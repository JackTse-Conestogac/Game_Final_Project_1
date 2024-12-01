using FruitCatch.Core.GameContent.Assets;
using FruitCatch.Core.GameContent.Enum;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using Microsoft.Xna.Framework.Media;
using FruitCatch.Core.GameContent.Enum;
using Microsoft.Xna.Framework.Input.Touch;
using Microsoft.Xna.Framework.Audio;


namespace FruitCatch.Core
{
    public class FruitCatchGameManager : Game
    {
        public static FruitCatchGameManager Instance { get; private set; }

        private GraphicsDeviceManager _graphics;
        private SpriteBatch _spriteBatch;


        //Platform
        private Platform _platform = Platform.Windows;


        public FruitCatchGameManager()
        {
            _graphics = new GraphicsDeviceManager(this);
            Content.RootDirectory = "Content";
            //IsMouseVisible = true;

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
            //MediaPlayer.IsRepeating = true;
            MediaPlayer.Play(Sound.Music);

        }

        protected override void LoadContent()
        {
            _spriteBatch = new SpriteBatch(GraphicsDevice);

            // TODO: use this.Content to load your game content here

            // Load assets content
            Arts.Load(Content);
            Sound.Load(Content);
            

        }


        protected override void Update(GameTime gameTime)
        {
            if (GamePad.GetState(PlayerIndex.One).Buttons.Back == ButtonState.Pressed || Keyboard.GetState().IsKeyDown(Keys.Escape))
                Exit();

            // TODO: Add your update logic here

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
