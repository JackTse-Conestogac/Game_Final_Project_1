using FruitCatch.Core.GameContent.Engines;
using FruitCatch.Core.GameContent.Enum;
using FruitCatch.Core.GameContent.Globals;
using FruitCatch.Core.GameContent.Input;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FruitCatch.Core.GameContent.Database;
using FruitCatch.Core.GameContent.Assets.Audio;
using System.Threading;
using FruitCatch.Core.GameContent.Assets.Fonts;

namespace FruitCatch.Core.GameContent.Screens
{
    public class GameOverScreen : GameScreen
    {
        private DataManager dataManager;
        private Button backButton;
        private Button restartButton;
        private Button quitButton;
        private SpriteFont textFont;
        private const string backButtonText = "BACK TO Menu";
        private const string restartGameButtonText = "RESTART";
        private const string quitButtonText = "QUIT";


        public GameOverScreen(Sprite background) : base(background)
        {
             dataManager = new DataManager();
            //Text
            textFont = Fonts.RegularFont;

            int buttonWidth = 100; // Example button width
            int buttonHeight = 80; // Example button height
            int startX = (Settings.SCREEN_WIDTH - 660) / 2; // Horizontal center
            int startY = 500; // Starting Y-coordinate


            // Create Button
            //this.backButton = new Button(startX, startY, buttonWidth, buttonHeight, textFont, backButtonText, Color.Black);
            //this.restartButton = new Button(startX + buttonSpacing, startY, buttonWidth, buttonHeight, textFont, restartGameButtonText, Color.Black);
            this.backButton = new Button(startX, startY, buttonWidth, buttonHeight, new Sprite("btn_back"));
            this.restartButton = new Button(startX + 300, startY, buttonWidth, buttonHeight, new Sprite("btn_restart"));
            this.quitButton = new Button(startX + 600, startY, buttonWidth, buttonHeight, new Sprite("btn_quit"));

        }

        public override void Update(GameTime gameTime, InputHandler input, FruitCatchGame game)
        {
            base.Update(gameTime, input, game);

            this.backButton.Update(gameTime, input);
            this.restartButton.Update(gameTime, input);
            this.quitButton.Update(gameTime, input);

            if (backButton.IsPressed())
            {
                // Update record in database
                dataManager.UpdateRecord(Global.CurrentPlayName, Global.CurrentLevel.ToString(), Global.Score);

                AudioSource.PlaySound("UI_Back");
                AudioSource.PlayMusic("Mus_Lobby");

                Global.InitialProperties(); // Initilizae Gobal Properties
                
                
                game.ChangeMenu(MenuState.StartScreen); // Change Menu to Start Screen
            }

            if (restartButton.IsPressed())
            {
             
                AudioSource.PlaySound("UI_StartGame");
                if (Global.CurrentLevel == Levels.Level3)
                {

                    Global.CurrentLevel = Levels.Level1;
                    Global.InitialForReplay();
                }
               
                game.ChangeMenu(MenuState.PlayScreen);
            }

            if (quitButton.IsPressed())
            {
                AudioSource.PlaySound("UI_Click");
                FruitCatchGame.Instance.Exit();
            }
        }

        public override void Draw(SpriteBatch spriteBatch)
        {
            base.Draw(spriteBatch);
            this.backButton.Draw(spriteBatch);
            this.restartButton.Draw(spriteBatch);
            this.quitButton.Draw(spriteBatch);
        }
    }
}
