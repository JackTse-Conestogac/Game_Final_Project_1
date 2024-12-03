using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Content;
using Microsoft.Xna.Framework.Graphics;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata;
using System.Text;
using System.Threading.Tasks;

namespace FruitCatch.Core.GameContent.Assets
{
    public class Fonts
    {
        public static SpriteFont ScoreFont { get; private set; }
        public static SpriteFont RegularFont { get; private set; }
        public static SpriteFont HilightFont { get; private set; }
        public static SpriteFont GameTitleFont { get; private set; }


        public static void Load(ContentManager content)
        {
            RegularFont = content.Load<SpriteFont>("Fonts/RegularFont");
            HilightFont = content.Load<SpriteFont>("Fonts/HilightFont");
            ScoreFont = content.Load<SpriteFont>("Fonts/ScoreFont");
            GameTitleFont = content.Load<SpriteFont>("Fonts/GameTitleFont");
        }
    }
}
