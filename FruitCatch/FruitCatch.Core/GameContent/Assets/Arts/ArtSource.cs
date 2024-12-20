﻿using FruitCatch.Core.GameContent.Enum;
using Microsoft.Xna.Framework.Content;
using Microsoft.Xna.Framework.Graphics;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Net.Mime.MediaTypeNames;

namespace FruitCatch.Core.GameContent.Assets.Arts
{
    public class ArtSource
    {
        public static Dictionary<string, Texture2D> IMAGES { get; set; }
        public static Dictionary<ItemType, string> ITEM_SPRITES { get; private set; }

        public static void Load(ContentManager content)
        {
            IMAGES = new Dictionary<string, Texture2D>();

            List<string> images = new List<string>() {
                "cave1",
                "cave2",
                "cave3",
                "icons8-anaconda-85",
                "icons8-crystal-48",
                "icons8-emerald-48",
                "icons8-gold-bars-48",
                "icons8-jewel-48",
                "icons8-mine-trolley-96",
                "icons8-mouse-animal-48",
                "icons8-ruby-64",
                "icons8-silver-bars-48",
                "icons8-snake-48",
                "icons8-spider-96",
                "icons8-stone-48",
                "icons8-topaz-48",
                "bg_game_over",
                "bg_play_screen",
                "bg_start_screen",
                "btn_about",
                "btn_back",
                "btn_continue",
                "btn_help",
                "btn_highest_score",
                "btn_load_game",
                "btn_quit",
                "btn_restart",
                "btn_start_game",
                "panel_score_board",
                "panel_score_board_02",
                "panel_help_board",
                "panel_about_board",
                "text_help",
                "text_about",
                "text_game_title",
                "text_highest_score",
                "text_load_game",
                "text_ready",
                "text_score",

            };

            foreach (string image in images)
            {
                IMAGES.Add(image, content.Load<Texture2D>("Images/" + image));
            }

            ITEM_SPRITES = new Dictionary<ItemType, string>
            {
                { ItemType.Coin, "icons8-gold-bars-48" },
                { ItemType.Jewserly, "icons8-jewel-48" },
                { ItemType.Stone, "icons8-stone-48" },
                { ItemType.Spider, "icons8-spider-96" },
                { ItemType.Silver, "icons8-silver-bars-48" },
                { ItemType.Snake, "icons8-snake-48" },
                { ItemType.Emerald, "icons8-emerald-48" },

            };

        }
    }
}
