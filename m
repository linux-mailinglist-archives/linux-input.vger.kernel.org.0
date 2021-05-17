Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 729BD382CBB
	for <lists+linux-input@lfdr.de>; Mon, 17 May 2021 14:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237201AbhEQNAo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 May 2021 09:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237176AbhEQNAh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 May 2021 09:00:37 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E1A1C061761
        for <linux-input@vger.kernel.org>; Mon, 17 May 2021 05:59:21 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1licq0-0006dk-NN; Mon, 17 May 2021 14:59:12 +0200
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1licpz-00039I-0q; Mon, 17 May 2021 14:59:11 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        David Jander <david@protonic.nl>, devicetree@vger.kernel.org
Subject: [RFC PATCH v1 3/3] Input: resistive-adc-touch: add support for z1 and z2 channels
Date:   Mon, 17 May 2021 14:59:09 +0200
Message-Id: <20210517125909.12024-4-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210517125909.12024-1-o.rempel@pengutronix.de>
References: <20210517125909.12024-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Typical touchscreen do not report pressure. Instead, it is calculated by
measuring resistance of touchscreen plates on different reference
points. Some ADC controllers, for example TI TSC2046, can provide this
measurements. With this patch resistive-adc-touch will be able to use it
and calculate pressure out if measured resistance.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 .../input/touchscreen/resistive-adc-touch.c   | 142 ++++++++++++++++--
 1 file changed, 129 insertions(+), 13 deletions(-)

diff --git a/drivers/input/touchscreen/resistive-adc-touch.c b/drivers/input/touchscreen/resistive-adc-touch.c
index e50af30183f4..f53f8a7fd186 100644
--- a/drivers/input/touchscreen/resistive-adc-touch.c
+++ b/drivers/input/touchscreen/resistive-adc-touch.c
@@ -20,7 +20,18 @@
 
 #define DRIVER_NAME					"resistive-adc-touch"
 #define GRTS_DEFAULT_PRESSURE_MIN			50000
+#define GRTS_DEFAULT_PRESSURE_MAX			65535
 #define GRTS_MAX_POS_MASK				GENMASK(11, 0)
