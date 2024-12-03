using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FruitCatch.Core.GameContent.Assets;
using FruitCatch.Core.GameContent.Engines;
using FruitCatch.Core.GameContent.Entities;
using FruitCatch.Core.GameContent.Managers;
using System.Threading;

namespace FruitCatch.Core.GameContent.Screens
{
    public class PlayScreen : GameScreen
    {
        private ScoreManager _scoreManager;
        private Player player;

        // Text Attributes
        private Text timerText;
        private Text levelText;
        private Text scoreText;
        private SpriteFont timerFont;
        private SpriteFont levelFont;
        private SpriteFont scoreFont;

        public PlayScreen(Sprite background) : base(background)
        {
            
            
        }
    }
}
