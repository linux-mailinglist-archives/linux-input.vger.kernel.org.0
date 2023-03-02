Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 095C46A8076
	for <lists+linux-input@lfdr.de>; Thu,  2 Mar 2023 11:56:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbjCBK4K (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Mar 2023 05:56:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbjCBK4H (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 2 Mar 2023 05:56:07 -0500
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 040EF3D086;
        Thu,  2 Mar 2023 02:56:05 -0800 (PST)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 0E52660004;
        Thu,  2 Mar 2023 10:56:01 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Subject: [PATCH v3 4/6] USB: core: Add wireless_status sysfs attribute
Date:   Thu,  2 Mar 2023 11:55:53 +0100
Message-Id: <20230302105555.51417-4-hadess@hadess.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302105555.51417-1-hadess@hadess.net>
References: <20230302105555.51417-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a wireless_status sysfs attribute to USB devices to keep track of
whether a USB device that's comprised of a receiver dongle and an emitter
device over a, most of the time proprietary, wireless link has its emitter
connected or disconnected.

This will be used by user-space OS components to determine whether the
battery-powered part of the device is wirelessly connected or not,
allowing, for example:
- upower to hide the battery for devices where the device is turned off
  but the receiver plugged in, rather than showing 0%, or other values
  that could be confusing to users
- Pipewire to hide a headset from the list of possible inputs or outputs
  or route audio appropriately if the headset is suddenly turned off, or
  turned on
- libinput to determine whether a keyboard or mouse is present when its
  receiver is plugged in.

This is done at the USB interface level as:
- the interface on which the wireless status is detected is sometimes
  not the same as where it could be consumed (eg. the audio interface
  on a headset dongle will still appear even if the headset is turned
  off), and we cannot have synchronisation of status across subsystems.
- this behaviour is not specific to HID devices, even if the protocols
  used to determine whether or not the remote device is connected can
  be HID.

This is not an attribute that is meant to replace protocol specific
APIs, such as the ones available for WWAN, WLAN/Wi-Fi, or Bluetooth
or any other sort of networking, but solely for wireless devices with
an ad-hoc “lose it and your device is e-waste” receiver dongle.

The USB interface will only be exporting the wireless_status sysfs
attribute if it gets set through the API exported in the next commit.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
Updated commit message and documentation in v2 so that the commit
doesn't need to reference older discussions.

Trimmed the width of the sysfs docs in v3.

 Documentation/ABI/testing/sysfs-bus-usb | 17 +++++++++
 drivers/usb/core/sysfs.c                | 50 +++++++++++++++++++++++++
 drivers/usb/core/usb.h                  |  1 +
 include/linux/usb.h                     |  9 +++++
 4 files changed, 77 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-usb b/Documentation/ABI/testing/sysfs-bus-usb
index 545c2dd97ed0..cb172db41b34 100644
--- a/Documentation/ABI/testing/sysfs-bus-usb
+++ b/Documentation/ABI/testing/sysfs-bus-usb
@@ -166,6 +166,23 @@ Description:
 		The file will be present for all speeds of USB devices, and will
 		always read "no" for USB 1.1 and USB 2.0 devices.
 
+What:		/sys/bus/usb/devices/<INTERFACE>/wireless_status
+Date:		February 2023
+Contact:	Bastien Nocera <hadess@hadess.net>
+Description:
+		Some USB devices use a USB receiver dongle to communicate
+		wirelessly with their device using proprietary protocols. This
+		attribute allows user-space to know whether the device is
+		connected to its receiver dongle, and, for example, consider
+		the device to be absent when choosing whether to show the
+		device's battery, show a headset in a list of outputs, or show
+		an on-screen keyboard if the only wireless keyboard is
+		turned off.
+		This attribute is not to be used to replace protocol specific
+		statuses available in WWAN, WLAN/Wi-Fi, Bluetooth, etc.
+		If the device does not use a receiver dongle with a wireless
+		device, then this attribute will not exist.
+
 What:		/sys/bus/usb/devices/.../<hub_interface>/port<X>
 Date:		August 2012
 Contact:	Lan Tianyu <tianyu.lan@intel.com>
diff --git a/drivers/usb/core/sysfs.c b/drivers/usb/core/sysfs.c
index 8217032dfb85..da3c0f0dd633 100644
--- a/drivers/usb/core/sysfs.c
+++ b/drivers/usb/core/sysfs.c
@@ -1232,9 +1232,59 @@ static const struct attribute_group intf_assoc_attr_grp = {
 	.is_visible =	intf_assoc_attrs_are_visible,
 };
 
+static ssize_t wireless_status_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	struct usb_interface *intf;
+
+	intf = to_usb_interface(dev);
+	if (intf->wireless_status == USB_WIRELESS_STATUS_DISCONNECTED)
+		return sysfs_emit(buf, "%s\n", "disconnected");
+	return sysfs_emit(buf, "%s\n", "connected");
+}
+static DEVICE_ATTR_RO(wireless_status);
+
+static struct attribute *intf_wireless_status_attrs[] = {
+	&dev_attr_wireless_status.attr,
+	NULL
+};
+
+static umode_t intf_wireless_status_attr_is_visible(struct kobject *kobj,
+		struct attribute *a, int n)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct usb_interface *intf = to_usb_interface(dev);
+
+	if (a != &dev_attr_wireless_status.attr ||
+	    intf->wireless_status != USB_WIRELESS_STATUS_NA)
+		return a->mode;
+	return 0;
+}
+
+static const struct attribute_group intf_wireless_status_attr_grp = {
+	.attrs =	intf_wireless_status_attrs,
+	.is_visible =	intf_wireless_status_attr_is_visible,
+};
+
+int usb_update_wireless_status_attr(struct usb_interface *intf)
+{
+	struct device *dev = &intf->dev;
+	int ret;
+
+	ret = sysfs_update_group(&dev->kobj, &intf_wireless_status_attr_grp);
+	if (ret < 0)
+		return ret;
+
+	sysfs_notify(&dev->kobj, NULL, "wireless_status");
+	kobject_uevent(&dev->kobj, KOBJ_CHANGE);
+
+	return 0;
+}
+
 const struct attribute_group *usb_interface_groups[] = {
 	&intf_attr_grp,
 	&intf_assoc_attr_grp,
+	&intf_wireless_status_attr_grp,
 	NULL
 };
 
