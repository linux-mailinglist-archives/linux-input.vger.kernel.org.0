Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5E8CEE07
	for <lists+linux-input@lfdr.de>; Mon,  7 Oct 2019 22:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728992AbfJGUvn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Oct 2019 16:51:43 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82]:13921 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728364AbfJGUvn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Oct 2019 16:51:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1570481499;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=lG37EiMG3oRtOya1hXARzRT8U1vSJoqjfvVsN9KdkNI=;
        b=pKipmnx8irt1FCKNqt/7+ou2zXyW3q3hMg6RIoiZWxv2N5Powp6dPjN1KBVU5Hcqpp
        eDCIbIH4bfpX6Wc32eTND6bQw5pqgmhg9Zs8WrFi8HjFXg98tvZn3J+WSv5UO/46uvoA
        S6WpdOosnjay7hfudjlJHpotGeDEwCP2r79nZStoahtqu6nrKzkxY28r1dfCeFKqVwa4
        Vr/wXRDdrZPReE4nN/HOpmPOAJYuoVBhfnnDXV7OEH5VFBVz4Ej16rw9uQBt19Z6FMJF
        lZsTyPunQhc1a01laGtr4oEdJuzXIV+wNyw2uuvlDWrHlVLtPqJil/dJsc/FYRzA94Qa
        8GJQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQrEOHTIXt87vtBtcfg=="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 44.28.0 AUTH)
        with ESMTPSA id L0811cv97KpX486
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 7 Oct 2019 22:51:33 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Andi Shyti <andi@etezian.org>, Simon Shields <simon@lineageos.org>,
        linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 3/3] Input: mms114 - add support for mms345l
Date:   Mon,  7 Oct 2019 22:50:21 +0200
Message-Id: <20191007205021.104402-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007203343.101466-1-stephan@gerhold.net>
References: <20191007203343.101466-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

MMS345L is another first generation touch screen from Melfas,
which uses the same registers as MMS152.

However, using I2C_M_NOSTART for it causes errors when reading:

	i2c i2c-0: sendbytes: NAK bailout.
	mms114 0-0048: __mms114_read_reg: i2c transfer failed (-5)

The driver works fine as soon as I2C_M_NOSTART is removed.

Add a separate melfas,mms345l binding, and make use of I2C_M_NOSTART
only for MMS114 and MMS152.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Note: I was not able to find a datasheet for any of the models,
so this change is merely based on testing and comparison with
the downstream driver [1].

There was a related patch [2] that removes I2C_M_NOSTART for all models,
but it seems abandoned and I do not have any other model for testing.
Therefore, this patch implements the least instrusive solution
and only removes I2C_M_NOSTART for MMS345L.

[1]: https://github.com/msm8916-mainline/android_kernel_qcom_msm8916/blob/SM-A500FU/drivers/input/touchscreen/mms300_a.c
[2]: https://patchwork.kernel.org/patch/10189541/
---
 drivers/input/touchscreen/mms114.c | 43 +++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 12 deletions(-)

diff --git a/drivers/input/touchscreen/mms114.c b/drivers/input/touchscreen/mms114.c
index 69c6d559eeb0..d9f45755d073 100644
--- a/drivers/input/touchscreen/mms114.c
+++ b/drivers/input/touchscreen/mms114.c
@@ -54,6 +54,7 @@
 enum mms_type {
 	TYPE_MMS114	= 114,
 	TYPE_MMS152	= 152,
+	TYPE_MMS345L	= 345,
 };
 
 struct mms114_data {
@@ -91,9 +92,14 @@ static int __mms114_read_reg(struct mms114_data *data, unsigned int reg,
 	if (reg <= MMS114_MODE_CONTROL && reg + len > MMS114_MODE_CONTROL)
 		BUG();
 
-	/* Write register: use repeated start */
+	/* Write register */
 	xfer[0].addr = client->addr;
-	xfer[0].flags = I2C_M_TEN | I2C_M_NOSTART;
+	if (data->type != TYPE_MMS345L)
+		/* use repeated start */
+		xfer[0].flags = I2C_M_TEN | I2C_M_NOSTART;
+	else
+		xfer[0].flags = client->flags & I2C_M_TEN;
+
 	xfer[0].len = 1;
 	xfer[0].buf = &buf;
 
@@ -250,6 +256,15 @@ static int mms114_get_version(struct mms114_data *data)
 	int error;
 
 	switch (data->type) {
+	case TYPE_MMS345L:
+		error = __mms114_read_reg(data, MMS152_FW_REV, 3, buf);
+		if (error)
+			return error;
+
+		dev_info(dev, "TSP FW Rev: bootloader 0x%x / core 0x%x / config 0x%x\n",
+			 buf[0], buf[1], buf[2]);
+		break;
+
 	case TYPE_MMS152:
 		error = __mms114_read_reg(data, MMS152_FW_REV, 3, buf);
 		if (error)
@@ -287,8 +302,8 @@ static int mms114_setup_regs(struct mms114_data *data)
 	if (error < 0)
 		return error;
 
-	/* MMS152 has no configuration or power on registers */
-	if (data->type == TYPE_MMS152)
+	/* Only MMS114 has configuration and power on registers */
+	if (data->type != TYPE_MMS114)
 		return 0;
 
 	error = mms114_set_active(data, true);
@@ -425,11 +440,16 @@ static int mms114_probe(struct i2c_client *client,
 {
 	struct mms114_data *data;
 	struct input_dev *input_dev;
-	const void *match_data;
+	enum mms_type type;
 	int error;
 
-	if (!i2c_check_functionality(client->adapter,
-				I2C_FUNC_PROTOCOL_MANGLING)) {
+	type = (enum mms_type)device_get_match_data(&client->dev);
+	if (!type)
+		return -EINVAL;
+
+	if (type != TYPE_MMS345L &&
+	    !i2c_check_functionality(client->adapter,
+				     I2C_FUNC_PROTOCOL_MANGLING)) {
 		dev_err(&client->dev,
 			"Need i2c bus that supports protocol mangling\n");
 		return -ENODEV;
@@ -446,11 +466,7 @@ static int mms114_probe(struct i2c_client *client,
 	data->client = client;
 	data->input_dev = input_dev;
 
-	match_data = device_get_match_data(&client->dev);
-	if (!match_data)
-		return -EINVAL;
-
-	data->type = (enum mms_type)match_data;
+	data->type = type;
 
 	input_set_capability(input_dev, EV_ABS, ABS_MT_POSITION_X);
 	input_set_capability(input_dev, EV_ABS, ABS_MT_POSITION_Y);
@@ -599,6 +615,9 @@ static const struct of_device_id mms114_dt_match[] = {
 	}, {
 		.compatible = "melfas,mms152",
 		.data = (void *)TYPE_MMS152,
+	}, {
+		.compatible = "melfas,mms345l",
+		.data = (void *)TYPE_MMS345L,
 	},
 	{ }
 };
-- 
2.23.0

