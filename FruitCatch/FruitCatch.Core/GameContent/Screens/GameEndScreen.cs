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

namespace FruitCatch.Core.GameContent.Screens
{
    public class GameEndScreen : GameScreen
    {
        private Button backButton;
        private Button restartGameButton;
        private SpriteFont textFont;
        private const string backButtonText = "BACK TO Menu";
        private const string restartGameButtonText = "RESTART GAME";


        public GameEndScreen(Sprite background) : base(background)
        {
            //Text
            textFont = Fonts.RegularFont;

            int buttonWidth = 50; // Example button width
            int buttonHeight = 50; // Example button height
            int buttonSpacing = 500; // Space between buttons
            int startX = (Settings.SCREEN_WIDTH - 250) / 2; // Horizontal center
            int startY = 900; // Starting Y-coordinate


            // Create Button
            this.backButton = new Button(startX, startY, buttonWidth, buttonHeight, textFont, backButtonText, Color.Black);
            this.restartGameButton = new Button(startX + buttonSpacing, startY, buttonWidth, buttonHeight, textFont, restartGameButtonText, Color.Black);

        }

        public override void Update(GameTime gameTime, InputHandler input, FruitCatchGame game)
        {
            base.Update(gameTime, input, game);

            this.backButton.Update(gameTime, input);
            this.restartGameButton.Update(gameTime, input);

            if (backButton.IsPressed())
            {
                game.ChangeMenu(MenuState.StartScreen);
            }

            if (restartGameButton.IsPressed())
            {
                AudioSource.Sounds["UI_StartGame"].Play();
                game.ChangeMenu(MenuState.PlayScreen);

            }

        }

        public override void Draw(SpriteBatch spriteBatch)
        {
            base.Draw(spriteBatch);
            this.backButton.Draw(spriteBatch);
            this.restartGameButton.Draw(spriteBatch);
        }
    }
}
