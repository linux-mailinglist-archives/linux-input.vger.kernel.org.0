Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3452D6A8079
	for <lists+linux-input@lfdr.de>; Thu,  2 Mar 2023 11:56:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbjCBK4L (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Mar 2023 05:56:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbjCBK4J (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 2 Mar 2023 05:56:09 -0500
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A441943900;
        Thu,  2 Mar 2023 02:56:07 -0800 (PST)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id DCDBE60008;
        Thu,  2 Mar 2023 10:56:04 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Subject: [PATCH v3 5/6] USB: core: Add API to change the wireless_status
Date:   Thu,  2 Mar 2023 11:55:54 +0100
Message-Id: <20230302105555.51417-5-hadess@hadess.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302105555.51417-1-hadess@hadess.net>
References: <20230302105555.51417-1-hadess@hadess.net>
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

This adds the API that allows device specific drivers to tell user-space
about whether the wireless device is connected to its receiver dongle.

See "USB: core: Add wireless_status sysfs attribute" for a detailed
explanation of what this attribute should be used for.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
Fixed locking/use-after-free in v2, thanks to Alan Stern

Fixed ordering of locking/put in v3, thanks to Alan Stern again

 drivers/usb/core/message.c | 40 ++++++++++++++++++++++++++++++++++++++
 include/linux/usb.h        |  5 +++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index 127fac1af676..7930dca84616 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -1908,6 +1908,45 @@ static void __usb_queue_reset_device(struct work_struct *ws)
 	usb_put_intf(iface);	/* Undo _get_ in usb_queue_reset_device() */
 }
 
+/*
+ * Internal function to set the wireless_status sysfs attribute
+ * See usb_set_wireless_status() for more details
+ */
+static void __usb_wireless_status_intf(struct work_struct *ws)
+{
+	struct usb_interface *iface =
+		container_of(ws, struct usb_interface, wireless_status_work);
+
+	device_lock(iface->dev.parent);
+	if (iface->sysfs_files_created)
+		usb_update_wireless_status_attr(iface);
+	device_unlock(iface->dev.parent);
+	usb_put_intf(iface);	/* Undo _get_ in usb_set_wireless_status() */
+}
+
+/**
+ * usb_set_wireless_status - sets the wireless_status struct member
+ * @dev: the device to modify
+ * @status: the new wireless status
+ *
+ * Set the wireless_status struct member to the new value, and emit
+ * sysfs changes as necessary.
+ *
+ * Returns: 0 on success, -EALREADY if already set.
+ */
+int usb_set_wireless_status(struct usb_interface *iface,
+		enum usb_wireless_status status)
+{
+	if (iface->wireless_status == status)
+		return -EALREADY;
+
+	usb_get_intf(iface);
+	iface->wireless_status = status;
+	schedule_work(&iface->wireless_status_work);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(usb_set_wireless_status);
 
 /*
  * usb_set_configuration - Makes a particular device setting be current
@@ -2100,6 +2139,7 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
 		intf->dev.type = &usb_if_device_type;
 		intf->dev.groups = usb_interface_groups;
 		INIT_WORK(&intf->reset_ws, __usb_queue_reset_device);
+		INIT_WORK(&intf->wireless_status_work, __usb_wireless_status_intf);
 		intf->minor = -1;
 		device_initialize(&intf->dev);
 		pm_runtime_no_callbacks(&intf->dev);
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 46fc85aba0df..a48eeec62a66 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -262,6 +262,7 @@ struct usb_interface {
 	unsigned resetting_device:1;	/* true: bandwidth alloc after reset */
 	unsigned authorized:1;		/* used for interface authorization */
 	enum usb_wireless_status wireless_status;
+	struct work_struct wireless_status_work;
 
 	struct device dev;		/* interface specific device info */
 	struct device *usb_dev;
@@ -896,6 +897,10 @@ static inline int usb_interface_claimed(struct usb_interface *iface)
 
 extern void usb_driver_release_interface(struct usb_driver *driver,
 			struct usb_interface *iface);
+
+int usb_set_wireless_status(struct usb_interface *iface,
+			enum usb_wireless_status status);
+
 const struct usb_device_id *usb_match_id(struct usb_interface *interface,
 					 const struct usb_device_id *id);
 extern int usb_match_one_id(struct usb_interface *interface,
-- 
2.39.2

