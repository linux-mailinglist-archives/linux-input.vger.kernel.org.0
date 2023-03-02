Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE736A807A
	for <lists+linux-input@lfdr.de>; Thu,  2 Mar 2023 11:56:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229922AbjCBK4U (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Mar 2023 05:56:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbjCBK4M (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 2 Mar 2023 05:56:12 -0500
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14EC7460A4;
        Thu,  2 Mar 2023 02:56:09 -0800 (PST)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id B34B060006;
        Thu,  2 Mar 2023 10:56:06 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Subject: [PATCH v3 6/6] HID: logitech-hidpp: Set wireless_status for G935 receiver
Date:   Thu,  2 Mar 2023 11:55:55 +0100
Message-Id: <20230302105555.51417-6-hadess@hadess.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302105555.51417-1-hadess@hadess.net>
References: <20230302105555.51417-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_PDS_OTHER_BAD_TLD autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Set the USB interface "wireless_status" for the G935 receiver when
receiving battery notifications.

This will allow sound daemons such as Pipewire or PulseAudio to know
whether or not the headset is turned on and connected.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
No changes since v1

 drivers/hid/hid-logitech-hidpp.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 4708819a6d79..c7d81b4241ad 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -74,6 +74,7 @@ MODULE_PARM_DESC(disable_tap_to_click,
 #define HIDPP_QUIRK_HIDPP_EXTRA_MOUSE_BTNS	BIT(27)
 #define HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS	BIT(28)
 #define HIDPP_QUIRK_HI_RES_SCROLL_1P0		BIT(29)
+#define HIDPP_QUIRK_WIRELESS_STATUS		BIT(30)
 
 /* These are just aliases for now */
 #define HIDPP_QUIRK_KBD_SCROLL_WHEEL HIDPP_QUIRK_HIDPP_WHEELS
@@ -472,6 +473,26 @@ static void hidpp_prefix_name(char **name, int name_length)
 	*name = new_name;
 }
 
+/*
+ * Updates the USB wireless_status based on whether the headset
+ * is turned on and reachable.
+ */
+static void hidpp_update_usb_wireless_status(struct hidpp_device *hidpp)
+{
+	struct hid_device *hdev = hidpp->hid_dev;
+	struct usb_interface *intf;
+
+	if (!(hidpp->quirks & HIDPP_QUIRK_WIRELESS_STATUS))
+		return;
+	if (!hid_is_usb(hdev))
+		return;
+
+	intf = to_usb_interface(hdev->dev.parent);
+	usb_set_wireless_status(intf, hidpp->battery.online ?
+				USB_WIRELESS_STATUS_CONNECTED :
+				USB_WIRELESS_STATUS_DISCONNECTED);
+}
+
 /**
  * hidpp_scroll_counter_handle_scroll() - Send high- and low-resolution scroll
  *                                        events given a high-resolution wheel
@@ -1872,6 +1893,7 @@ static int hidpp20_query_adc_measurement_info_1f20(struct hidpp_device *hidpp)
 								 &hidpp->battery.voltage);
 	hidpp->battery.capacity = hidpp20_map_adc_measurement_1f20_capacity(hidpp->hid_dev,
 									    hidpp->battery.voltage);
+	hidpp_update_usb_wireless_status(hidpp);
 
 	return 0;
 }
@@ -1896,6 +1918,7 @@ static int hidpp20_adc_measurement_event_1f20(struct hidpp_device *hidpp,
 		hidpp->battery.capacity = hidpp20_map_adc_measurement_1f20_capacity(hidpp->hid_dev, voltage);
 		if (hidpp->battery.ps)
 			power_supply_changed(hidpp->battery.ps);
+		hidpp_update_usb_wireless_status(hidpp);
 	}
 	return 0;
 }
@@ -4557,7 +4580,8 @@ static const struct hid_device_id hidpp_devices[] = {
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC088) },
 
 	{ /* G935 Gaming Headset */
-	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0x0a87) },
+	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0x0a87),
+		.driver_data = HIDPP_QUIRK_WIRELESS_STATUS },
 
 	{ /* MX5000 keyboard over Bluetooth */
 	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb305),
-- 
2.39.2

