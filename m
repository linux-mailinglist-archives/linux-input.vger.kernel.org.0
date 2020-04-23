Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54E8B1B5244
	for <lists+linux-input@lfdr.de>; Thu, 23 Apr 2020 04:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbgDWCFe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Apr 2020 22:05:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726398AbgDWCFe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Apr 2020 22:05:34 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 238E0C03C1AA
        for <linux-input@vger.kernel.org>; Wed, 22 Apr 2020 19:05:34 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id n24so1703965plp.13
        for <linux-input@vger.kernel.org>; Wed, 22 Apr 2020 19:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=m/d5mtjTLvvREnKZiH82KQMblueomkVgjmp8lvYya6c=;
        b=kijpLkU12cNN0L0c0yL5SbRbhOnD+thbSk2XnclV6hPqSAzuAbV/Q4lFMSvUPF+HoN
         y2Zb1qjdnV0aS2iprB/U3OezsUtb7aLFOEdSXWcdG8m4Qlfbq3dfDZ/lwha3vUPa5K6/
         X6xmgbL3mdgQgf25nANg3/k0irYs6bz9xal9Jftp1/nEZge0Oap+v53/C6V3O1gAwCOi
         I0KQbdn+5y0ZLpTpjcGVFLGFhyJtKPGSkI38ixUMbpcui6QKe2FacR8XUnH1sZ3Vva2T
         UWB/GBPC8ZHrxz+KQaeVr4MZXlwrD34nhtcyNVQkSCOffX6FQRG47RRpHGz9avPNEvki
         OMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m/d5mtjTLvvREnKZiH82KQMblueomkVgjmp8lvYya6c=;
        b=XGeBdn+ao2KGLPTK6/RHeX85uNXK1+5jtw3237Bjkwba82XFH5DuMCaanjI8pHbOAA
         mbTCPKohODisAcw586a/8ijF8uXLYXNQ3OcJceYQqcWPkJv8h9hE3uGACv2+uDXTCqD+
         ewT8lRO7txPDyIvXqbAA9FEyMkEnZzNM2AteXaqALHb0b+PaWtvaTWar9DugynjBVH+W
         FBuaUE26SGsL0yfBbqJwfTR7MRBHbzWkmB6pd9zePQLGrzX3At6uzJSUOg1wQrWoYrZ9
         rRhI8G2xKJHwXv94VCPglKAvHnAM8rZ7+zlMQb/Pzv3qkjMmFwspWsIMkTMXDI4cRzUg
         ZxpA==
X-Gm-Message-State: AGi0PuZ9uXl8lgyGhp5FOZNSSZhQ9Svvp102KARVsj0bPNuz45CJ0O3B
        j61s29ruN1NNAuv4k09Bfbsia6Wv
X-Google-Smtp-Source: APiQypLjqo2b1FQR/XG5DVGzKrSYbL8Pq1NPFPJ6Li82lfJYqNCzJNXuXRV0RPY5XZdT/WzOH5ZxZg==
X-Received: by 2002:a17:90a:e00c:: with SMTP id u12mr1670981pjy.167.1587607533205;
        Wed, 22 Apr 2020 19:05:33 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id a200sm817463pfa.201.2020.04.22.19.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 19:05:32 -0700 (PDT)
Date:   Wed, 22 Apr 2020 19:05:30 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>
Subject: Re: [PATCH 2/2 v5] Input: cy8ctma140 - add driver
Message-ID: <20200423020530.GH125362@dtor-ws>
References: <20200421080650.25514-1-linus.walleij@linaro.org>
 <20200421080650.25514-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200421080650.25514-2-linus.walleij@linaro.org>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Apr 21, 2020 at 10:06:50AM +0200, Linus Walleij wrote:
> This adds a new driver for the Cypress CY8CTMA140 touchscreen.
> 
> This driver is inspired by out-of-tree code for the Samsung
> GT-S7710 mobile phone.
> 
> I have tried to compare the structure and behaviour of this
> touchscreen to the existing CYTTSP and CYTTSP4 generics and
> it seems pretty different. It is also different in character
> from the cy8ctmg110_ts.c. It appears to rather be vaguely
> related to the Melfas MMS114 driver, yet distinctly
> different.

