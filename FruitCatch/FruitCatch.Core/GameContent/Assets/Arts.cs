using Microsoft.Xna.Framework.Content;
using Microsoft.Xna.Framework.Graphics;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Net.Mime.MediaTypeNames;

namespace FruitCatch.Core.GameContent.Assets
{
    public class Arts
    {
        public static Dictionary<string, Texture2D> IMAGES {  get; set; }


        public static void Load(ContentManager content)
        {
            IMAGES = new Dictionary<string, Texture2D>();

            List<string> images = new List<string>() {
                "cave1",
                "cave2",
                "cave3",
                "icons8-anaconda-85",
                "icons8-crystal-48",
                "icons8-emerald-48",
                "icons8-gold-bars-48",
                "icons8-jewel-48",
                "icons8-mine-trolley-96",
                "icons8-mouse-animal-48",
                "icons8-ruby-64",
                "icons8-silver-bars-48",
                "icons8-snake-48",
                "icons8-spider-96",
                "icons8-stone-48",
                "icons8-topaz-48",
            };

            foreach (string image in images)
            {
                IMAGES.Add(image, content.Load<Texture2D>("Images/"+image));
            }

        }
    }
}
