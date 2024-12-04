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
        // Global
        private ScoreManager _scoreManager;
        private int countDown;
        private float elapsedTime;

        // 
        private Player player;
        private Vector2 playerStartPosition;
        private float playerSpeed;

        // Text Attributes
        private string t_Text;
        private string l_Text;
        private string s_Text;
        private string hb_Text;
        private Text timerText;
        private Text levelText;
        private Text scoreText;
        private Text HealthBarText;
        private Vector2 timerTextPosition;
        private Vector2 levelTextPosition;
        private Vector2 scoreTextPosition;
        private Vector2 HealthBarPosition;
        private SpriteFont timerFont;
        private SpriteFont levelFont;
        private SpriteFont scoreFont;
        private SpriteFont HealthBarFont;

        public PlayScreen(Sprite background) : base(background)
        {
            // Initialize Player
            
            playerSpeed = 1500f; // Pixels per second
            playerStartPosition = new Vector2(Settings.SCREEN_WIDTH / 2, 975);
            player = new Player((int)playerStartPosition.X, (int)playerStartPosition.Y, playerSpeed);

    
            // Initialize countdown timer
            countDown = Global.PlayTime; 
            elapsedTime = 0;

            // Initialize Text
            t_Text = $"Timer: {countDown}";
            timerFont = Fonts.ScoreFont;
            timerTextPosition = new Vector2(10, 10); // Left aligned

            timerText = new Text(t_Text, timerFont, timerTextPosition, Color.Cyan);

            hb_Text = $"Health: {player.HealthBar}";
            HealthBarFont = Fonts.ScoreFont;
            HealthBarPosition = new Vector2(10, 90);
            HealthBarText = new Text(hb_Text, HealthBarFont, HealthBarPosition, Color.Cyan);

            l_Text = $"Level: {Global.CurrentLevel}";
            levelFont = Fonts.ScoreFont;
            levelTextPosition = new Vector2(Settings.SCREEN_WIDTH / 2 - 150, 10);
            levelText = new Text(l_Text, levelFont, levelTextPosition, Color.Cyan);

            s_Text = $"Score: {Global.Score}";
            scoreFont = Fonts.ScoreFont;
            scoreTextPosition = new Vector2(Settings.SCREEN_WIDTH - 250, 10);
            scoreText = new Text(s_Text, scoreFont, scoreTextPosition, Color.Cyan);

        }

        public override void Update(GameTime gameTime, InputHandler input, FruitCatchGame game)
        {
            base.Update(gameTime, input, game);

            //Timer Update Logic
            elapsedTime += (float)gameTime.ElapsedGameTime.TotalSeconds;

            if (elapsedTime >= 1f) // Update every second
            {
                countDown -= 1;
                elapsedTime = 0;
                if (countDown < 0) countDown = 0; // Prevent countdown going negative

                // Update timer text
                timerText.Update(gameTime, $"Timer: {countDown}");
            }

            this.timerText.Update(gameTime, $"Timer: {countDown}");
            this.HealthBarText.Update(gameTime, $"Health: {player.HealthBar} X: {player.Position.X} Y: {player.Position.Y}" );
            this.levelText.Update(gameTime, $"Level: {Global.CurrentLevel}");
            this.scoreText.Update(gameTime, $"Score: {Global.Score}");

            // Update player control
            this.player.Update(gameTime, input);

        }

        public override void Draw(SpriteBatch spriteBatch)
        {
            base.Draw(spriteBatch);

            // Text Draw
            this.timerText.Draw(spriteBatch);
            this.HealthBarText.Draw(spriteBatch);
            this.levelText.Draw(spriteBatch);
            this.scoreText.Draw(spriteBatch);

            this.player.Draw(spriteBatch);
        }
    }
}
