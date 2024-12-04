using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Net.Mime.MediaTypeNames;
using FruitCatch.Core.GameContent.Engines;
using FruitCatch.Core.GameContent.Globals;
using FruitCatch.Core.GameContent.Input;
using FruitCatch.Core.GameContent.Enum;
using FruitCatch.Core.GameContent.Assets;


namespace FruitCatch.Core.GameContent.Screens
{
    public class HelpScreen : GameScreen
    {
        private Button backButton;
        private SpriteFont textFont;
        private const string backButtonText = "BACK";


        public HelpScreen(Sprite background) : base(background)
        {
            //Text
            textFont = Fonts.RegularFont;

            int buttonWidth = 50; // Example button width
            int buttonHeight = 50; // Example button height
            int buttonSpacing = 200; // Space between buttons
            int startX = (Settings.SCREEN_WIDTH - buttonWidth) / 2; // Horizontal center
            int startY = 900; // Starting Y-coordinate


            // Create Button
            this.backButton = new Button(startX, startY, buttonWidth, buttonHeight, textFont, backButtonText, Color.Black);
           
        }

        public override void Update(GameTime gameTime, InputHandler input, FruitCatchGame game)
        {
            base.Update(gameTime, input, game);

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
            this.backButton.Draw(spriteBatch);
        }
    }
}
