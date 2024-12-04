using FruitCatch.Core.GameContent.Engines;
using FruitCatch.Core.GameContent.Enum;
using FruitCatch.Core.GameContent.Globals;
using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FruitCatch.Core.GameContent.Entities
{
    public class Item : GameObject
    {
        private ItemType _type;
        private Sprite _sprite;

        public Item(int x, int y, ItemType type, Sprite sprite) : base(x, y, sprite)
        {
            _type = type;
            _sprite = sprite;
        }

        public void Fall(float speed, GameTime gameTime)
        {
            logicalY += (int)(speed * gameTime.ElapsedGameTime.TotalSeconds);
            sprite.Position = new Vector2(logicalX, logicalY);

        }

        public bool IsOffScreen()
        {
            return logicalY > Settings.SCREEN_HEIGHT;
        }

        public bool CheckCollision(Player player)
        {
            return CollisionWith(player);
        }

        public int GetItemReward()
        {
            return _type switch
            {
                ItemType.Coin => 10,
                ItemType.Jewserly => 50,
                ItemType.Stone => -5,
                _ => 0
            };
        }
    }
}
