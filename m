Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F88E19941D
	for <lists+linux-input@lfdr.de>; Tue, 31 Mar 2020 12:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730781AbgCaKws (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Mar 2020 06:52:48 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:43597 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730532AbgCaKwr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Mar 2020 06:52:47 -0400
IronPort-SDR: 1EsqhI/tfSYIN+Y6N/WfKm12a0CqFzljTkzmfo0zPXkEyyiASEaUXuEdMAQGV6zpKOrldzwhbn
 V4xc1KO+fb0WGem13CE/0VQkVkAZUz5gMl7x3sIFTtHa9CSvyQPcKPUD4Vkgg0k8HV2QBSI7fa
 EtTnXCxHSvIhDQYe1nCZahYqgYLTl0Eah+XjAzNplKpkhutX0rkQaY+S2/fKYBk2pRFSCGWzpg
 dZeNVR2R5AP10CVUR4IqzzdORtgvrMZ0DpRbFLMuad3N6XhQEnX2RmecqtSevuIae1GvjSX1g2
 vgk=
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="47330793"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 31 Mar 2020 02:52:46 -0800
IronPort-SDR: xej9MTSEmt/icaDIsI2NZdIC7MZM8pVA0PberYWe+3Tbkmvtq8sCFitMJNvYdwWJJLq6lG3UxC
 ph12KQKtwZY0Pvd5OLpJLmzr3hqTBSlPVFw9gRIs1p7+al5iqrsGbFvzQnGngrAK8Dqsi2syR8
 llwQnsJnYka+VnAa0TaJjUFdxg25T+sUR0ymTJvvadYUVjbcdk3JZ14zS3OHIP+PMgrU0LHGng
 RwugW4hv3DSisUXKvpjLFFLHy+/nKltWXNmolYfOtBuwSnYu6Y6FyJfyxn0qwoxzNPHBkqZ/s2
 wFM=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v10 29/55] Input: atmel_mxt_ts - rename bl_completion to chg_completion
Date:   Tue, 31 Mar 2020 03:50:25 -0700
Message-ID: <20200331105051.58896-30-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331105051.58896-1-jiada_wang@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nick Dyer <nick.dyer@itdev.co.uk>

Rename bl_completion to chg_completion

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
(cherry picked from ndyer/linux/for-upstream commit dda8453bfb44216645ede798918a314d4fca2481)
[gdavis: Resolve forward port conflicts due to applying upstream
	 commit 96a938aa214e ("Input: atmel_mxt_ts - remove platform
	 data support").]
Signed-off-by: George G. Davis <george_davis@mentor.com>
[jiada: call complete(&data->chg_completion) only when in_bootloader is TRUE
	Add commit description]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 0f1c0e5c6169..ed142b24d12d 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -382,9 +382,6 @@ struct mxt_data {
 	u8 T100_reportid_max;
 	u16 T107_address;
 
-	/* for fw update in bootloader */
-	struct completion bl_completion;
-
 	/* for reset handling */
 	struct completion reset_completion;
 
@@ -396,6 +393,9 @@ struct mxt_data {
 
 	enum mxt_suspend_mode suspend_mode;
 
+	/* for power up handling */
+	struct completion chg_completion;
+
 	/* Indicates whether device is in suspend */
 	bool suspended;
 
@@ -613,7 +613,7 @@ static int mxt_check_bootloader(struct mxt_data *data, struct mxt_flash *f)
 		 * CHG assertion before reading the status byte.
 		 * Once the status byte has been read, the line is deasserted.
 		 */
-		ret = mxt_wait_for_completion(data, &data->bl_completion,
+		ret = mxt_wait_for_completion(data, &data->chg_completion,
 					      MXT_FW_CHG_TIMEOUT);
 		if (ret) {
 			/*
@@ -1414,8 +1414,7 @@ static irqreturn_t mxt_interrupt(int irq, void *dev_id)
 	struct mxt_data *data = dev_id;
 
 	if (data->in_bootloader) {
-		/* bootloader state transition completion */
-		complete(&data->bl_completion);
+		complete(&data->chg_completion);
 		return IRQ_HANDLED;
 	}
 
@@ -2179,9 +2178,9 @@ static void mxt_regulator_enable(struct mxt_data *data)
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
@@ -3346,7 +3345,7 @@ static int mxt_enter_bootloader(struct mxt_data *data)
 		enable_irq(data->irq);
 	}
 
-	reinit_completion(&data->bl_completion);
+	reinit_completion(&data->chg_completion);
 
 	return 0;
 }
@@ -3382,7 +3381,7 @@ static int mxt_load_fw(struct device *dev)
 	}
 
 	/* Wait for flash. */
-	ret = mxt_wait_for_completion(data, &data->bl_completion,
+	ret = mxt_wait_for_completion(data, &data->chg_completion,
 				      MXT_FW_RESET_TIME);
 	if (ret)
 		goto disable_irq;
@@ -3393,7 +3392,7 @@ static int mxt_load_fw(struct device *dev)
 	 * the CHG line after bootloading has finished, so ignore potential
 	 * errors.
 	 */
-	mxt_wait_for_completion(data, &data->bl_completion, MXT_FW_RESET_TIME);
+	mxt_wait_for_completion(data, &data->chg_completion, MXT_FW_RESET_TIME);
 
 	data->in_bootloader = false;
 disable_irq:
@@ -3815,7 +3814,7 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	data->irq = client->irq;
 	i2c_set_clientdata(client, data);
 
-	init_completion(&data->bl_completion);
+	init_completion(&data->chg_completion);
 	init_completion(&data->reset_completion);
 	init_completion(&data->crc_completion);
 
-- 
2.17.1