...

>  
> +config TOUCHSCREEN_CY8CTMA140
> +	tristate "cy8ctma140 touchscreen"
> +	depends on I2C
> +	depends on GPIOLIB || COMPILE_TEST

Why do we need gpiolib here?

> +
> +static irqreturn_t cy8ctma140_irq_thread(int irq, void *d)
> +{
> +	struct cy8ctma140 *ts = d;
> +	u8 msgbuf0[1];
> +	/* This message also fits some bytes for touchkeys, if used */
> +	u8 buf[31];
> +	struct i2c_msg msg[] = {
> +		{
> +			.addr = ts->client->addr,
> +			.flags = 0,
> +			.len = 1,
> +			.buf = msgbuf0,
> +		}, {
> +			.addr = ts->client->addr,
> +			.flags = I2C_M_RD,
> +			.len = sizeof(buf),
> +			.buf = buf,
> +		},
> +	};
> +	u8 fingers;
> +	/* X, Y and Width (W) supported */
> +	u16 f1x, f1y;
> +	u16 f2x, f2y;
> +	u8 f1w, f2w;
> +	u8 f1id, f2id;
> +	int ret;
> +	struct input_mt_pos pos;
> +
> +	msgbuf0[0] = CY8CTMA140_GET_FINGERS;
> +	ret = __i2c_transfer(ts->client->adapter, msg, ARRAY_SIZE(msg));

Why do we use "unlocked" __i2c_transfer()? Can't we use normal
i2c_transfer()? For __i2c_transfer() someone has to lock the segment...

> +	/*
> +	 * When just handling two fingers this code is simple and we do not
> +	 * need a loop increasing the complexity. If you need to modify
> +	 * this driver for some firmware handling more than 2 fingers,
> +	 * this is where you put in an array of coordinates and a loop
> +	 * instead.
> +	 */

Hmm, I think if we do use loop the code is actually _much_ simpler,
please see the patch below.

> +
> +static int cy8ctma140_init(struct cy8ctma140 *ts)
> +{
> +	u8 addr[1];
> +	u8 buf[5];
> +	int ret;
> +
> +	addr[0] = CY8CTMA140_GET_FW_INFO;
> +	ret = i2c_master_send(ts->client, addr, 1);
> +	if (ret < 0) {
> +		dev_err(ts->dev, "error sending FW info message\n");
> +		return ret;
> +	}
> +	ret = i2c_master_recv(ts->client, buf, 5);
> +	if (ret < 0) {
> +		dev_err(ts->dev, "error recieveing FW info message\n");
> +		return ret;
> +	}

Does it have to be 2 separate transactions? Can we use write/read
i2c_transfer() here?

> +	if (ret != 5) {
> +		dev_err(ts->dev, "got only %d bytes\n", ret);
> +		return -EIO;
> +	}
> +
> +	dev_info(ts->dev, "vendor %c%c, HW ID %.2d, FW ver %.4d\n",
> +		 buf[0], buf[1], buf[3], buf[4]);
> +	return 0;
> +}
> +
> +	ret = cy8ctma140_power_up(ts);
> +	if (ret)
> +		return ret;
> +	ret = devm_add_action_or_reset(dev, cy8ctma140_power_off_action, ts);
> +	if (ret) {
> +		dev_err(dev, "failed to install power off handler\n");
> +		return ret;
> +	}
> +
> +	ret = devm_request_threaded_irq(dev, client->irq, NULL,
> +					cy8ctma140_irq_thread,
> +					IRQF_ONESHOT,
> +					CY8CTMA140_NAME, ts);
> +	if (ret) {
> +		dev_err(dev, "irq %d busy? error %d\n", client->irq, ret);
> +		goto err_reg_dis;

Why "goto" here if we are using devm?

> +	}
> +
> +	ret = cy8ctma140_init(ts);
> +	if (ret)
> +		return ret;
> +
> +	ret = input_register_device(input);
> +	if (ret)
> +		goto err_reg_dis;

Same here.

> +
> +	i2c_set_clientdata(client, ts);
> +
> +	return 0;
> +
> +err_reg_dis:
> +	cy8ctma140_power_down(ts);
> +	return ret;
> +}
> +
> +static int __maybe_unused cy8ctma140_suspend(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct cy8ctma140 *ts = i2c_get_clientdata(client);
> +
> +	if (!device_may_wakeup(&client->dev))
> +		cy8ctma140_power_down(ts);
> +	input_mt_slot(ts->input, 0);
> +	input_mt_report_slot_state(ts->input, MT_TOOL_FINGER, false);
> +	input_mt_slot(ts->input, 1);
> +	input_mt_report_slot_state(ts->input, MT_TOOL_FINGER, false);
> +	input_mt_report_pointer_emulation(ts->input, true);
> +	input_sync(ts->input);

Is this really needed? Userspace usually ignores "old" events. If this
is needed, it is better done in input core rather than individual
drivers.

Can you please try the patch below on top of yours?

-- 
Dmitry


Input: cy8ctma140 - misc changes

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/cy8ctma140.c |  279 +++++++++++++-------------------
 1 file changed, 114 insertions(+), 165 deletions(-)

diff --git a/drivers/input/touchscreen/cy8ctma140.c b/drivers/input/touchscreen/cy8ctma140.c
index 12ceec1e306b..e4a9c54d614e 100644
--- a/drivers/input/touchscreen/cy8ctma140.c
+++ b/drivers/input/touchscreen/cy8ctma140.c
@@ -29,16 +29,17 @@
 #include <linux/regulator/consumer.h>
 #include <linux/delay.h>
 
-/* Used for driver name etc */
-#define CY8CTMA140_NAME "cy8ctma140"
+#define CY8CTMA140_NAME			"cy8ctma140"
 
-/*
- * The datasheet claims the device supports 4 fingers but the firmware
- * I've seen certainly only supports 2 fingers.
- */
-#define CY8CTMA140_MAX_FINGERS 2
-#define CY8CTMA140_GET_FINGERS 0x00
-#define CY8CTMA140_GET_FW_INFO 0x19
+#define CY8CTMA140_MAX_FINGERS		4
+
+#define CY8CTMA140_GET_FINGERS		0x00
+#define CY8CTMA140_GET_FW_INFO		0x19
+
+/* This message also fits some bytes for touchkeys, if used */
+#define CY8CTMA140_PACKET_SIZE		31
+
+#define CY8CTMA140_INVALID_BUFFER_BIT	5
 
 struct cy8ctma140 {
 	struct input_dev *input;
@@ -51,18 +52,57 @@ struct cy8ctma140 {
 	u8 prev_f2id;
 };
 
+static void cy8ctma140_report(struct cy8ctma140 *ts, u8 *data, int n_fingers)
+{
+	static const u8 contact_offsets[] = { 0x03, 0x09, 0x10, 0x16 };
+	u8 *buf;
+	u16 x, y;
+	u8 w;
+	u8 id;
+	int slot;
+	int i;
+
+	for (i = 0; i < n_fingers; i++) {
+		buf = &data[contact_offsets[i]];
+
+		/*
+		 * Odd contacts have contact ID in the lower nibble of
+		 * the preceding byte, whereas even contacts have it in
+		 * the upper nibble of the following byte.
+		 */
+		id = i % 2 ? buf[-1] & 0x0f : buf[5] >> 4;
+		slot = input_mt_get_slot_by_key(ts->input, id);
+		if (slot < 0)
+			continue;
+
+		x = get_unaligned_be16(buf);
+		y = get_unaligned_be16(buf + 2);
+		w = buf[4];
+
+		dev_dbg(ts->dev, "finger %d: ID %02x (%d, %d) w: %d\n",
+			slot, id, x, y, w);
+
+		input_mt_slot(ts->input, slot);
+		input_mt_report_slot_state(ts->input, MT_TOOL_FINGER, true);
+		touchscreen_report_pos(ts->input, &ts->props, x, y, true);
+		input_report_abs(ts->input, ABS_MT_TOUCH_MAJOR, w);
+	}
+
+	input_mt_sync_frame(ts->input);
+	input_sync(ts->input);
+}
+
 static irqreturn_t cy8ctma140_irq_thread(int irq, void *d)
 {
 	struct cy8ctma140 *ts = d;
-	u8 msgbuf0[1];
-	/* This message also fits some bytes for touchkeys, if used */
-	u8 buf[31];
+	u8 cmdbuf[] = { CY8CTMA140_GET_FINGERS };
+	u8 buf[CY8CTMA140_PACKET_SIZE];
 	struct i2c_msg msg[] = {
 		{
 			.addr = ts->client->addr,
 			.flags = 0,
-			.len = 1,
-			.buf = msgbuf0,
+			.len = sizeof(cmdbuf),
+			.buf = cmdbuf,
 		}, {
 			.addr = ts->client->addr,
 			.flags = I2C_M_RD,
@@ -70,116 +110,33 @@ static irqreturn_t cy8ctma140_irq_thread(int irq, void *d)
 			.buf = buf,
 		},
 	};
-	u8 fingers;
-	/* X, Y and Width (W) supported */
-	u16 f1x, f1y;
-	u16 f2x, f2y;
-	u8 f1w, f2w;
-	u8 f1id, f2id;
+	u8 n_fingers;
 	int ret;
-	struct input_mt_pos pos;
 
-	msgbuf0[0] = CY8CTMA140_GET_FINGERS;
-	ret = __i2c_transfer(ts->client->adapter, msg, ARRAY_SIZE(msg));
-	if (ret < 0) {
-		dev_err(ts->dev, "error reading message\n");
-		goto evt_out;
-	}
+	ret = i2c_transfer(ts->client->adapter, msg, ARRAY_SIZE(msg));
 	if (ret != ARRAY_SIZE(msg)) {
-		dev_err(ts->dev, "wrong number of messages\n");
-		goto evt_out;
-	}
-	if (buf[1] & 0x20) {
-		dev_info(ts->dev, "invalid event\n");
-		goto evt_out;
+		if (ret < 0)
+			dev_err(ts->dev, "error reading message: %d\n", ret);
+		else
+			dev_err(ts->dev, "wrong number of messages\n");
+		goto out;
 	}
 
-	/* IDs are 1 and 2 so subtract 1 from ID */
-	f1id = (buf[8] >> 4) - 1;
-	f2id = (buf[8] & 0x0f) - 1;
-
-	f1x = get_unaligned_be16(&buf[3]);
-	f1y = get_unaligned_be16(&buf[5]);
-	f1w = buf[7];
-
-	f2x = get_unaligned_be16(&buf[9]);
-	f2y = get_unaligned_be16(&buf[11]);
-	f2w = buf[13];
-
-	fingers = buf[2] & 0x0f;
-
-	if (!fingers) {
-		/*
-		 * For the unlikely case that both fingers reports as released
-		 * by the same IRQ.
-		 */
-		if (ts->prev_fingers >= 2) {
-			dev_dbg(ts->dev, "release finger 2 ID: %02x\n",
-				ts->prev_f2id);
-			input_mt_slot(ts->input, ts->prev_f2id);
-			input_mt_report_slot_state(ts->input, MT_TOOL_FINGER,
-						   false);
-		}
-		if (ts->prev_fingers >= 1) {
-			dev_dbg(ts->dev, "release finger 1 ID: %02x\n",
-				ts->prev_f1id);
-			input_mt_slot(ts->input, ts->prev_f1id);
-			input_mt_report_slot_state(ts->input,
-						   MT_TOOL_FINGER, false);
-		}
-		goto fingers_out;
+	if (buf[1] & BIT(CY8CTMA140_INVALID_BUFFER_BIT)) {
+		dev_dbg(ts->dev, "invalid event\n");
+		goto out;
 	}
 
-	/*
-	 * When just handling two fingers this code is simple and we do not
-	 * need a loop increasing the complexity. If you need to modify
-	 * this driver for some firmware handling more than 2 fingers,
-	 * this is where you put in an array of coordinates and a loop
-	 * instead.
-	 */
-	if (fingers >= 1) {
-		touchscreen_set_mt_pos(&pos, &ts->props, f1x, f1y);
-		dev_dbg(ts->dev,
-			"%d fingers: finger 1 ID: %02x (%d, %d) w: %d\n",
-			fingers, f1id, pos.x, pos.y, f1w);
-		input_mt_slot(ts->input, f1id);
-		input_mt_report_slot_state(ts->input, MT_TOOL_FINGER, true);
-		input_report_abs(ts->input, ABS_MT_POSITION_X, pos.x);
-		input_report_abs(ts->input, ABS_MT_POSITION_Y, pos.y);
-		input_report_abs(ts->input, ABS_MT_TOUCH_MAJOR, f1w);
-	}
-	if (fingers == 1 && ts->prev_fingers == 2) {
-		dev_dbg(ts->dev, "release finger 2 ID: %02x\n", ts->prev_f2id);
-		input_mt_slot(ts->input, ts->prev_f2id);
-		input_mt_report_slot_state(ts->input, MT_TOOL_FINGER, false);
-		goto fingers_out;
-	}
-	if (fingers >= 2) {
-		touchscreen_set_mt_pos(&pos, &ts->props, f2x, f2y);
-		dev_dbg(ts->dev,
-			"%d fingers: finger 2 ID %02x (%d, %d) w: %d\n",
-			fingers, f2id, pos.x, pos.y, f2w);
-		input_mt_slot(ts->input, f2id);
-		input_mt_report_slot_state(ts->input, MT_TOOL_FINGER, true);
-		input_report_abs(ts->input, ABS_MT_POSITION_X, pos.x);
-		input_report_abs(ts->input, ABS_MT_POSITION_Y, pos.y);
-		input_report_abs(ts->input, ABS_MT_TOUCH_MAJOR, f2w);
+	n_fingers = buf[2] & 0x0f;
+	if (n_fingers > CY8CTMA140_MAX_FINGERS) {
+		dev_err(ts->dev, "unexpected number of fingers: %d\n",
+			n_fingers);
+		goto out;
 	}
-	if (fingers > 2)
-		dev_err(ts->dev, "%d fingers - unsupported!\n", fingers);
 
-fingers_out:
-	input_mt_sync_frame(ts->input);
-	input_sync(ts->input);
-	/*
-	 * The firmware just resports 1 or 0 finger without any indication of
-	 * the ID of the finger that just disappeared, so we need to cache
-	 * the previous finger IDs.
-	 */
-	ts->prev_fingers = fingers;
-	ts->prev_f1id = f1id;
-	ts->prev_f2id = f2id;
-evt_out:
+	cy8ctma140_report(ts, buf, n_fingers);
+
+out:
 	return IRQ_HANDLED;
 }
 
@@ -187,26 +144,28 @@ static int cy8ctma140_init(struct cy8ctma140 *ts)
 {
 	u8 addr[1];
 	u8 buf[5];
+	int error;
 	int ret;
 
 	addr[0] = CY8CTMA140_GET_FW_INFO;
-	ret = i2c_master_send(ts->client, addr, 1);
-	if (ret < 0) {
+	error = i2c_master_send(ts->client, addr, 1);
+	if (error) {
 		dev_err(ts->dev, "error sending FW info message\n");
-		return ret;
+		return error;
 	}
 	ret = i2c_master_recv(ts->client, buf, 5);
 	if (ret < 0) {
-		dev_err(ts->dev, "error recieveing FW info message\n");
+		dev_err(ts->dev, "error receiving FW info message\n");
 		return ret;
 	}
 	if (ret != 5) {
-		dev_err(ts->dev, "got only %d bytes\n", ret);
+		dev_err(ts->dev, "got only %d bytes\n", error);
 		return -EIO;
 	}
 
-	dev_info(ts->dev, "vendor %c%c, HW ID %.2d, FW ver %.4d\n",
-		 buf[0], buf[1], buf[3], buf[4]);
+	dev_dbg(ts->dev, "vendor %c%c, HW ID %.2d, FW ver %.4d\n",
+		buf[0], buf[1], buf[3], buf[4]);
+
 	return 0;
 }
 
@@ -246,7 +205,7 @@ static int cy8ctma140_probe(struct i2c_client *client,
 	struct cy8ctma140 *ts;
 	struct input_dev *input;
 	struct device *dev = &client->dev;
-	int ret;
+	int error;
 
 	ts = devm_kzalloc(dev, sizeof(*ts), GFP_KERNEL);
 	if (!ts)
@@ -281,10 +240,10 @@ static int cy8ctma140_probe(struct i2c_client *client,
 	input_abs_set_fuzz(input, ABS_MT_POSITION_X, 0);
 	input_abs_set_fuzz(input, ABS_MT_POSITION_Y, 0);
 
-	ret = input_mt_init_slots(input, CY8CTMA140_MAX_FINGERS,
-				  INPUT_MT_DIRECT);
-	if (ret)
-		return ret;
+	error = input_mt_init_slots(input, CY8CTMA140_MAX_FINGERS,
+				  INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
+	if (error)
+		return error;
 
 	input->name = CY8CTMA140_NAME;
 	input->id.bustype = BUS_I2C;
@@ -299,48 +258,44 @@ static int cy8ctma140_probe(struct i2c_client *client,
 	 */
 	ts->regulators[0].supply = "vcpin";
 	ts->regulators[1].supply = "vdd";
-	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ts->regulators),
+	error = devm_regulator_bulk_get(dev, ARRAY_SIZE(ts->regulators),
 				      ts->regulators);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
+	if (error) {
+		if (error != -EPROBE_DEFER)
 			dev_err(dev, "Failed to get regulators %d\n",
-				ret);
-		return ret;
+				error);
+		return error;
 	}
 
-	ret = cy8ctma140_power_up(ts);
-	if (ret)
-		return ret;
-	ret = devm_add_action_or_reset(dev, cy8ctma140_power_off_action, ts);
-	if (ret) {
+	error = cy8ctma140_power_up(ts);
+	if (error)
+		return error;
+
+	error = devm_add_action_or_reset(dev, cy8ctma140_power_off_action, ts);
+	if (error) {
 		dev_err(dev, "failed to install power off handler\n");
-		return ret;
+		return error;
 	}
 
-	ret = devm_request_threaded_irq(dev, client->irq, NULL,
-					cy8ctma140_irq_thread,
-					IRQF_ONESHOT,
-					CY8CTMA140_NAME, ts);
-	if (ret) {
-		dev_err(dev, "irq %d busy? error %d\n", client->irq, ret);
-		goto err_reg_dis;
+	error = devm_request_threaded_irq(dev, client->irq,
+					  NULL, cy8ctma140_irq_thread,
+					  IRQF_ONESHOT, CY8CTMA140_NAME, ts);
+	if (error) {
+		dev_err(dev, "irq %d busy? error %d\n", client->irq, error);
+		return error;
 	}
 
-	ret = cy8ctma140_init(ts);
-	if (ret)
-		return ret;
+	error = cy8ctma140_init(ts);
+	if (error)
+		return error;
 
-	ret = input_register_device(input);
-	if (ret)
-		goto err_reg_dis;
+	error = input_register_device(input);
+	if (error)
+		return error;
 
 	i2c_set_clientdata(client, ts);
 
 	return 0;
-
-err_reg_dis:
-	cy8ctma140_power_down(ts);
-	return ret;
 }
 
 static int __maybe_unused cy8ctma140_suspend(struct device *dev)
@@ -350,12 +305,6 @@ static int __maybe_unused cy8ctma140_suspend(struct device *dev)
 
 	if (!device_may_wakeup(&client->dev))
 		cy8ctma140_power_down(ts);
-	input_mt_slot(ts->input, 0);
-	input_mt_report_slot_state(ts->input, MT_TOOL_FINGER, false);
-	input_mt_slot(ts->input, 1);
-	input_mt_report_slot_state(ts->input, MT_TOOL_FINGER, false);
-	input_mt_report_pointer_emulation(ts->input, true);
-	input_sync(ts->input);
 
 	return 0;
 }
@@ -364,12 +313,12 @@ static int __maybe_unused cy8ctma140_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct cy8ctma140 *ts = i2c_get_clientdata(client);
-	int ret;
+	int error;
 
 	if (!device_may_wakeup(&client->dev)) {
-		ret = cy8ctma140_power_up(ts);
-		if (ret)
-			return ret;
+		error = cy8ctma140_power_up(ts);
+		if (error)
+			return error;
 	}
 
 	return 0;

