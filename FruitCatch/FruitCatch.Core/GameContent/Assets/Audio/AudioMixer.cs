using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Media;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FruitCatch.Core.GameContent.Assets.Audio
{
    public class AudioMixer
    {
        public static float MasterVolume { get; set; } = 1.0f;
        public static float MusicVolume { get; set; } = 1.5f;
        public static float SFXVolume { get; set; } = 0.2f;

        public static void SetMasterVolume(float volume)
        {
            MasterVolume = MathHelper.Clamp(volume, 0.0f, 1.0f);
            MediaPlayer.Volume = MusicVolume * MasterVolume;
        }

        public static void SetMusicVolume(float volume)
        {
            MusicVolume = MathHelper.Clamp(volume, 0.0f, 1.0f);
            MediaPlayer.Volume = MusicVolume * MasterVolume;
        }

        public static void SetSFXVolume(float volume)
        {
            SFXVolume = MathHelper.Clamp(volume, 0.0f, 1.0f);
        }


    }
}
