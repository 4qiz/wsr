

using Session5Api.Models;

namespace Session5Api
{
    public static class Mappers
    {
        public static S5Medicine ToMedicineFromDto(this MedicineDto medicineDto)
            => new S5Medicine
            {
                Image = medicineDto.Image,
                Manufacturer = medicineDto.Manufacturer,
                Name = medicineDto.Name,
                Price = medicineDto.Price,
                StockQuantity = medicineDto.StockQuantity,
                TradeName = medicineDto.TradeName,
                WarehouseId = medicineDto.WarehouseId
            };

        public static MedicineDto ToMedicineFromDto(this S5Medicine medicine)
            => new MedicineDto
            {
                MedicineId = medicine.MedicineId,
                Image = medicine.Image,
                Manufacturer = medicine.Manufacturer,
                Name = medicine.Name,
                Price = medicine.Price,
                StockQuantity = medicine.StockQuantity,
                TradeName = medicine.TradeName,
                WarehouseId = medicine.WarehouseId
            };

        public static S5IssueRequest ToIssueRequestFromDto(this IssueRequestDto issueRequestDto)
            => new S5IssueRequest { 
                Purpose = issueRequestDto.Purpose 
            };

        public static IssueRequestDto ToDtoFromIssueRequest(this S5IssueRequest issueRequest)
            => new IssueRequestDto
            {
                Purpose = issueRequest.Purpose,
                CreatedTime = (DateTime)issueRequest.CreatedTime,
                IssueRequestId = issueRequest.IssueRequestId
            };
    }
}
