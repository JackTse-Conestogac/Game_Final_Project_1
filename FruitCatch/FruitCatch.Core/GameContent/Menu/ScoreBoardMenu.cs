using FruitCatch.Core.GameContent.Engines;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FruitCatch.Core.GameContent.Globals;
using FruitCatch.Core.GameContent.Input;
using FruitCatch.Core.GameContent.Assets.Fonts;

namespace FruitCatch.Core.GameContent.Menu
{
    internal class ScoreBoardMenu : GameObject
    {
        private static Sprite _background = new Sprite("panel_score_board_02");
        private SpriteFont _textFont;
        private Vector2 _position;
        private Table _scoreTable;

        public ScoreBoardMenu(int startX, int startY) :base(startX, startY, _background) // scoreboard UI background
        {
            _background.SetPosition(startX, startY);
            _textFont = Fonts.RegularFont;
            _scoreTable = new Table(_textFont, new Vector2(startX - 100, startY), new int[] { 300, 300, 300}, 50, Color.Cyan);
        }

        public void Update(GameTime gameTime, InputHandler input)
        {
            this._scoreTable.Clear();
            this._scoreTable.AddRow("Name:", "Level:", "Score:");
            this._scoreTable.AddRow($"{Global.CurrentPlayName}", $"{Global.CurrentLevel}", $"{Global.Score}");
        }

        public void Draw(SpriteBatch spriteBatch)
        {
            base.Draw(spriteBatch);
            _scoreTable.Draw(spriteBatch);
        }
    }
}
