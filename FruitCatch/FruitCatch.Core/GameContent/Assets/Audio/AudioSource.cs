using FruitCatch.Core.GameContent.Enum;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Audio;
using Microsoft.Xna.Framework.Content;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Media;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FruitCatch.Core.GameContent.Assets.Audio
{
    public class AudioSource
    {
        // public static Song Music { get; private set; }
        public static Dictionary<string, Song> Music { get; private set; }
        public static Dictionary<string, SoundEffect> Sounds { get; private set; }

        private static Dictionary<ItemType, string> itemTypeSounds;


        // Music fade in
        private static bool isFadingIn = false;
        private static float fadeInDuration = 0.0f;
        private static float fadeInStep = 0.0f;
        private static float fadeInTimer = 0.0f;
        private static float targetVolume = 1.0f;

        // Music fade out
        private static bool isFadingOut = false;
        private static float fadeOutDuration = 0.0f;
        private static float fadeOutStep = 0.0f;
        private static float fadeOutTimer = 0.0f;

        // SFX fade in
        private static bool isSoundFadingIn = false;
        private static float soundFadeInDuration = 0.0f;
        private static float soundFadeInStep = 0.0f;
        private static float soundFadeInTimer = 0.0f;
        private static float soundTargetVolume = 1.0f;
        private static SoundEffectInstance fadingSoundInstance = null;

        // SFX fade out
        private static bool isSoundFadingOut = false;
        private static float soundFadeOutDuration = 0.0f;
        private static float soundFadeOutStep = 0.0f;
        private static float soundFadeOutTimer = 0.0f;
        private static SoundEffectInstance fadingOutSoundInstance = null;


        public static void Update(GameTime gameTime)
        {
             // Update fade in
            if (isFadingIn)
            {
                // Accumulate elapsed time
                fadeInTimer += (float)gameTime.ElapsedGameTime.TotalMilliseconds;

                if (fadeInTimer >= 10.0f) // Process every 10ms
                {
                    fadeInTimer -= 10.0f; // Reset timer for the next step

                    // Increase volume
                    MediaPlayer.Volume = MathHelper.Clamp(MediaPlayer.Volume + fadeInStep * 10, 0.0f, targetVolume);

                    // Stop fading if volume reaches the target
                    if (MediaPlayer.Volume >= targetVolume)
                    {
                        isFadingIn = false;
                    }
                }
            }

            // Update fade out
            if (isFadingOut)
            {
                // Accumulate time
                fadeOutTimer += (float)gameTime.ElapsedGameTime.TotalMilliseconds;

                if (fadeOutTimer >= 10.0f) // Process every 10ms
                {
                    fadeOutTimer -= 10.0f; // Reset timer for next step

                    // Decrease volume
                    MediaPlayer.Volume = MathHelper.Clamp(MediaPlayer.Volume - fadeOutStep * 10, 0.0f, 1.0f);

                    // Stop music if volume reaches zero
                    if (MediaPlayer.Volume <= 0.0f)
                    {
                        MediaPlayer.Stop();
                        isFadingOut = false;
                    }
                }
            }

            // Update sound effect fade-in
            if (isSoundFadingIn && fadingSoundInstance != null)
            {
                soundFadeInTimer += (float)gameTime.ElapsedGameTime.TotalMilliseconds;

                if (soundFadeInTimer >= 10.0f) // Process every 10ms
                {
                    soundFadeInTimer -= 10.0f;

                    fadingSoundInstance.Volume = MathHelper.Clamp(fadingSoundInstance.Volume + soundFadeInStep * 10, 0.0f, soundTargetVolume);

                    if (fadingSoundInstance.Volume >= soundTargetVolume)
                    {
                        isSoundFadingIn = false;
                        fadingSoundInstance = null; // Reset instance after fade-in completes
                    }
                }
            }

            if (isSoundFadingOut && fadingOutSoundInstance != null)
            {
                soundFadeOutTimer += (float)gameTime.ElapsedGameTime.TotalMilliseconds;

                if (soundFadeOutTimer >= 10.0f)
                {
                    soundFadeOutTimer -= 10.0f;

                    fadingOutSoundInstance.Volume = MathHelper.Clamp(fadingOutSoundInstance.Volume - soundFadeOutStep * 10, 0.0f, 1.0f);

                    if (fadingOutSoundInstance.Volume <= 0.0f)
                    {
                        fadingOutSoundInstance.Stop();
                        isSoundFadingOut = false;
                        fadingOutSoundInstance = null; // Reset instance
                    }
                }
            }
        }
        public static void Load(ContentManager content)
        {
            Music = new Dictionary<string, Song>();

            List<string> musicList = new List<string>()
            {
                "Mus_Lobby",
                "Mus_GameOver",
                "Mus_Battle_01",
                "Mus_Battle_02",
                "Mus_Battle_03",
                "Mus_Stinger_Victory",

            };
            foreach (string music in musicList)
            {
                Music.Add(music, content.Load<Song>("Audio/" + music));
            }


            Sounds = new Dictionary<string, SoundEffect>();

            List<string> soundList = new List<string>() {
               "UI_StartGame",
               "UI_Back",
               "UI_Button_Click",
               "UI_Button_HighLight",
               "UI_GameEnd",
               "Player_GainCoin",
            };

            foreach (string sfx in soundList)
            {
                Sounds.Add(sfx, content.Load<SoundEffect>("Audio/" + sfx));
            }

            itemTypeSounds = new Dictionary<ItemType, string>
            {
            { ItemType.Coin, "Player_GainCoin" },
            { ItemType.Silver, "Player_GainCoin" },
            { ItemType.Jewserly, "Player_GainCoin" },
            { ItemType.Stone, "UI_GameEnd" },
            { ItemType.Snake, "UI_GameEnd" },
            { ItemType.Spider, "UI_GameEnd" }
            };

        }

        public static string GetSoundEffectForItemType(ItemType itemType)
        {
            return itemTypeSounds.ContainsKey(itemType) ? itemTypeSounds[itemType] : null;
        }


        public static void PlayMusic(string music)
        {
            MediaPlayer.Volume = AudioMixer.MusicVolume * AudioMixer.MasterVolume;
            MediaPlayer.IsRepeating = true;
            MediaPlayer.Play(Music[music]);
        }

        public static void PlayMusic(string music, float duration, float targetVolume = 1.0f)
        {
            Debug.WriteLine($"[MUSIC] {music} is playing");
            isFadingIn = true;
            fadeInDuration = duration;
            fadeInStep = targetVolume / (duration * 1000);
            fadeInTimer = 0.0f;
            AudioSource.targetVolume = targetVolume;
            
            MediaPlayer.Volume = 0.0f;
            MediaPlayer.IsRepeating = true;
            MediaPlayer.Play(Music[music]);
        }

        public static void StopMusic()
        {
            MediaPlayer.Stop();
        }

        public static void StopMusic(float duration)
        {
            isFadingOut = true;
            fadeOutDuration = duration;
            fadeOutStep = MediaPlayer.Volume / (duration * 1000); // Step size per millisecond
            fadeOutTimer = 0.0f;

            MediaPlayer.Stop();
        }

        public static void PlaySound(string sfx)
        {
            if (Sounds.ContainsKey(sfx))
            {
                Sounds[sfx].Play(AudioMixer.SFXVolume * AudioMixer.MasterVolume, 0.0f, 0.0f);
            }
        }

        public static void PlaySound(string sfx, float duration, float targetVolume = 1.0f)
        {
            if (Sounds.ContainsKey(sfx))
            {
                SoundEffectInstance instance = Sounds[sfx].CreateInstance();
                instance.Volume = 0.0f; // Start at 0 volume
                instance.Play();

                // Initialize fade-in state
                isSoundFadingIn = true;
                soundFadeInDuration = duration;
                soundFadeInStep = targetVolume / (duration * 1000); // Step size per millisecond
                soundFadeInTimer = 0.0f;
                soundTargetVolume = targetVolume;
                fadingSoundInstance = instance;
            }
        }

        public static void StopSound(string sfx, float duration)
        {
            SoundEffectInstance soundInstance = AudioSource.Sounds[sfx].CreateInstance();
            //soundInstance.Volume = 1.0f; // Set initial volume
            //soundInstance.Play();

            // Initialize fade-out state
            isSoundFadingOut = true;
            soundFadeOutDuration = duration;
            soundFadeOutStep = soundInstance.Volume / (duration * 1000); 
            soundFadeOutTimer = 0.0f;
            fadingOutSoundInstance = soundInstance;
            
        }
    }
}
