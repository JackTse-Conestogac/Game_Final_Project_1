using FruitCatch.Core.GameContent.Assets;
using FruitCatch.Core.GameContent.Engines;
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

namespace FruitCatch.Core.GameContent.Screens
{
    public class ScoreBoardScreen : GameScreen
    {
        private DataManager dataManager;

        private Button backButton;
        private SpriteFont textFont;
        private const string backButtonText = "BACK";
        private Table table;
        

        public ScoreBoardScreen(Sprite background ) : base(background)
        {
            dataManager = new DataManager();

            //Text
            textFont = Fonts.RegularFont;

            // Button parameters
            int buttonWidth = 50; // Example button width
            int buttonHeight = 50; // Example button height
            int buttonSpacing = 200; // Space between buttons
            int startX = (Settings.SCREEN_WIDTH - buttonWidth) / 2; // Horizontal center
            int startY = 900; // Starting Y-coordinate

            //Table
            table = new Table(textFont, new Vector2(startX - 470, startY - 700), new int[] {300, 300, 300, 400}, 50, Color.White );
            this.table.AddRow("Top","Name", "Level", "Score");

            // Create Button
            this.backButton = new Button(startX, startY, buttonWidth, buttonHeight, textFont, backButtonText, Color.Black);

        }

        public override void Update(GameTime gameTime, InputHandler input, FruitCatchGame game)
        {
            
            base.Update(gameTime, input, game);
            UpdateScoreBoard(this.table);


            this.table.Update(gameTime);
            this.backButton.Update(gameTime, input);

            if (backButton.IsPressed())
            {
                AudioSource.Sounds["UI_Back"].Play();
                game.ChangeMenu(MenuState.StartScreen);
            }
        }

        public override void Draw(SpriteBatch spriteBatch)
        {
            base.Draw(spriteBatch);
            this.table.Draw(spriteBatch);
            this.backButton.Draw(spriteBatch);
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
