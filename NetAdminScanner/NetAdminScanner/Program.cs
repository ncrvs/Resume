using System;
using System.Net.NetworkInformation;
using System.Net.Sockets;
using System.Threading.Tasks;

namespace NetAdminScanner
{
    class Program
    {
        static async Task Main(string[] args)
        {
            Console.WriteLine(" NetAdmin Network Diagnostic Tool ");
            Console.Write("Введите IP-адрес или домен (например, 8.8.8.8 или google.com): ");
            string host = Console.ReadLine();

            Console.WriteLine($"\nОтправка ICMP Ping-запроса на {host}...");
            await PingHost(host);

            Console.WriteLine("\nСканирование стандартных TCP-портов (80, 443, 3389)...");
            int[] portsToScan = { 80, 443, 3389 }; // 80 (HTTP), 443 (HTTPS), 3389 (RDP)

            foreach (int port in portsToScan)
            {
                await CheckPort(host, port);
            }

            Console.WriteLine("\nДиагностика завершена. Нажмите любую клавишу для выхода.");
            Console.ReadKey();
        }

        static async Task PingHost(string host)
        {
            try
            {
                using Ping pingSender = new Ping();
                PingReply reply = await pingSender.SendPingAsync(host, 2000);

                if (reply.Status == IPStatus.Success)
                {
                    Console.ForegroundColor = ConsoleColor.Green;
                    Console.WriteLine($"[УСПЕШНО] Узел {host} доступен. Время отклика: {reply.RoundtripTime} мс");
                }
                else
                {
                    Console.ForegroundColor = ConsoleColor.Red;
                    Console.WriteLine($"[ОШИБКА] Узел {host} недоступен. Статус: {reply.Status}");
                }
            }
            catch (Exception ex)
            {
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine($"[ОШИБКА ПИНГА] {ex.Message}");
            }
            Console.ResetColor();
        }

        static async Task CheckPort(string host, int port)
        {
            try
            {
                using TcpClient client = new TcpClient();
                var connectTask = client.ConnectAsync(host, port);

                // Тайм-аут 1.5 секунды
                if (await Task.WhenAny(connectTask, Task.Delay(1500)) == connectTask)
                {
                    Console.ForegroundColor = ConsoleColor.Green;
                    Console.WriteLine($"[ОТКРЫТ] Порт {port}");
                }
                else
                {
                    Console.ForegroundColor = ConsoleColor.Yellow;
                    Console.WriteLine($"[ЗАКРЫТ/ФИЛЬТРУЕТСЯ] Порт {port} (Тайм-аут)");
                }
            }
            catch
            {
                Console.ForegroundColor = ConsoleColor.DarkYellow;
                Console.WriteLine($"[ЗАКРЫТ] Порт {port} (Отказ в подключении)");
            }
            Console.ResetColor();
        }
    }
}
