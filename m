Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE9E6A0A72
	for <lists+linux-input@lfdr.de>; Thu, 23 Feb 2023 14:25:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232420AbjBWNZD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Feb 2023 08:25:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232900AbjBWNZD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Feb 2023 08:25:03 -0500
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 358D856794;
        Thu, 23 Feb 2023 05:25:01 -0800 (PST)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id B8A2F240014;
        Thu, 23 Feb 2023 13:24:57 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Subject: [PATCH 3/5] USB: core: Add wireless_status sysfs attribute
Date:   Thu, 23 Feb 2023 14:24:50 +0100
Message-Id: <20230223132452.37958-3-hadess@hadess.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223132452.37958-1-hadess@hadess.net>
References: <20230223132452.37958-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a wireless_status sysfs attribute to USB devices to keep track of
whether a USB device that uses a receiver/emitter combo has its
emitter connected or disconnected.

By default, the USB device will declare not to use a receiver/emitter.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 Documentation/ABI/testing/sysfs-bus-usb | 12 ++++++
 drivers/usb/core/sysfs.c                | 50 +++++++++++++++++++++++++
 drivers/usb/core/usb.h                  |  1 +
 include/linux/usb.h                     | 10 +++++
 4 files changed, 73 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-usb b/Documentation/ABI/testing/sysfs-bus-usb
index 545c2dd97ed0..0bd22ece05cd 100644
--- a/Documentation/ABI/testing/sysfs-bus-usb
+++ b/Documentation/ABI/testing/sysfs-bus-usb
@@ -166,6 +166,18 @@ Description:
 		The file will be present for all speeds of USB devices, and will
 		always read "no" for USB 1.1 and USB 2.0 devices.
 
+What:		/sys/bus/usb/devices/<INTERFACE>/wireless_status
+Date:		January 2023
+Contact:	Bastien Nocera <hadess@hadess.net>
+Description:
+		Some USB devices use a small USB receiver coupled with a larger
+		wireless device, usually communicating using proprietary
+		wireless protocols. This attribute will read either "connected"
+		or "disconnected" depending on whether the emitter is turned on,
+		in range and connected, on the interface which is used to detect
+		this state. If the device does not use a receiver/emitter combo,
+		then this attribute will not exist.
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
index 86d1c8e79566..517ae4b4e333 100644
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
@@ -887,6 +896,7 @@ static inline int usb_interface_claimed(struct usb_interface *iface)
 
 extern void usb_driver_release_interface(struct usb_driver *driver,
 			struct usb_interface *iface);
+
 const struct usb_device_id *usb_match_id(struct usb_interface *interface,
 					 const struct usb_device_id *id);
 extern int usb_match_one_id(struct usb_interface *interface,
-- 
2.39.2

