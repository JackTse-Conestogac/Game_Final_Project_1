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
using FruitCatch.Core.GameContent.Assets.Audio;
using FruitCatch.Core.GameContent.Assets.Fonts;

namespace FruitCatch.Core.GameContent.Screens
{
    public class AboutScreen : GameScreen
    {
        private Button backButton;
        private SpriteFont textFont;

        private Sprite panelBoard;

        private Text gameTitle;
        private SpriteFont gameTitleFont;
        private Vector2 gameTitlePosition;
        private Sprite title;

        private const string gameTitleText = "ABOUT";
        private const string backButtonText = "BACK";
        public AboutScreen(Sprite background) : base(background)
        {
            // Text
            textFont = Fonts.RegularFont;

            // Buttons
            int buttonWidth = 100; //  button width
            int buttonHeight = 80; //  button height
            int buttonSpacing = 20; // Space between buttons
            int startX = (Settings.SCREEN_WIDTH - buttonWidth) / 2; // Horizontal center
            int startY = 900; // Starting Y-coordinate


            // Create Button
            if (FruitCatchGame.Instance.Platform == Platform.ANDROID)
            {
                // Title
                title = new Sprite("text_about");
                title.SetPosition(Settings.SCREEN_WIDTH / 2 - 800, - 370);

                this.backButton = new Button(startX, startY - 100, buttonWidth, buttonHeight, new Sprite("btn_back"));

                // Panel Background
                panelBoard = new Sprite("panel_about_board");
                panelBoard.SetPosition(startX - 800, startY - 900);
            }
            else
            {
                // Title
                title = new Sprite("text_about");
                title.SetPosition(Settings.SCREEN_WIDTH / 2 - 890, - 410);

                this.backButton = new Button(startX, startY, buttonWidth, buttonHeight, new Sprite("btn_back"));

                // Panel Background
                panelBoard = new Sprite("panel_about_board");
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
            if(FruitCatchGame.Instance.Platform == Platform.ANDROID)
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
