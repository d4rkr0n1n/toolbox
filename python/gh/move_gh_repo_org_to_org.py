import json
import subprocess
import sys


def main():
    test = subprocess.run(
            ["gh", "repo", "list", "--json", "name", "--limit=100", "--fork=false"],
            check=True,
            stdout=subprocess.PIPE,
            text=True,
        )
    repos = [
        "d4rkr0n1n/" + x["name"] for x in json.loads(test.stdout)
    ]
    print(repos)
    response = subprocess.run(
        ["gh", "api", "user"],
        check=True,
        stdout=subprocess.PIPE,
        text=True,
    )

    user = json.loads(response.stdout)
    print(f"Authenticated as {user['login']}")

    for repo in repos[1:]:
        print(f"Moving {repo}")
        print(f"Remaining {len(repos) - repos.index(repo) - 1}")
        response = subprocess.run(
            [
                "gh",
                "api",
                "--method",
                "POST",
                "-H",
                "Accept: application/vnd.github+json",
                f"repos/{repo}/transfer",
                "-f",
                "new_owner=d4rkr0n1n-archive",
            ],
            check=True,
            stdout=subprocess.PIPE,
            text=True,
        )


if __name__ == "__main__":
    try:
        main()
    except subprocess.CalledProcessError as error:
        print(f"gh command failed with exit status {error.returncode}", file=sys.stderr)
        sys.exit(error.returncode)
