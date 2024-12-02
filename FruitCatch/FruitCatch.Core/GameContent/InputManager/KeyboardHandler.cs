using Microsoft.Xna.Framework.Input;
using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FruitCatch.Core.GameContent.InputManager
{
    public class KeyboardHandler
    {
        public static KeyboardHandler Instance { get;  set; }

        // For Keyboard
        private KeyboardState currentKeyState;
        private KeyboardState PreviousKeyboardState;

        // For Mouse
        private MouseState currentMouseState;
        private MouseState previousMouseState;

        public void Update()
        {
            PreviousKeyboardState = currentKeyState;
            currentKeyState = Keyboard.GetState();

            previousMouseState = currentMouseState;
            currentMouseState = Mouse.GetState();
        }

        public bool IsKeyPressed(Keys key)
        {
            return currentKeyState.IsKeyDown(key) && !PreviousKeyboardState.IsKeyDown(key);
        }

        public bool IsKeyHeld(Keys key)
        {
            return currentKeyState.IsKeyDown(key);
        }


        // Mouse Control

        public bool IsLeftMouseButtonClicked()
        {
            return currentMouseState.LeftButton == ButtonState.Pressed &&
                   previousMouseState.LeftButton == ButtonState.Released;
        }

        public bool IsRightMouseButtonClicked()
        {
            return currentMouseState.RightButton == ButtonState.Pressed &&
                   previousMouseState.RightButton == ButtonState.Released;
        }

        public bool IsMiddleMouseButtonClicked()
        {
            return currentMouseState.MiddleButton == ButtonState.Pressed &&
                   previousMouseState.MiddleButton == ButtonState.Released;
        }

        public Point GetMousePosition()
        {
            return currentMouseState.Position;
        }

        public bool IsMouseMoved()
        {
            return currentMouseState.Position != previousMouseState.Position;
        }

        public bool IsMouseOverArea(Rectangle area)
        {
            return area.Contains(currentMouseState.Position);
        }

        public int GetMouseScrollWheelValue()
        {
            return currentMouseState.ScrollWheelValue;
        }

        public int GetScrollWheelDelta()
        {
            return currentMouseState.ScrollWheelValue - previousMouseState.ScrollWheelValue;
        }

    }
}
