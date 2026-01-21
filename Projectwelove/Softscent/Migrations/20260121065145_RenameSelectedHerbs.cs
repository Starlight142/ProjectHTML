using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Softscent.Migrations
{
    /// <inheritdoc />
    public partial class RenameSelectedHerbs : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "SelectedHerbs",
                table: "OrderDetails",
                newName: "CustomConfiguration");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "CustomConfiguration",
                table: "OrderDetails",
                newName: "SelectedHerbs");
        }
    }
}
