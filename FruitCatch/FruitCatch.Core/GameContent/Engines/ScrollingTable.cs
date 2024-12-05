using FruitCatch.Core.GameContent.Input;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FruitCatch.Core.GameContent.Engines
{

    public class ScrollingTable
    {
        private List<string[]> rows;  // Holds rows of the table
        private SpriteFont font;      // Font for rendering text
        private Vector2 position;     // Starting position of the table
        private int[] columnWidths;   // Width of each column
        private int rowHeight;        // Height of each row
        private Color textColor;      // Text color
        private Color highlightColor; // Color for highlighting rows
        private int visibleRows;      // Number of visible rows (for scrolling)
        private int scrollOffset;     // Current scroll offset
        private int selectedIndex;    // Index of the selected row (-1 if none)
        private Rectangle tableBounds;


        public Action<int> OnRowClick;

        public ScrollingTable(SpriteFont font, Vector2 position, int[] columnWidths, int rowHeight, Color textColor, Color highlightColor, int visibleRows = 10)
        {
            this.font = font;
            this.position = position;
            this.columnWidths = columnWidths;
            this.rowHeight = rowHeight;
            this.textColor = textColor;
            this.highlightColor = highlightColor;
            this.rows = new List<string[]>();
            this.scrollOffset = 0;
            this.selectedIndex = -1;
            this.visibleRows = visibleRows;
            this.tableBounds = new Rectangle((int)position.X, (int)position.Y, columnWidths.Sum() + (10 * (columnWidths.Length - 1)), rowHeight * visibleRows);
        }

        public void AddRow(params string[] columns)
        {
            //if (columns.Length != columnWidths.Length)
            //    throw new ArgumentException("Number of columns in the row must match the number of column widths defined.");
            rows.Add(columns);
        }

        public void Update(GameTime gameTime, InputHandler input)
        {
            int scrollDelta = input.GetScrollWheelDelta();
            if (scrollDelta != 0)
            {
                scrollOffset -= scrollDelta / 120; // Adjust scrolling speed
                scrollOffset = Math.Clamp(scrollOffset, 0, Math.Max(0, rows.Count - visibleRows));
            }

            Point mousePosition = input.GetMousePosition();
            if (tableBounds.Contains(mousePosition))
            {
                int relativeY = mousePosition.Y - (int)position.Y;
                int hoveredRow = (relativeY / rowHeight) + scrollOffset;

                if (hoveredRow >= 0 && hoveredRow < rows.Count)
                {
                    selectedIndex = hoveredRow;

                    if (input.IsLeftMouseButtonClicked())
                    {
                        Console.WriteLine($"Row clicked: {string.Join(", ", GetSelectedRow())}");
                        OnRowClick?.Invoke(selectedIndex); // Notify the click with the row index
                    }
                }
            }
        }


        public void Draw(SpriteBatch spriteBatch)
        {
            Vector2 currentPosition = position;

            for (int i = scrollOffset; i < Math.Min(rows.Count, scrollOffset + visibleRows); i++)
            {
                var row = rows[i];

                //Color rowColor = (i == selectedIndex) ? highlightColor : textColor;
                Color rowColor = (i == selectedIndex && i > 0) ? highlightColor : textColor;

                for (int j = 0; j < row.Length; j++)
                {
                    Vector2 textPosition = currentPosition + new Vector2(GetColumnOffset(j), 0);
                    spriteBatch.DrawString(font, row[j], textPosition, rowColor);
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

        public string[] GetRow(int rowIndex)
        {
            return (rowIndex >= 0 && rowIndex < rows.Count) ? rows[rowIndex] : null;
        }

        public int GetRowCount()
        {
            return rows.Count;
        }

        public string[] GetSelectedRow()
        {
            return (selectedIndex >= 0 && selectedIndex < rows.Count) ? rows[selectedIndex] : null;
        }
    }

}
