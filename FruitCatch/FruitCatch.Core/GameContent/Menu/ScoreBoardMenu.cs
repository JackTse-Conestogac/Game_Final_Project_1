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
using FruitCatch.Core.GameContent.Enum;
using FruitCatch.Core.GameContent.Assets.Fonts;
using System.Reflection.Metadata.Ecma335;

namespace FruitCatch.Core.GameContent.Menu
{
    internal class ScoreBoardMenu : GameObject
    {
        private static Sprite _background = new Sprite("panel_score_board");
        private SpriteFont _textFont;
        private Vector2 _position;
        private Table _scoreTable;

        public ScoreBoardMenu(int startX, int startY) :base(startX, startY, _background) // scoreboard UI background
        {
            _background.SetPosition(startX, startY);

            _textFont = Fonts.ScoreBoardFont;
            if(FruitCatchGame.Instance.Platform == Platform.ANDROID)
            {
                _scoreTable = new Table(_textFont, new Vector2(startX + 600, startY + 370), new int[] { 200, 200, 200 }, 50, Color.Wheat);
            }
            else
            {
                _scoreTable = new Table(_textFont, new Vector2(startX + 680, startY + 430), new int[] { 200, 200, 200 }, 50, Color.Wheat);
            }
           
        }

        public void Update(GameTime gameTime, InputHandler input)
        {
            this._scoreTable.Clear();
            this._scoreTable.AddRow("Name:", "Level:", "Score:");
            this._scoreTable.AddRow($"{Global.CurrentPlayName}", $"{Global.CurrentLevel}", $"{Global.Score}");
        }

        public void Draw(SpriteBatch spriteBatch)
        {
            if(FruitCatchGame.Instance.Platform == Platform.ANDROID)
            {
                base.Draw(spriteBatch, 0.9f);
                _scoreTable.Draw(spriteBatch);
            }
            else
            {
                base.Draw(spriteBatch);
                _scoreTable.Draw(spriteBatch);
            }
        }
    }
}
