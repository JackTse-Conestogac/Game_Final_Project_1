using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FruitCatch.Core.GameContent.Engines;
using FruitCatch.Core.GameContent.Globals;
using FruitCatch.Core.GameContent.Input;
using FruitCatch.Core.GameContent.Enum;
using FruitCatch.Core.GameContent.Assets.Audio;
using FruitCatch.Core.GameContent.Assets.Fonts;

namespace FruitCatch.Core.GameContent.Screens
{
    public class StartScreen : GameScreen
    {

        private Button startGameButton;
        private Button loadGameButton;
        private Button helpButton;
        private Button aboutButton;
        private Button quitButton;
        private Button scoreBoardButton;



        private SpriteFont textFont;

        private Sprite title;
        private const string gameTitleText = "MINING TREASURE HUNT";
        private const string startButtonText = "START GAME";
        private const string loadGameButtonText = "LOAD GAME";
        private const string helpButtonText = "HELP";
        private const string aboutButtonText = "ABOUT";
        private const string gameEndButtonText = "HIGHEST SCORE";
        private const string quitButtonText = "QUIT";
        
        public StartScreen(Sprite bg) :base(bg)
        {

            int buttonWidth = 150; // Assuming 200px width
            int buttonHeight = 90; // Assuming 50px height
            int centerX = (Settings.SCREEN_WIDTH - buttonWidth) / 2 ; // Centered horizontally
            int centerY = (Settings.SCREEN_HEIGHT - buttonHeight) / 2;


            if(FruitCatchGame.Instance.Platform == Platform.ANDROID) 
            {
                title = new Sprite("text_game_title");
                title.SetPosition(Settings.SCREEN_WIDTH / 2 - 800, -300);
            }
            else
            {
                title = new Sprite("text_game_title");
                title.SetPosition(Settings.SCREEN_WIDTH / 2 - 890, -410);
            }

            // With text
            //this.startGameButton = new Button(centerX, centerY - 200, buttonWidth, buttonHeight, textFont, startButtonText, Color.Cyan);
            //this.loadGameButton = new Button(centerX, centerY - 100, buttonWidth, buttonHeight, textFont, loadGameButtonText, Color.Cyan);
            //this.helpButton = new Button(centerX, centerY, buttonWidth, buttonHeight, textFont, helpButtonText, Color.Cyan);
            //this.aboutButton = new Button(centerX, centerY + 100, buttonWidth, buttonHeight, textFont, aboutButtonText, Color.Cyan);
            //this.scoreBoardButton = new Button(centerX, centerY + 200, buttonWidth, buttonHeight, textFont, gameEndButtonText, Color.Cyan);
            //this.restartButton = new Button(centerX, centerY + 300, buttonWidth, buttonHeight, textFont, quitButtonText, Color.Cyan);

            // Without text
            this.startGameButton = new Button(centerX, centerY - 200 , buttonWidth, buttonHeight, new Sprite("btn_start_game"));
            this.loadGameButton = new Button(centerX, centerY - 100 , buttonWidth, buttonHeight, new Sprite("btn_load_game"));
            this.helpButton = new Button(centerX, centerY, buttonWidth, buttonHeight, new Sprite("btn_help"));
            this.aboutButton = new Button(centerX, centerY + 100 , buttonWidth, buttonHeight, new Sprite("btn_about"));
            this.scoreBoardButton = new Button(centerX, centerY + 200 , buttonWidth, buttonHeight, new Sprite("btn_highest_score"));
            this.quitButton = new Button(centerX, centerY + 300 , buttonWidth, buttonHeight, new Sprite("btn_quit"));
        }

        public override void Update(GameTime gameTime, InputHandler input, FruitCatchGame game)
        {
            base.Update(gameTime, input, game);

            this.startGameButton.Update(gameTime, input);
            this.loadGameButton.Update(gameTime, input);
            this.helpButton.Update(gameTime, input);
            this.aboutButton.Update(gameTime, input);
            this.quitButton.Update(gameTime, input);
            this.scoreBoardButton.Update(gameTime, input);

            if (startGameButton.IsPressed())
            {
                Console.WriteLine("Start Game selected.");
                AudioSource.PlaySound("UI_Button_Click");
                game.ChangeMenu(MenuState.PlayerInfoScreen);
            }
            if (loadGameButton.IsPressed())
            {
                Console.WriteLine("LoadRecordList Game selected.");
                AudioSource.PlaySound("UI_Button_Click");
                game.ChangeMenu(MenuState.LoadGameScreen);
            }
            if (helpButton.IsPressed())
            {
                Console.WriteLine("Help selected.");
                AudioSource.PlaySound("UI_Button_Click");
                game.ChangeMenu(MenuState.HelpScreen);
            }
            if (aboutButton.IsPressed())
            {
                Console.WriteLine("About selected.");
                AudioSource.PlaySound("UI_Button_Click");
                game.ChangeMenu(MenuState.AboutScreen);
            }

            if (scoreBoardButton.IsPressed())
            {
                Console.WriteLine("Score Board selected.");
                AudioSource.PlaySound("UI_Button_Click");
                game.ChangeMenu(MenuState.ScoreBoardScreen);
            }

            if (quitButton.IsPressed())
            {
                Console.WriteLine("Quit selected.");
                AudioSource.PlaySound("UI_Button_Click");
                game.ChangeMenu(MenuState.Quit);
            }
        }

        public override void Draw(SpriteBatch spriteBatch)
        {
            base.Draw(spriteBatch);
            if(FruitCatchGame.Instance.Platform == Platform.ANDROID)
            {

                this.title.Draw(spriteBatch, 0.8f);
                this.startGameButton.Draw(spriteBatch, 0.1f);
                this.loadGameButton.Draw(spriteBatch, 0.2f);
                this.helpButton.Draw(spriteBatch, 0.2f);
                this.aboutButton.Draw(spriteBatch, 0.2f);
                this.quitButton.Draw(spriteBatch, 0.2f);
                this.scoreBoardButton.Draw(spriteBatch, 0.2f);
            }
            else
            {
                this.title.Draw(spriteBatch);
                this.startGameButton.Draw(spriteBatch, 0.1f);
                this.loadGameButton.Draw(spriteBatch, 0.2f);
                this.helpButton.Draw(spriteBatch , 0.2f);
                this.aboutButton.Draw(spriteBatch, 0.2f);
                this.quitButton.Draw(spriteBatch, 0.2f);
                this.scoreBoardButton.Draw(spriteBatch, 0.2f);
            }
        }
    }
}
