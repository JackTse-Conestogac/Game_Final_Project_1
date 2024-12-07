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

        private Text gameTitle;
        private SpriteFont gameTitleFont;
        private Vector2 gameTitlePosition;
        private const string gameTitleText = "HELP";
        private const string backButtonText = "BACK";
        public HelpScreen(Sprite background) : base(background)
        {
            //Text
            textFont = Fonts.RegularFont;

            // Title
            gameTitlePosition = new Vector2(Settings.SCREEN_WIDTH / 2 - 100, 30);
            gameTitleFont = Fonts.GameTitleFont;
            gameTitle = new Text(gameTitleText, gameTitleFont, gameTitlePosition, Color.ForestGreen);

            

            // Buttons
            int buttonWidth = 100; // Example button width
            int buttonHeight = 80; // Example button height
            int buttonSpacing = 200; // Space between buttons
            int startX = (Settings.SCREEN_WIDTH - buttonWidth) / 2; // Horizontal center
            int startY = 900; // Starting Y-coordinate

            // Create Button
            //this.backButton = new Button(startX, startY, buttonWidth, buttonHeight, textFont, backButtonText, Color.Black);
            this.backButton = new Button(startX, startY, buttonWidth, buttonHeight, new Sprite("btn_back"));

            // Panel Background
            title = new Sprite("text_help");
            //title.SetPosition(Settings.SCREEN_WIDTH -500, Settings.SCREEN_HEIGHT);
            title.SetPosition(Settings.SCREEN_WIDTH /2 - 890, -410);
            panelBoard = new Sprite("panel_help_board");
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
            this.backButton.Draw(spriteBatch);
            //this.gameTitle.Draw(spriteBatch);
            this.title.Draw(spriteBatch);
        }
    }
}
