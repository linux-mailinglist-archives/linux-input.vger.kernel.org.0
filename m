Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DADB322F398
	for <lists+linux-input@lfdr.de>; Mon, 27 Jul 2020 17:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728673AbgG0PQn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Jul 2020 11:16:43 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:5633 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728627AbgG0PQn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Jul 2020 11:16:43 -0400
IronPort-SDR: 3Kvtji6U3Oa3AAIohhNz6ROdLjzrjO/XL5YB52J3Z2O6Gd1OawVQw2H0PAGiYZisiG78Kapjpc
 Y3wOhLSxPZgMWtopOfceSRIhSFJ0MvdEeI/uMrT6ek771p3xvLSeXopzgY0B3r9xLe+smvjQYF
 /5iG9sf6EhOqI7xq/1tDgK+tEB4y3BcwZralvNgxWtmRnsdbXOFIw71B+AFt+qQRKuMjQVSLJ3
 zBdHvt3URoUUijiHGBWOjVJba8TEgtmUcjkf2P5pSq1rDFrh1jXC2G7Jkhl2DEFDxEcW8anLe+
 W4E=
X-IronPort-AV: E=Sophos;i="5.75,402,1589270400"; 
   d="scan'208";a="51453982"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 27 Jul 2020 07:16:42 -0800
IronPort-SDR: yVLRzEpwd1oDDNQtZNV09sWEFlBgbTeO6Q33rDhXD3CjIRq2ej6U2hhnmKiO8GbEAJVU/zr4Ei
 Gkl4r1c6+DtzxOmycbpfD7ryfDvV+i9BnKvny9ITBgbJaOCJZmRLdMyCclwhkSq6iA4/zKxoYe
 Fe8hRFccfP8TQANr3Xc8RGmQvAKQlZ6aCWjLav/tSsemxGpjFMUZ6es+++f71KveKBC09V9gu3
 Ix8YNZkUvMcIxDZDyPVaNPEpZGqat3NS6WzyuOHIUtZh9okTIQnEA8h9lOOfLU357G30EbUL+L
 nnE=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <digetx@gmail.com>, <jiada_wang@mentor.com>
Subject: [PATCH v2 1/1] Input: atmel_mxt_ts - only read messages in mxt_acquire_irq() when necessary
Date:   Tue, 28 Jul 2020 00:16:37 +0900
Message-ID: <20200727151637.23810-1-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nick Dyer <nick.dyer@itdev.co.uk>

The workaround of reading all messages until an invalid is received is a
way of forcing the CHG line high, which means that when using
edge-triggered interrupts the interrupt can be acquired.

With level-triggered interrupts the workaround is unnecessary.

Also, most recent maXTouch chips have a feature called RETRIGEN which, when
enabled, reasserts the interrupt line every cycle if there are messages
waiting. This also makes the workaround unnecessary.