+#define GRTS_MAX_CHANNELS				4
+
+enum grts_ch_type {
+	GRTS_CH_NONE = 0,
+	GRTS_CH_X,
+	GRTS_CH_Y,
+	GRTS_CH_PRESSURE,
+	GRTS_CH_Z1,
+	GRTS_CH_Z2,
+};
 
 /**
  * struct grts_state - generic resistive touch screen information struct
@@ -33,24 +44,61 @@
  */
 struct grts_state {
 	u32				pressure_min;
+	u32				x_plate_ohms;
 	bool				pressure;
 	struct iio_channel		*iio_chans;
 	struct iio_cb_buffer		*iio_cb;
 	struct input_dev		*input;
 	struct touchscreen_properties	prop;
+	enum grts_ch_type		ch[GRTS_MAX_CHANNELS];
 };
 
 static int grts_cb(const void *data, void *private)
 {
 	const u16 *touch_info = data;
 	struct grts_state *st = private;
-	unsigned int x, y, press = 0x0;
+	unsigned int x, y, press = 0x0, z1, z2;
+	unsigned int Rt;
+	unsigned int idx;
+
+	for (idx = 0; st->ch[idx] != GRTS_CH_NONE; idx++) {
+		switch (st->ch[idx]) {
+		case GRTS_CH_X:
+			x = touch_info[idx];
+			break;
+		case GRTS_CH_Y:
+			y = touch_info[idx];
+			break;
+		case GRTS_CH_PRESSURE:
+			press = touch_info[idx];
+			break;
+		case GRTS_CH_Z1:
+			z1 = touch_info[idx];
+			break;
+		case GRTS_CH_Z2:
+			z2 = touch_info[idx];
+			break;
+		case GRTS_CH_NONE:
+			break;
+		}
+	}
 
-	/* channel data coming in buffer in the order below */
-	x = touch_info[0];
-	y = touch_info[1];
-	if (st->pressure)
-		press = touch_info[2];
+	if (z1) {
+		Rt = z2;
+		Rt -= z1;
+		Rt *= st->x_plate_ohms;
+		Rt = DIV_ROUND_CLOSEST(Rt, 16);
+		Rt *= x;
+		Rt /= z1;
+		Rt = DIV_ROUND_CLOSEST(Rt, 256);
+		/* On increased pressure the resistance (Rt) is decreasing
+		 * so, convert values to make it looks as real pressure.
+		 */
+		if (Rt < GRTS_DEFAULT_PRESSURE_MAX)
+			press = GRTS_DEFAULT_PRESSURE_MAX - Rt;
+		else
+			press = 0;
+	}
 
 	if ((!x && !y) || (st->pressure && (press < st->pressure_min))) {
 		/* report end of touch */
@@ -94,6 +142,73 @@ static void grts_disable(void *data)
 	iio_channel_release_all_cb(data);
 }
 
+static int grts_get_properties(struct grts_state *st, struct device *dev)
+{
+	int idx;
+
+	idx = device_property_match_string(dev, "io-channel-names", "x");
+	if (idx < 0)
+		return idx;
+
+	if (idx >= GRTS_MAX_CHANNELS)
+		return -EOVERFLOW;
+
+	st->ch[idx] = GRTS_CH_X;
+
+	idx = device_property_match_string(dev, "io-channel-names", "y");
+	if (idx < 0)
+		return idx;
+
+	if (idx >= GRTS_MAX_CHANNELS)
+		return -EOVERFLOW;
+
+	st->ch[idx] = GRTS_CH_Y;
+
+	/* pressure is optional */
+	idx = device_property_match_string(dev, "io-channel-names", "pressure");
+	if (idx >= 0) {
+		if (idx >= GRTS_MAX_CHANNELS)
+			return -EOVERFLOW;
+
+		st->ch[idx] = GRTS_CH_PRESSURE;
+		st->pressure = true;
+
+		return 0;
+	}
+
+	/* if no pressure is defined, try optional z1 + z2 */
+	idx = device_property_match_string(dev, "io-channel-names", "z1");
+	if (idx >= 0) {
+		int error;
+
+		if (idx >= GRTS_MAX_CHANNELS)
+			return -EOVERFLOW;
+
+		st->ch[idx] = GRTS_CH_Z1;
+
+		/* if z1 is provided z2 is not optional */
+		idx = device_property_match_string(dev, "io-channel-names", "z2");
+		if (idx < 0)
+			return idx;
+
+		if (idx >= GRTS_MAX_CHANNELS)
+			return -EOVERFLOW;
+
+		st->ch[idx] = GRTS_CH_Z2;
+		st->pressure = true;
+
+		error = device_property_read_u32(dev,
+						 "touchscreen-x-plate-ohms",
+						 &st->x_plate_ohms);
+		if (error) {
+			dev_err(dev, "can't get touchscreen-x-plate-ohms property\n");
+			return error;
+		}
+	}
+
+	return 0;
+}
+
 static int grts_probe(struct platform_device *pdev)
 {
 	struct grts_state *st;
@@ -115,12 +230,13 @@ static int grts_probe(struct platform_device *pdev)
 		return error;
 	}
 
-	chan = &st->iio_chans[0];
-	st->pressure = false;
-	while (chan && chan->indio_dev) {
-		if (!strcmp(chan->channel->datasheet_name, "pressure"))
-			st->pressure = true;
-		chan++;
+	if (!device_property_present(dev, "io-channel-names"))
+		return -ENODEV;
+
+	error = grts_get_properties(st, dev);
+	if (error) {
+		dev_err(dev, "Failed to parse properties\n");
+		return error;
 	}
 
 	if (st->pressure) {
@@ -148,7 +264,7 @@ static int grts_probe(struct platform_device *pdev)
 	input_set_abs_params(input, ABS_Y, 0, GRTS_MAX_POS_MASK - 1, 0, 0);
 	if (st->pressure)
 		input_set_abs_params(input, ABS_PRESSURE, st->pressure_min,
-				     0xffff, 0, 0);
+				     GRTS_DEFAULT_PRESSURE_MAX, 0, 0);
 
 	input_set_capability(input, EV_KEY, BTN_TOUCH);
 
-- 
2.29.2

