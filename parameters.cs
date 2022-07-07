using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    public class parameters
    {
        public void q2()
        {
            for (int i = 0; i < 5; i++)
            {
                for (int j = 0; j <= i; j++)
                {
                    Console.Write("*");
                }
                Console.WriteLine();
            }

        }
        public void q2version2(int layer)
        {
            if (layer == 0) return;
            q2version2(layer - 1);
            for (int i = 0; i < layer; i++)
            {
                Console.Write("*");
            }
            Console.WriteLine("\n");

        }
        public void assignment2()
        {
            int[] intarray = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 0 };
            //Console.WriteLine(Arrays.toString(intarray));
            //for(int x: intarray)
            int[] intarray2 = new int[intarray.Length];
            int j = 0;
            foreach (int i in intarray)
            {
                Console.WriteLine(i.ToString());

                intarray2[j] = i;
                j++;
            }
            foreach (int i in intarray2)
            {
                Console.WriteLine(i.ToString());
            }
        }
        public void Assignment2q2()
        {
            ////List<string> ls = new ArrayList<string>();
            var ls = new ArrayList();
            string input = "ok";
            while (!input.Equals("break")) {
                Console.WriteLine("question 2 + - -- input=");
                input = Console.ReadLine();

                if (input.Equals("+")) { ls.Add(3); };
                if (input.Equals("-")) { ls.Remove(3); };
                ls.Add(1);
                ls.Add(2);
                foreach (var items in ls) { Console.WriteLine(items); }
                //Console.Write()
            }

        }
        public void Assignment2q3(int startnum, int end)
        {
            var ar = new ArrayList();
            for (int i = startnum; i <= end; i++)
            {
                if (i % 2 == 0) ar.Add(i);
            }
            foreach (var items in ar) { Console.Write(items + " "); }
            Console.WriteLine();
        }
        public ArrayList Assignment2q5()
        {
            ArrayList arr = new ArrayList();
            //   var old = new ArrayList { 2, 1, 1, 2, 3, 3, 2, 2, 2, 1 };
            int[] old = { 2, 1, 1, 2, 3, 3, 2, 2, 2, 1 };

            int count = 1;
            int index = 0;
            int longestcount = 1;

            for (int i = 1; i < old.Length; i++)// java sizeof()
            {
                //if (!old[i] .Equals( old[i - 1]))  //这就是不定义arraylist <>的坏处  必须用equal比较
                if (old[i] != (old[i - 1]))
                {
                    count = 0;
                }
                Console.WriteLine(old[i].GetType());
                //Console.WriteLine(old[i-1]);
                count++;
                if (count > longestcount) { longestcount = count; index = i; }
            }
            if (longestcount == 1) { var x = old[0]; arr.Add(x); }
            else {
                for (int i = index; i > index - longestcount; i--)
                {
                    arr.Add(old[i]);
                }
            }

            return arr;
        }
        //    var dict =
        //new dictionary<string, int>
        //{
        //    ["b"] = 3,
        //    ["a"] = 4
        //};

        //    // greatest key
        //    var maxkey = dict.keys.max(); // "b"

        //    // greatest value
        //    var maxvalue = dict.values.max(); // 4

        //    // key of the greatest value
        //    // 4 is the greatest value, and its key is "a", so "a" is the answer.
        //    var keyofmaxvalue =
        //        dict.aggregate((x, y) => x.value > y.value ? x : y).key; // "a"////////////////////////////////////aggregate
        public void Assignment2q7()
        {
            //Dictionary<Integer, Integer> dic = new Dictionary<Integer, Integer>;
            Dictionary<int, int> dic = new Dictionary<int, int>();

            int[] arr = { 4, 1, 1, 4, 2, 3, 4, 4, 1, 2, 4, 9, 3 };///////////////
            for (int i = 0; i < arr.Length; i++)
            {
                if (!dic.ContainsKey(arr[i])) dic.Add(arr[i], 1);
                else dic[arr[i]] += 1;
            }
            var maxValue = dic.Values.Max();
            //var maxKey = dic.maxValue.Key;
            var maxkey = dic.FirstOrDefault(x => x.Value == maxValue).Key;//?????????????????=========  not using equal?
            Console.WriteLine("{0},{1}", maxValue, maxkey);
        }
        public void Assignment2qp1() {
            string input = "24tvcoi92";
            Array arr = input.ToCharArray();
            Array.Reverse(arr);
            //arr.ToString();
            //Console.WriteLine(arr.ToString());  和java 不一样 不能直接打印  return System.Char[] instead?????????
            StringBuilder x = new StringBuilder();
            foreach(char item in arr)
            {
                x.Append(item);
            }
            Console.WriteLine(x); arr.ToString();
        }
        public void Assignment2qp4()
        {
            string input = "https://www.apple.com/iphone";
            Char[] arr = input.ToCharArray();
            List<String> nl = new List<String>();
            StringBuilder nsb = new StringBuilder();
            for (int i=0; i<input.Length; i++)
            {
                if (arr[i] != ':' && arr[i] != '/')
                {
                    nsb.Append(arr[i]);
                }
                if(i==input.Length-1)
                {
                    nl.Add(nsb.ToString());
                    break;
                }
                if (arr[i] == '/' && arr[i + 1] != '/') { nl.Add(nsb.ToString()); nsb = new StringBuilder(); }
            }
            Console.WriteLine("protocol{0},{1},{2}", nl[0], nl[1], nl[2]);
        }
        public void Assignment2qp3() {

           // public static bool checkPalin(string word)
         //   {
        //        int n = word.Length;
        //        word = word.ToLower();
        //        for (int i = 0; i < n; i++, n--)
        //        {
        //            if (word[i] != word[n - 1])
        //            {
        //                return false;
        //            }
        //        }
        //        return true;
        //    }

        //    // Function to count palindrome words
        //    public static int countPalin(string str)
        //    {
        //        // to check last word for palindrome
        //        str = str + " ";

        //        // to store each word
        //        string word = "";
        //        int count = 0;
        //        for (int i = 0; i < str.Length; i++)
        //        {
        //            char ch = str[i];

        //            // extracting each word
        //            if (ch != ' ')
        //            {
        //                word = word + ch;
        //            }
        //            else
        //            {
        //                if (checkPalin(word))
        //                {
        //                    count++;
        //                }
        //                word = "";
        //            }
        //        }

        //        return count;
        //    }

        //    // Driver code
        //    public static void Main(string[] args)
        //    {
        //        Console.WriteLine(countPalin("Madam " +
        //                   "Arora teaches malayalam"));

        //        Console.WriteLine(countPalin("Nitin " +
        //                          "speaks malayalam"));
        //    }
        //}

    }
    }
}
