﻿using FruitCatch.Core.GameContent.Engines;
using FruitCatch.Core.GameContent.Enum;
using FruitCatch.Core.GameContent.Globals;
using FruitCatch.Core.GameContent.Input;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FruitCatch.Core.GameContent.Database;
using FruitCatch.Core.GameContent.Assets.Audio;
using FruitCatch.Core.GameContent.Assets.Fonts;

namespace FruitCatch.Core.GameContent.Screens
{
    public class ScoreBoardScreen : GameScreen
    {
        private DataManager dataManager;

        private Button backButton;
        private SpriteFont textFont;
        private const string backButtonText = "BACK";
        private Table table;
        private Sprite scoreBoard;

        private Text gameTitle;
        private SpriteFont gameTitleFont;
        private Vector2 gameTitlePosition;
        private const string gameTitleText = "HIGHEST SCORE";

        private Sprite title;

        public ScoreBoardScreen(Sprite background ) : base(background)
        {
            dataManager = new DataManager();

            //Text
            textFont = Fonts.ScoreBoardFont;



            // Button parameters
            int buttonWidth = 100; //  button width
            int buttonHeight = 80; //  button height
            int buttonSpacing = 200; // Space between buttons
            int startX = (Settings.SCREEN_WIDTH - buttonWidth) / 2; // Horizontal center
            int startY = 900; // Starting Y-coordinate
            
            

            // Create Button
            if (FruitCatchGame.Instance.Platform == Platform.ANDROID)
            {
                // Title
                title = new Sprite("text_highest_score");
                title.SetPosition(Settings.SCREEN_WIDTH / 2 - 800, - 410);

                //Table
                table = new Table(textFont, new Vector2(startX - 230, startY - 550), new int[] { 100, 150, 150, 300 }, 50, Color.Wheat);
                this.table.AddRow("Top", "Name", "Level", "Score");

                // Button
                this.backButton = new Button(startX - 55, startY - 100, buttonWidth, buttonHeight, new Sprite("btn_back"));

                // Score board background
                scoreBoard = new Sprite("panel_score_board");
                scoreBoard.SetPosition(startX - 850, startY - 900);
            }
            else
            {
                // Title
                title = new Sprite("text_highest_score");
                title.SetPosition(Settings.SCREEN_WIDTH / 2 - 890, -460);

                //Table
                table = new Table(textFont, new Vector2(startX - 230, startY - 500), new int[] { 100, 200, 200, 300 }, 50, Color.Wheat);
                this.table.AddRow("Top", "Name", "Level", "Score");

                // Button
                this.backButton = new Button(startX , startY, buttonWidth, buttonHeight, new Sprite("btn_back"));

                // Score board background
                scoreBoard = new Sprite("panel_score_board");
                scoreBoard.SetPosition(startX - 900, startY - 900);
            }
               

        }

        public override void Update(GameTime gameTime, InputHandler input, FruitCatchGame game)
        {
            
            base.Update(gameTime, input, game);
            UpdateScoreBoard(this.table);


            this.table.Update(gameTime);
            this.backButton.Update(gameTime, input);

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
                this.scoreBoard.Draw(spriteBatch, 0.9f);
                this.table.Draw(spriteBatch);
                this.backButton.Draw(spriteBatch, 0.2f);
                this.title.Draw(spriteBatch, 0.9f);
            }
            else
            {
                this.scoreBoard.Draw(spriteBatch);
                this.table.Draw(spriteBatch);
                this.backButton.Draw(spriteBatch, 0.2f);
                this.title.Draw(spriteBatch);
            }
        }

        public void UpdateScoreBoard(Table table)
        {
            // Fetch the top scores from the data manager
            var topScores = dataManager.GetTopScores();
            int num = 0;
            // Clear and populate the table
            table.Clear();
            table.AddRow("Top","Name", "Level", "Score");
            foreach (var score in topScores)
            {
                num++;
                table.AddRow(num.ToString(),score.playerName, score.currentLevel, score.score.ToString());
            }
        }

    }
}
