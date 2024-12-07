using FruitCatch.Core.GameContent.Enum;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FruitCatch.Core.GameContent.Entities
{
    public class LevelItemConfig
    {
        private static Dictionary<Levels, List<ItemType>> levelItems = new Dictionary<Levels, List<ItemType>>();

        static LevelItemConfig()
        {
            // Configure items for each level
            levelItems[Levels.Level1] = new List<ItemType> { ItemType.Silver , ItemType.Stone}; 
            levelItems[Levels.Level2] = new List<ItemType> { ItemType.Coin, ItemType.Spider }; 
            levelItems[Levels.Level3] = new List<ItemType> { ItemType.Jewserly , ItemType.Snake, ItemType.Emerald}; 
         
        }

        public static List<ItemType> GetItemsForLevel(Levels level)
        {
            return levelItems.ContainsKey(level) ? levelItems[level] : new List<ItemType>();
        }
    }
}
