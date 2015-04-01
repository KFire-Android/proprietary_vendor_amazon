#!/system/bin/sh

export PATH=/system/bin

if [ -e /proc/product_features/wan ]
then
    setprop ro.product.model KFTHWA
else
    setprop ro.product.model KFTHWI
fi
