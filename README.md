# my-i3-conf

Fonts: ttf-dejavu ttf-liberation noto-fonts ner-fonts

Problem fix:

Systemd on shutdown/reboot very slow:

1. Check containerd (sudo systemctl edit --full containerd.service) Kill mode and try set KillMode=mixed
2. Add debug.sh from systemd wiki

Backlight module failed while system booting:

1. In grub config --> GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet splash fbcon=nodefer acpi_backlight=vendor"

