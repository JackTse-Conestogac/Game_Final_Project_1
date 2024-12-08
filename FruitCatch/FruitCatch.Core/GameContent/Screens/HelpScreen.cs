using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using Microsoft.Xna.Framework;
using System.Collections.Generic;
using System.Linq;
using FruitCatch.Core.GameContent.Engines;
using FruitCatch.Core.GameContent.Globals;
using FruitCatch.Core.GameContent.Input;
using FruitCatch.Core.GameContent.Enum;
using FruitCatch.Core.GameContent.Assets.Audio;
using FruitCatch.Core.GameContent.Assets.Fonts;


namespace FruitCatch.Core.GameContent.Screens
{
    public class HelpScreen : GameScreen
    {
        private Button backButton;
        private SpriteFont textFont;
        private Sprite panelBoard;
        private Sprite title;

        private const string backButtonText = "BACK";
        public HelpScreen(Sprite background) : base(background)
        {
            //Text
            textFont = Fonts.RegularFont;

            // Buttons
            int buttonWidth = 100; //  button width
            int buttonHeight = 80; //  button height
            int buttonSpacing = 200; // Space between buttons
            int startX = (Settings.SCREEN_WIDTH - buttonWidth) / 2; // Horizontal center
            int startY = 900; // Starting Y-coordinate

            // Create Button
            if (FruitCatchGame.Instance.Platform == Platform.ANDROID)
            {
                // Title
                title = new Sprite("text_help");
                title.SetPosition(Settings.SCREEN_WIDTH / 2 - 800, - 370);

                // Button
                this.backButton = new Button(startX, startY - 100, buttonWidth, buttonHeight, new Sprite("btn_back"));

                // Panel Background
                panelBoard = new Sprite("panel_help_board");
                panelBoard.SetPosition(startX - 800, startY - 900);
            }
            else
            {
                // Title
                title = new Sprite("text_help");
                title.SetPosition(Settings.SCREEN_WIDTH / 2 - 890, - 410);

                // Button
                this.backButton = new Button(startX, startY, buttonWidth, buttonHeight, new Sprite("btn_back"));

                // Panel Background
                panelBoard = new Sprite("panel_help_board");
                panelBoard.SetPosition(startX - 900, startY - 900);
            }

            
        }

        public override void Update(GameTime gameTime, InputHandler input, FruitCatchGame game)
        {
            base.Update(gameTime, input, game);

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
                this.panelBoard.Draw(spriteBatch, 0.9f);
                this.backButton.Draw(spriteBatch, 0.2f);
                this.title.Draw(spriteBatch, 0.9f);
            }
            else
            {
                this.panelBoard.Draw(spriteBatch);
                this.backButton.Draw(spriteBatch, 0.2f);
                this.title.Draw(spriteBatch);
            }
        }
    }
}