Note: the RETRIGEN feature is only in some firmware versions/chips, it's
not valid simply to enable the bit.

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
Acked-by: Benson Leung <bleung@chromium.org>
Acked-by: Yufeng Shen <miletus@chromium.org>
(cherry picked from ndyer/linux/for-upstream commit 1ae4e8281e491b22442cd5acdfca1862555f8ecb)
[gdavis: Fix conflicts due to v4.6-rc7 commit eb43335c4095 ("Input:
	 atmel_mxt_ts - use mxt_acquire_irq in mxt_soft_reset").]
Signed-off-by: George G. Davis <george_davis@mentor.com>
[jiada: reset use_retrigen_workaround at beginning of mxt_check_retrigen()
	call mxt_check_retrigen() after mxt_acquire_irq() in mxt_initialize()
	replace white-spaces with tab for MXT_COMMS_RETRIGEN
	Changed to check if IRQ is level type]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 56 ++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index a2189739e30f..6b71b0aff115 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -20,6 +20,7 @@
 #include <linux/i2c.h>
 #include <linux/input/mt.h>
 #include <linux/interrupt.h>
+#include <linux/irq.h>
 #include <linux/of.h>
 #include <linux/property.h>
 #include <linux/slab.h>
@@ -129,6 +130,7 @@ struct t9_range {
 /* MXT_SPT_COMMSCONFIG_T18 */
 #define MXT_COMMS_CTRL		0
 #define MXT_COMMS_CMD		1
+#define MXT_COMMS_RETRIGEN	BIT(6)
 
 /* MXT_DEBUG_DIAGNOSTIC_T37 */
 #define MXT_DIAGNOSTIC_PAGEUP	0x01
@@ -308,6 +310,7 @@ struct mxt_data {
 	struct t7_config t7_cfg;
 	struct mxt_dbg dbg;
 	struct gpio_desc *reset_gpio;
+	bool use_retrigen_workaround;
 
 	/* Cached parameters from object table */
 	u16 T5_address;
@@ -318,6 +321,7 @@ struct mxt_data {
 	u16 T71_address;
 	u8 T9_reportid_min;
 	u8 T9_reportid_max;
+	u16 T18_address;
 	u8 T19_reportid;
 	u16 T44_address;
 	u8 T100_reportid_min;
@@ -1190,9 +1194,11 @@ static int mxt_acquire_irq(struct mxt_data *data)
 
 	enable_irq(data->irq);
 
-	error = mxt_process_messages_until_invalid(data);
-	if (error)
-		return error;
+	if (data->use_retrigen_workaround) {
+		error = mxt_process_messages_until_invalid(data);
+		if (error)
+			return error;
+	}
 
 	return 0;
 }
@@ -1282,6 +1288,38 @@ static u32 mxt_calculate_crc(u8 *base, off_t start_off, off_t end_off)
 	return crc;
 }
 
+static int mxt_check_retrigen(struct mxt_data *data)
+{
+	struct i2c_client *client = data->client;
+	int error;
+	int val;
+	struct irq_data *irqd;
+
+	data->use_retrigen_workaround = false;
+
+	irqd = irq_get_irq_data(data->irq);
+	if (!irqd)
+		return -EINVAL;
+
+	if (irqd_is_level_type(irqd))
+		return 0;
+
+	if (data->T18_address) {
+		error = __mxt_read_reg(client,
+				       data->T18_address + MXT_COMMS_CTRL,
+				       1, &val);
+		if (error)
+			return error;
+
+		if (val & MXT_COMMS_RETRIGEN)
+			return 0;
+	}
+
+	dev_warn(&client->dev, "Enabling RETRIGEN workaround\n");
+	data->use_retrigen_workaround = true;
+	return 0;
+}
+
 static int mxt_prepare_cfg_mem(struct mxt_data *data, struct mxt_cfg *cfg)
 {
 	struct device *dev = &data->client->dev;
@@ -1561,6 +1599,10 @@ static int mxt_update_cfg(struct mxt_data *data, const struct firmware *fw)
 
 	mxt_update_crc(data, MXT_COMMAND_BACKUPNV, MXT_BACKUP_VALUE);
 
+	ret = mxt_check_retrigen(data);
+	if (ret)
+		goto release_mem;
+
 	ret = mxt_soft_reset(data);
 	if (ret)
 		goto release_mem;
@@ -1604,6 +1646,7 @@ static void mxt_free_object_table(struct mxt_data *data)
 	data->T71_address = 0;
 	data->T9_reportid_min = 0;
 	data->T9_reportid_max = 0;
+	data->T18_address = 0;
 	data->T19_reportid = 0;
 	data->T44_address = 0;
 	data->T100_reportid_min = 0;
@@ -1678,6 +1721,9 @@ static int mxt_parse_object_table(struct mxt_data *data,
 						object->num_report_ids - 1;
 			data->num_touchids = object->num_report_ids;
 			break;
+		case MXT_SPT_COMMSCONFIG_T18:
+			data->T18_address = object->start_address;
+			break;
 		case MXT_SPT_MESSAGECOUNT_T44:
 			data->T44_address = object->start_address;
 			break;
@@ -2141,6 +2187,10 @@ static int mxt_initialize(struct mxt_data *data)
 	if (error)
 		return error;
 
+	error = mxt_check_retrigen(data);
+	if (error)
+		return error;
+
 	error = request_firmware_nowait(THIS_MODULE, true, MXT_CFG_NAME,
 					&client->dev, GFP_KERNEL, data,
 					mxt_config_cb);
-- 
2.17.1

