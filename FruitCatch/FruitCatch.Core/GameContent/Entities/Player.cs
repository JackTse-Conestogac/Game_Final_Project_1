using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FruitCatch.Core.GameContent.Engines;
using FruitCatch.Core.GameContent.Globals;
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
        //private static Sprite _sprite;
        private float _speed;
        private int _healthBar;
        public int HealthBar { get { return _healthBar; } }
        public Vector2 Position { get { return _position; } set { _position = value; } }



        public Player(int x,int y, float speed) : base(x, y, new Sprite("icons8-mine-trolley-96")) 
        {
            _position = new Vector2(x,y);
            _speed = speed;
            _healthBar = 100;
            

        }

        public override void Update(GameTime gameTime, InputHandler input)
        {
            float movement = _speed * (float)gameTime.ElapsedGameTime.TotalSeconds;

            // Use InputHandler for movement
            if (input.IsKeyHeld(Keys.Right) || input.IsKeyHeld(Keys.D)) // CHANGED
            {
                _position.X += movement;

                Console.WriteLine("Moving Right");
            }

            if (input.IsKeyHeld(Keys.Left) || input.IsKeyHeld(Keys.A)) // CHANGED
            {
                _position.X -= movement;

                Console.WriteLine("Moving Left");
            }

            // Set Bounds
            int playerWidth = sprite.GetTextureOriginalSize().X;
            int playerHeight = sprite.GetTextureOriginalSize().Y;
            _position.X = MathHelper.Clamp(_position.X, 0, Settings.SCREEN_WIDTH - playerWidth);
            _position.Y = MathHelper.Clamp(_position.Y, 0, Settings.SCREEN_HEIGHT - playerHeight);
            logicalX = (int)_position.X;
            logicalY = (int)_position.Y;

            collision.X = logicalX; // Update collision rectangle
            collision.Y = logicalY;

            sprite.Position = _position;

            Console.WriteLine($"Player Position: {_position}");

            base.Update(gameTime, input);
        }


        public override void Draw(SpriteBatch spriteBatch)
        {
            sprite.Draw(spriteBatch);
        }


    }
}
