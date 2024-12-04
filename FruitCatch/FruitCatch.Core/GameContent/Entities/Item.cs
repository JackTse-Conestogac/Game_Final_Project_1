using FruitCatch.Core.GameContent.Enum;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FruitCatch.Core.GameContent.Entities
{
    public class Item
    {
        private ItemType _type;
        
        public Item(ItemType type)
        {
            _type = type;
        }


        public int GetItemReward()
        {

            return 0;
        }
    }
}
