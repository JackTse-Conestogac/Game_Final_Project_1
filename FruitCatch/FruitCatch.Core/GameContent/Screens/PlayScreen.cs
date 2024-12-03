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
using FruitCatch.Core.GameContent.Globals;
using FruitCatch.Core.GameContent.Input;

namespace FruitCatch.Core.GameContent.Screens
{
    public class PlayScreen : GameScreen
    {
        private ScoreManager _scoreManager;
        private Player player;

        // Text Attributes
        private string t_Text;
        private string l_Text;
        private string s_Text;
        private Text timerText;
        private Text levelText;
        private Text scoreText;
        private Vector2 timerTextPosition;
        private Vector2 levelTextPosition;
        private Vector2 scoreTextPosition;
        private SpriteFont timerFont;
        private SpriteFont levelFont;
        private SpriteFont scoreFont;

        public PlayScreen(Sprite background) : base(background)
        {

            //player = new Player();

            t_Text = $"Timer: {Global.Time:HH:mm:ss}";
            timerFont = Fonts.ScoreFont;
            timerTextPosition = new Vector2(Settings.SCREEN_WIDTH - 200, 30);
            timerText = new Text(t_Text, timerFont, timerTextPosition, Color.Cyan);

            //l_Text = $"Level: {Global.CurrentLevel}";
            //levelFont = Fonts.ScoreFont;
            //levelTextPosition = new Vector2(Settings.SCREEN_WIDTH - 500, 30);
            //levelText = new Text(t_Text, timerFont, timerTextPosition, Color.Cyan);

            //s_Text = $"Score: {Global.Time}";
            //scoreFont = Fonts.ScoreFont;
            //scoreTextPosition = new Vector2(Settings.SCREEN_WIDTH - 900, 30);
            //scoreText = new Text(t_Text, timerFont, timerTextPosition, Color.Cyan);

        }

        public override void Update(GameTime gameTime, InputHandler input, FruitCatchGame game)
        {
            base.Update(gameTime, input, game);
            Global.Time = Global.Time.AddMilliseconds(gameTime.ElapsedGameTime.TotalMilliseconds);
            this.timerText.Update(gameTime, $"Timer: {Global.Time:HH:mm:ss}");
            //this.levelText.Update(gameTime, $"Level: {Global.CurrentLevel}");
            //this.scoreText.Update(gameTime, $"Score: {Global.Score}");

        }
        public override void Draw(SpriteBatch spriteBatch)
        {
            base.Draw(spriteBatch);
            this.timerText.Draw(spriteBatch);
            //this.levelText.Draw(spriteBatch);
            //this.scoreText.Draw(spriteBatch);


            //this.player.Draw(spriteBatch);
        }
    }
}
