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

        public Sprite Sprite { get { return sprite; } set { sprite = value; } }

        protected int logicalX; 
        protected int logicalY;

        public float X { get { return collision.X; } }
        public float Right { get { return collision.Right; } }

        protected GameObject(int x, int y, Sprite sprite)
        {

            this.sprite = sprite;
            this.logicalX = x;
            this.logicalY = y; 

            int width = 0;
            int height = 0;

            if (sprite != null)
            {
                width = sprite.GetTextureOriginalSize().X;
                height = sprite.GetTextureOriginalSize().Y;
            }

            this.collision = new Rectangle(
                x,
                y,
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
            collision.X = logicalX;
            collision.Y = logicalY;
            if (sprite != null)
            {
                sprite.Update(logicalX, logicalY); 
            }
        }

        public virtual void Draw(SpriteBatch spriteBatch)  
        {
            this.sprite.Draw(spriteBatch);
        }
    }
}
