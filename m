Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5499026FDC0
	for <lists+linux-input@lfdr.de>; Fri, 18 Sep 2020 15:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbgIRNDR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Sep 2020 09:03:17 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:28732 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726301AbgIRNDQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Sep 2020 09:03:16 -0400
X-Greylist: delayed 426 seconds by postgrey-1.27 at vger.kernel.org; Fri, 18 Sep 2020 09:03:16 EDT
IronPort-SDR: negiCScoTLiygwmGe8YvPwscLQYfwlGHZD8bVTlMg0eBY7tnZQK4cjmWIpMw5FqqvRWpngiKvy
 3D9icV6fWyRT4jWV294YO4el00M4P3mnqu09ipXKa0+WMBluJx7CNqWSCWjlqPDczc1JOx15/5
 yurtGXFJ1f8JrcMqRtrE3zdYdQKQKSz75zx+urdPCOiL3KMmaiXaWZg2vGjaxKuSwanZDyj73N
 pYKWt/RrNNuPVgTgJOEv1cci+pwrVcr72e69Du5G2a9YL4A+J3N4Rb9jb2otDyBIVbDUmQ/nmA
 EZQ=
X-IronPort-AV: E=Sophos;i="5.77,274,1596528000"; 
   d="scan'208";a="55257214"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 18 Sep 2020 04:56:09 -0800
IronPort-SDR: WAmsPWYGkou2dnfBRj5YXqIx4i3wjlaQhi3joKPWhLGbk/vAfnqpptsUzj8Wyj0y4apMGpOwGW
 zCdD1tgOJCGDqZjehEylW8+FfVsEP9U2WPGYG0jrQFWDkDQ1n6eBfFU3j9XZbSDGBJqA8eMiJe
 xhuEDF4hP1xqlfW90g0H3gSlWuBdFGcJloofFsKXjGwWn64j1hQi5XfQZpgIfPdKpoJi31MWKc
 qUGVVYur+PoyN0HF9gg+Nk/A+ymOJqE+29QbVTkvEndnIGgPHdttu404ykPSlAHp6S2RqrRR3Q
 p+8=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <robh+dt@kernel.org>, <digetx@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <andy.shevchenko@gmail.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>, <jiada_wang@mentor.com>
Subject: [PATCH v2 2/2] Input: atmel_mxt_ts - wake mXT1386 from deep-sleep mode
Date:   Fri, 18 Sep 2020 21:56:01 +0900
Message-ID: <20200918125601.8210-2-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200918125601.8210-1-jiada_wang@mentor.com>
References: <20200918125601.8210-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

According to datasheet, mXT1386 chip has a WAKE line, it is used
to wake the chip up from deep sleep mode before communicating with
it via the I2C-compatible interface.

if the WAKE line is connected to a GPIO line, the line must be
asserted 25 ms before the host attempts to communicate with the mXT1386.
If the WAKE line is connected to the SCL pin, the mXT1386 will send a
NACK on the first attempt to address it, the host must then retry 25 ms
later.

This patch introduces mxt_wake() which does a dummy i2c read, follows
with a 25 ms sleep for mXT1386 chip. mxt_wake() is added to
mxt_initialize(), mxt_load_fw() and mxt_start() to ensure before any
actual i2c transfer, mxt_wake() can be executed.

Added new compatible string "atmel,mXT1386".

Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
Suggested-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index a2189739e30f..d580050a237f 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -196,6 +196,7 @@ enum t100_type {
 #define MXT_CRC_TIMEOUT		1000	/* msec */
 #define MXT_FW_RESET_TIME	3000	/* msec */
 #define MXT_FW_CHG_TIMEOUT	300	/* msec */
+#define MXT_WAKEUP_TIME     25  /* msec */
 
 /* Command to unlock bootloader */
 #define MXT_UNLOCK_CMD_MSB	0xaa
@@ -2099,12 +2100,33 @@ static void mxt_config_cb(const struct firmware *cfg, void *ctx)
 	release_firmware(cfg);
 }
 
+static void mxt_wake(struct mxt_data *data)
+{
+	struct i2c_client *client = data->client;
+	struct device *dev = &data->client->dev;
+	struct device_node *np = dev->of_node;
+	union i2c_smbus_data dummy;
+
+	if (!of_device_is_compatible(np, "atmel,mXT1386"))
+		return;
+
+	/* TODO: add WAKE-GPIO support */
+
+	i2c_smbus_xfer(client->adapter, client->addr,
+		       0, I2C_SMBUS_READ, 0, I2C_SMBUS_BYTE,
+		       &dummy);
+
+	msleep(MXT_WAKEUP_TIME);
+}
+
 static int mxt_initialize(struct mxt_data *data)
 {
 	struct i2c_client *client = data->client;
 	int recovery_attempts = 0;
 	int error;
 
+	mxt_wake(data);
+
 	while (1) {
 		error = mxt_read_info_block(data);
 		if (!error)
@@ -2787,6 +2809,8 @@ static int mxt_load_fw(struct device *dev, const char *fn)
 	if (ret)
 		goto release_firmware;
 
+	mxt_wake(data);
+
 	if (!data->in_bootloader) {
 		/* Change to the bootloader mode */
 		data->in_bootloader = true;
@@ -2928,6 +2952,7 @@ static const struct attribute_group mxt_attr_group = {
 
 static void mxt_start(struct mxt_data *data)
 {
+	mxt_wake(data);
 	switch (data->suspend_mode) {
 	case MXT_SUSPEND_T9_CTRL:
 		mxt_soft_reset(data);
@@ -3185,6 +3210,7 @@ static SIMPLE_DEV_PM_OPS(mxt_pm_ops, mxt_suspend, mxt_resume);
 
 static const struct of_device_id mxt_of_match[] = {
 	{ .compatible = "atmel,maxtouch", },
+	{ .compatible = "atmel,mXT1386", },
 	/* Compatibles listed below are deprecated */
 	{ .compatible = "atmel,qt602240_ts", },
 	{ .compatible = "atmel,atmel_mxt_ts", },
@@ -3209,6 +3235,7 @@ static const struct i2c_device_id mxt_id[] = {
 	{ "atmel_mxt_tp", 0 },
 	{ "maxtouch", 0 },
 	{ "mXT224", 0 },
+	{ "mXT1386", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mxt_id);
-- 
2.17.1

