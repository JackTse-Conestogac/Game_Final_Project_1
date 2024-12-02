using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FruitCatch.Core.GameContent.Menu;
using FruitCatch.Core.GameContent.Assets;

namespace FruitCatch.Core.GameContent.Scenes
{
    public class StartScene : GameScene
    {
        private MenuComponent menu;
        public MenuComponent Menu { get => menu; set => menu = value; }

        public StartScene(Game game) : base(game)
        {
            FruitCatchGameManager g = (FruitCatchGameManager)game;
            string[] menuItems = { "START GAME", "HELP", "SCORE BOARD", "ABOUT", "QUIT" };

            Menu = new MenuComponent(game, g.MenuSprite, Fonts.RegularFont, Fonts.HilightFont, menuItems);
            this.Components.Add(Menu);
        }

    }
}
