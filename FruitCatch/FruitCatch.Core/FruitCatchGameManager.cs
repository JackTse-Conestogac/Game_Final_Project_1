using FruitCatch.Core.GameContent.Assets;
using FruitCatch.Core.GameContent.Enum;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using Microsoft.Xna.Framework.Media;
using FruitCatch.Core.GameContent.Enum;
using Microsoft.Xna.Framework.Input.Touch;
using Microsoft.Xna.Framework.Audio;
using FruitCatch.Core.GameContent.InputManager;
using FruitCatch.Core.GameContent.Scenes;


namespace FruitCatch.Core
{
    public class FruitCatchGameManager : Game
    {
        public static FruitCatchGameManager Instance { get; private set; }

        private GraphicsDeviceManager _graphics;
        private SpriteBatch _spriteBatch;
        public SpriteBatch MenuSprite;

        //Platform
        private Platform _platform = Platform.Windows;

        //Menu
        private StartScene startScene;
        private PlayScene playScene;
        //private GameEndScene gameEndScene;
        //private AboutScene aboutScene;
        //private HelpScene helpScene;
        //private ScoreBoardScene scoreBoardScene;


        public FruitCatchGameManager()
        {
            _graphics = new GraphicsDeviceManager(this);
            Content.RootDirectory = "Content";


            // Platform
            if (_platform == Platform.Andriod)
            {
                IsMouseVisible = false;
            }
            else
            {
                SetWindowSize();
                IsMouseVisible = true;
            }
        }

        protected override void Initialize()
        {
            // TODO: Add your initialization logic here

            if (_platform == Platform.Andriod)
            {
                TouchPanel.EnabledGestures = GestureType.Tap | GestureType.DoubleTap | GestureType.Flick | GestureType.FreeDrag;
            }

            base.Initialize();
            SetWindowSize();
            MediaPlayer.IsRepeating = true;
            MediaPlayer.Play(Sound.Music);

        }

        protected override void LoadContent()
        {

            _spriteBatch = new SpriteBatch(GraphicsDevice);
            MenuSprite = new SpriteBatch(GraphicsDevice);

            // TODO: use this.Content to load your game content here

            // Load assets content
            Arts.Load(Content);
            Fonts.Load(Content);
            Sound.Load(Content);

            // Menu Content Initial
            startScene = new StartScene(this);
            this.Components.Add(startScene);

            playScene = new PlayScene(this);
            this.Components.Add(playScene);

            //gameEndScene = new GameEndScene(this);
            //this.Components.Add(gameEndScene);

            //aboutScene = new AboutScene(this);
            //this.Components.Add(aboutScene);

            //helpScene = new HelpScene(this);
            //this.Components.Add(helpScene);

            //scoreBoardScene = new ScoreBoardScene(this);
            //this.Components.Add(scoreBoardScene);



            startScene.show();

        }


        protected override void Update(GameTime gameTime)
        {
            //if (GamePad.GetState(PlayerIndex.One).Buttons.Back == ButtonState.Pressed || Keyboard.GetState().IsKeyDown(Keys.Escape))
            //    Exit();

            // TODO: Add your update logic here
            

            int selectedIndex = 0;
            KeyboardState ks = Keyboard.GetState();
            if (startScene.Enabled)
            {
                selectedIndex = startScene.Menu.SelectedIndex;
                if (selectedIndex == 0 && ks.IsKeyDown(Keys.Enter))
                {
                    startScene.hide();
                    playScene.show();
                }
                else if (selectedIndex == 1 && ks.IsKeyDown(Keys.Enter))
                {
                    startScene.hide();
                    //helpScene.show();
                }
                //other scenes
                else if (selectedIndex == 4 && ks.IsKeyDown(Keys.Enter))
                {
                    Exit();
                }
            }

            if (playScene.Enabled)
            {
                if (ks.IsKeyDown(Keys.Escape))
                {
                    playScene.hide();
                    startScene.show();

                }
            }
            //if (helpScene.Enabled)
            //{
            //    if (ks.IsKeyDown(Keys.Escape))
            //    {
            //        helpScene.hide();
            //        startScene.show();
            //    }
            //}
            //same way other scenes


            base.Update(gameTime);
        }

        protected override void Draw(GameTime gameTime)
        {
            GraphicsDevice.Clear(Color.CornflowerBlue);

            // TODO: Add your drawing code here


            base.Draw(gameTime);
        }


        private void SetWindowSize()
        {
            int screenWidth = (int)(GraphicsAdapter.DefaultAdapter.CurrentDisplayMode.Width * 0.8);
            int screenHeight = (int)(GraphicsAdapter.DefaultAdapter.CurrentDisplayMode.Height * 0.8);

            _graphics.PreferredBackBufferWidth = screenWidth;
            _graphics.PreferredBackBufferHeight = screenHeight;
        }

    }
}
