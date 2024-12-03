using FruitCatch.Core.GameContent.Globals;
using FruitCatch.Core.GameContent.Input;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata.Ecma335;
using System.Resources;
using System.Text;
using System.Threading.Tasks;
using static System.Net.Mime.MediaTypeNames;

namespace FruitCatch.Core.GameContent.Engines
{
    public class Button : GameObject
    {
        private bool hover;
        private bool isPressed;
        private string text = "";
        private SpriteFont font;
        private Color textColor;
       // private static Sprite _sprite = new Sprite("icons8-ruby-64");

        private int width;  
        private int height;
        
        public bool IsPressed()
        {
            bool result = isPressed;
            isPressed = false;
        
            return result;
        }

        public Button(int x, int y, int width, int height, Sprite _sprite) : base(x, y, _sprite) 
        {
            this.hover = false;
            this.isPressed = false;

            this.width = width;
            this.height = height;
            
            // Set collision rectangle size
            this.collision.Width = width * Settings.PIXEL_RATIO;    
            this.collision.Height = height * Settings.PIXEL_RATIO;  

        }

        public Button(int x, int y, int width, int height, SpriteFont font, string text, Color? textColor, Sprite sprite) : base(x, y, sprite)
        {
            this.hover = false;
            this.isPressed = false;
            this.font = font;
            this.text = text;
            this.textColor = textColor ?? Color.Black;

            this.width = width;
            this.height = height;

            // Set collision rectangle size
            this.collision.Width = width * Settings.PIXEL_RATIO;    
            this.collision.Height = height * Settings.PIXEL_RATIO;  
        }

        public Button(int x, int y, int width, int height) : base(x, y, new Sprite("icons8-ruby-64"))
        {
            this.hover = false;
            this.isPressed = false;

            this.width = width;
            this.height = height;

            // Set collision rectangle size
            this.collision.Width = width * Settings.PIXEL_RATIO;
            this.collision.Height = height * Settings.PIXEL_RATIO;
        }

        public Button(int x, int y, int width, int height, SpriteFont font, string text, Color? textColor) : base(x, y, new Sprite("icons8-ruby-64"))
        {
            this.hover = false;
            this.isPressed = false;
            this.font = font;
            this.text = text;
            this.textColor = textColor ?? Color.Black;

            this.width = width;
            this.height = height;

            // Set collision rectangle size
            this.collision.Width = width * Settings.PIXEL_RATIO;    // Adjusted
            this.collision.Height = height * Settings.PIXEL_RATIO;  // Adjusted
        }

        public override void Update(GameTime gameTime, InputHandler input)
        {
            if (input == null)
            {
                throw new ArgumentNullException(nameof(input), "Input handler cannot be null.");
            }

            if (collision.Contains(input.GetMousePosition()))
            {
                Console.WriteLine("Mouse is over the button.");

                if (input.IsLeftMouseButtonClicked())
                {
                    isPressed = true;
                    Console.WriteLine("Button clicked.");
                }

                if (input.IsLeftMouseButtonDown())
                {
                    sprite.SetColor(Color.Gray);
                    Console.WriteLine("Mouse button held down.");
                }
                else
                {
                    sprite.SetColor(Color.LightGray);
                    Console.WriteLine("Hovering but not clicked.");
                }
                hover = true;
            }
            else
            {
                sprite.SetColor(Color.White);
                hover = false;
            }

            base.Update(gameTime, input);
        }


        public override void Draw(SpriteBatch spriteBatch)
        {
            base.Draw(spriteBatch);

            if (!string.IsNullOrEmpty(text))
            {
                Vector2 textSize = font.MeasureString(text);
                Vector2 textOrigin = textSize / 2f;

                Vector2 buttonCenter = new Vector2(
                    collision.X + collision.Width / 2f,
                    collision.Y + collision.Height / 2f
                    //collision.X + collision.Width,
                    //collision.Y + collision.Height
                    //collision.X + (collision.Width - textSize.X) / 2,
                    //collision.Y + (collision.Height - textSize.Y) / 2
                );
              
                //Vector2 textPosition = new Vector2(
                //    collision.X + (collision.Width - textSize.X) / 2,
                //    collision.Y + (collision.Height - textSize.Y) / 2
                //);
                
                //spriteBatch.DrawString(font, text, textPosition, textColor);

                spriteBatch.DrawString(
                    font,
                    text,
                    buttonCenter,
                    textColor,
                    0f,
                    textOrigin,
                    Settings.PIXEL_RATIO, // Apply scaling if necessary
                    SpriteEffects.None,
                    0f
                );
            }
        }


    }
}
