Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F8EF8FDE9
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:35:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726753AbfHPIfL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:35:11 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:36047 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbfHPIfK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:35:10 -0400
X-Greylist: delayed 324 seconds by postgrey-1.27 at vger.kernel.org; Fri, 16 Aug 2019 04:35:10 EDT
IronPort-SDR: VvmaJo2Be8Qvvg79/jfn1ZV6bBK1Ccgv+ZqqTRLdHqkohHtSJOi0Y3v/DukLn8J8uYxV1i1Hjx
 bEahePOZ0vQSUzopDcAsjUWg+C32IcH6dUix9phya+eVTl0Zf7O6VhOiGpdMmzBqcI4f5mRDMn
 5G13K0t1Rl0SNue/iyev3TqsIYAoF4Sz63N4sXdpw3q2lNWzsUn3FJiuT71ztNiDBCzM/yQ4YT
 JIDhrjFCDAMaLsjE5ehmsxlQ51JaiCE6lsFmnX2sbPsP/rHpSeNa28waWSvPtehQqw0Iar3KSv
 DuI=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40519096"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:34:07 -0800
IronPort-SDR: DTUG+J+hBkSqcp+63UC1QI+phYaTpWqD65skKZ9iJdIrqGYwUI+04RY/wEmoIH3PJbxXeOdUh0
 5vhu6VKYCmv7heeJ0A/tMyA4ZS+dnlMkJE6m7AL1zfACUHUXpIDKlnl18BHkR1KW+VbC8bEUUz
 NvwKuibdq72comPJzF5xObvjZWj6vWqliW1WyP30GJSOEUtzgU5qDpy7mZO8C7kZ5t9dBnEoLe
 c9tYjnXcGpL0QpRJqSsTKaLRDHWiKlfolkq0cm3s+C72jjgjkAnYiyfCEWD/EQjW/xRIDPrWNc
 eDw=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 25/63] Input: atmel_mxt_ts - rename bl_completion to chg_completion
Date:   Fri, 16 Aug 2019 17:33:37 +0900
Message-ID: <20190816083415.18819-1-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-09.mgc.mentorg.com (147.34.90.209) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nick Dyer <nick.dyer@itdev.co.uk>

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
(cherry picked from ndyer/linux/for-upstream commit dda8453bfb44216645ede798918a314d4fca2481)
[gdavis: Resolve forward port conflicts due to applying upstream
	 commit 96a938aa214e ("Input: atmel_mxt_ts - remove platform
	 data support").]
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 27 ++++++++++++------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index a7805df83af2..6f185bc5128c 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -381,9 +381,6 @@ struct mxt_data {
 	u8 T100_reportid_max;
 	u16 T107_address;
 
-	/* for fw update in bootloader */
-	struct completion bl_completion;
-
 	/* for reset handling */
 	struct completion reset_completion;
 
@@ -395,6 +392,9 @@ struct mxt_data {
 
 	enum mxt_suspend_mode suspend_mode;
 
+	/* for power up handling */
+	struct completion chg_completion;
+
 	/* Indicates whether device is in suspend */
 	bool suspended;
 
@@ -611,7 +611,7 @@ static int mxt_check_bootloader(struct mxt_data *data, struct mxt_flash *f)
 	 * CHG assertion before reading the status byte.
 	 * Once the status byte has been read, the line is deasserted.
 	 */
-	ret = mxt_wait_for_completion(data, &data->bl_completion,
+	ret = mxt_wait_for_completion(data, &data->chg_completion,
 				      MXT_FW_CHG_TIMEOUT);
 	if (ret) {
 		/*
@@ -1400,11 +1400,10 @@ static irqreturn_t mxt_interrupt(int irq, void *dev_id)
 {
 	struct mxt_data *data = dev_id;
 
-	if (data->in_bootloader) {
-		/* bootloader state transition completion */
-		complete(&data->bl_completion);
+	complete(&data->chg_completion);
+
+	if (data->in_bootloader)
 		return IRQ_HANDLED;
-	}
 
 	if (!data->object_table)
 		return IRQ_HANDLED;
@@ -2164,9 +2163,9 @@ static void mxt_regulator_enable(struct mxt_data *data)
 	msleep(MXT_CHG_DELAY);
 
 retry_wait:
-	reinit_completion(&data->bl_completion);
+	reinit_completion(&data->chg_completion);
 	data->in_bootloader = true;
-	error = mxt_wait_for_completion(data, &data->bl_completion,
+	error = mxt_wait_for_completion(data, &data->chg_completion,
 					MXT_POWERON_DELAY);
 	if (error == -EINTR)
 		goto retry_wait;
@@ -3330,7 +3329,7 @@ static int mxt_enter_bootloader(struct mxt_data *data)
 		enable_irq(data->irq);
 	}
 
-	reinit_completion(&data->bl_completion);
+	reinit_completion(&data->chg_completion);
 
 	return 0;
 }
@@ -3366,7 +3365,7 @@ static int mxt_load_fw(struct device *dev)
 	}
 
 	/* Wait for flash. */
-	ret = mxt_wait_for_completion(data, &data->bl_completion,
+	ret = mxt_wait_for_completion(data, &data->chg_completion,
 				      MXT_FW_RESET_TIME);
 	if (ret)
 		goto disable_irq;
@@ -3377,7 +3376,7 @@ static int mxt_load_fw(struct device *dev)
 	 * the CHG line after bootloading has finished, so ignore potential
 	 * errors.
 	 */
-	mxt_wait_for_completion(data, &data->bl_completion, MXT_FW_RESET_TIME);
+	mxt_wait_for_completion(data, &data->chg_completion, MXT_FW_RESET_TIME);
 
 	data->in_bootloader = false;
 disable_irq:
@@ -3771,7 +3770,7 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	data->irq = client->irq;
 	i2c_set_clientdata(client, data);
 
-	init_completion(&data->bl_completion);
+	init_completion(&data->chg_completion);
 	init_completion(&data->reset_completion);
 	init_completion(&data->crc_completion);
 
-- 
2.19.2

