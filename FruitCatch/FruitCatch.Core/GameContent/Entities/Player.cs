using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FruitCatch.Core.GameContent.Engines;
using FruitCatch.Core.GameContent.Input;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using static System.Net.Mime.MediaTypeNames;

namespace FruitCatch.Core.GameContent.Entities
{
    public class Player : GameObject
    {
        private Vector2 _position;
        private Vector2 _speed;

        public Player(Vector2 position, Vector2 speed ,Sprite _sprite) : base((int)position.X, (int)position.Y, _sprite) 
        {
            _position = position;
            _speed = speed;
        }

        //public override void Update(GameTime gameTime, InputHandler input)
        //{


        //    if (input.IsKeyPressed(Keys.Left) || input.IsKeyPressed(Keys.A))
        //    {
        //        _position -= _speed;
        //        if (_position.X < 0)
        //        {
        //            _position.X = 0;
        //        }
        //    }
        //    if (input.IsKeyPressed(Keys.Right) || input.IsKeyPressed(Keys.D))
        //    {
        //        _position += _speed;
        //        if (_position.X > Shared.stage.X - tex.Width)
        //        {
        //            _position.X = Shared.stage.X - tex.Width;
        //        }
        //    }
        //    base.Update(gameTime);
        //}
        //public override void Draw(SpriteBatch spriteBatch, Vector2 position, Color color)
        //{
            
        //    spriteBatch.Draw(spriteBatch, position, Color.White);
            
           
        //}

        //public Rectangle getBounds()
        //{
        //    return new Rectangle((int)position.X, (int)position.Y, tex.Width, tex.Height);
        //}
    }
}
