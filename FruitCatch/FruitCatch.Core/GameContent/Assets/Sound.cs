using Microsoft.Xna.Framework.Audio;
using Microsoft.Xna.Framework.Content;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Media;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FruitCatch.Core.GameContent.Assets
{
    public class Sound
    {
        public static Song Music { get; private set; }
        //public static SoundEffect CoinSound { get; private set; }


        public static void Load(ContentManager content)
        {
            Music = content.Load<Song>("Audio/jingle-bells");

            //CoinSound = content.Load<SoundEffect>("Audio/");
        }
    }
}
