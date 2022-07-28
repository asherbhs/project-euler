using System;
using System.Linq;

public class Problem1
{
    public static void Main(string[] args)
    {
        Console.WriteLine(

            Enumerable.Range(1, 999)
                .Where(n => n % 3 == 0 || n % 5 == 0)
                .Sum()

        );
    }
}