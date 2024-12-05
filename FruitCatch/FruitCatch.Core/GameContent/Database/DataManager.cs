using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using System.IO;
using System.Text.Json.Serialization;
using FruitCatch.Core.GameContent.Enum;
using FruitCatch.Core.GameContent.Engines;

namespace FruitCatch.Core.GameContent.Database
{
    public class DataManager
    {
        private  List<Data> _records;
        private const string PATH = "playerRecord.json";

        public DataManager() 
        {
            _records = LoadRecordList();
        }

        public List<Data> LoadRecordList()
        {
            if (File.Exists(PATH))
            {
                var fileData = File.ReadAllText(PATH);
                return JsonSerializer.Deserialize<List<Data>>(fileData);
            }
            return new List<Data>();

        }

        
        public void AddRecord(string name, Levels currentLevel, int score)
        {
            Data newRecord = new Data()
            {
                recordId = GenerateId(),
                playerName = name,
                currentLevel = currentLevel.ToString(),
                score = score

            };
            _records.Add(newRecord);
            SaveAll();
        }

        public void UpdateRecord(string name, string currentLevel, int score)
        {
            Data record = _records.FirstOrDefault(r => r.playerName == name);
            if (record != null)
            {
                record.playerName = name;
                record.currentLevel = currentLevel;
                record.score = score;
                SaveAll(); // Re-save the updated list
            }
        }

        private void SaveAll()
        {
            string serializedData = JsonSerializer.Serialize(_records);
            File.WriteAllText(PATH, serializedData);
        }

        public int GenerateId()
        {
            return _records.Count > 0 ? _records.Max(r => r.recordId) + 1 : 1;
        }

        public List<Data> GetTopScores()
        {
            return _records.OrderByDescending(r => r.score).Take(5).ToList();
        }
    }
}