diff --git a/drivers/usb/core/usb.h b/drivers/usb/core/usb.h
index 0eac7d4285d1..3f14e15f07f6 100644
--- a/drivers/usb/core/usb.h
+++ b/drivers/usb/core/usb.h
@@ -15,6 +15,7 @@ extern int usb_create_sysfs_dev_files(struct usb_device *dev);
 extern void usb_remove_sysfs_dev_files(struct usb_device *dev);
 extern void usb_create_sysfs_intf_files(struct usb_interface *intf);
 extern void usb_remove_sysfs_intf_files(struct usb_interface *intf);
+extern int usb_update_wireless_status_attr(struct usb_interface *intf);
 extern int usb_create_ep_devs(struct device *parent,
 				struct usb_host_endpoint *endpoint,
 				struct usb_device *udev);
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 86d1c8e79566..46fc85aba0df 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -170,6 +170,12 @@ usb_find_last_int_out_endpoint(struct usb_host_interface *alt,
 	return usb_find_common_endpoints_reverse(alt, NULL, NULL, NULL, int_out);
 }
 
+enum usb_wireless_status {
+	USB_WIRELESS_STATUS_NA = 0,
+	USB_WIRELESS_STATUS_DISCONNECTED,
+	USB_WIRELESS_STATUS_CONNECTED,
+};
+
 /**
  * struct usb_interface - what usb device drivers talk to
  * @altsetting: array of interface structures, one for each alternate
@@ -203,6 +209,8 @@ usb_find_last_int_out_endpoint(struct usb_host_interface *alt,
  * @reset_ws: Used for scheduling resets from atomic context.
  * @resetting_device: USB core reset the device, so use alt setting 0 as
  *	current; needs bandwidth alloc after reset.
+ * @wireless_status: if the USB device uses a receiver/emitter combo, whether
+ *	the emitter is connected.
  *
  * USB device drivers attach to interfaces on a physical device.  Each
  * interface encapsulates a single high level function, such as feeding
@@ -253,6 +261,7 @@ struct usb_interface {
 	unsigned needs_binding:1;	/* needs delayed unbind/rebind */
 	unsigned resetting_device:1;	/* true: bandwidth alloc after reset */
 	unsigned authorized:1;		/* used for interface authorization */
+	enum usb_wireless_status wireless_status;
 
 	struct device dev;		/* interface specific device info */
 	struct device *usb_dev;
-- 
2.39.2

