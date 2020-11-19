using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyKaraoke.Models
{
    public class RevenueModel
    {
        public BarChart DoanhThuChart { get; set; }
        
        public LineChart TotalDT { get; set; }

        public PieChart TypeRoom { get; set; }
    }

    public class LineChart
    {
        public List<string> Labels1 { get; set; } = new List<string>();
        public List<int> Data1 { get; set; } = new List<int>();
    }

    public class BarChart
    {
        public List<string> Labels { get; set; } = new List<string>();
        public List<int> Data { get; set; } = new List<int>();

        public int max { get; set; } = new int();
    }

    public class PieChart
    {
        public List<string> LabelsPie { get; set; } = new List<string>();
        public List<int> DataPie { get; set; } = new List<int>();
    }
}