using FruitCatch.Core.GameContent.Engines;
using FruitCatch.Core.GameContent.Enum;
using FruitCatch.Core.GameContent.Globals;
using FruitCatch.Core.GameContent.Input;
using FruitCatch.Core.GameContent.Menu;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FruitCatch.Core.GameContent.Database;
using FruitCatch.Core.GameContent.Assets.Audio;
using FruitCatch.Core.GameContent.Assets.Fonts;

namespace FruitCatch.Core.GameContent.Screens
{
    public class GameEndScreen : GameScreen
    {
        private DataManager dataManager;
        private Global _global;
        private Button backButton;
        private Button contineGameButton;
        private SpriteFont textFont;
        private ScoreBoardMenu scoreMenu;
        private const string backButtonText = "BACK TO Menu";
        private const string restartGameButtonText = "CONTINUE GAME";
        private Sprite title;


        public GameEndScreen(Sprite background) : base(background)
        {
            _global = new Global();
            dataManager = new DataManager();

            //Text
            textFont = Fonts.RegularFont;

            //Button
            int buttonWidth = 100; // Example button width
            int buttonHeight = 80; // Example button height
            int buttonSpacing = 500; // Space between buttons
            int startX = (Settings.SCREEN_WIDTH - 550) / 2; // Horizontal center
            int startY = 900; // Starting Y-coordinate

            if (FruitCatchGame.Instance.Platform == Platform.ANDROID)
            {
                // title
                title = new Sprite("text_score");
                title.SetPosition(Settings.SCREEN_WIDTH / 2 - 930, - 415);

                // Button
                this.backButton = new Button(startX - 100, startY - 100, buttonWidth, buttonHeight, new Sprite("btn_back"));
                this.contineGameButton = new Button(startX - 100 + buttonSpacing, startY - 100, buttonWidth, buttonHeight, new Sprite("btn_continue"));

                // Score Board
                this.scoreMenu = new ScoreBoardMenu(startX - 650, startY - 900);
            }
            else
            {
                // title
                title = new Sprite("text_score");
                title.SetPosition(Settings.SCREEN_WIDTH / 2 - 850, - 400);

                // Button
                this.backButton = new Button(startX, startY, buttonWidth, buttonHeight, new Sprite("btn_back"));
                this.contineGameButton = new Button(startX + buttonSpacing, startY, buttonWidth, buttonHeight, new Sprite("btn_continue"));

                // Score Board
                this.scoreMenu = new ScoreBoardMenu(startX - 650, startY - 900);
            }
            
        }

        public override void Update(GameTime gameTime, InputHandler input, FruitCatchGame game)
        {
            base.Update(gameTime, input, game);

            this.backButton.Update(gameTime, input);
            this.contineGameButton.Update(gameTime, input);
            this.scoreMenu.Update(gameTime, input);

            if (backButton.IsPressed())
            {
                // Update Record in database
                dataManager.UpdateRecord(Global.CurrentPlayName, Global.CurrentLevel.ToString(), Global.Score);

                AudioSource.PlaySound("UI_Back");

                Global.InitialProperties();
                
                game.ChangeMenu(MenuState.StartScreen);
            }

            if (contineGameButton.IsPressed())
            {
             
                AudioSource.PlaySound("UI_StartGame");

                if (Global.CurrentLevel == Levels.Level1)
                {
                    Global.CurrentLevel = Levels.Level2;
                }
                else if(Global.CurrentLevel == Levels.Level2)
                {
                    Global.CurrentLevel = Levels.Level3;
                }
                
                game.ChangeMenu(MenuState.PlayScreen);

            }

        }

        public override void Draw(SpriteBatch spriteBatch)
        {

            base.Draw(spriteBatch);
            this.scoreMenu.Draw(spriteBatch);
            this.backButton.Draw(spriteBatch , 0.2f);
            this.contineGameButton.Draw(spriteBatch, 0.2f);
            this.title.Draw(spriteBatch, 0.9f);
        }
    }
}
