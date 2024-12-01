using Microsoft.Xna.Framework.Input;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FruitCatch.Core.GameContent.InputManager
{
    public class KeyboardHandler
    {

        private KeyboardState currentKeyState;
        private KeyboardState PreviousKeyboardState;

        public void Update()
        {
            PreviousKeyboardState = currentKeyState;
            currentKeyState = Keyboard.GetState();
        }

        public bool IsKeyPressed(Keys key)
        {
            return currentKeyState.IsKeyDown(key) && !PreviousKeyboardState.IsKeyDown(key);
        }
    }
}
