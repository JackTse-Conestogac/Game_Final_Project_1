using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;

namespace FruitCatch.Core.GameContent.Engines
{
    public class Table
    {
        private List<string[]> rows;       // Holds rows of the table
        private SpriteFont font;           // Font for rendering text
        private Vector2 position;          // Starting position of the table
        private int[] columnWidths;        // Width of each column
        private int rowHeight;             // Height of each row
        private Color textColor;           // Text color
        
        public Table(SpriteFont font, Vector2 position, int[] columnWidths, int rowHeight, Color textColor)
        {
            this.font = font;
            this.position = position;
            this.columnWidths = columnWidths;
            this.rowHeight = rowHeight;
            this.textColor = textColor;
            this.rows = new List<string[]>(); // Initialize empty rows
        }

        public void AddRow(params string[] columns)
        {
            if (columns.Length != columnWidths.Length)
                throw new ArgumentException("Number of columns in the row must match the number of column widths defined.");
            rows.Add(columns);
        }

        public void Update(GameTime gameTime){}

        public void Draw(SpriteBatch spriteBatch)
        {
            Vector2 currentPosition = position;

            // Draw rows and columns
            for (int i = 0; i < rows.Count; i++)
            {
                var row = rows[i];

                for (int j = 0; j < row.Length; j++)
                {
                    // Draw text
                    Vector2 textPosition = currentPosition + new Vector2(GetColumnOffset(j), 0);
                    spriteBatch.DrawString(font, row[j], textPosition, textColor);
                }

                currentPosition.Y += rowHeight; // Move to the next row
            }
        }

        private int GetColumnOffset(int columnIndex)
        {
            int offset = 0;
            for (int i = 0; i < columnIndex; i++)
            {
                offset += columnWidths[i] + 10; // Add padding between columns
            }
            return offset;
        }

        public void Clear()
        {
            rows.Clear();
        }
    }
}
