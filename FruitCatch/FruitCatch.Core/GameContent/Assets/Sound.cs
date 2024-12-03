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
        public static Dictionary<string, SoundEffect> Sounds { get; private set; }


        public static void Load(ContentManager content)
        {
            Music = content.Load<Song>("Audio/jingle-bells");

            Sounds = new Dictionary<string, SoundEffect>();

            List<string> soundList = new List<string>() { 
               
            };


            foreach(string sfx in soundList)
            {
                Sounds.Add(sfx, content.Load<SoundEffect>("Audio" + sfx));
            }
            

        }
    }
}
