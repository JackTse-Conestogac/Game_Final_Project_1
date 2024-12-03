using FruitCatch.Core.GameContent.Globals;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FruitCatch.Core.GameContent.Engines
{
    public class Text
    {

        private string text;
        private SpriteFont font;
        private Vector2 position;
        private Color color;

        public Text(string text, SpriteFont font, Vector2 position, Color color)
        {
            this.text = text;
            this.font = font;
            this.position = position;
            this.color = color;
        }


        public void Draw(SpriteBatch spriteBatch)
        {
            spriteBatch.DrawString(font, text, position, color);
        }

    }
}
