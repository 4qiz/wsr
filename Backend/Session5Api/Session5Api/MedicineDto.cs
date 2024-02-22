namespace Session5Api
{
    public class MedicineDto
    {
        public int MedicineId { get; set; }

        public string Name { get; set; } = null!;

        public string TradeName { get; set; } = null!;

        public string Manufacturer { get; set; } = null!;

        public string Image { get; set; } = null!;

        public decimal Price { get; set; }

        public int StockQuantity { get; set; }

        public int WarehouseId { get; set; }
    }
}
