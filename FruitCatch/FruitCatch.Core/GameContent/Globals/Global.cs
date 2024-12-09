using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Security;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;
using FruitCatch.Core.GameContent.Enum;

namespace FruitCatch.Core.GameContent.Globals
{
    public class Global
    {
        public static Global INSTANCE { get; private set; }
        public static string CurrentPlayName { get; set; } = string.Empty;

        
        public static int PlayTime;

        public static Levels CurrentLevel { get; set; }
        public static int Score { get; set; } = 0;


        public static void InitialProperties()
        {
            CurrentPlayName = string.Empty;
            CurrentLevel = Levels.Level1;
            PlayTime = 30;
            Score = 0;
        }

        public static void InitialForReplay()
        {
            CurrentLevel = Levels.Level1;
            PlayTime = 30;
            Score = 0;
        }
    }
}
