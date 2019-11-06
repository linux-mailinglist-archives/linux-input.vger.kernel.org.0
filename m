Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F568F0F95
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2019 08:04:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731562AbfKFHDX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Nov 2019 02:03:23 -0500
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:8729 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731206AbfKFHDW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Nov 2019 02:03:22 -0500
IronPort-SDR: PLGj78tGP7hE75Esx6M7zh+AphLhnwK0xEyS028y+6+rd8mZ+MzNFxrN/P6ZmnXO8oi5LxGijO
 0J5lw7/KWem88j3ufGRprpxTDVwzvv/iso8uj8JNcGe3PyrS6VGxQ/Fz8xSyJRHb2muIpcyYfy
 FSwTN7pe/oCMFski6AfzyT6xZOVy/hXpIYAVOURPrcmoJPkkiHSzJC54FlhRS+trGSEdi2PPkT
 rFbCNEA6voMIxkYNVZgElgSjmFJ5+XClp8rGaIvEDkt/uuWJxeI9MBc5ZMj8MGbAyMr5cph0Zk
 3ZI=
X-IronPort-AV: E=Sophos;i="5.68,272,1569312000"; 
   d="scan'208";a="42908619"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 05 Nov 2019 23:03:21 -0800
IronPort-SDR: ZywX9rAjkbWw9PktunhBtbMcKqSLvviP8rynsZwAZRoSqTqAbnm8581ii2eJjDlwUe3x3IsT6S
 uwx8beT/npD6STsVs9QW35xYCVElnC5vt8g9c33BTfr6bqdXf1BpgbZq9/FnKSCJMKt0epLM2F
 +vGzfhFdDCZS9WJTHU+cCd6wCbbI8Zw9iB9Z7z37ymulz7IoCp2hcbZezuRQComF7rUju+p6Fj
 obJJkNHlonmUzMIe6wsE9zD5B+0HJrDBRq2S5F6XaexvRVuEZOttGn9d86SIEYTmCm3eREEhqI
 NnQ=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
Subject: [PATCH v5 23/48] Input: atmel_mxt_ts - rename bl_completion to chg_completion
Date:   Wed, 6 Nov 2019 16:01:21 +0900
Message-ID: <20191106070146.18759-24-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191106070146.18759-1-jiada_wang@mentor.com>
References: <20191106070146.18759-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
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
[jiada: call complete(&data->chg_completion) only when in_bootloader is TRUE]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 1c5230f7a9af..520dc9670b38 100644
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
@@ -1402,8 +1402,7 @@ static irqreturn_t mxt_interrupt(int irq, void *dev_id)
 	struct mxt_data *data = dev_id;
 
 	if (data->in_bootloader) {
-		/* bootloader state transition completion */
-		complete(&data->bl_completion);
+		complete(&data->chg_completion);
 		return IRQ_HANDLED;
 	}
 
@@ -2167,9 +2166,9 @@ static void mxt_regulator_enable(struct mxt_data *data)
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
@@ -3334,7 +3333,7 @@ static int mxt_enter_bootloader(struct mxt_data *data)
 		enable_irq(data->irq);
 	}
 
-	reinit_completion(&data->bl_completion);
+	reinit_completion(&data->chg_completion);
 
 	return 0;
 }
@@ -3370,7 +3369,7 @@ static int mxt_load_fw(struct device *dev)
 	}
 
 	/* Wait for flash. */
-	ret = mxt_wait_for_completion(data, &data->bl_completion,
+	ret = mxt_wait_for_completion(data, &data->chg_completion,
 				      MXT_FW_RESET_TIME);
 	if (ret)
 		goto disable_irq;
@@ -3381,7 +3380,7 @@ static int mxt_load_fw(struct device *dev)
 	 * the CHG line after bootloading has finished, so ignore potential
 	 * errors.
 	 */
-	mxt_wait_for_completion(data, &data->bl_completion, MXT_FW_RESET_TIME);
+	mxt_wait_for_completion(data, &data->chg_completion, MXT_FW_RESET_TIME);
 
 	data->in_bootloader = false;
 disable_irq:
@@ -3802,7 +3801,7 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	data->irq = client->irq;
 	i2c_set_clientdata(client, data);
 
-	init_completion(&data->bl_completion);
+	init_completion(&data->chg_completion);
 	init_completion(&data->reset_completion);
 	init_completion(&data->crc_completion);
 
-- 
2.17.1

