using FruitCatch.Core.GameContent.Assets.Arts;
using FruitCatch.Core.GameContent.Engines;
using FruitCatch.Core.GameContent.Enum;
using FruitCatch.Core.GameContent.Globals;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FruitCatch.Core.GameContent.Entities
{
    public class ItemGeneretor
    {
        private List<Item> items; // To store active items
        private Random random;
        private Player player;
        private Levels currentLevel;

        public ItemGeneretor(Player player)
        {
            this.items = new List<Item>();
            this.random = new Random();
            this.player = player;
            this.currentLevel = Global.CurrentLevel;
        }

        public void GenerateItem()
        {
            var availableItems = LevelItemConfig.GetItemsForLevel(currentLevel);
            if (availableItems.Count == 0)
                return;

            int x = random.Next(0, Settings.SCREEN_WIDTH - 64); // Random horizontal position
            int y = -64; // Spawn above the screen
            ItemType type = availableItems[random.Next(availableItems.Count)]; // Select a random item type

            // Retrieve the sprite name for the item type
            string spriteName = ArtSource.ITEM_SPRITES[type];
            Sprite sprite = new Sprite(spriteName); // Create the sprite using its name

            items.Add(new Item(x, y, type, sprite));
        }

        public void Update(GameTime gameTime)
        {
            for (int i = items.Count - 1; i >= 0; i--)
            {
                Item item = items[i];

                item.Fall(600f, gameTime); // item Fall speed

                if (item.IsOffScreen())
                {
                    items.RemoveAt(i);
                    continue;
                }

                if (item.CheckCollision(player))
                {
                    Global.Score += item.GetItemReward();
                    items.RemoveAt(i);
                }
            }
        }

        public void Draw(SpriteBatch spriteBatch)
        {
            foreach (var item in items)
            {
                item.Draw(spriteBatch);
            }
        }

    }
}
