using FruitCatch.Core.GameContent.Assets;
using FruitCatch.Core.GameContent.Assets.Audio;
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

        private Text gameTitle;
        private SpriteFont gameTitleFont;
        private Vector2 gameTitlePosition;
        private const string gameTitleText = "LOAD GAME";


        // Button Cooldown 
        private double cooldown = 700;
        private double timer = 0;

        public LoadGameScreen(Sprite background) :base(background) 
        {
            // Manager
            dataManager = new DataManager();

            //Text
            textFont = Fonts.RegularFont;

            // Title
            gameTitlePosition = new Vector2(Settings.SCREEN_WIDTH / 2 - 300, 30);
            gameTitleFont = Fonts.GameTitleFont;
            gameTitle = new Text(gameTitleText, gameTitleFont, gameTitlePosition, Color.ForestGreen);

            // Button
            int buttonWidth = 100; // Example button width
            int buttonHeight = 80; // Example button height
            int buttonSpacing = 200; // Space between buttons
            int startX = (Settings.SCREEN_WIDTH - buttonWidth) / 2; // Horizontal center
            int startY = 900; // Starting Y-coordinate

            // Create Button
            //this.backButton = new Button(startX, startY, buttonWidth, buttonHeight, textFont, backButtonText, Color.Black);
            this.backButton = new Button(startX, startY, buttonWidth, buttonHeight, new Sprite("btn_back"));

            // Table
            Vector2 tablePosition = new Vector2(startX- 520, startY -750);
            loadGameTable = new ScrollingTable(textFont, tablePosition, new int[]{300, 400, 200, 300}, 50, Color.Cyan, Color.Gray, 10);
            loadGameTable.AddRow("Record Id", "Player Name", "Level", "Score");

            // Panel Background
            panelBoard = new Sprite("panel_score_board");
            panelBoard.SetPosition(startX - 470, startY - 800);
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
                loadGameTable.AddRow("Record Id", "Player Name", "Level", "Score");
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
                        AudioSource.PlaySound("UI_StartGame");
                        Debug.WriteLine("[AUDIO] UI_StartGame Trigger");
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
            this.panelBoard.Draw(spriteBatch);
            this.loadGameTable.Draw(spriteBatch);
            this.backButton.Draw(spriteBatch);
            this.gameTitle.Draw(spriteBatch);

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
