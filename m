Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 143C4BB9E8
	for <lists+linux-input@lfdr.de>; Mon, 23 Sep 2019 18:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438376AbfIWQuW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Sep 2019 12:50:22 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42396 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389516AbfIWQuW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Sep 2019 12:50:22 -0400
Received: by mail-pl1-f194.google.com with SMTP id e5so6739293pls.9
        for <linux-input@vger.kernel.org>; Mon, 23 Sep 2019 09:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8lkjVOpBBtIvnfc8AqZi/EJdsVEqhXIY7s5zuRbnasU=;
        b=PzOKP8qAP9DGrZdJV556JQ6gQrZjskm445fYPVhwBmnFQu/XjhTMoBDvFOS1L9iCUa
         t1+x2fQMIJztXSsdUuiq2MDlf+2xnNomLibHr/2PXyfAnCCwqrapcp3xWCazmAZJZdXF
         zPTw/RhAu16RsLadMNoDbDIoXn7E5GHz/sQ6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8lkjVOpBBtIvnfc8AqZi/EJdsVEqhXIY7s5zuRbnasU=;
        b=NUNeDZnHNGLRXrizZSw9wdMFtCaD0bq19QAP+qJDrHSYoHuUWfFcqA5ElpuEdcT71c
         cQ0SZ2aGf+W6kiqzeUH1on04T+E59wlvtUFHGOlUKDWXoITSNlgOaa6OOE3lMS8aykX4
         fHwpaaH2RlYEEmft0y/XX0VQ9YAcSb5f//sTcP5U+sRuOsHXexzC3VWrjXJwAgr11Zec
         bT9n9yGuI1lkQ4fR44QVBHSobBbMZQqC7uwXSvnmuKPayVu2GQIjVDyquAhLTiO3bDhL
         Bfo1LOInBYCtua6iVe2QmLTh6S1fJJ8UfKeqyYgFZXaf+KOg6Tcml3VG1BDtdHLfCxYf
         JbUQ==
X-Gm-Message-State: APjAAAVJDTXMpDtqG/X8prW7cA17T+PFjGIgTiAEoAw41mhh6lNbF6fv
        O28OW9XOSZDf3tfFRSpl0No5vg==
X-Google-Smtp-Source: APXvYqySjXIKtbcZJEIN5DNhGeFoBXP/BrxsEcZ0djdUYK58L9YeTQB1kFHMIfMeneWRMGc0uvDOfw==
X-Received: by 2002:a17:902:6bc7:: with SMTP id m7mr746474plt.60.1569257420183;
        Mon, 23 Sep 2019 09:50:20 -0700 (PDT)
Received: from evgreen2.mtv.corp.google.com ([2620:15c:202:201:ffda:7716:9afc:1301])
        by smtp.gmail.com with ESMTPSA id o195sm16534690pfg.21.2019.09.23.09.50.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 23 Sep 2019 09:50:19 -0700 (PDT)
From:   Evan Green <evgreen@chromium.org>
To:     Nick Dyer <nick@shmanahar.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jongpil Jung <jongpil19.jung@samsung.com>,
        Furquan Shaikh <furquan@chromium.org>,
        Rajat Jain <rajatja@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH] Input: atmel_mxt_ts - Disable IRQ across suspend
Date:   Mon, 23 Sep 2019 09:50:04 -0700
Message-Id: <20190923165004.161846-1-evgreen@chromium.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Across suspend and resume, we are seeing error messages like the following:

atmel_mxt_ts i2c-PRP0001:00: __mxt_read_reg: i2c transfer failed (-121)
atmel_mxt_ts i2c-PRP0001:00: Failed to read T44 and T5 (-121)

This occurs because the driver leaves its IRQ enabled. Upon resume, there
is an IRQ pending, but the interrupt is serviced before both the driver and
the underlying I2C bus have been resumed. This causes EREMOTEIO errors.

Disable the IRQ in suspend, and re-enable it if it was previously enabled
in resume.

Signed-off-by: Evan Green <evgreen@chromium.org>
---

 drivers/input/touchscreen/atmel_mxt_ts.c | 33 +++++++++++++++++++-----
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 24c4b691b1c9..19cbcd9767e2 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -291,6 +291,7 @@ struct mxt_data {
 	u8 xsize;
 	u8 ysize;
 	bool in_bootloader;
+	bool irq_enabled;
 	u16 mem_size;
 	u8 t100_aux_ampl;
 	u8 t100_aux_area;
@@ -1185,11 +1186,23 @@ static int mxt_t6_command(struct mxt_data *data, u16 cmd_offset,
 	return 0;
 }
 
+static void mxt_enable_irq(struct mxt_data *data)
+{
+	enable_irq(data->irq);
+	data->irq_enabled = true;
+}
+
+static void mxt_disable_irq(struct mxt_data *data)
+{
+	disable_irq(data->irq);
+	data->irq_enabled = false;
+}
+
 static int mxt_acquire_irq(struct mxt_data *data)
 {
 	int error;
 
-	enable_irq(data->irq);
+	mxt_enable_irq(data);
 
 	error = mxt_process_messages_until_invalid(data);
 	if (error)
@@ -1205,7 +1218,7 @@ static int mxt_soft_reset(struct mxt_data *data)
 
 	dev_info(dev, "Resetting device\n");
 
-	disable_irq(data->irq);
+	mxt_disable_irq(data);
 
 	reinit_completion(&data->reset_completion);
 
@@ -2807,7 +2820,7 @@ static int mxt_load_fw(struct device *dev, const char *fn)
 		mxt_free_input_device(data);
 		mxt_free_object_table(data);
 	} else {
-		enable_irq(data->irq);
+		mxt_enable_irq(data);
 	}
 
 	reinit_completion(&data->bl_completion);
@@ -2882,7 +2895,7 @@ static int mxt_load_fw(struct device *dev, const char *fn)
 	data->in_bootloader = false;
 
 disable_irq:
-	disable_irq(data->irq);
+	mxt_disable_irq(data);
 release_firmware:
 	release_firmware(fw);
 	return ret;
@@ -3101,7 +3114,7 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		return error;
 	}
 
-	disable_irq(client->irq);
+	mxt_disable_irq(data);
 
 	if (data->reset_gpio) {
 		msleep(MXT_RESET_GPIO_TIME);
@@ -3132,7 +3145,7 @@ static int mxt_remove(struct i2c_client *client)
 {
 	struct mxt_data *data = i2c_get_clientdata(client);
 
-	disable_irq(data->irq);
+	mxt_disable_irq(data);
 	sysfs_remove_group(&client->dev.kobj, &mxt_attr_group);
 	mxt_free_input_device(data);
 	mxt_free_object_table(data);
@@ -3156,6 +3169,11 @@ static int __maybe_unused mxt_suspend(struct device *dev)
 
 	mutex_unlock(&input_dev->mutex);
 
+	/*
+	 * Disable the IRQ directly since the boolean will be used to restore
+	 * the IRQ state on resume.
+	 */
+	disable_irq(data->irq);
 	return 0;
 }
 
@@ -3168,6 +3186,9 @@ static int __maybe_unused mxt_resume(struct device *dev)
 	if (!input_dev)
 		return 0;
 
+	if (data->irq_enabled)
+		enable_irq(data->irq);
+
 	mutex_lock(&input_dev->mutex);
 
 	if (input_dev->users)
-- 
2.21.0

