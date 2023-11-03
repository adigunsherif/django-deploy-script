#!/bin/bash
# Bash script to setup gunicorn


# Create the Gunicorn socket unit
socket_unit_file="/etc/systemd/system/gunicorn${directory_name}.socket"
echo "[Unit]" | sudo tee "$socket_unit_file"
echo "Description=gunicorn socket" | sudo tee -a "$socket_unit_file"
echo "" | sudo tee -a "$socket_unit_file"
echo "[Socket]" | sudo tee -a "$socket_unit_file"
echo "ListenStream=/run/gunicorn${directory_name}.sock" | sudo tee -a "$socket_unit_file"
echo "" | sudo tee -a "$socket_unit_file"
echo "[Install]" | sudo tee -a "$socket_unit_file"
echo "WantedBy=sockets.target" | sudo tee -a "$socket_unit_file"

# Enable and start the Gunicorn socket
sudo systemctl enable "gunicorn${directory_name}.socket"
sudo systemctl start "gunicorn${directory_name}.socket"

# Create the Gunicorn service unit
service_unit_file="/etc/systemd/system/gunicorn${directory_name}.service"
echo "[Unit]" | sudo tee "$service_unit_file"
echo "Description=gunicorn${directory_name} daemon" | sudo tee -a "$service_unit_file"
echo "Requires=gunicorn${directory_name}.socket" | sudo tee -a "$service_unit_file"
echo "After=network.target" | sudo tee -a "$service_unit_file"
echo "" | sudo tee -a "$service_unit_file"
echo "[Service]" | sudo tee -a "$service_unit_file"
echo "User=ubuntu" | sudo tee -a "$service_unit_file"
echo "WorkingDirectory=/home/ubuntu/${directory_name}/${repository_folder}" | sudo tee -a "$service_unit_file"
echo "ExecStart=/home/ubuntu/${directory_name}/${directory_name}env/bin/gunicorn \\" | sudo tee -a "$service_unit_file"
echo "  --access-logfile - \\" | sudo tee -a "$service_unit_file"
echo "  --workers 3 \\" | sudo tee -a "$service_unit_file"
echo "  --bind unix:/run/gunicorn.sock \\" | sudo tee -a "$service_unit_file"
echo "  {appname}.wsgi:application" | sudo tee -a "$service_unit_file"
echo "" | sudo tee -a "$service_unit_file"
echo "[Install]" | sudo tee -a "$service_unit_file"
echo "WantedBy=multi-user.target" | sudo tee -a "$service_unit_file"

# Reload systemd and start the Gunicorn service
sudo systemctl daemon-reload
sudo systemctl enable "gunicorn${directory_name}.service"
sudo systemctl start "gunicorn${directory_name}.service"



