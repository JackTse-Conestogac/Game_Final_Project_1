using FruitCatch.Core.GameContent.Assets;
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
            _graphics = new GraphicsDeviceManager(this);
            _graphics.PreferredBackBufferWidth = Settings.SCREEN_WIDTH;
            _graphics.PreferredBackBufferHeight = Settings.SCREEN_HEIGHT;
            _graphics.IsFullScreen = Settings.IS_FULLSCREEN;
            this.IsFixedTimeStep = true;
            Global.InitialProperties();

            Content.RootDirectory = "Content";

            _platform = platform;

            // Platform
            if (_platform == Platform.ANDRIOD)
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

            if (_platform == Platform.ANDRIOD)
            {
                TouchPanel.EnabledGestures = GestureType.Tap | GestureType.DoubleTap | GestureType.Flick | GestureType.FreeDrag;
            }

            base.Initialize();

            InputHandler.Instance = new InputHandler();
            MediaPlayer.IsRepeating = true;
            MediaPlayer.Play(AudioSource.Music);

        }

        protected override void LoadContent()
        {

            _spriteBatch = new SpriteBatch(GraphicsDevice);
            //MenuSprite = new SpriteBatch(GraphicsDevice);

            // TODO: use this.Content to load your game content here

            // LoadRecordList assets content

            ArtSource.Load(Content);
            AudioSource.Load(Content);
            Fonts.Load(Content);
            

            // Menu
            screen = new StartScreen(new Sprite("cave1"));
           
        }


        protected override void Update(GameTime gameTime)
        {
            //if (GamePad.GetState(PlayerIndex.One).Buttons.Back == ButtonState.Pressed || Keyboard.GetState().IsKeyDown(Keys.Escape))
            //    Exit();

            // TODO: Add your update logic here
            InputHandler.Instance.Update(); // VERIFIED
            screen.Update(gameTime, InputHandler.Instance, this); // VERIFIED

            // Check Game End 
            if (screen is PlayScreen playScreen)
            {
                if (playScreen.CountDown == 0)
                {
                    // Transition to GameEndScreen when countdown is 0
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
                    this.screen = new StartScreen(new Sprite("cave1"));
                    break;
                case MenuState.LoadGameScreen:
                    this.screen = new LoadGameScreen(new Sprite("cave2"));
                    break;
                case MenuState.PlayerInfoScreen:
                    this.screen = new PlayerInfoScreen(new Sprite("cave1"));
                    break;
                case MenuState.PlayScreen:
                    this.screen = new PlayScreen(new Sprite("cave3"));
                    break;
                case MenuState.HelpScreen:
                    this.screen = new HelpScreen(new Sprite("cave3"));
                    break;
                case MenuState.AboutScreen:
                    this.screen = new AboutScreen(new Sprite("icons8-ruby-64"));
                    break;
                case MenuState.ScoreBoardScreen:
                    this.screen = new ScoreBoardScreen(new Sprite("icons8-topaz-48"));
                    break;
                case MenuState.GameEndScreen:
                    this.screen = new GameEndScreen(new Sprite("cave3"));
                    break;
                case MenuState.GameOverScreen:
                    this.screen = new GameOverScreen(new Sprite("cave2"));
                    break;
                case MenuState.Quit:
                    Exit();
                    break;
            }
        }

    }
}
