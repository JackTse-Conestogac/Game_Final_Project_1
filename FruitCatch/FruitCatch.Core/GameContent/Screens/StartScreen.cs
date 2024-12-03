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

        private SpriteFont textFont;
        private const string startButtonText = "START GAME";
        private const string helpButtonText = "HELP ";
        private const string aboutButtonText = "ABOUT ";
        private const string quitButtonText = "QUIT ";

        public StartScreen(Sprite bg) :base(bg)
        {
            textFont = Fonts.RegularFont;

            int buttonWidth = 50; // Example button width
            int buttonHeight = 50; // Example button height
            int buttonSpacing = 20; // Space between buttons
            int startX = (Settings.SCREEN_WIDTH - buttonWidth) / 2; // Horizontal center
            int startY = 180; // Starting Y-coordinate

            this.startGameButton = new Button(startX, startY, buttonWidth, buttonHeight, textFont, startButtonText, Color.Black);
            this.helpButton = new Button(startX, startY + buttonHeight + buttonSpacing, buttonWidth, buttonHeight, textFont, helpButtonText, Color.Black);
            this.aboutButton = new Button(startX, startY + 2 * (buttonHeight + buttonSpacing), buttonWidth, buttonHeight, textFont, aboutButtonText, Color.Black);
            this.quitButton = new Button(startX, startY + 3 * (buttonHeight + buttonSpacing), buttonWidth, buttonHeight, textFont, quitButtonText, Color.Black);

        }

        public override void Update(GameTime gameTime, InputHandler input, FruitCatchGame game)
        {
            base.Update(gameTime, input, game);

            this.startGameButton.Update(gameTime, input);
            this.helpButton.Update(gameTime, input);
            this.aboutButton.Update(gameTime, input);
            this.quitButton.Update(gameTime, input);

            if (startGameButton.IsPressed())
            {
                Console.WriteLine("Start Game selected.");
                game.ChangeMenu(MenuState.StartScreen);
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
        }

        public override void Draw(SpriteBatch spriteBatch)
        {
            base.Draw(spriteBatch);
            this.startGameButton.Draw(spriteBatch);
            this.helpButton.Draw(spriteBatch);
            this.aboutButton.Draw(spriteBatch); 
            this.quitButton.Draw(spriteBatch);
        }
    }
}
