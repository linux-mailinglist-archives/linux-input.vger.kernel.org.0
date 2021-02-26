Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E23E325E70
	for <lists+linux-input@lfdr.de>; Fri, 26 Feb 2021 08:50:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbhBZHsi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Feb 2021 02:48:38 -0500
Received: from emcscan.emc.com.tw ([192.72.220.5]:30486 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbhBZHsi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Feb 2021 02:48:38 -0500
X-Greylist: delayed 708 seconds by postgrey-1.27 at vger.kernel.org; Fri, 26 Feb 2021 02:48:37 EST
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="39567952"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 26 Feb 2021 15:35:42 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(2833:0:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Fri, 26 Feb 2021 15:35:39 +0800 (CST)
Received: from 49.216.207.71
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(2477:1:AUTH_LOGIN)
        (envelope-from <jingle.wu@emc.com.tw>); Fri, 26 Feb 2021 15:35:39 +0800 (CST)
From:   "jingle.wu" <jingle.wu@emc.com.tw>
To:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        dmitry.torokhov@gmail.com
Cc:     phoenix@emc.com.tw, dave.wang@emc.com.tw, josh.chen@emc.com.tw,
        "jingle.wu" <jingle.wu@emc.com.tw>
Subject: [PATCH] Input: elan_i2c - Reduce the resume time for new devices
Date:   Fri, 26 Feb 2021 15:35:37 +0800
Message-Id: <20210226073537.4926-1-jingle.wu@emc.com.tw>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Remove elan_initilize() function at resume state,
for Voxel, Delbin, Magple, Bobba and new devices.

Signed-off-by: Jingle Wu <jingle.wu@emc.com.tw>
---
 drivers/input/mouse/elan_i2c.h      |  5 +++
 drivers/input/mouse/elan_i2c_core.c | 57 +++++++++++++++++++++++++++--
 2 files changed, 58 insertions(+), 4 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c.h b/drivers/input/mouse/elan_i2c.h
index d5f9cd76eefb..16b795524179 100644
--- a/drivers/input/mouse/elan_i2c.h
+++ b/drivers/input/mouse/elan_i2c.h
@@ -45,6 +45,11 @@
 #define ETP_FW_PAGE_SIZE_512	512
 #define ETP_FW_SIGNATURE_SIZE	6
 
+#define ETP_PRODUCT_ID_DELBIN	0x00C2
+#define ETP_PRODUCT_ID_VOXEL	0x00BF
+#define ETP_PRODUCT_ID_MAGPIE   0x0120
+#define ETP_PRODUCT_ID_BOBBA    0x0121
+
 struct i2c_client;
 struct completion;
 
diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index 0f46e2f6c9e8..e75bbaeaf068 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -55,6 +55,9 @@
 #define ETP_MK_DATA_OFFSET	33	/* For high precision reports */
 #define ETP_MAX_REPORT_LEN	39
 
+/* quirks to control the device */
+#define ETP_QUIRK_SET_QUICK_WAKEUP_DEV	BIT(0)
+
 /* The main device structure */
 struct elan_tp_data {
 	struct i2c_client	*client;
@@ -99,8 +102,50 @@ struct elan_tp_data {
 	bool			baseline_ready;
 	u8			clickpad;
 	bool			middle_button;
+
+	unsigned long		quirks;		/* Various quirks */
+};
+
+
+static const struct elan_i2c_quirks {
+	__u16 ic_type;
+	__u16 product_id;
+	__u32 quirks;
+} elan_i2c_quirks[] = {
+	{ 0x0D, ETP_PRODUCT_ID_DELBIN,
+		ETP_QUIRK_SET_QUICK_WAKEUP_DEV },
+	{ 0x10, ETP_PRODUCT_ID_VOXEL,
+		ETP_QUIRK_SET_QUICK_WAKEUP_DEV },
+	{ 0x14, ETP_PRODUCT_ID_MAGPIE,
+		ETP_QUIRK_SET_QUICK_WAKEUP_DEV },
+	{ 0x14, ETP_PRODUCT_ID_BOBBA,
+		ETP_QUIRK_SET_QUICK_WAKEUP_DEV },
+	{ 0, 0 }
 };
 
+/*
+ * elan_i2c_lookup_quirk: return any quirks associated with a elan i2c device
+ * @ic_type: the 16-bit ic type
+ * @product_id: the 16-bit product ID
+ *
+ * Returns: a u32 quirks value.
+ */
+static u32 elan_i2c_lookup_quirk(const u16 ic_type, const u16 product_id)
+{
+	u32 quirks = 0;
+	int n;
+
+	for (n = 0; elan_i2c_quirks[n].ic_type; n++)
+		if (elan_i2c_quirks[n].ic_type == ic_type &&
+		    (elan_i2c_quirks[n].product_id == product_id))
+			quirks = elan_i2c_quirks[n].quirks;
+
+	if ((ic_type >= 0x0D) && (product_id >= 0x123))
+		quirks |= ETP_QUIRK_SET_QUICK_WAKEUP_DEV;
+
+	return quirks;
+}
+
 static int elan_get_fwinfo(u16 ic_type, u8 iap_version, u16 *validpage_count,
 			   u32 *signature_address, u16 *page_size)
 {
@@ -273,10 +318,12 @@ static int __elan_initialize(struct elan_tp_data *data)
 	bool woken_up = false;
 	int error;
 
-	error = data->ops->initialize(client);
-	if (error) {
-		dev_err(&client->dev, "device initialize failed: %d\n", error);
-		return error;
+	if (!(data->quirks & ETP_QUIRK_SET_QUICK_WAKEUP_DEV)) {
+		error = data->ops->initialize(client);
+		if (error) {
+			dev_err(&client->dev, "device initialize failed: %d\n", error);
+			return error;
+		}
 	}
 
 	error = elan_query_product(data);
@@ -366,6 +413,8 @@ static int elan_query_device_info(struct elan_tp_data *data)
 	if (error)
 		return error;
 
+	data->quirks = elan_i2c_lookup_quirk(data->ic_type, data->product_id);
+
 	error = elan_get_fwinfo(data->ic_type, data->iap_version,
 				&data->fw_validpage_count,
 				&data->fw_signature_address,
-- 
2.17.1

