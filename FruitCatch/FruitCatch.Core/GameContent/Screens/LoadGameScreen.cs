﻿using FruitCatch.Core.GameContent.Assets.Audio;
using FruitCatch.Core.GameContent.Assets.Fonts;
using FruitCatch.Core.GameContent.Database;
using FruitCatch.Core.GameContent.Engines;
using FruitCatch.Core.GameContent.Enum;
using FruitCatch.Core.GameContent.Globals;
using FruitCatch.Core.GameContent.Input;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;

namespace FruitCatch.Core.GameContent.Screens
{
    public class LoadGameScreen : GameScreen
    {
        private DataManager dataManager;
        private ScrollingTable loadGameTable;
        private Button backButton;
        private SpriteFont textFont;
        private const string backButtonText = "BACK";
        private Sprite panelBoard;
        Levels setRecordLevel;

        private Sprite title;

        // Button Cooldown 
        private double cooldown = 300;
        private double timer = 0;
        private bool isAudioTrigger;

        public LoadGameScreen(Sprite background) :base(background) 
        {
            // Manager
            dataManager = new DataManager();
            isAudioTrigger = false;

            //Text
            textFont = Fonts.ScoreBoardFont;

            

            // Button Size
            int buttonWidth = 100; //  button width
            int buttonHeight = 80; //  button height
            int buttonSpacing = 200; // Space between buttons
            int startX = (Settings.SCREEN_WIDTH - buttonWidth) / 2; // Horizontal center
            int startY = 900; // Starting Y-coordinate

           

            if (FruitCatchGame.Instance.Platform == Platform.ANDROID)
            {
                // Title
                title = new Sprite("text_load_game");
                title.SetPosition(Settings.SCREEN_WIDTH / 2 - 890, -410);

                // Button
                this.backButton = new Button(startX - 50, startY - 100, buttonWidth, buttonHeight, new Sprite("btn_back"));

                // Table
                Vector2 tablePosition = new Vector2(startX - 260, startY - 550);
                loadGameTable = new ScrollingTable(textFont, tablePosition, new int[] { 100, 200, 150, 300 }, 50, Color.Wheat, Color.Gray, 6);
                loadGameTable.AddRow("Id", "Player Name", "Level", "Score");

                // Panel Background
                panelBoard = new Sprite("panel_score_board");
                panelBoard.SetPosition(startX - 850, startY - 900);
            }
            else
            {
                // Title
                title = new Sprite("text_load_game");
                title.SetPosition(Settings.SCREEN_WIDTH / 2 - 890, -470);

                // Button
                this.backButton = new Button(startX, startY, buttonWidth, buttonHeight, new Sprite("btn_back"));

                // Table
                Vector2 tablePosition = new Vector2(startX - 230, startY - 500);
                loadGameTable = new ScrollingTable(textFont, tablePosition, new int[] { 100, 200, 200, 300 }, 50, Color.Wheat, Color.Gray, 6);
                loadGameTable.AddRow("Id", "Player Name", "Level", "Score");

                // Panel Background
                panelBoard = new Sprite("panel_score_board");
                panelBoard.SetPosition(startX - 900, startY - 900);
            }
                


        }


        public override void Update(GameTime gameTime, InputHandler input, FruitCatchGame game)
        {
            timer += gameTime.ElapsedGameTime.TotalMilliseconds;

            base.Update(gameTime, input, game);
            this.backButton.Update(gameTime, input);
            this.loadGameTable.Update(gameTime, input);

            var savedGames = dataManager.LoadRecordList();
            Console.WriteLine(savedGames);
            this.loadGameTable.Clear();
            if (savedGames.Count > 0)
            {
                loadGameTable.AddRow("Id", "Player Name", "Level", "Score");
                foreach (var gameData in savedGames)
                {
                    loadGameTable.AddRow(
                        gameData.recordId.ToString(),
                        gameData.playerName,
                        gameData.currentLevel,
                        gameData.score.ToString()
                    );
                }
            }
            else
            {
                // Display a no data message if no records are available
                loadGameTable.AddRow("No saved games found.");
            }

            if(timer > cooldown)
            {
                timer = 0;
                loadGameTable.OnRowClick += (rowIndex) =>
                {
                    if(rowIndex != 0)
                    {
                        LoadSelectedGame(rowIndex);// Pass the clicked row index to LoadSelectedGame
                        if(isAudioTrigger == false)
                        {
                            AudioSource.PlaySound("UI_StartGame");
                            Debug.WriteLine("[AUDIO] UI_StartGame Trigger");
                            isAudioTrigger = true;
                        }
                        
                        game.ChangeMenu(MenuState.PlayScreen);
                    }  
                };
            }


            if (backButton.IsPressed())
            {
                
                AudioSource.PlaySound("UI_Back");
                game.ChangeMenu(MenuState.StartScreen);
            }

        }

        public override void Draw(SpriteBatch spriteBatch)
        {
            base.Draw(spriteBatch);

            if (FruitCatchGame.Instance.Platform == Platform.ANDROID)
            {
                this.panelBoard.Draw(spriteBatch,0.9f);
                this.loadGameTable.Draw(spriteBatch);
                this.backButton.Draw(spriteBatch, 0.2f);
                this.title.Draw(spriteBatch,0.9f);
            }
            else
            {
                this.panelBoard.Draw(spriteBatch);
                this.loadGameTable.Draw(spriteBatch);
                this.backButton.Draw(spriteBatch, 0.2f);
                this.title.Draw(spriteBatch);
            }
        }

        public void LoadSelectedGame(int rowIndex)
        {
            if (rowIndex >= 0 && rowIndex < loadGameTable.GetRowCount())
            {
                var selectedRow = loadGameTable.GetRow(rowIndex);
                if (selectedRow != null && selectedRow.Length >= 1 && int.TryParse(selectedRow[0], out int recordId))
                {
                    var record = dataManager.LoadRecordList().FirstOrDefault(r => r.recordId == recordId);

                    if (record != null)
                    {
                        Global.CurrentPlayName = record.playerName;
                        Global.CurrentLevel = GetRecordLevel(record);
                        Global.Score = record.score;

                        Console.WriteLine($"Loaded Record: ID={record.recordId}, Name={record.playerName}, Level={record.currentLevel}, Score={record.score}");

                    }


                }
            }
        }

        public Levels GetRecordLevel(Data record)
    {
        switch (record.currentLevel)
        {
                case "Level1":
                    setRecordLevel = Levels.Level2;
                    break;
                case "Level2":
                    setRecordLevel = Levels.Level3;
                    break;
                case "Level3":
                    setRecordLevel = Levels.Level3;
                    break;
        }
            return setRecordLevel;
    }
    }
}
