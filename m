Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD1E74BF22D
	for <lists+linux-input@lfdr.de>; Tue, 22 Feb 2022 07:42:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbiBVGl3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Feb 2022 01:41:29 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:57642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbiBVGl2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Feb 2022 01:41:28 -0500
X-Greylist: delayed 3600 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 21 Feb 2022 22:41:04 PST
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 056B2111092
        for <linux-input@vger.kernel.org>; Mon, 21 Feb 2022 22:41:03 -0800 (PST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0A9C1200AAE;
        Tue, 22 Feb 2022 05:43:53 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id C77A9200AB3;
        Tue, 22 Feb 2022 05:43:52 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id BFAB0183AC94;
        Tue, 22 Feb 2022 12:43:51 +0800 (+08)
From:   haibo.chen@nxp.com
To:     dmitry.torokhov@gmail.com
Cc:     haibo.chen@nxp.com, linux-imx@nxp.com, linux-input@vger.kernel.org
Subject: [PATCH] input: mma8450: Add chip id check in probe
Date:   Tue, 22 Feb 2022 12:35:29 +0800
Message-Id: <1645504529-5667-1-git-send-email-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Haibo Chen <haibo.chen@nxp.com>

Add chip ID check in probe function. Add this to avoid the
continuously polling error log when this device is not connect
on the i2c bus.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/input/misc/mma8450.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/input/misc/mma8450.c b/drivers/input/misc/mma8450.c
index 1b5a5e19230a..c9f7e2ee7c91 100644
--- a/drivers/input/misc/mma8450.c
+++ b/drivers/input/misc/mma8450.c
@@ -38,6 +38,8 @@
 
 #define MMA8450_CTRL_REG1	0x38
 #define MMA8450_CTRL_REG2	0x39
+#define MMA8450_ID		0xc6
+#define MMA8450_WHO_AM_I	0x0f
 
 static int mma8450_read(struct i2c_client *c, unsigned int off)
 {
@@ -150,7 +152,23 @@ static int mma8450_probe(struct i2c_client *c,
 			 const struct i2c_device_id *id)
 {
 	struct input_dev *input;
-	int err;
+	int err, client_id;
+	struct i2c_adapter *adapter = NULL;
+
+	adapter = to_i2c_adapter(c->dev.parent);
+	err = i2c_check_functionality(adapter,
+					I2C_FUNC_SMBUS_BYTE |
+					I2C_FUNC_SMBUS_BYTE_DATA);
+	if (!err)
+		return err;
+
+	client_id = i2c_smbus_read_byte_data(c, MMA8450_WHO_AM_I);
+	if (MMA8450_ID != client_id) {
+		dev_err(&c->dev,
+			"read chip ID 0x%x is not equal to 0x%x!\n", client_id,
+			MMA8450_ID);
+		return -EINVAL;
+	}
 
 	input = devm_input_allocate_device(&c->dev);
 	if (!input)
-- 
2.25.1

