using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FruitCatch.Core.GameContent.Assets;
using FruitCatch.Core.GameContent.Engines;
using FruitCatch.Core.GameContent.Globals;
using FruitCatch.Core.GameContent.Input;
using FruitCatch.Core.GameContent.Enum;

namespace FruitCatch.Core.GameContent.Screens
{
    public class StartScreen : GameScreen
    {

        private Button startGameButton;
        private Button helpButton;
        private Button aboutButton;
        private Button quitButton;
        private Button gameEndButton;

        private Text gameTitle;

        private SpriteFont textFont;
        private SpriteFont gameTitleFont;
        private Vector2 gameTitlePosition;

        private const string gameTitleText = "GAME TITLE";
        private const string startButtonText = "START GAME";
        private const string helpButtonText = "HELP";
        private const string aboutButtonText = "ABOUT";
        private const string quitButtonText = "QUIT";
        private const string gameEndButtonText = "GAME END (For Debug)";


        public StartScreen(Sprite bg) :base(bg)
        {

            int buttonWidth = 200; // Assuming 200px width
            int buttonHeight = 50; // Assuming 50px height
            int centerX = (Settings.SCREEN_WIDTH - buttonWidth) / 2 ; // Centered horizontally
            int centerY = (Settings.SCREEN_HEIGHT - buttonHeight) / 2;

            gameTitlePosition = new Vector2(Settings.SCREEN_WIDTH /2 - 300, 30);
            textFont = Fonts.RegularFont;
            gameTitleFont = Fonts.GameTitleFont;
            gameTitle = new Text(gameTitleText, gameTitleFont, gameTitlePosition, Color.ForestGreen);

            
            startGameButton = new Button(centerX, centerY - 100, buttonWidth, buttonHeight, textFont, startButtonText, Color.Cyan);
            helpButton = new Button(centerX, centerY, buttonWidth, buttonHeight, textFont, helpButtonText, Color.Cyan);
            aboutButton = new Button(centerX, centerY + 100, buttonWidth, buttonHeight, textFont, aboutButtonText, Color.Cyan);
            quitButton = new Button(centerX, centerY + 200, buttonWidth, buttonHeight, textFont, quitButtonText, Color.Cyan);
            gameEndButton = new Button(centerX, centerY + 300, buttonWidth, buttonHeight, textFont, gameEndButtonText, Color.Cyan);
        }

        public override void Update(GameTime gameTime, InputHandler input, FruitCatchGame game)
        {
            base.Update(gameTime, input, game);

            this.startGameButton.Update(gameTime, input);
            this.helpButton.Update(gameTime, input);
            this.aboutButton.Update(gameTime, input);
            this.quitButton.Update(gameTime, input);
            this.gameEndButton.Update(gameTime, input);

            if (startGameButton.IsPressed())
            {
                Console.WriteLine("Start Game selected.");
                AudioSource.Sounds["UI_StartGame"].Play();
                game.ChangeMenu(MenuState.PlayScreen);
            }
            if (helpButton.IsPressed())
            {
                Console.WriteLine("Help selected.");
                game.ChangeMenu(MenuState.HelpScreen);
            }
            if (aboutButton.IsPressed())
            {
                Console.WriteLine("About selected.");
                game.ChangeMenu(MenuState.AboutScreen);
            }

            if (quitButton.IsPressed())
            {
                Console.WriteLine("Quit selected.");
                game.ChangeMenu(MenuState.Quit);
            }

            if (gameEndButton.IsPressed())
            {
                Console.WriteLine("About selected.");
                game.ChangeMenu(MenuState.GameEndScreen);
            }
        }

        public override void Draw(SpriteBatch spriteBatch)
        {
            base.Draw(spriteBatch);
            this.gameTitle.Draw(spriteBatch);
            this.startGameButton.Draw(spriteBatch);
            this.helpButton.Draw(spriteBatch);
            this.aboutButton.Draw(spriteBatch); 
            this.quitButton.Draw(spriteBatch);
            this.gameEndButton.Draw(spriteBatch);
        }
    }
}
