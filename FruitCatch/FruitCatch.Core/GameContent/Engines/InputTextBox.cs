using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FruitCatch.Core.GameContent.Engines
{
    public class InputTextBox
    {
        private SpriteFont font;
        private Vector2 position;
        private Color textColor;
        private Color boxColor;
        private Rectangle boxRectangle;
        private StringBuilder userInput;
        private bool isFocused;
        private double blinkTime;
        private bool showCursor;

        public InputTextBox(SpriteFont font, Vector2 position, int width, int height, Color textColor, Color boxColor)
        {
            this.font = font;
            this.position = position;
            this.textColor = textColor;
            this.boxColor = boxColor;
            this.boxRectangle = new Rectangle((int)position.X, (int)position.Y, width, height);
            this.userInput = new StringBuilder();
            this.isFocused = false;
            this.blinkTime = 0;
            this.showCursor = true;
        }

        public string GetText()
        {
            return userInput.ToString();
        }

        public void Update(GameTime gameTime)
        {
            // Toggle cursor visibility
            blinkTime += gameTime.ElapsedGameTime.TotalMilliseconds;
            if (blinkTime >= 500)
            {
                showCursor = !showCursor;
                blinkTime = 0;
            }

            // Handle keyboard input
            if (isFocused)
            {
                KeyboardState keyboardState = Keyboard.GetState();
                foreach (var key in keyboardState.GetPressedKeys())
                {
                    if (key == Keys.Back && userInput.Length > 0)
                    {
                        userInput.Remove(userInput.Length - 1, 1);
                    }
                    else if (key == Keys.Enter)
                    {
                        isFocused = false; // End input on Enter
                    }
                    else
                    {
                        char keyChar = GetCharFromKey(key);
                        if (keyChar != '\0') userInput.Append(keyChar);
                    }
                }
            }
        }

        public void Draw(SpriteBatch spriteBatch)
        {
            // Draw the text box
            Texture2D boxTexture = new Texture2D(spriteBatch.GraphicsDevice, 1, 1);
            boxTexture.SetData(new[] { boxColor });
            spriteBatch.Draw(boxTexture, boxRectangle, Color.White);

            // Draw the user input
            string displayText = userInput.ToString();
            if (isFocused && showCursor)
            {
                displayText += "|"; // Add a blinking cursor
            }

            spriteBatch.DrawString(font, displayText, position, textColor);
        }

        public void Focus()
        {
            isFocused = true;
        }

        public void Unfocus()
        {
            isFocused = false;
        }

        private char GetCharFromKey(Keys key)
        {
            if (key >= Keys.A && key <= Keys.Z) return (char)key; // Convert A-Z keys
            if (key >= Keys.D0 && key <= Keys.D9) return (char)(key - Keys.D0 + '0'); // Convert 0-9 keys
            return '\0'; // Default case
        }
    }
}
