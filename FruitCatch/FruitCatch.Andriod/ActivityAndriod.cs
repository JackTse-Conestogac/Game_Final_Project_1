using Android.App;
using Android.Content.PM;
using Android.OS;
using Android.Views;
using FruitCatch.Core;
using Microsoft.Xna.Framework;
using FruitCatch.Core.GameContent.Enum;

namespace FruitCatch.Andriod
{
    [Activity(
        Label = "@string/app_name",
        MainLauncher = true,
        Icon = "@drawable/icon",
        AlwaysRetainTaskState = true,
        LaunchMode = LaunchMode.SingleInstance,
        ScreenOrientation = ScreenOrientation.FullUser,
        ConfigurationChanges = ConfigChanges.Orientation | ConfigChanges.Keyboard | ConfigChanges.KeyboardHidden | ConfigChanges.ScreenSize
    )]
    public class ActivityAndriod : AndroidGameActivity
    {
        private FruitCatchGame _game;
        private View _view;

        protected override void OnCreate(Bundle bundle)
        {
            base.OnCreate(bundle);

            _game = new FruitCatchGame(Platform.ANDRIOD);
            _view = _game.Services.GetService(typeof(View)) as View;

            SetContentView(_view);
            _game.Run();
        }
    }
}