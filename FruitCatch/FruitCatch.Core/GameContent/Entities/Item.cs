using FruitCatch.Core.GameContent.Assets.Audio;
using FruitCatch.Core.GameContent.Database;
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

            // Sync collision rectangle
            collision.X = logicalX; 
            collision.Y = logicalY;

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
            int reward = _type switch
            {
                ItemType.Coin => 20,
                ItemType.Jewserly => 50,
                ItemType.Stone => -5,
                ItemType.Spider => -10,
                ItemType.Silver => 15,
                ItemType.Snake => -30,
                _ => 0
            };

            // Assign Sound Effect 
            string soundEffect = AudioSource.GetSoundEffectForItemType(_type);
            if (!string.IsNullOrEmpty(soundEffect))
            {
                AudioSource.PlaySound(soundEffect);
            }


            return reward;
        }
    }
}
