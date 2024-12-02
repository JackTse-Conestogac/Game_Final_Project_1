using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Security;
using System.Text;
using System.Threading.Tasks;
using FruitCatch.Core.GameContent.Enum;

namespace FruitCatch.Core.GameContent
{
    public class Global
    {
        public static Global Instance { get; private set; }

        public DateTime DateTime {  get; set; }

        public int Timer {  get; set; }

        public Levels CurrentLevel { get; set; }

        public int Score { get; set; }

    }
}
