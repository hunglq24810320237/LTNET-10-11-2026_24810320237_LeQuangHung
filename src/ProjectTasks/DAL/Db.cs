using Microsoft.Data.SqlClient;
namespace ProjectTasks.DAL;
internal static class Db { internal static string ConnectionString {get;set;}=@"Server=localhost\SQLEXPRESS;Database=ProjectTaskDB;Trusted_Connection=True;TrustServerCertificate=True;"; internal static SqlConnection Open(){var c=new SqlConnection(ConnectionString);c.Open();return c;} }