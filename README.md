# PingSweep

A lightweight Bash utility that checks every host address in an IPv4 `/24` network and records hosts that respond to ICMP echo requests.

## Features

- Scans addresses `.1` through `.254` concurrently
- Uses only common command-line tools
- Writes responsive IP addresses to `active_hosts.txt`
- Clears the previous output file before each run

## Requirements

- Linux with Bash
- `ping`
- `grep`

## Installation

```bash
git clone https://github.com/c0desec/PingSweep.git
cd PingSweep
chmod +x pingsweep.sh
```

## Usage

Pass the first three octets of the target network:

```bash
./pingsweep.sh 192.168.1
```

The script scans `192.168.1.1` through `192.168.1.254`. Responsive addresses are saved to:

```text
active_hosts.txt
```

## How it works

For each host address, the script sends one ICMP echo request with a one-second timeout. Successful responses are printed and appended to the output file. Background jobs allow the checks to run concurrently.

## Limitations

- Accepts an IPv4 `/24` prefix only; it does not parse CIDR notation.
- Hosts that block or ignore ICMP may appear offline.
- The current version does not validate the supplied prefix.
- A scan launches up to 254 background processes.

## Responsible use

Use this tool only on systems and networks you own or have explicit permission to test.

## Contributing

Issues and focused pull requests are welcome. Useful next steps include CIDR support, input validation, configurable timeouts, and concurrency limits.
