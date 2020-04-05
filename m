Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B2BE19ECD5
	for <lists+linux-input@lfdr.de>; Sun,  5 Apr 2020 19:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbgDERQ4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 5 Apr 2020 13:16:56 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.166]:8825 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726830AbgDERQ4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 5 Apr 2020 13:16:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586107013;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=FnmATBTslEuLEF/fk47FHsA4w8jawDa9qgdOrN6WzJc=;
        b=ZKYI7168JFLvHSKYFaJha2S75w0ttknv7Ea5Geay33q6B/aUdNWSh986MlNJ4x0wqN
        bel58BMq3v94H2Zp4XIEuVrzkabFNkc/HaPW+prEEtdg9om4mx9JGr2yiD5Y1jpNIm4T
        qkrEcljdU9+/57F9QpJaY9GChTHacQopd9mgbUF/hKDZNjcuV2xEDj76sbL+pOQ0F2db
        f6ZajLqsVbw7a0sG/2hRJ7NNMT+terXhFW1EOTuuLbUo2K6nbYFgBT1J1nuqQ9S9fnb+
        hOxQ2vCCUrNmRitgd5EebkrpI5aUSr8vv29B5mc1G+m6U7UWFgK0tvh3MfnoBnHDR6uC
        Sx+g==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB526NfqU="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
        with ESMTPSA id u043b8w35HAoxil
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 5 Apr 2020 19:10:50 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Andi Shyti <andi@etezian.org>, linux-input@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 1/2] Input: mms114 - add support for mms345l
Date:   Sun,  5 Apr 2020 19:09:03 +0200
Message-Id: <20200405170904.61512-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.26.0
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

Reviewed-by: Andi Shyti <andi@etezian.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Changes in v2:
  - Pick up review tags
  - Clarify intention

I sent more or less the same patch an half year(!) ago:
  https://patchwork.kernel.org/patch/11178515/

Back then we discussed removing the I2C_M_NOSTART quirk for all
devices in the mms114 driver, and using the chance to convert it to
use smbus/regmap functions instead of the custom i2c read/write functions.

However, this changes the behavior for all existing devices,
(eventually causing a regression if the quirk is really needed for them).
The problem with the smbus patch was that i2c_smbus_read_i2c_block_data()
is currently limited to 32 bytes (as specified in older versions of the SMBus
standard), which broke larger touchscreen packets (i.e. multi-touch).

Until today, I'm still not quite sure what needs to be changed to finally
gain support for MMS345L in mainline, despite several emails asking for
clarification. MMS345L support is seemingly stuck forever :(

I have only my device with MMS345L for testing, and everyone with one
of the other devices seems to be rather busy. IMO it would be much safer
to take this patch, which keeps behavior for all existing devices as-is.

Can we reconsider applying this patch and do the refactoring
separately later?

Thanks,
Stephan
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
2.26.0

