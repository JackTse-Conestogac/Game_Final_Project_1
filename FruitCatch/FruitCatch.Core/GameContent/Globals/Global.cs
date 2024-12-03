using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Security;
using System.Text;
using System.Threading.Tasks;
using FruitCatch.Core.GameContent.Enum;

namespace FruitCatch.Core.GameContent.Globals
{
    public class Global
    {
        private int _playTime = 10;

        public static Global INSTANCE { get; private set; }
        public string CurrentPlayName { get;  set; } 
        public DateTime DateTime { get; set; }
        public int PlayTime { get { return _playTime; } set { _playTime = value; } }
        public Levels CurrentLevel { get; set; }
        public int Score { get; set; }

    }
}
