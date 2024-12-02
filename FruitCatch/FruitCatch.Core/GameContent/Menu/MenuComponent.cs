using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FruitCatch.Core.GameContent.Menu
{
    public class MenuComponent : DrawableGameComponent
    {
        private SpriteBatch sb;
        private SpriteFont regularFont, hilightFont;

        private List<string> menuItems;
        public int SelectedIndex { get; set; }
        private Vector2 position;
        private Color regularColor = Color.Black;
        private Color hilightColor = Color.Red;
        //private MouseState mouseOldState;
        private KeyboardState keyboardOldState;


        public MenuComponent(Game game, SpriteBatch sb,
            SpriteFont regularFont, SpriteFont hilightFont,
            string[] menus) : base(game)
        {
            this.sb = sb;
            this.regularFont = regularFont;
            this.hilightFont = hilightFont;
            menuItems = menus.ToList();
            position = new Vector2(MenuShared.stage.X / 2, MenuShared.stage.Y / 2);
        }

        //public override void Update(GameTime gameTime)
        //{
        //    MouseState ms = Mouse.GetState();
        //    Vector2 tempPos = position;
        //    SelectedIndex = -1; // Reset selection
        //    SpriteFont font = regularFont;

        //    for (int i = 0; i < menuItems.Count; i++)
        //    {

        //        Vector2 size = font.MeasureString(menuItems[i]);

        //        Rectangle boundingBox = new Rectangle(
        //            (int)tempPos.X,
        //            (int)tempPos.Y,
        //            (int)size.X,
        //            (int)font.LineSpacing
        //        );

        //        if (boundingBox.Contains(ms.X, ms.Y))
        //        {
        //            SelectedIndex = i; // Highlight item under mouse

        //            if (ms.LeftButton == ButtonState.Pressed && mouseOldState.LeftButton == ButtonState.Released)
        //            {
        //                // Handle click on menu item
        //                // You can trigger the action associated with the menu item here
        //            }
        //        }

        //        tempPos.Y += font.LineSpacing;
        //    }

        //    mouseOldState = ms;

        //    base.Update(gameTime);
        //}


        public override void Update(GameTime gameTime)
        {
            KeyboardState ks = Keyboard.GetState();
            if (ks.IsKeyDown(Keys.Down) && keyboardOldState.IsKeyUp(Keys.Down))
            {
                SelectedIndex++;
                if (SelectedIndex == menuItems.Count)
                {
                    SelectedIndex = 0;
                }
            }

            if (ks.IsKeyDown(Keys.Up) && keyboardOldState.IsKeyUp(Keys.Up))
            {
                SelectedIndex--;
                if (SelectedIndex == -1)
                {
                    SelectedIndex = menuItems.Count - 1;
                }
            }


            keyboardOldState = ks;

            base.Update(gameTime);
        }


        public override void Draw(GameTime gameTime)
        {
            Vector2 temPos = position;
            sb.Begin();
            for (int i = 0; i < menuItems.Count; i++)
            {
                if (SelectedIndex == i)
                {
                    sb.DrawString(hilightFont, menuItems[i], temPos, hilightColor);
                    temPos.Y += hilightFont.LineSpacing;
                }
                else
                {
                    sb.DrawString(regularFont, menuItems[i], temPos, regularColor);
                    temPos.Y += regularFont.LineSpacing;
                }
            }
            sb.End();

            base.Draw(gameTime);
        }

    }
}
