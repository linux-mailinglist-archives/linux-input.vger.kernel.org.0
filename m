Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4AD88FDF9
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726842AbfHPIhB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:37:01 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:36109 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbfHPIhB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:37:01 -0400
IronPort-SDR: ReNLheUIcuh8SSEsLyGPy1pfzmFqfpLXYqPXO/PuqnFMbgytdO5+eBXGehayrkcwXtr9T7VLEm
 cCwAqk9Qo7nOS6AhPaFVwuy9eXvrqy45eWtqFZZiM5xHsBe3Js0D10vhyZKQBaUVvxD/yPDr8E
 dJ8MUSW+QNpYkdtT5uDVk/79gQgPJFO8iM9dVWHPSMXVBaK6teTYgzsGegeeSSbFR63ZqsuVb/
 49uiT7RywV98a8kGEWrsiDrk+1cVjlFoc6bsZGmTWNcrZUoY0uNwRWDp/XWmhVOgDkLb+zVDLE
 hdE=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40518977"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:29:55 -0800
IronPort-SDR: R3E1uA730EC2UL2bG2Sf/EHt7+o/g4MY7yiqeYt96rQsrEqwtRyO15E1YNuIegO3S2/wo9HQbl
 NqOEj6ho9k/8El5Uussojyu2atFdGpo3KtCj5mtEXPQ1RaKI6C75fbJdMfSgZKq+bUJoOcZBS4
 Xi9/uPkqqdA/zg2oLpvft6TaUPX63LiezTxuGWPU49s/MSOanelkuZaZ0qFgkqWZQjRLz2620a
 2bUlaIAgYhRiPF1TvaB5pgGZSXT0MWxUnY88+jJmHCVgPS/edFlXMXGug0gcTUR3hDCcV4+P7i
 nXA=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 03/63] Input: atmel_mxt_ts - only read messages in mxt_acquire_irq() when necessary
Date:   Fri, 16 Aug 2019 17:28:52 +0900
Message-ID: <20190816082952.17985-4-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190816082952.17985-1-jiada_wang@mentor.com>
References: <20190816082952.17985-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
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
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 49 ++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 79e35c929857..9b165d23e092 100644
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
+#define MXT_COMMS_RETRIGEN      BIT(6)
 
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
@@ -1282,6 +1288,31 @@ static u32 mxt_calculate_crc(u8 *base, off_t start_off, off_t end_off)
 	return crc;
 }
 
+static int mxt_check_retrigen(struct mxt_data *data)
+{
+	struct i2c_client *client = data->client;
+	int error;
+	int val;
+
+	if (irq_get_trigger_type(data->irq) & IRQF_TRIGGER_LOW)
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
@@ -1561,6 +1592,10 @@ static int mxt_update_cfg(struct mxt_data *data, const struct firmware *fw)
 
 	mxt_update_crc(data, MXT_COMMAND_BACKUPNV, MXT_BACKUP_VALUE);
 
+	ret = mxt_check_retrigen(data);
+	if (ret)
+		goto release_mem;
+
 	ret = mxt_soft_reset(data);
 	if (ret)
 		goto release_mem;
@@ -1604,6 +1639,7 @@ static void mxt_free_object_table(struct mxt_data *data)
 	data->T71_address = 0;
 	data->T9_reportid_min = 0;
 	data->T9_reportid_max = 0;
+	data->T18_address = 0;
 	data->T19_reportid = 0;
 	data->T44_address = 0;
 	data->T100_reportid_min = 0;
@@ -1678,6 +1714,9 @@ static int mxt_parse_object_table(struct mxt_data *data,
 						object->num_report_ids - 1;
 			data->num_touchids = object->num_report_ids;
 			break;
+		case MXT_SPT_COMMSCONFIG_T18:
+			data->T18_address = object->start_address;
+			break;
 		case MXT_SPT_MESSAGECOUNT_T44:
 			data->T44_address = object->start_address;
 			break;
@@ -2140,6 +2179,10 @@ static int mxt_initialize(struct mxt_data *data)
 		msleep(MXT_FW_RESET_TIME);
 	}
 
+	error = mxt_check_retrigen(data);
+	if (error)
+		return error;
+
 	error = mxt_acquire_irq(data);
 	if (error)
 		return error;
-- 
2.19.2

