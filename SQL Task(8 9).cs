using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace ConsoleApp9
{
    class Program
    {
        static void Main(string[] args)
        {
            string connectionString = "Server=cmdlhrdb01;Database=5052_DB;Trusted_Connection=True;";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {




                // 1. Execute Stored Procedure to Add a new Student
                using (SqlCommand command = new SqlCommand("AddStudent", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@StudentID", 13);
                    command.Parameters.AddWithValue("@FirstName", "Hamza");
                    command.Parameters.AddWithValue("@LastName", "Abbas");
                    command.Parameters.AddWithValue("@Age", 17);
                    command.Parameters.AddWithValue("@CourseID", 2);
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }




                //2.Execute Stored Procedure to Update a Student's Age
                using (SqlCommand command = new SqlCommand("UpdateStudenteAge", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@ID", 5);
                    command.Parameters.AddWithValue("@NewAge", 45);
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }





                // 3. Execute Stored Procedure to Delete a Student
                using (SqlCommand command = new SqlCommand("DeleteStudent", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@ID", 12);
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }




                // 4. Execute Stored Procedure to Get All Students
                using (SqlCommand command = new SqlCommand("ListALLStudents", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        Console.WriteLine($"StudentID: {reader["StudentID"]}, FirstName: {reader["FirstName"]}, LastName: {reader["LastName"]}, Age: {reader["Age"]}, CourseID: {reader["CourseID"]}");
                    }
                    connection.Close();
                }


                //----------------------------Task 9: Advanced Reports in Console Application-------------------------------------------------------------


                //1.List the names of students who are not enrolled in any course.
                using (SqlCommand command = new SqlCommand("notEnrolled", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();



                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        Console.WriteLine($"FirstName: {reader["FirstName"]}, LastName: {reader["LastName"]}");
                    }

                    connection.Close();
                }

                //2.Find the most popular course (the course with the most students enrolled).
                using (SqlCommand command = new SqlCommand("mostPopular", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();



                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        Console.WriteLine($"CourseName: {reader["CourseName"]}");
                    }

                    connection.Close();

                }
                Console.Read();

                //3.List the students who are older than the average age of students.
                using (SqlCommand command = new SqlCommand("olderthanAverage_Age", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();



                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        Console.WriteLine($" {reader["FirstName"]} {reader["LastName"]}");
                    }

                    connection.Close();
                }
                Console.Read();



                //4.Find the total number of students and average age for each course.
                using (SqlCommand command = new SqlCommand("studentAndAverageageOfcourse", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();



                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        Console.WriteLine($" {reader["Total_noStudents"]} {reader["Average_Age"]}");
                    }

                    connection.Close();
                }
                Console.Read();




                //5.List the courses that have no students enrolled in them.
                using (SqlCommand command = new SqlCommand("noStudentEnrolled", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();



                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        Console.WriteLine($"{reader["CourseName"]}");
                    }

                    connection.Close();
                }
                Console.Read();


                //6.List students who share courses with a specific student (choose one from your records).
                using (SqlCommand command = new SqlCommand("shareCourse", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();



                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        Console.WriteLine($"{reader["FirstName"]} {reader["LastName"]} ");
                    }

                    connection.Close();
                }
                Console.Read();




                //7.For each course, list the youngest and oldest student.
                using (SqlCommand command = new SqlCommand("youngestOldest_student", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();



                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        Console.WriteLine($"{reader["youngest"]} {reader["Oldest"]}");
                    }

                    connection.Close();
                }
                Console.Read();

            }
        }
    }
}
