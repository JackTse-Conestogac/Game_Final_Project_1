using FruitCatch.Core.GameContent.Engines;
using FruitCatch.Core.GameContent.Input;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FruitCatch.Core.GameContent.Screens
{
    public abstract class GameScreen 
    {
        //public List<GameComponent> Components { get; set; }

        protected Sprite background;

        protected GameScreen(Sprite background)
        {
            this.background = background;
        }

        public virtual void Update(GameTime gameTime, InputHandler input, FruitCatchGame game){}

        public virtual void Draw(SpriteBatch spriteBatch)
        {
            
            this.background.Draw(spriteBatch);  
        
        }
    }
}
