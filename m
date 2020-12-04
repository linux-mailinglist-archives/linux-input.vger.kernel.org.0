Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 776422CF0BC
	for <lists+linux-input@lfdr.de>; Fri,  4 Dec 2020 16:31:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730378AbgLDPaU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Dec 2020 10:30:20 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:41510 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727997AbgLDPaU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 4 Dec 2020 10:30:20 -0500
Received: from [111.196.65.193] (helo=localhost.localdomain)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <hui.wang@canonical.com>)
        id 1klD1d-0002pv-K9; Fri, 04 Dec 2020 15:29:38 +0000
From:   Hui Wang <hui.wang@canonical.com>
To:     linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Subject: [PATCH 2/2] HID: i2c-hid: Add a quirk to keep the power in shutdown
Date:   Fri,  4 Dec 2020 23:29:12 +0800
Message-Id: <20201204152912.151604-2-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201204152912.151604-1-hui.wang@canonical.com>
References: <20201204152912.151604-1-hui.wang@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On the latest Thinkpad Yoga laptop, the touchscreen module is wacom
I2C WACF2200 (056a:5276), we found the touchscreen could not work
after rebooting, needs to poweroff the machine then poweron the
machine to let it work.

It is highly possible that this is a BIOS issue, but the windows
doesn't have this problem with the same BIOS.

If keeping the power on when calling shutdown, the touchscreen could
work after rebooting. Let us add a quirk for it and apply the quirk
to this machine only.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 drivers/hid/hid-ids.h              |  1 +
 drivers/hid/i2c-hid/i2c-hid-core.c | 20 ++++++++++++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index f170feaac40b..ecc1d4040b6f 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1223,6 +1223,7 @@
 #define USB_VENDOR_ID_WACOM		0x056a
 #define USB_DEVICE_ID_WACOM_GRAPHIRE_BLUETOOTH	0x81
 #define USB_DEVICE_ID_WACOM_INTUOS4_BLUETOOTH   0x00BD
+#define USB_DEVICE_ID_WACOM_5276		0x5276
 
 #define USB_VENDOR_ID_WALTOP				0x172f
 #define USB_DEVICE_ID_WALTOP_SLIM_TABLET_5_8_INCH	0x0032
diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 953877cf1051..7c6d5b8175fd 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -51,7 +51,7 @@
 #define I2C_HID_QUIRK_BOGUS_IRQ			BIT(4)
 #define I2C_HID_QUIRK_RESET_ON_RESUME		BIT(5)
 #define I2C_HID_QUIRK_BAD_INPUT_SIZE		BIT(6)
-
+#define I2C_HID_QUIRK_KEEP_PWR_ON_SHUTDOWN	BIT(7)
 
 /* flags */
 #define I2C_HID_STARTED		0
@@ -183,6 +183,20 @@ static const struct i2c_hid_quirks {
 		 I2C_HID_QUIRK_RESET_ON_RESUME },
 	{ USB_VENDOR_ID_ITE, I2C_DEVICE_ID_ITE_LENOVO_LEGION_Y720,
 		I2C_HID_QUIRK_BAD_INPUT_SIZE },
+	{
+		.idVendor = USB_VENDOR_ID_WACOM,
+		.idProduct = USB_DEVICE_ID_WACOM_5276,
+		.quirks = I2C_HID_QUIRK_KEEP_PWR_ON_SHUTDOWN,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+					DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "LENOVO_MT_20XY_BU_Think_FM_ThinkPad X1 Yoga Gen 6"),
+				}
+			},
+			{}
+		}
+	},
 	{ 0, 0 }
 };
 
@@ -1182,7 +1196,9 @@ static void i2c_hid_shutdown(struct i2c_client *client)
 {
 	struct i2c_hid *ihid = i2c_get_clientdata(client);
 
-	i2c_hid_set_power(client, I2C_HID_PWR_SLEEP);
+	if (!(ihid->quirks & I2C_HID_QUIRK_KEEP_PWR_ON_SHUTDOWN))
+		i2c_hid_set_power(client, I2C_HID_PWR_SLEEP);
+
 	free_irq(client->irq, ihid);
 
 	i2c_hid_acpi_shutdown(&client->dev);
-- 
2.25.1

