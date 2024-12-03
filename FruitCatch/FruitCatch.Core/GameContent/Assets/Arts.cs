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
        //public static Texture2D PlayScreenBackground { get; private set; }
        //public static Texture2D GameEndBackground { get; private set; }
        //public static Texture2D StartScreenBackground { get; private set; }


        public static void Load(ContentManager content)
        {
            //StartScreenBackground = content.Load<Texture2D>("Images/cave1");
            //PlayScreenBackground = content.Load<Texture2D>("Images/cave3");
            //GameEndBackground = content.Load<Texture2D>("Images/cave2");
            IMAGES = new Dictionary<string, Texture2D>();

            List<string> images = new List<string>() {
                "cave1",
                "cave2",
                "cave3",
                "icons8-ruby-64",
            };

            foreach (string image in images)
            {
                IMAGES.Add(image, content.Load<Texture2D>("Images/"+image));
            }

        }
    }
}
