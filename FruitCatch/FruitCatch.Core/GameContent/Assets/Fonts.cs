﻿using Microsoft.Xna.Framework.Content;
using Microsoft.Xna.Framework.Graphics;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FruitCatch.Core.GameContent.Assets
{
    public class Fonts
    {
        public static SpriteFont ScoreFont { get; private set; }


        public static void Load(ContentManager content)
        {


            ScoreFont = content.Load<SpriteFont>("Fonts/MyFont");

        }
    }
}