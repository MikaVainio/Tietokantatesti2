using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Tietokantatesti2
{
    class Program
    {
        static void Main(string[] args)
        {
            // Muodostetaan yheys tietokantaan
            using (SqlConnection sqlConnection = new SqlConnection("Data Source=sql1.testaus.intra; Initial Catalog=Käyttäjätiedot; Integrated Security=True"))
            {
                // Avataan yhteys SQL-palvelimeen
                sqlConnection.Open();
                // Määritellään suoritettava SQL-komento
                SqlCommand sqlCommand = new SqlCommand("SELECT KayttajaID, Kayttajatunnus FROM dbo.Kayttaja", sqlConnection);
                // Aikakatkaistaan, jos vastausta ei saada 30 sek. sisällä
                sqlCommand.CommandTimeout = 30;
                // Suoritetaan komento lukijassa
                SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
                // Tulostetaan ruudulle sitä mukaa, kun dataa tulee
                while(sqlDataReader.Read())
                {
                    Console.WriteLine("{0}\t{1}", sqlDataReader.GetInt32(0), sqlDataReader.GetString(1));
                }
                // Suljetaan lukija
                sqlDataReader.Close();              
                // Kutustaan SUSER_NAME järjestelmäfuntiota ja tallennetaan tulos muuttujaan
                SqlCommand sqlCommand1 = new SqlCommand("SELECT SUSER_NAME()", sqlConnection);
                sqlCommand1.CommandTimeout = 1;
                SqlDataReader sqlDataReader1 = sqlCommand1.ExecuteReader();
                while(sqlDataReader1.Read())
                {
                    Console.WriteLine(sqlDataReader1.GetString(0));
                }
                sqlDataReader1.Close();


                Console.ReadLine();
                // Suljetaan yhteys palvelimeen
                sqlConnection.Close();
            }
        }
    }
}
