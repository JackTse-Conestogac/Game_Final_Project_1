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
        //private const string PATH = "playerRecord.json";
        private string _path;
        public DataManager() 
        {

            if (FruitCatchGame.Instance.Platform == Platform.ANDROID)
            {

                string externalFolder = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments), "FruitCatch");

                if (!Directory.Exists(externalFolder))
                {
                    Directory.CreateDirectory(externalFolder);
                }

                _path = Path.Combine(externalFolder, "playerRecord.json");
                Debug.WriteLine($"[Android] Data file path: {_path}");

            }
            else
            {
                // On Windows 
                string baseDir = AppDomain.CurrentDomain.BaseDirectory;
                _path = Path.Combine(baseDir, "playerRecord.json");
                Debug.WriteLine($"[Windows] Data file path: {_path}");
            }


            _records = LoadRecordList();
        }
            
        public List<Data> LoadRecordList()
        {
            if (File.Exists(_path))
            {
                var fileData = File.ReadAllText(_path);
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
                SaveAll();
            }
        }

        private void SaveAll()
        {
            string serializedData = JsonSerializer.Serialize(_records);
            File.WriteAllText(_path, serializedData);
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
