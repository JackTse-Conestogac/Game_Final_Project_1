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

            // Title
            gameTitlePosition = new Vector2(Settings.SCREEN_WIDTH / 2 - 200, 30);
            gameTitleFont = Fonts.GameTitleFont;
            gameTitle = new Text(gameTitleText, gameTitleFont, gameTitlePosition, Color.ForestGreen);
            title = new Sprite("text_about");
            title.SetPosition(Settings.SCREEN_WIDTH / 2 - 890, -410);

            // Buttons
            int buttonWidth = 100; // Example button width
            int buttonHeight = 80; // Example button height
            int buttonSpacing = 20; // Space between buttons
            int startX = (Settings.SCREEN_WIDTH - buttonWidth) / 2; // Horizontal center
            int startY = 900; // Starting Y-coordinate


            // Create Button
            //this.backButton = new Button(startX, startY, buttonWidth, buttonHeight, textFont, backButtonText, Color.Black);
            this.backButton = new Button(startX, startY, buttonWidth, buttonHeight, new Sprite("btn_back"));

            // Panel Background
            panelBoard = new Sprite("panel_about_board");
            panelBoard.SetPosition(startX - 900, startY - 900);

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
            this.panelBoard.Draw(spriteBatch);  
            this.backButton?.Draw(spriteBatch);
            //this.gameTitle.Draw(spriteBatch);
            this.title.Draw(spriteBatch);
        }
    }
}
