wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip -o ngrok-stable-linux-amd64.zip > /dev/null 2>&1
rm -rf ngrok-stable-linux-amd64.zip
./ngrok authtoken 29Y7qXwzz01LI5RKuUvQgs7isKx_UWgYUeWwLZrLLZdYDTx1
nohup ./ngrok tcp --region ap 5900 &>/dev/null &
sudo apt-get update && apt-get install qemu -y
sudo apt install qemu-utils -y
sudo apt install qemu-system-x86-xen -y
sudo apt install qemu-system-x86 -y
qemu-img create -f raw windows10.img 32G
wget -O virtio-win.iso 'https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.215-1/virtio-win-0.1.215.iso'
wget -O windows10.iso 'https://dl.malwarewatch.org/windows/Windows%2010%201507.iso'
clear
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
sudo qemu-system-x86_64 \
  -m 8G \
  -cpu EPYC \
  -boot order=d \
  -drive file=windows10.iso,media=cdrom \
  -drive file=windows10.img,format=raw,if=virtio \
  -drive file=virtio-win.iso,media=cdrom \
  -device usb-ehci,id=usb,bus=pci.0,addr=0x4 \
  -device usb-tablet \
  -vnc :0 \
  -smp cores=2 \
