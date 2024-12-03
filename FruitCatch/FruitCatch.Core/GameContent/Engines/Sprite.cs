using FruitCatch.Core.GameContent.Assets;
using FruitCatch.Core.GameContent.Globals;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Media;
using System;
using System.Linq;
using System.Resources;
using System.Text;
using System.Threading.Tasks;

namespace FruitCatch.Core.GameContent.Engines
{
    public class Sprite
    {
        protected Texture2D texture;
        protected Rectangle destinationRectangle;
        protected Color color;
        protected float rotation;
        protected Vector2 position;
        protected SpriteEffects imgOrientation;

        public Point GetTextureSize()
        {
            return new Point(this.destinationRectangle.Width, this.destinationRectangle.Height);
        }

        public Point GetTextureOriginalSize() // Added
        {
            return new Point(this.texture.Width, this.texture.Height);
        }

        public Vector2 GetPosition()
        {
            return new Vector2(destinationRectangle.X, destinationRectangle.Y);
        }

        public void SetColor(Color color)
        {
            this.color = color;
        }

        public void SetTexture(Texture2D texture)
        {
            this.texture = texture;
        }

        public void SetOrientation(SpriteEffects imgOrientation)
        {
            this.imgOrientation = imgOrientation;
        }
        public void SetRotation (float rotation)
        {
            this.rotation = rotation;
        }
        public void SetPosition(int x, int y)
        {
            this.position.X = x;
            this.position.Y = y;
        }

        public Sprite(string img)
        {
            this.Initialize(img, 0, 0, SpriteEffects.None);
        }

        public Sprite(string img, int x, int y)
        {
            this.Initialize(img, x, y, SpriteEffects.None);
        }

        public Sprite(string img, int x, int y, SpriteEffects imgOrientation)
        {
            this.Initialize(img, x, y, imgOrientation);
        }

        private void Initialize(string img, int x, int y, SpriteEffects imgOrientation)
        {
            //this.texture = Arts.IMAGES[img];
            //this.color = Color.White;
            //this.rotation = 0f;
            //this.imgOrientation = imgOrientation;
            //this.position = new Vector2(0, 0);
            //this.destinationRectangle = new Rectangle((x + (int)this.position.X) * Settings.PIXEL_RATIO,
            //    (y + (int)this.position.Y) * Settings.PIXEL_RATIO,
            //    this.texture.Width * Settings.PIXEL_RATIO,
            //    this.texture.Height * Settings.PIXEL_RATIO);

            this.texture = Arts.IMAGES[img];
            this.color = Color.White;
            this.rotation = 0f;
            this.imgOrientation = imgOrientation;

            this.destinationRectangle = new Rectangle(
                x * Settings.PIXEL_RATIO,
                y * Settings.PIXEL_RATIO,
                this.texture.Width * Settings.PIXEL_RATIO,
                this.texture.Height * Settings.PIXEL_RATIO
            );
        }

        public virtual void Update(int x, int y)
        {
            //this.destinationRectangle.X = (x + (int)this.position.X) * Settings.PIXEL_RATIO;
            //this.destinationRectangle.Y = (y + (int)this.position.Y) * Settings.PIXEL_RATIO;
            //this.destinationRectangle.Width = this.texture.Width * Settings.PIXEL_RATIO;
            //this.destinationRectangle.Height = this.texture.Height * Settings.PIXEL_RATIO;

            this.destinationRectangle.X = x * Settings.PIXEL_RATIO;
            this.destinationRectangle.Y = y * Settings.PIXEL_RATIO;
            this.destinationRectangle.Width = this.texture.Width * Settings.PIXEL_RATIO;
            this.destinationRectangle.Height = this.texture.Height * Settings.PIXEL_RATIO;
        }

        public virtual void Draw(SpriteBatch spriteBatch)
        {
            spriteBatch.Draw(this.texture, this.destinationRectangle, null, this.color, this.rotation, this.position, this.imgOrientation, 0f);
        }

    }
}
