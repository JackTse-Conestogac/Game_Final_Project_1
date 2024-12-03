using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FruitCatch.Core.GameContent.Globals;
using FruitCatch.Core.GameContent.Input;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;

namespace FruitCatch.Core.GameContent.Engines
{
    public class GameObject
    {
        protected Rectangle collision;
        protected Sprite sprite;

        protected int logicalX; 
        protected int logicalY;

        public float X { get { return collision.X; } }
        public float Right { get { return collision.Right; } }

        protected GameObject(int x, int y, Sprite sprite)
        {
            //this.sprite = sprite;
            //Point textureSize = sprite.GetTextureSize();
            //this.collision = new Rectangle(x * Settings.PIXEL_RATIO, y * Settings.PIXEL_RATIO, textureSize.X, textureSize.Y);
            //this.sprite.Update(x, y);

            this.sprite = sprite;
            this.logicalX = x; // Added
            this.logicalY = y; // Added

            int width = 0;
            int height = 0;

            if (sprite != null)
            {
                width = sprite.GetTextureOriginalSize().X * Settings.PIXEL_RATIO;
                height = sprite.GetTextureOriginalSize().Y * Settings.PIXEL_RATIO;
            }

            this.collision = new Rectangle(
                x * Settings.PIXEL_RATIO,
                y * Settings.PIXEL_RATIO,
                width,
                height
            );

            if (sprite != null)
            {
                this.sprite.Update(x, y);
            }


        }

        public bool CollisionWith(GameObject obj)
        {
            return this.collision.Intersects(obj.collision);
        }

        public virtual void Update(GameTime gameTime, InputHandler input)
        {
            collision.X = logicalX * Settings.PIXEL_RATIO;
            collision.Y = logicalY * Settings.PIXEL_RATIO;
            if (sprite != null)
            {
                sprite.Update(logicalX, logicalY); // Adjusted
            }
        }

        public virtual void Draw(SpriteBatch spriteBatch)  
        {
            this.sprite.Draw(spriteBatch);
        }
    }
}
