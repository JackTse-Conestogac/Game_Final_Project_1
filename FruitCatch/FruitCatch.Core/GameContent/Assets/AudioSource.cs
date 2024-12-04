using FruitCatch.Core.GameContent.Enum;
using Microsoft.Xna.Framework.Audio;
using Microsoft.Xna.Framework.Content;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Media;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FruitCatch.Core.GameContent.Assets
{
    public class AudioSource
    {
        public static Song Music { get; private set; }
        public static Dictionary<string, SoundEffect> Sounds { get; private set; }

        private static Dictionary<ItemType, string> itemTypeSounds;

        public static void Load(ContentManager content)
        {
            Music = content.Load<Song>("Audio/jingle-bells");

            Sounds = new Dictionary<string, SoundEffect>();

            List<string> soundList = new List<string>() {
               "UI_StartGame",
               "UI_Back",
               "UI_Button_Click",
               "UI_Button_HighLight",
               "UI_GameEnd",
               "Player_GainCoin",
            };

            foreach(string sfx in soundList)
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
    }
}
