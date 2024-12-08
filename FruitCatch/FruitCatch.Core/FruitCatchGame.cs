using FruitCatch.Core.GameContent.Enum;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using Microsoft.Xna.Framework.Media;
using FruitCatch.Core.GameContent.Enum;
using Microsoft.Xna.Framework.Input.Touch;
using Microsoft.Xna.Framework.Audio;
using FruitCatch.Core.GameContent.Input;
using FruitCatch.Core.GameContent.Screens;
using FruitCatch.Core.GameContent.Globals;
using FruitCatch.Core.GameContent.Engines;
using System.Threading.Tasks;
using FruitCatch.Core.GameContent.Assets.Audio;
using System.Threading;
using FruitCatch.Core.GameContent.Assets.Arts;
using FruitCatch.Core.GameContent.Assets.Fonts;


namespace FruitCatch.Core
{
    public class FruitCatchGame : Game
    {
        public static FruitCatchGame Instance { get; private set; }

        private GraphicsDeviceManager _graphics;
        private SpriteBatch _spriteBatch;

        //Platform
        private Platform _platform;
        public Platform Platform { get { return _platform; } }

        // Current Screen
        GameScreen screen;

        public FruitCatchGame(Platform platform)
        {
            Instance = this;
            _graphics = new GraphicsDeviceManager(this);
            _graphics.PreferredBackBufferWidth = Settings.SCREEN_WIDTH;
            _graphics.PreferredBackBufferHeight = Settings.SCREEN_HEIGHT;
            _graphics.IsFullScreen = Settings.IS_FULLSCREEN;
            this.IsFixedTimeStep = true;
            Global.InitialProperties();

            Content.RootDirectory = "Content";

            _platform = platform;

            // Show & Hiden Mouse base on platform
            if (_platform == Platform.ANDROID)
            {
                IsMouseVisible = false;
            }
            else
            {
                IsMouseVisible = true;
            }
        }

        protected override void Initialize()
        {
            // TODO: Add your initialization logic here

            if (_platform == Platform.ANDROID)
            {
                TouchPanel.EnabledGestures = GestureType.Tap | GestureType.DoubleTap | GestureType.Flick | GestureType.FreeDrag | GestureType.Hold;
            }

            base.Initialize();
            
            InputHandler.Instance = new InputHandler();

            // Inital Play Music
            AudioSource.PlayMusic("Mus_Lobby");

        }

        protected override void LoadContent()
        {

            _spriteBatch = new SpriteBatch(GraphicsDevice);

            // Load assets content
            ArtSource.Load(Content);
            AudioSource.Load(Content);
            Fonts.Load(Content);
            
            // Menu
            screen = new StartScreen(new Sprite("bg_play_screen"));

        }


        protected override void Update(GameTime gameTime)
        {
            //if (GamePad.GetState(PlayerIndex.One).Buttons.Back == ButtonState.Pressed || Keyboard.GetState().IsKeyDown(Keys.Escape))
            //    Exit();

            InputHandler.Instance.Update(); 
            screen.Update(gameTime, InputHandler.Instance, this);

            // Check Game End 
            if (screen is PlayScreen playScreen)
            {
                if (playScreen.CountDown == 0) // Transition to GameEndScreen when countdown is 0
                {
                    
                    if(Global.CurrentLevel == Levels.Level3)
                    {

                        ChangeMenu(MenuState.GameOverScreen);
                    }
                    else
                    {
                        ChangeMenu(MenuState.GameEndScreen);
                    }
                    
                    return; // Stop further updates
                }
            }

            // Audio
            AudioSource.Update(gameTime);


            base.Update(gameTime);
        }

        protected override void Draw(GameTime gameTime)
        {
            GraphicsDevice.Clear(Settings.BACKGROUND_COLOR);

            // TODO: Add your drawing code here
            _spriteBatch.Begin();

            this.screen.Draw(this._spriteBatch);

            _spriteBatch.End();

            base.Draw(gameTime);
        }


        public void ChangeMenu(MenuState menu)
        {
            switch (menu)
            {
                case MenuState.StartScreen:
                    this.screen = new StartScreen(new Sprite("bg_play_screen"));
                    break;
                case MenuState.LoadGameScreen:
                    this.screen = new LoadGameScreen(new Sprite("bg_start_screen"));
                    break;
                case MenuState.PlayerInfoScreen:
                    this.screen = new PlayerInfoScreen(new Sprite("bg_start_screen"));
                    break;
                case MenuState.PlayScreen:
                    if (Global.CurrentLevel == Levels.Level1)
                    {
                        AudioSource.PlayMusic("Mus_Battle_01");
                    }
                    else if(Global.CurrentLevel == Levels.Level2)
                    {
                        AudioSource.PlayMusic("Mus_Battle_02");
                    }
                    else if (Global.CurrentLevel == Levels.Level3)
                    {
                        AudioSource.PlayMusic("Mus_Battle_03");
                    }
                    this.screen = new PlayScreen(new Sprite("bg_play_screen"));
                        break;
                case MenuState.HelpScreen:
                    this.screen = new HelpScreen(new Sprite("bg_start_screen"));
                    break;
                case MenuState.AboutScreen:
                    this.screen = new AboutScreen(new Sprite("bg_start_screen"));
                    break;
                case MenuState.ScoreBoardScreen:
                    this.screen = new ScoreBoardScreen(new Sprite("bg_start_screen"));
                    break;
                case MenuState.GameEndScreen:
                    AudioSource.PlayMusic("Mus_Lobby");
                    this.screen = new GameEndScreen(new Sprite("bg_play_screen"));
                    break;
                case MenuState.GameOverScreen:
                    this.screen = new GameOverScreen(new Sprite("bg_game_over"));
                    AudioSource.PlayMusic("Mus_Stinger_Victory");
                    AudioSource.PlayMusicWithDelay("Mus_GameOver", 4800, 3.0f, 1.0f);
                    break;
                case MenuState.Quit:
                    Exit();
                    break;
            }
        }

    }
}
