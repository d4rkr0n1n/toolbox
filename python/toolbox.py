import platform
import socket


def main() -> None:
    print("========================================")
    print("          TOOLBOX SYSTEM INFO")
    print("========================================")

    system_info = (
        ("Computer name", socket.gethostname()),
        ("Operating system", platform.system()),
        ("OS release", platform.release()),
        ("OS version", platform.version()),
        ("Architecture", platform.machine()),
        ("Python version", platform.python_version()),
    )

    for label, value in system_info:
        print(f"{label:<18}: {value}")

    print("========================================")
    print("       Made in India(🇮🇳) with ❤️")
    print("========================================")


if __name__ == "__main__":
    main()
