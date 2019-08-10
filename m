Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0105288C4F
	for <lists+linux-input@lfdr.de>; Sat, 10 Aug 2019 18:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbfHJQlm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 10 Aug 2019 12:41:42 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46424 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbfHJQll (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 10 Aug 2019 12:41:41 -0400
Received: by mail-pf1-f195.google.com with SMTP id c3so24497492pfa.13
        for <linux-input@vger.kernel.org>; Sat, 10 Aug 2019 09:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2S9eGMSPaM5V0UZfgU7KyIeFQ1GfynRpNdntytpuK9w=;
        b=Vv/r9U418ZF+mBk434qfhZJ/zSfSPdzlWtkgUC5aglK11PR1bKJcLsZmDSXO7Iemlz
         gU0CczHta83Kuqaevg/sKDaVudurCxFcwdQ2y6Xp9ZHwRO9rnKKPqbrUa+n0FAUXgjy8
         BLd1GApDrs8yvrFtqbFhRjRuBOtTpL9u5GPZCqo5nAvQFhI7auZrrcCEQlo+C335ldp8
         1CH64xFezeGIq0DKOaHiqu0a2MFMUteknFPOa/iYF2aATaJZKuVq2r7PFa7sJCnJYQtK
         pCYVXXDKMAMirTo+D45maqpbIctHtYOddBVVRB/WL7q5UQskTWfamr/kKVZSJfCq1v+J
         6VqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2S9eGMSPaM5V0UZfgU7KyIeFQ1GfynRpNdntytpuK9w=;
        b=aL8NVujlAOF7AzKRR5cmggDwUEcOzA84mEzlFqCoAqn/ePrzw4lpjclUWhyHNf1rok
         egxKP0y2x0akq/M1gh2J/SKF8lWSkJZnLrJfCsEUtSmRDZ+yHLkYLZEIwWire/7NP0Fv
         yn+tQYw541dPiNk8pmMtAXOk0NasIxdLm0IHVk+jUeaYKbuKfimEdxTiekdjOqsPATT/
         QVo9iRCVUViqvgth+X8wH6DGIwFhkFCiIeP3ABPdKtSwmDDxdt3lce5l40mRtui/xWb6
         gF7b1JsD01nIxRQ/5pfMzxcE3mJ7Vxd0hqEcCxO2Z4gWzki279eJyqSG7ijk0XtQAI55
         XOiw==
X-Gm-Message-State: APjAAAUbUTfqiTLZgVdmx8wIGGq6kY91iUma3dVzFRoYfSrQ0W0hGG3u
        UXi8eKz1ePjHgq9QU9Hn5aA=
X-Google-Smtp-Source: APXvYqyZdEK0e5CI6FSO2LuAmS+0AtwDfMbXoCm7Wxd5GXU4aP6HwfUET/AoOZPjwlsIt+gYry6WCg==
X-Received: by 2002:a63:5550:: with SMTP id f16mr23664426pgm.426.1565455300322;
        Sat, 10 Aug 2019 09:41:40 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id z19sm88329908pgv.35.2019.08.10.09.41.39
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 10 Aug 2019 09:41:39 -0700 (PDT)
Date:   Sat, 10 Aug 2019 09:41:37 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-input@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        Olivier Sobrie <olivier@sobrie.be>,
        Philipp Puschmann <pp@emlix.com>
Subject: Re: [PATCH 2/2] Input: ili210x - add ILI2117 support
Message-ID: <20190810164137.GQ178933@dtor-ws>
References: <20190302141704.32547-1-marex@denx.de>
 <20190302141704.32547-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190302141704.32547-2-marex@denx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Marek,

On Sat, Mar 02, 2019 at 03:17:04PM +0100, Marek Vasut wrote:
> Add support for ILI2117 touch controller. This controller is similar
> to the ILI210x and ILI251x, except for the following differences:
> - Reading out of touch data must happen at most 300 mS after the
>   interrupt line was asserted. No command must be sent, the data
>   are returned upon pure I2C read of 43 bytes long.
> - Supports 10 simultaneous touch inputs.
> - Touch data format is slightly different.

So with this and also I see there is another ili2117a submission, I do
believe that we need to switch to using function pointers instead of
if/else if/else style cheking of the model.

Please try the patch below and see if it works for you and please rebase
this one on to of it.

Thanks.

-- 
Dmitry


Input: ili210x - define and use chip operations structure

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Instead of doing if/else if/else on the chip's model number let's define
chip operations structure and use it to perform indirect calls. With number
of protocols supported by the driver growing, this makes it better
maintainable.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/ili210x.c |  231 ++++++++++++++++++++---------------
 1 file changed, 129 insertions(+), 102 deletions(-)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index e9006407c9bc..c60b09da5a1f 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -12,10 +12,12 @@
 #include <linux/of_device.h>
 #include <asm/unaligned.h>
 
-#define ILI210X_TOUCHES		2
-#define ILI251X_TOUCHES		10
 #define DEFAULT_POLL_PERIOD	20
 
+#define ILI210X_DATA_SIZE	64
+#define ILI251X_DATA_SIZE1	31
+#define ILI251X_DATA_SIZE2	20
+
 /* Touchscreen commands */
 #define REG_TOUCHDATA		0x10
 #define REG_PANEL_INFO		0x20
@@ -28,9 +30,14 @@ struct firmware_version {
 	u8 minor;
 } __packed;
 
-enum ili2xxx_model {
-	MODEL_ILI210X,
-	MODEL_ILI251X,
+struct ili2xxx_chip {
+	int (*read_reg)(struct i2c_client *client, u8 reg,
+			void *buf, size_t len);
+	int (*get_touch_data)(struct i2c_client *client, u8 *data);
+	bool (*parse_touch_data)(const u8 *data, unsigned int finger,
+				 unsigned int *x, unsigned int *y);
+	bool (*continue_polling)(const u8 *data);
+	unsigned int max_touches;
 };
 
 struct ili210x {
@@ -40,15 +47,13 @@ struct ili210x {
 	struct delayed_work dwork;
 	struct gpio_desc *reset_gpio;
 	struct touchscreen_properties prop;
-	enum ili2xxx_model model;
-	unsigned int max_touches;
+	const struct ili2xxx_chip *chip;
 };
 
-static int ili210x_read_reg(struct i2c_client *client, u8 reg, void *buf,
-			    size_t len)
+static int ili210x_read_reg(struct i2c_client *client,
+			    u8 reg, void *buf, size_t len)
 {
-	struct ili210x *priv = i2c_get_clientdata(client);
-	struct i2c_msg msg[2] = {
+	struct i2c_msg msg[] = {
 		{
 			.addr	= client->addr,
 			.flags	= 0,
@@ -62,53 +67,28 @@ static int ili210x_read_reg(struct i2c_client *client, u8 reg, void *buf,
 			.buf	= buf,
 		}
 	};
+	int error, ret;
 
-	if (priv->model == MODEL_ILI251X) {
-		if (i2c_transfer(client->adapter, msg, 1) != 1) {
-			dev_err(&client->dev, "i2c transfer failed\n");
-			return -EIO;
-		}
-
-		usleep_range(5000, 5500);
-
-		if (i2c_transfer(client->adapter, msg + 1, 1) != 1) {
-			dev_err(&client->dev, "i2c transfer failed\n");
-			return -EIO;
-		}
-	} else {
-		if (i2c_transfer(client->adapter, msg, 2) != 2) {
-			dev_err(&client->dev, "i2c transfer failed\n");
-			return -EIO;
-		}
+	ret = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
+	if (ret != ARRAY_SIZE(msg)) {
+		error = ret < 0 ? ret : -EIO;
+		dev_err(&client->dev, "%s failed: %d\n", __func__, error);
+		return error;
 	}
 
 	return 0;
 }
 
-static int ili210x_read(struct i2c_client *client, void *buf, size_t len)
+static int ili210x_read_touch_data(struct i2c_client *client, u8 *data)
 {
-	struct i2c_msg msg = {
-		.addr	= client->addr,
-		.flags	= I2C_M_RD,
-		.len	= len,
-		.buf	= buf,
-	};
-
-	if (i2c_transfer(client->adapter, &msg, 1) != 1) {
-		dev_err(&client->dev, "i2c transfer failed\n");
-		return -EIO;
-	}
-
-	return 0;
+	return ili210x_read_reg(client, REG_TOUCHDATA,
+				data, ILI210X_DATA_SIZE);
 }
 
-static bool ili210x_touchdata_to_coords(struct ili210x *priv, u8 *touchdata,
+static bool ili210x_touchdata_to_coords(const u8 *touchdata,
 					unsigned int finger,
 					unsigned int *x, unsigned int *y)
 {
-	if (finger >= ILI210X_TOUCHES)
-		return false;
-
 	if (touchdata[0] & BIT(finger))
 		return false;
 
@@ -118,55 +98,103 @@ static bool ili210x_touchdata_to_coords(struct ili210x *priv, u8 *touchdata,
 	return true;
 }
 
-static bool ili251x_touchdata_to_coords(struct ili210x *priv, u8 *touchdata,
+static bool ili210x_check_continue_polling(const u8 *data)
+{
+	return data[0] & 0xf3;
+}
+
+static const struct ili2xxx_chip ili210x_chip = {
+	.read_reg		= ili210x_read_reg,
+	.get_touch_data		= ili210x_read_touch_data,
+	.parse_touch_data	= ili210x_touchdata_to_coords,
+	.continue_polling	= ili210x_check_continue_polling,
+	.max_touches		= 2,
+};
+
+static int ili251x_read_reg(struct i2c_client *client,
+			    u8 reg, void *buf, size_t len)
+{
+	int error, ret;
+
+	ret = i2c_master_send(client, &reg, 1);
+	if (ret == 1) {
+		usleep_range(5000, 5500);
+
+		ret = i2c_master_recv(client, buf, len);
+		if (ret == len)
+			return 0;
+	}
+
+	error = ret < 0 ? ret : -EIO;
+	dev_err(&client->dev, "%s failed: %d\n", __func__, error);
+	return ret;
+}
+
+static int ili251x_read_touch_data(struct i2c_client *client, u8 *data)
+{
+	int error;
+
+	error = ili251x_read_reg(client, REG_TOUCHDATA,
+				 data, ILI251X_DATA_SIZE1);
+	if (!error && data[0]) {
+		error = i2c_master_recv(client, data + ILI251X_DATA_SIZE1,
+					ILI251X_DATA_SIZE2);
+		if (error >= 0 && error != ILI251X_DATA_SIZE2)
+			error = -EIO;
+	}
+
+	return error;
+}
+
+static bool ili251x_touchdata_to_coords(const u8 *touchdata,
 					unsigned int finger,
 					unsigned int *x, unsigned int *y)
 {
-	if (finger >= ILI251X_TOUCHES)
-		return false;
+	u16 val;
 
-	*x = get_unaligned_be16(touchdata + 1 + (finger * 5) + 0);
-	if (!(*x & BIT(15)))	/* Touch indication */
+	val = get_unaligned_be16(touchdata + 1 + (finger * 5) + 0);
+	if (!(val & BIT(15)))	/* Touch indication */
 		return false;
 
-	*x &= 0x3fff;
+	*x = val & 0x3fff;
 	*y = get_unaligned_be16(touchdata + 1 + (finger * 5) + 2);
 
 	return true;
 }
 
+static bool ili251x_check_continue_polling(const u8 *data)
+{
+	return false;
+}
+
+static const struct ili2xxx_chip ili251x_chip = {
+	.read_reg		= ili251x_read_reg,
+	.get_touch_data		= ili251x_read_touch_data,
+	.parse_touch_data	= ili251x_touchdata_to_coords,
+	.continue_polling	= ili251x_check_continue_polling,
+	.max_touches		= 10,
+};
+
 static bool ili210x_report_events(struct ili210x *priv, u8 *touchdata)
 {
 	struct input_dev *input = priv->input;
 	int i;
-	bool contact = false, touch = false;
+	bool contact = false, touch;
 	unsigned int x = 0, y = 0;
 
-	for (i = 0; i < priv->max_touches; i++) {
-		if (priv->model == MODEL_ILI210X) {
-			touch = ili210x_touchdata_to_coords(priv, touchdata,
-							    i, &x, &y);
-		} else if (priv->model == MODEL_ILI251X) {
-			touch = ili251x_touchdata_to_coords(priv, touchdata,
-							    i, &x, &y);
-			if (touch)
-				contact = true;
-		}
+	for (i = 0; i < priv->chip->max_touches; i++) {
+		touch = priv->chip->parse_touch_data(touchdata, i, &x, &y);
 
 		input_mt_slot(input, i);
-		input_mt_report_slot_state(input, MT_TOOL_FINGER, touch);
-		if (!touch)
-			continue;
-		touchscreen_report_pos(input, &priv->prop, x, y,
-				       true);
+		if (input_mt_report_slot_state(input, MT_TOOL_FINGER, touch)) {
+			touchscreen_report_pos(input, &priv->prop, x, y, true);
+			contact = true;
+		}
 	}
 
 	input_mt_report_pointer_emulation(input, false);
 	input_sync(input);
 
-	if (priv->model == MODEL_ILI210X)
-		contact = touchdata[0] & 0xf3;
-
 	return contact;
 }
 
@@ -175,20 +203,12 @@ static void ili210x_work(struct work_struct *work)
 	struct ili210x *priv = container_of(work, struct ili210x,
 					    dwork.work);
 	struct i2c_client *client = priv->client;
-	u8 touchdata[64] = { 0 };
+	const struct ili2xxx_chip *chip = priv->chip;
+	u8 touchdata[ILI210X_DATA_SIZE] = { 0 };
 	bool touch;
-	int error = -EINVAL;
-
-	if (priv->model == MODEL_ILI210X) {
-		error = ili210x_read_reg(client, REG_TOUCHDATA,
-					 touchdata, sizeof(touchdata));
-	} else if (priv->model == MODEL_ILI251X) {
-		error = ili210x_read_reg(client, REG_TOUCHDATA,
-					 touchdata, 31);
-		if (!error && touchdata[0] == 2)
-			error = ili210x_read(client, &touchdata[31], 20);
-	}
+	int error;
 
+	error = chip->get_touch_data(client, touchdata);
 	if (error) {
 		dev_err(&client->dev,
 			"Unable to get touchdata, err = %d\n", error);
@@ -196,8 +216,7 @@ static void ili210x_work(struct work_struct *work)
 	}
 
 	touch = ili210x_report_events(priv, touchdata);
-
-	if (touch)
+	if (touch || chip->continue_polling(touchdata))
 		schedule_delayed_work(&priv->dwork,
 				      msecs_to_jiffies(priv->poll_period));
 }
@@ -261,20 +280,26 @@ static void ili210x_cancel_work(void *data)
 }
 
 static int ili210x_i2c_probe(struct i2c_client *client,
-				       const struct i2c_device_id *id)
+			     const struct i2c_device_id *id)
 {
 	struct device *dev = &client->dev;
+	const struct ili2xxx_chip *chip;
 	struct ili210x *priv;
 	struct gpio_desc *reset_gpio;
 	struct input_dev *input;
 	struct firmware_version firmware;
-	enum ili2xxx_model model;
 	int error;
 
-	model = (enum ili2xxx_model)id->driver_data;
-
 	dev_dbg(dev, "Probing for ILI210X I2C Touschreen driver");
 
+	chip = device_get_match_data(dev);
+	if (!chip && id)
+		chip = (const struct ili2xxx_chip *)id->driver_data;
+	if (!chip) {
+		dev_err(&client->dev, "unknown device model\n");
+		return -ENODEV;
+	}
+
 	if (client->irq <= 0) {
 		dev_err(dev, "No IRQ!\n");
 		return -EINVAL;
@@ -308,17 +333,12 @@ static int ili210x_i2c_probe(struct i2c_client *client,
 	priv->poll_period = DEFAULT_POLL_PERIOD;
 	INIT_DELAYED_WORK(&priv->dwork, ili210x_work);
 	priv->reset_gpio = reset_gpio;
-	priv->model = model;
-	if (model == MODEL_ILI210X)
-		priv->max_touches = ILI210X_TOUCHES;
-	if (model == MODEL_ILI251X)
-		priv->max_touches = ILI251X_TOUCHES;
-
+	priv->chip = chip;
 	i2c_set_clientdata(client, priv);
 
 	/* Get firmware version */
-	error = ili210x_read_reg(client, REG_FIRMWARE_VERSION,
-				 &firmware, sizeof(firmware));
+	error = chip->read_reg(client, REG_FIRMWARE_VERSION,
+			       &firmware, sizeof(firmware));
 	if (error) {
 		dev_err(dev, "Failed to get firmware version, err: %d\n",
 			error);
@@ -334,7 +354,14 @@ static int ili210x_i2c_probe(struct i2c_client *client,
 	input_set_abs_params(input, ABS_MT_POSITION_X, 0, 0xffff, 0, 0);
 	input_set_abs_params(input, ABS_MT_POSITION_Y, 0, 0xffff, 0, 0);
 	touchscreen_parse_properties(input, true, &priv->prop);
-	input_mt_init_slots(input, priv->max_touches, INPUT_MT_DIRECT);
+
+	error = input_mt_init_slots(input, priv->chip->max_touches,
+				    INPUT_MT_DIRECT);
+	if (error) {
+		dev_err(dev, "Unable to set up slots, err: %d\n",
+			error);
+		return error;
+	}
 
 	error = devm_add_action(dev, ili210x_cancel_work, priv);
 	if (error)
@@ -394,15 +421,15 @@ static SIMPLE_DEV_PM_OPS(ili210x_i2c_pm,
 			 ili210x_i2c_suspend, ili210x_i2c_resume);
 
 static const struct i2c_device_id ili210x_i2c_id[] = {
-	{ "ili210x", MODEL_ILI210X },
-	{ "ili251x", MODEL_ILI251X },
+	{ "ili210x", (long)&ili210x_chip },
+	{ "ili251x", (long)&ili251x_chip },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ili210x_i2c_id);
 
 static const struct of_device_id ili210x_dt_ids[] = {
-	{ .compatible = "ilitek,ili210x", .data = (void *)MODEL_ILI210X },
-	{ .compatible = "ilitek,ili251x", .data = (void *)MODEL_ILI251X },
+	{ .compatible = "ilitek,ili210x", .data = &ili210x_chip },
+	{ .compatible = "ilitek,ili251x", .data = &ili251x_chip },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, ili210x_dt_ids);
