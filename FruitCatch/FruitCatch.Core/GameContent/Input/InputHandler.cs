using Microsoft.Xna.Framework.Input;
using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Xna.Framework.Input.Touch;
using FruitCatch.Core.GameContent.Enum;
using System.Reflection.Metadata.Ecma335;

namespace FruitCatch.Core.GameContent.Input
{
    public class InputHandler
    {
        public static InputHandler Instance { get; set; }

        // For Keyboard
        private KeyboardState currentKeyState;
        private KeyboardState PreviousKeyboardState;

        // For Mouse
        private MouseState currentMouseState;
        private MouseState previousMouseState;

        // For Touch Screen
        private TouchCollection currentTouchCollection;
        private TouchCollection previousTouchCollection;
        private TouchLocation? currentPrimaryTouch;
        private TouchLocation? previousPrimaryTouch;

        
        

        public void Update()
        {
            // Update Keyboard
            PreviousKeyboardState = currentKeyState;
            currentKeyState = Keyboard.GetState();

            // Update Mouse
            previousMouseState = currentMouseState;
            currentMouseState = Mouse.GetState();

            // Update Touch
            previousTouchCollection = currentTouchCollection;
            currentTouchCollection = TouchPanel.GetState();

            previousPrimaryTouch = currentPrimaryTouch;
            currentPrimaryTouch = currentTouchCollection.FirstOrDefault();

        }


        // Keyboard Control
        public bool IsKeyPressed(Keys key)
        {
            return currentKeyState.IsKeyDown(key) && !PreviousKeyboardState.IsKeyDown(key);
        }

        public bool IsKeyHeld(Keys key)
        {
            if(FruitCatchGame.Instance.Platform == Platform.ANDROID)
            {
                return IsTouchTap(); 
            }

             return currentKeyState.IsKeyDown(key);
            
        }
        public Keys[] GetPressedKeys()
        {
            return currentKeyState.GetPressedKeys();
        }

        // Mouse Control
        public bool IsLeftMouseButtonDown()
        {
            if (FruitCatchGame.Instance.Platform == Platform.ANDROID)
            {
                return IsTouchHeld();
            }

            return currentMouseState.LeftButton == ButtonState.Pressed;
                   
        }
        public bool IsLeftMouseButtonClicked()
        {
            if (FruitCatchGame.Instance.Platform == Platform.ANDROID)
            {
                return IsTouchTap();
            }

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
            if (FruitCatchGame.Instance.Platform == Platform.ANDROID && currentPrimaryTouch.HasValue)
            {
                Vector2 pos = currentPrimaryTouch.Value.Position;
                return new Point((int)pos.X, (int)pos.Y);
            }

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
            if (FruitCatchGame.Instance.Platform == Platform.ANDROID)
            {
                // Check if we have a valid ongoing touch.
                if (previousPrimaryTouch.HasValue && currentPrimaryTouch.HasValue && IsTouchHeld())
                {
                    // Calculate the vertical movement between this frame and the last frame.
                    float deltaY = currentPrimaryTouch.Value.Position.Y - previousPrimaryTouch.Value.Position.Y;

                    float threshold = 2f; // You can adjust this value based on your preference.
                    if (Math.Abs(deltaY) < threshold)
                    {
                        // Movement too small, ignore it by returning 0.
                        return 0;
                    }

                    // Convert the vertical movement to an integer scroll value.
                    // You can invert this sign if you want the opposite scrolling direction.
                    // Also, consider adding a scale factor if the movement is too sensitive or too sluggish.
                    int scrollDelta = (int)(-deltaY);

                    return scrollDelta;
                }

                // No movement or no valid touch scenario
                return 0;
            }
            else
            {
                // On desktop (or other platforms), just return the mouse's actual scroll wheel delta
                return currentMouseState.ScrollWheelValue - previousMouseState.ScrollWheelValue;
            }
        }


        // Touch Control
        public bool HasTouch()
        {
            return currentPrimaryTouch.HasValue;
        }

        public bool IsTouchPressed()
        {
            // Equivalent to a "touch down" event: current is pressed, previous wasn't present or wasn't pressed
            if (!currentPrimaryTouch.HasValue)
                return false;

            var currentState = currentPrimaryTouch.Value.State;

            // For a "pressed" event, we want to see if it just started this frame.
            bool wasTouchedBefore = previousPrimaryTouch.HasValue && previousPrimaryTouch.Value.State != TouchLocationState.Released;
            return currentState == TouchLocationState.Pressed && !wasTouchedBefore;
        }

        public bool IsTouchReleased()
        {
            // Equivalent to a "touch up" event
            if (!currentPrimaryTouch.HasValue && previousPrimaryTouch.HasValue)
            {
                // No current touch, but previously we had one, so it ended this frame.
                return true;
            }

            if (currentPrimaryTouch.HasValue && previousPrimaryTouch.HasValue)
            {
                return previousPrimaryTouch.Value.State != TouchLocationState.Released &&
                       currentPrimaryTouch.Value.State == TouchLocationState.Released;
            }

            return false;
        }

        public bool IsTouchHeld()
        {
            // If a touch is ongoing (Pressed or Moved states)
            if (!currentPrimaryTouch.HasValue)
                return false;

            var s = currentPrimaryTouch.Value.State;
            return s == TouchLocationState.Pressed || s == TouchLocationState.Moved;
        }

        public Vector2 GetTouchPosition()
        {
            // Returns the current primary touch position if available
            return currentPrimaryTouch.HasValue ? currentPrimaryTouch.Value.Position : Vector2.Zero;
        }

        public bool IsTouchOverArea(Rectangle area)
        {
            if (!currentPrimaryTouch.HasValue)
                return false;

            var position = currentPrimaryTouch.Value.Position;
            return area.Contains(position.ToPoint());
        }

        public bool IsTouchTap()
        {
            // A "tap" can be interpreted as a touch that went pressed -> released quickly and didn't move much.
            // We can store some info when touch pressed to check how far it traveled, but let's do a simple check:
            // If we detect a release and previously there was a pressed state, consider it a tap.
            if (IsTouchReleased() && previousPrimaryTouch.HasValue)
            {
                // If you want to add some distance or time checks for a "true" tap, do so here.
                return true;
            }
            return false;
        }
    }
}
