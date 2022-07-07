using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    class Program
    {
        private object console;

        static void Main(string[] args)
        {
            // The code provided will print ‘Hello World’ to the console.
            // Press Ctrl+F5 (or go to Debug > Start Without Debugging) to run your app.
            Console.WriteLine("Hello World!");
            //Console.ReadKey();
            string x = "hello";
            String y = "hello";

            Console.WriteLine(x.GetType());
            Console.WriteLine(y.GetType());
            //Console.WriteLine(String.vla);

            // Go to http://aka.ms/dotnet-get-started-console to continue learning how to build a console app! 
            try
            {
                //    console.writeline("input=");
                 //   int input = convert.toint32(console.readline());
                //    int centuries = input;
                //    int years = 100 * centuries;
                //    int a = 0;
                //    int b = 0;
                //    int c = 2147483647;
                //    //console.writeline(b/a);
                //    console.writeline(c + 1);
                parameters pp = new parameters();
                pp.assignment2();
                pp.q2();
                //pp.Assignment2q2();
                Console.WriteLine("Hello World!");
                // pp.Assignment2q3(0, 5);
                //pp.Assignment2q5();
                //pp.Assignment2q7();
                //pp.Assignment2qp1();
                pp.Assignment2qp4();
               // foreach (var items in pp.Assignment2q5()) { Console.Write(items + " "); }
                Console.WriteLine("Hello World!");
                pp.q2version2(5);
                
                Console.WriteLine("Hello World!");
                Console.WriteLine(Question3());
            //    console.writeline("centuries={0}, years={1}", centuries, years);
            }
            catch (Exception e)
            {
                TextWriter errorWriter = Console.Error;
                errorWriter.WriteLine(e.Message);
                ////errorWriter.WriteLine(usageText);
                //return 1;
            }



            
        }

        static string Question3() //////////////////////????????String string
            {
            //int q3 = 1;
            //Console.WriteLine("q3");
            string res;
            Console.WriteLine("question 3 guess num input=");
            int input = Convert.ToInt32(Console.ReadLine());
            int correctNumber = new Random().Next(3) + 1;
            while (0 == 0) {
                if (input == correctNumber) { res = "correct"; break; }
                else
                {
                    Console.WriteLine("try again");
                     input = Convert.ToInt32(Console.ReadLine());
                }
            }
            return res;
        }
    }
}
