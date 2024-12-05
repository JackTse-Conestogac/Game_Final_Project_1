using FruitCatch.Core.GameContent.Assets;
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


        public GameEndScreen(Sprite background) : base(background)
        {
            _global = new Global();
            dataManager = new DataManager();

            //Text
            textFont = Fonts.RegularFont;

            int buttonWidth = 50; // Example button width
            int buttonHeight = 50; // Example button height
            int buttonSpacing = 500; // Space between buttons
            int startX = (Settings.SCREEN_WIDTH - 550) / 2; // Horizontal center
            int startY = 900; // Starting Y-coordinate

            // Create Button
            this.backButton = new Button(startX, startY, buttonWidth, buttonHeight, textFont, backButtonText, Color.Cyan);
            this.contineGameButton = new Button(startX + buttonSpacing, startY, buttonWidth, buttonHeight, textFont, restartGameButtonText, Color.Cyan);

            // Score Board
            this.scoreMenu = new ScoreBoardMenu(startX, startY - 700);
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

                AudioSource.Sounds["UI_Back"].Play();
                
                Global.InitialProperties();
                
                game.ChangeMenu(MenuState.StartScreen);
            }

            if (contineGameButton.IsPressed())
            {
                AudioSource.Sounds["UI_StartGame"].Play();

                if(Global.CurrentLevel == Levels.Level1)
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
            this.backButton.Draw(spriteBatch);
            this.contineGameButton.Draw(spriteBatch);
            this.scoreMenu.Draw(spriteBatch);
        }
    }
}
