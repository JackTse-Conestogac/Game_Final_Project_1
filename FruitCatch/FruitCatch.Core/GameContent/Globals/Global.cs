﻿using System;
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
        public static string CurrentPlayName { get;  set; } 
        public static DateTime Time { get; set; } = DateTime.Now;
        public int PlayTime { get { return _playTime; } set { _playTime = value; } }
        public static Levels CurrentLevel { get; set; }
        public static int Score { get; set; } = 0;

    }
}
