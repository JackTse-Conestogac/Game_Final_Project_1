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
using Microsoft.Xna.Framework.Audio;

namespace FruitCatch.Core.GameContent.Screens
{
    public class PlayerInfoScreen : GameScreen
    {
        private Button startGameButton;
        private Button backButton;
        private InputTextBox inputTextBox;
        private SpriteFont textFont;

        private const string startButtonText = "START";
        private const string backButtonText = "BACK TO MENU";
        private Text error;
        private string errorText = "";


        public PlayerInfoScreen(Sprite background) : base(background)
        {
            //Text
            textFont = Fonts.RegularFont;

            int buttonWidth = 50; // Example button width
            int buttonHeight = 50; // Example button height
            int buttonSpacing = 200; // Space between buttons
            int startX = (Settings.SCREEN_WIDTH - buttonWidth) / 2; // Horizontal center
            int startY = 650; // Starting Y-coordinate

            // Create Button
            Vector2 inputPosition = new Vector2(startX -260, startY - 100);
            this.inputTextBox = new InputTextBox(textFont, inputPosition, 600, 50, Color.Black, Color.White);
            this.startGameButton = new Button(startX +150, startY, buttonWidth, buttonHeight, textFont, startButtonText, Color.Black);
            this.backButton = new Button(startX - 150, startY, buttonWidth, buttonHeight, textFont, backButtonText, Color.Black);

            Vector2 errortextPosition = new Vector2(startX - 300, startY + 100);
            this.error = new Text(errorText, textFont, errortextPosition, Color.Red);
        }

        public override void Update(GameTime gameTime, InputHandler input, FruitCatchGame game)
        {
            

            this.inputTextBox.Update(gameTime, input);
            this.startGameButton.Update(gameTime, input);
            this.backButton.Update(gameTime, input);

            base.Update(gameTime, input, game);

            if (!string.IsNullOrEmpty(inputTextBox.GetText()))
            {
                errorText = ""; // Clear error text when input is valid
            }


            if (startGameButton.IsPressed())
            {
                string playerName = inputTextBox.GetText();
                if (!string.IsNullOrEmpty(playerName))
                {

                    Global.CurrentPlayName = playerName;
                    AudioSource.Sounds["UI_StartGame"].Play();
                    game.ChangeMenu(MenuState.PlayScreen);
                }
                else
                {
                    errorText = "Player name cannot be empty!";
                }
            }

            if(backButton.IsPressed())
            {
               

                AudioSource.Sounds["UI_Back"].Play();
                game.ChangeMenu(MenuState.StartScreen);
            }
        }

        public override void Draw(SpriteBatch spriteBatch)
        {
            base.Draw(spriteBatch);
            this.inputTextBox.Draw(spriteBatch);
            this.startGameButton.Draw(spriteBatch);
            this.backButton.Draw(spriteBatch);

            if (!string.IsNullOrEmpty(errorText))
            {
                this.error.TextString = errorText; // Update the error text object
                this.error.Draw(spriteBatch);
            }

        }

    }
}
