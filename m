Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17CA02CF0BB
	for <lists+linux-input@lfdr.de>; Fri,  4 Dec 2020 16:31:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730365AbgLDPaP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Dec 2020 10:30:15 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:41498 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727997AbgLDPaO (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 4 Dec 2020 10:30:14 -0500
Received: from [111.196.65.193] (helo=localhost.localdomain)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <hui.wang@canonical.com>)
        id 1klD1X-0002pv-M5; Fri, 04 Dec 2020 15:29:32 +0000
From:   Hui Wang <hui.wang@canonical.com>
To:     linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Subject: [PATCH 1/2] HID: i2c-hid: expand the quirk lookup table to support dmi_table
Date:   Fri,  4 Dec 2020 23:29:11 +0800
Message-Id: <20201204152912.151604-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

After adding the dmi_table, we could apply the quirk to the specific
machine, and the dmi_table is optional when define a quirk table, if
not define the dmi_table, the lookup_quirk() works the same as before.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index aeff1ffb0c8b..953877cf1051 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -37,6 +37,7 @@
 #include <linux/mutex.h>
 #include <linux/acpi.h>
 #include <linux/of.h>
+#include <linux/dmi.h>
 #include <linux/regulator/consumer.h>
 
 #include <linux/platform_data/i2c-hid.h>
@@ -166,6 +167,7 @@ static const struct i2c_hid_quirks {
 	__u16 idVendor;
 	__u16 idProduct;
 	__u32 quirks;
+	const struct dmi_system_id *dmi_table;
 } i2c_hid_quirks[] = {
 	{ USB_VENDOR_ID_WEIDA, HID_ANY_ID,
 		I2C_HID_QUIRK_SET_PWR_WAKEUP_DEV },
@@ -188,21 +190,20 @@ static const struct i2c_hid_quirks {
  * i2c_hid_lookup_quirk: return any quirks associated with a I2C HID device
  * @idVendor: the 16-bit vendor ID
  * @idProduct: the 16-bit product ID
+ * @table: struct i2c_hid_quirks table pointer
+ * @len: the 32-bit table length
  *
  * Returns: a u32 quirks value.
  */
-static u32 i2c_hid_lookup_quirk(const u16 idVendor, const u16 idProduct)
+static u32 i2c_hid_lookup_quirk(const u16 idVendor, const u16 idProduct,
+				const struct i2c_hid_quirks *table, u32 len)
 {
-	u32 quirks = 0;
-	int n;
+	for (; len > 0; len--, table++)
+		if (table->idVendor == idVendor && table->idProduct == idProduct)
+			if (!table->dmi_table || dmi_check_system(table->dmi_table))
+				return table->quirks;
 
-	for (n = 0; i2c_hid_quirks[n].idVendor; n++)
-		if (i2c_hid_quirks[n].idVendor == idVendor &&
-		    (i2c_hid_quirks[n].idProduct == (__u16)HID_ANY_ID ||
-		     i2c_hid_quirks[n].idProduct == idProduct))
-			quirks = i2c_hid_quirks[n].quirks;
-
-	return quirks;
+	return 0;
 }
 
 static int __i2c_hid_command(struct i2c_client *client,
@@ -1133,7 +1134,8 @@ static int i2c_hid_probe(struct i2c_client *client,
 		 client->name, hid->vendor, hid->product);
 	strlcpy(hid->phys, dev_name(&client->dev), sizeof(hid->phys));
 
-	ihid->quirks = i2c_hid_lookup_quirk(hid->vendor, hid->product);
+	ihid->quirks = i2c_hid_lookup_quirk(hid->vendor, hid->product, i2c_hid_quirks,
+					    ARRAY_SIZE(i2c_hid_quirks));
 
 	ret = hid_add_device(hid);
 	if (ret) {
-- 
2.25.1

