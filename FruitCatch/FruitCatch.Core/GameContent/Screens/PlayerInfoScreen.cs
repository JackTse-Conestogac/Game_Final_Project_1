using FruitCatch.Core.GameContent.Assets;
using FruitCatch.Core.GameContent.Engines;
using FruitCatch.Core.GameContent.Enum;
using FruitCatch.Core.GameContent.Globals;
using FruitCatch.Core.GameContent.Input;
using FruitCatch.Core.GameContent.Database;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework;
using System;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Xna.Framework.Audio;

namespace FruitCatch.Core.GameContent.Screens
{
    public class PlayerInfoScreen : GameScreen
    {
        private DataManager dataManager;

        private Button startGameButton;
        private Button backButton;
        private InputTextBox inputTextBox;
        private SpriteFont textFont;
        private SpriteFont textFontBold;

        private const string startButtonText = "START";
        private const string backButtonText = "BACK TO MENU";
        private Text caption;
        private Text error;
        private string captionText = "Enter your name :";
        private string errorText = "";


        // Button Cooldown 
        private double ButtonCooldown = 200; 
        private double ButtonTimer = 0;


        public PlayerInfoScreen(Sprite background) : base(background)
        {

            dataManager = new DataManager();

            //Text
            textFont = Fonts.RegularFont;
            textFontBold = Fonts.HilightFont;

            int buttonWidth = 50; //  button width
            int buttonHeight = 50; //  button height
            int buttonSpacing = 200; // Space between buttons
            int startX = (Settings.SCREEN_WIDTH - buttonWidth) / 2; // Horizontal center
            int startY = 650; // Starting Y-coordinate

            // Create Button
            Vector2 inputPosition = new Vector2(startX -260, startY - 100);
            this.inputTextBox = new InputTextBox(textFont, inputPosition, 600, 50, Color.Black, Color.White);
            
            this.startGameButton = new Button(startX +150, startY, buttonWidth, buttonHeight, textFont, startButtonText, Color.Black);
            this.backButton = new Button(startX - 150, startY, buttonWidth, buttonHeight, textFont, backButtonText, Color.Black);

            // Text
            Vector2 captionPosition = new Vector2(startX - 260, startY - 150);
            this.caption = new Text(captionText, textFontBold, captionPosition, Color.Black);
            Vector2 errortextPosition = new Vector2(startX - 150, startY + 100);
            this.error = new Text(errorText, textFont, errortextPosition, Color.Red);


            
        }

        public override void Update(GameTime gameTime, InputHandler input, FruitCatchGame game)
        {
            ButtonTimer += gameTime.ElapsedGameTime.TotalMilliseconds;

            this.inputTextBox.Update(gameTime, input);
            this.startGameButton.Update(gameTime, input);
            this.backButton.Update(gameTime, input);

            base.Update(gameTime, input, game);

            if (!string.IsNullOrEmpty(inputTextBox.GetText()))
            {
                errorText = ""; // Clear error text when input is valid
            }


            if (startGameButton.IsPressed() && ButtonTimer >= ButtonCooldown)
            {
                ButtonTimer = 0; // Reset cooldown timer
                string playerName = inputTextBox.GetText();
                if (!string.IsNullOrEmpty(playerName))
                {
                    Global.CurrentPlayName = playerName;

                    // Save to database 
                    dataManager.AddRecord(Global.CurrentPlayName, Global.CurrentLevel, Global.Score);

                    AudioSource.Sounds["UI_StartGame"].Play();
                    game.ChangeMenu(MenuState.PlayScreen);
                }
                else
                {
                    errorText = "Player name cannot be empty!";
                }
            }

            if (backButton.IsPressed())
            {
               
                AudioSource.Sounds["UI_Back"].Play();
                game.ChangeMenu(MenuState.StartScreen);
            }
        }

        public override void Draw(SpriteBatch spriteBatch)
        {
            base.Draw(spriteBatch);
            //Text
            this.caption.Draw(spriteBatch);

            // Button and input text box
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
