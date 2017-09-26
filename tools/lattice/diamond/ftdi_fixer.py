#!/usr/bin/python
# vim: set ts=4 sw=4 expandtab syntax=python:
"""

FTDI device permission fixer

Can be called from a udev rule to ensure connected FTDI devices have
world-writable permissions for use by user applications

J. Hipps <jacob@ycnrg.org>
https://ycnrg.org/

"""

import os
import sys
import usb1

def find_usb_device(vid, pid):
    """locate usb device with libusb"""
    usb = usb1.USBContext()
    for tdev in usb.getDeviceList():
        if tdev.getVendorID() == vid and tdev.getProductID() == pid:
            n_bus = tdev.getBusNumber()
            n_dev = tdev.getDeviceAddress()
            n_port = tdev.getPortNumber()
            return (n_bus, n_dev)
    return None

def fix_dev_perms(bus, dev):
    """fix perms for entry in /dev/bus"""
    db_path = '/dev/bus/usb/%03d/%03d' % (bus, dev)
    try:
        os.stat(db_path)
    except Exception as e:
        print("Entry not accessible [%s]: %s" % (db_path, str(e)))
        return False
    try:
        os.chmod(db_path, 0o0666)
    except Exception as e:
        print("Failed to update perms for %s: %s" % (db_path, str(e)))
        return False
    return True

def _main():
    """entry point"""
    if 'ID_VENDOR_ID' in os.environ and 'ID_MODEL_ID' in os.environ:
        try:
            d_vid = int(os.environ['ID_VENDOR_ID'], 16)
            d_pid = int(os.environ['ID_MODEL_ID'], 16)
        except:
            print("Failed to convert values from env")
            sys.exit(2)
    else:
        if len(sys.argv) < 3:
            print("usage: ftdi_fixer.py [VENDOR_ID PRODUCT_ID]")
            sys.exit(1)
        try:
            d_vid = int(sys.argv[1], 16)
            d_pid = int(sys.argv[2], 16)
        except:
            print("Failed to convert hex values")
            sys.exit(2)

    udev = find_usb_device(d_vid, d_pid)

    if udev:
        fix_dev_perms(*udev)
    else:
        print("Failed to locate device")
        sys.exit(1)
    sys.exit(0)

if __name__ == '__main__':
    _main()

