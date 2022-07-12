using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace day4
{
    class Program
    {
        static void Main(string[] args)
        {
            // The code provided will print ‘Hello World’ to the console.
            // Press Ctrl+F5 (or go to Debug > Start Without Debugging) to run your app.
            Console.WriteLine("Hello World!");
            #region
            try
            {
                //int a = Convert.ToInt32(Console.ReadLine());
                Employee e = new Employee() { Id = 1, Age = 0};

            }
            catch(FormatException ex)
            {
                Console.WriteLine($"err {ex}");
            }
            catch (OverflowException ex)
            {
                Console.WriteLine($"2ed err {ex}");
            }
            //catch (Exception ex)///  所有的额相册option  来自 exception   ///不能只在ageeception 中定义   这里必须catch 否则无返回
            //{
            //    Console.WriteLine($"{ex}");
            //}

            //或者 直接掉自定义 ageexception   但为什么 不用new????????????????????????
            catch (AgeException ex)  
            {
                Console.WriteLine(ex);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
            finally
            {
                Console.WriteLine("finally");
            }
            //  using  exposible SQLConnection  内存管理 finnaly
            #endregion
            ////////////////////////////////////////////////////////////////////////////delegate////////////////////////
            //是 function 和 class delegate  返回值 一样的类
            Arithmaticperation ao = new Arithmaticperation();
            MathDelegate math = new MathDelegate(ao.Addition);// method 不能有括号（）no
            
            math += ao.Substraction;//no()
            math(1, 2);
            ////////////////////////////////////////////////////////// predefine delegate
            math += (a, b) =>
              {
                  Console.WriteLine(a + b);
                  Console.WriteLine(a - b);
              };
            //anonymouse defer
            //read oly vs  const   both no changing
            //const assign value when initialize  默认 是static
            //read only modify in constructor    
            Console.WriteLine("-------------------------------");
            Exampledel<int> ed = new Exampledel<int>(Add);
            
            Console.WriteLine(ed(1,2));


            Action<string> hello = new Action<string>(Yell);
            hello("yell");

            Func<int,int,int> Additon = new Func<int, int, int>(Add);
            Console.WriteLine(   Additon(2, 2));
            Func<int,int,int, int> additon2 = new Func<int, int, int, int> ((int a, int b, int c)=>{ return a + b + c; });
            Func<int,int,int, int> additon3 = (a,b,c)=> { return a + b + c; };
            additon3 = (a,b,c)=> { return a*b*c; };

            Console.WriteLine(additon2(2, 2,2));
            Console.WriteLine(additon3(2, 2,2));





            Console.ReadKey();
        }
        public static int Add(int a, int b)
        {
            return a + b;
        }
        public static void Yell(string x)
        {
            Console.WriteLine(x);
        }
        
    }
    delegate T Exampledel<T>(T a, T b);    ///////////////////定义
}
