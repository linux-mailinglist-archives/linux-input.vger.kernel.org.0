Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EDD31CA33F
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 07:59:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728095AbgEHF7A (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 01:59:00 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:45906 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728093AbgEHF67 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 May 2020 01:58:59 -0400
IronPort-SDR: lABfUEMR4TV7l0NKrzIn20Oxz3YEIiuANMpW248NExKkzkOxGOMFnUCYPwZ8fqpj/TvKp9Nd7q
 4yJlIQ9x7nXRrZu9auCTVgK8qGKCt8CkXq8DvyvJtXg/cFT5NXjxMXgto0IauZS7rY9KcFPJ0l
 uFIv6PtoXe6DQdGgdz3mFJgCRfpBtNvwTs+TQ8vC+CfVJCMgSrP+WjSVDdaLlSJJExJ6eynF29
 BSZSeiaHlDf5lJYlsnYPM3jcXOQHK5AVqZ88ABSKaTYZ14uUuBjN1cBt41b7PcM4l2S9MAEstL
 0Xc=
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="48710634"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 07 May 2020 21:58:58 -0800
IronPort-SDR: x1GkO14UZkQ0XJlLfiIbtztHs9EeHS+2nOwpqLSKR4UTqu5zJCfYSqGbXc67mDMrmdJmGnzUd4
 ZOGZGMMD8TeQrfPMIsAGYckis/nrCav5caN91Sn157lPAqQMRnGFY9Okn7C16AhbFHJTaX3Th8
 uxlnooT9uX8eVnbdROmXkXGi1MkzaIoOB1jy/tf9U2E1+3b4J2YzIWXr+DcjEIdvzXJU4Q9moV
 hy2ZcsW6sdFMxB70bGwu1e00kEr2A/VkzBO41L0sm2/8JEcP1VdZKwHlaxj0f/NPorvT4f0S/W
 r0U=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v11 31/56] Input: atmel_mxt_ts - rename bl_completion to chg_completion
Date:   Thu, 7 May 2020 22:56:31 -0700
Message-ID: <20200508055656.96389-32-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508055656.96389-1-jiada_wang@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
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
index 4d2240971387..0d77ae455fde 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -383,9 +383,6 @@ struct mxt_data {
 	u8 T100_reportid_max;
 	u16 T107_address;
 
-	/* for fw update in bootloader */
-	struct completion bl_completion;
-
 	/* for reset handling */
 	struct completion reset_completion;
 
@@ -397,6 +394,9 @@ struct mxt_data {
 
 	enum mxt_suspend_mode suspend_mode;
 
+	/* for power up handling */
+	struct completion chg_completion;
+
 	/* Indicates whether device is in suspend */
 	bool suspended;
 
@@ -614,7 +614,7 @@ static int mxt_check_bootloader(struct mxt_data *data, struct mxt_flash *f)
 		 * CHG assertion before reading the status byte.
 		 * Once the status byte has been read, the line is deasserted.
 		 */
-		ret = mxt_wait_for_completion(data, &data->bl_completion,
+		ret = mxt_wait_for_completion(data, &data->chg_completion,
 					      MXT_FW_CHG_TIMEOUT);
 		if (ret) {
 			/*
@@ -1415,8 +1415,7 @@ static irqreturn_t mxt_interrupt(int irq, void *dev_id)
 	struct mxt_data *data = dev_id;
 
 	if (data->in_bootloader) {
-		/* bootloader state transition completion */
-		complete(&data->bl_completion);
+		complete(&data->chg_completion);
 		return IRQ_HANDLED;
 	}
 
@@ -2180,9 +2179,9 @@ static void mxt_regulator_enable(struct mxt_data *data)
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
@@ -3342,7 +3341,7 @@ static int mxt_enter_bootloader(struct mxt_data *data)
 		enable_irq(data->irq);
 	}
 
-	reinit_completion(&data->bl_completion);
+	reinit_completion(&data->chg_completion);
 
 	return 0;
 }
@@ -3378,7 +3377,7 @@ static int mxt_load_fw(struct device *dev)
 	}
 
 	/* Wait for flash. */
-	ret = mxt_wait_for_completion(data, &data->bl_completion,
+	ret = mxt_wait_for_completion(data, &data->chg_completion,
 				      MXT_FW_RESET_TIME);
 	if (ret)
 		goto disable_irq;
@@ -3389,7 +3388,7 @@ static int mxt_load_fw(struct device *dev)
 	 * the CHG line after bootloading has finished, so ignore potential
 	 * errors.
 	 */
-	mxt_wait_for_completion(data, &data->bl_completion, MXT_FW_RESET_TIME);
+	mxt_wait_for_completion(data, &data->chg_completion, MXT_FW_RESET_TIME);
 
 	data->in_bootloader = false;
 disable_irq:
@@ -3811,7 +3810,7 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	data->irq = client->irq;
 	i2c_set_clientdata(client, data);
 
-	init_completion(&data->bl_completion);
+	init_completion(&data->chg_completion);
 	init_completion(&data->reset_completion);
 	init_completion(&data->crc_completion);
 
-- 
2.17.1

