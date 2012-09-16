namespace Kigg.Web
{
    using System;
    using System.Text;

    public static class DateTimeExtension
    {
        public static string ToRelative(this DateTime target)
        {
            Check.Argument.IsNotInFuture(target, "target");

            StringBuilder result = new StringBuilder();
            TimeSpan diff = (SystemTime.Now() - target);

            Action<int, string> format = (v, u) =>
            {
                if (v > 0)
                {
                    if (result.Length > 0)
                    {
                        result.Append(", ");
                    }

                    if (u == "dzie�" && v > 1)
                        u = "dni";

                    if (u == "godzin�" && v > 1)
                    {
                        if ((v % 10 >= 5) || (v % 10 <= 1) || (v > 4 && v < 22))
                        {
                            u = "godzin";
                        }
                        else
                        {
                            u = "godziny";
                        }
                    }

                    if (u == "minut�" && v > 1)
                    {
                        if ((v % 10 >= 5) || (v % 10 <= 1) || (v > 4 && v < 22))
                        {
                            u = "minut";
                        }
                        else
                        {
                            u = "minuty";
                        }
                    }

                    result.Append("{0} {1}".FormatWith(v, u));
                }
            };

            format(diff.Days, "dzie�");
            format(diff.Hours, "godzin�");
            format(diff.Minutes, "minut�");


            return (result.Length == 0) ? "chwil�" : result.ToString();
        }
    }
}