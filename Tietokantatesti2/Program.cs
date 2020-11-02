using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;

namespace Tietokantatesti2
{
    // Luokka käyttäjätietojen tallentamista varten
    class User
    {
        public Int32 userId;
        public string firstName;
        public string lastName;
        public string systemUserName;

        // Oletusmuodostin
        public User()
        {
            this.userId = 0;
            this.firstName = "N/A";
            this.lastName = "N/A";
            this.systemUserName ="N/A";

        }
    }

    // Luokka töiden kirjaustietoja varten
    class Entry
    {
        public Int32 entryId;
        public Int32 userId2;
        public DateTime DateTime;
        public string explanation;
        
        // Oletusmuodostin
        Entry()
        {
            this.entryId = 0;
            this.userId2 = 0;
            this.DateTime = DateTime.Parse("1.1.2020");
            this.explanation = "N/A";
        }

    }
    
    // Pääohjelma
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
                
                // Luodaan olio käyttäjätietojen tallentamiseksi
                User user = new User();
                
                // Kutustaan SUSER_NAME järjestelmäfuntiota ja tallennetaan tulos muuttujaan
                SqlCommand sqlCommand1 = new SqlCommand("SELECT SUSER_NAME()", sqlConnection);
                sqlCommand1.CommandTimeout = 1;
                SqlDataReader sqlDataReader1 = sqlCommand1.ExecuteReader();
                
                // While-silmukka: varaudutaan useampaan tietueeseen tulosjoukossa
               
                 // TODO: poista tarpeeton silmukka
                 while(sqlDataReader1.Read())
                {
                    user.systemUserName = sqlDataReader1.GetString(0);
                }
                 
                 // Suljetaan lukija
                sqlDataReader1.Close();

                Console.WriteLine("Käyttäjätunnuos on " + user.systemUserName);

                // Kutsutaan OmatTyot-proseduuria
                // Luodaan SQL-komento-olio proseduurin suoritusta varten
                SqlCommand sqlCommand2 = new SqlCommand("dbo.OmatTyot", sqlConnection) ;
                sqlCommand2.CommandType = CommandType.StoredProcedure;
                sqlCommand2.Parameters.Add("@kayttaja", SqlDbType.NVarChar).Value = user.systemUserName;

                // Luodaan lukija proseduurin tulosjoukkoa varten
                SqlDataReader sqlDataReader2 = sqlCommand2.ExecuteReader();

                while(sqlDataReader2.Read())
                {
                    Console.WriteLine("{0}\t{1}\t{2}\t{3}", sqlDataReader2.GetString(0), sqlDataReader2.GetString(1), sqlDataReader2.GetDateTime(2).ToString("yyy.MM.dd"), sqlDataReader2.GetString(3));
                }

                sqlDataReader2.Close();
                Console.ReadLine();
                 
                // Suljetaan yhteys palvelimeen
                sqlConnection.Close();
            }
        }
    }
}
