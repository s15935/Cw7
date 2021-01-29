using System;
using System.ComponentModel.DataAnnotations;

namespace Cw7.DTOs.Requests
{
    public class EnrollStudentRequest
    {
        [Required(ErrorMessage = "Numer indeksu jest wymagany podczas dodawania studenta!")]
        [RegularExpression("^s[\\d]+$")]
        public string IndexNumber { get; set; }

        [Required(ErrorMessage = "Imię jest wymagane podczas dodawania studenta!")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "Nazwisko jest wymagane podczas dodawania studenta!")]
        public string LastName { get; set; }

        [Required(ErrorMessage = "Data urodzenia jest wymagana podczas dodawania studenta!")]
        public DateTime BirthDate { get; set; }

        [Required(ErrorMessage = "Kierunek studiów jest wymagany podczas dodawania studenta!")]
        public string Studies { get; set; }

        [Required(ErrorMessage = "Hasło użytkownika jest wymagane podczas dodawania studenta!")]
        public string Password { get; set; }
    }
}