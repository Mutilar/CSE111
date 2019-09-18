﻿using System;
using System.Collections.Generic;
using System.IO;

class Test
{
    public static void Main()
    {
        string[] files = new string[] { "nation", "part", "partsupp", "orders", "region", "supplier" };
        List<string> files_list = new List<string>(files);
        string output = "";
        int count = 0;
        try
        {
            foreach (string one_file in files_list) {
                using (StreamReader sr = new StreamReader("C:\\Users\\Mutilar\\Downloads\\tpch_2_13_0\\" + one_file + ".txt"))
                {
                    string line;
                    while ((line = sr.ReadLine()) != null)
                    {

                        //Console.WriteLine(line);
                        output += line.Substring(0, line.Length - 1) + "\n";
                        if (count++ % 100 == 0) Console.WriteLine(count + " processed");
                    }
                }
                Console.WriteLine("all processed!... post-processing");
                output = output.Replace(",", "_");

                output = output.Replace("|", ",");

                output = output.Substring(0, output.Length - 1);

                using (StreamWriter sw = new StreamWriter("C:\\Users\\Mutilar\\Downloads\\tpch_2_13_0\\" + one_file + "-OUT.csv"))
                {
                    sw.WriteLine(output);
                }
            }
        }
        catch (Exception e)
        {
            Console.WriteLine("The file could not be read:");
            Console.WriteLine(e.Message);
        }
    }
}