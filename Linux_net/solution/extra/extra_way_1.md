## Let's  try different approach

1. Let's keep the static IP for *Router #2 (r2)* in **/etc/netplan/00-installer-config.yaml** file.

    ![ScShot_8](media_2/scs8.png "r2: /etc/netplan/00-installer-config.yaml")

2. If we do it *(r2)* will still work like router for *ws21* and *ws22*.
While at the same time will get a new address for the *Network 2*.

    ![ScShot_9](media_2/scs9.png "r2: ping w11, ping w22, routes.yaml")

    ![ScShot_10](media_2/scs10.png "r2: ip a")

## Additional 

1. If we remove static IP from **/etc/netplan/00-installer-config.yaml** file for *ws21*:

    ![ScShot_11](media_2/scs11.png "r2: /etc/netplan/00-installer-config.yaml")

2. This way *ws21* will get new IP address in range we assigned in the **/etc/dhcp/dhcpd.conf** file.

    ![ScShot_12](media_2/scs12.png "ws21 new IP")

3. It can be *pinged* using new  IP address.

    ![ScShot_13](media_2/scs13.png "ws21 new IP")


