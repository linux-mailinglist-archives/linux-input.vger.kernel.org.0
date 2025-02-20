Return-Path: <linux-input+bounces-10211-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA2FA3DAE9
	for <lists+linux-input@lfdr.de>; Thu, 20 Feb 2025 14:10:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42AEE189C381
	for <lists+linux-input@lfdr.de>; Thu, 20 Feb 2025 13:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C369C1F76A8;
	Thu, 20 Feb 2025 13:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kqm3fOy4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F7E1F8672;
	Thu, 20 Feb 2025 13:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740057007; cv=none; b=WDK8ZDbf7+9OmjA8oGfIGvZSo/RG5nlGDsG4E9GMwD698WJirSKYSStY8eESrHTshRNn6QjOBtNPjqXGbkbccwwyI+Pfl2tyF/PJ7tA+p8czuN0aYqKEcmLFiw2j3lNf76VWiEwkulWvWFXY049AjRnS/j1iWQCcoignsmgCDlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740057007; c=relaxed/simple;
	bh=PlZuN6lokaVTZxUX3MEc3kP4uFyWBmAY7HEBlNuA+No=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GZ8HATaXDCfxF4Vke2wOB9jcYYT1/5ZRxRI6w4ac1PFz1XiVGpDhKddnlCXvJSbWafejTx9j0dLXAMg51bRPoqWjKbZwyUOGTKGwN6MI/n4SvlMiNnhD8OY4xRC9EPqyymZsLSUX4tofoY/HWEjWmjMXRRTJQUs6TTTbddi0hGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kqm3fOy4; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30a303a656aso9072581fa.0;
        Thu, 20 Feb 2025 05:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740057004; x=1740661804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfLSKOTa7yyc/7LvwUHFg6MR+Jam9EaH0/4MKy/NpD4=;
        b=Kqm3fOy4aXnQFdhbO4UZqDgnJB/A168fkyRtHSegsmUgt1/Af2NV18i2biRPyAzDss
         wtDSVGV2AwoW/LJq8gywL1NVbNbTMMxQKSctJrZwKvHmWmaAlVeXpZtO5Ldcb6GPVtj1
         mWZOOT6GrK/xtmuvpP9OeXOhkvxH3omkzXcBNsKcCxMiZPe79Zhu3oGrZU3xN1wtloGq
         YB6Ev+o5JbYKB6aW7Jq41vPoGAV1w8ctLtsIbStio4lgBQSR1PD/jIw/Gypx83CrJzl1
         tRJXj0zzX0tuPpph3yYfCgi0w00gJVqPdFZsVi+20O6DGnbLNyO1tpiv6NCb1GadhnBb
         8apw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740057004; x=1740661804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nfLSKOTa7yyc/7LvwUHFg6MR+Jam9EaH0/4MKy/NpD4=;
        b=v5ORYiObBwm8ACNod8t4S9XxJrLOGcrB2h7T8lKA39gWsYEju1xOegiVgnRDR5tFWl
         gbLOlWtK92j9BSlkQvFZ0MfqVz9hca0uHYT4Puoxe/98HD3ENhJ8eRdUo7H2Nv2i/7Nm
         EgqorPvC7KsEZlEyJ98ZyDMlea7gpHJnNLThU7LiGBv/h4F3kpkHqxPx5IsMYse1eCaS
         n7Al4Ci8+AmHLl0SLJA4ot2GxczGCmTLsqZW5x2B373lXo8XWoxwo8CtsA24m90Du8Ct
         dztyOvpVYZjqfTIbSR0mj6NlXEFByEnNdZ2Q53B2K0RVyRmA7RFpbRXOlCMga3tBEE+g
         JpYQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7iw28W1TgJCtnkjyA2bkcK17XMhE1wvyCNzyou2oOC5uvTg4gDMnIi6OAABMBs54JHhW0f94GpE60ekNn@vger.kernel.org, AJvYcCX8lwrrwyX+l3wxYjzXyq3xs0WrkqVFiKqKGZR5aTvBPpIMMcuFpZiozUYeALliMy1l6brqs4xH9WHv1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/1DkwLtAkBiL9qW+WlH/TWZ+cTxle7KUCcjm8LrR9QXVG356+
	nhwfFLK+skuBmL7AsTFhTGVr9W2jahgK62bhZJJtIVIM+RdYP+AYnOAjLQ5X
X-Gm-Gg: ASbGncv1PjmcBcmwrPNssPQkQalal7MIs4i1gNS5O19nt4q8ElYt1YjPMlxbvXvWXf7
	3kea2XXoPZ27JyRqPZaOiA6EamxY9C7b4p1DcCMtaQ29odFQFaqyuh9/wgvIi5IwtKpNxAknBfG
	8N5e4bjp1BLIDxs9UJfuHgQiNt4oUpg/iz/52GExRPnsghGsO1/0b1lLhimozwqzbWwgk1+lhA/
	zIPMgN1XoE+3TfRP0GpHzjlr9akzBv3drvMD0FrfpIVxbVxzmc2H16+noCtPYMG2NFNCqpnD0V7
	0WBpR/FY7W424mpYqpDPmoclwUhbSRPSzQLKqX1V
X-Google-Smtp-Source: AGHT+IGU2d50kLZ3mLqizMb/8wIsicUHRVZydM8BivNiqhueplDN8nkYIG6oyZJPxJSE7NmKaYbS5w==
X-Received: by 2002:a05:651c:a:b0:2ff:8e69:77d7 with SMTP id 38308e7fff4ca-30927a64cacmr63670511fa.20.1740057003048;
        Thu, 20 Feb 2025 05:10:03 -0800 (PST)
Received: from NB-5917.corp.yadro.com (avpn01.yadro.com. [89.207.88.243])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3091029b75esm25510721fa.103.2025.02.20.05.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 05:10:02 -0800 (PST)
From: Dmitry Mastykin <mastichi@gmail.com>
To: job@noorman.info,
	dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	felix@kaechele.ca
Cc: Dmitry Mastykin <mastichi@gmail.com>
Subject: [PATCH 2/2] Input: himax_hx83112b - add pen support
Date: Thu, 20 Feb 2025 16:09:40 +0300
Message-Id: <20250220130940.2019784-2-mastichi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250220130940.2019784-1-mastichi@gmail.com>
References: <20250220130940.2019784-1-mastichi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add pen support based on Himax Android driver, that provides two versions
of pen data structure. Pen support is activated in device-tree by
"pen-present" property. Its value is the version number. We tested with:
	pen-present = <1>;
Additional set of device-properties must be used to set pen resolution
and axis orientation:
	pen-size-x = <2000>;
	pen-size-y = <1200>;
	...
Touchscreen size device-properties may be added for pen points/mm
calculation:
	touchscreen-x-mm = <239>;
	touchscreen-y-mm = <143>;

Tested on: Starry Electronic XR109IA2T LCM (HX83102J)

Signed-off-by: Dmitry Mastykin <mastichi@gmail.com>
---
 drivers/input/touchscreen/himax_hx83112b.c | 135 ++++++++++++++++++++-
 1 file changed, 131 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/himax_hx83112b.c b/drivers/input/touchscreen/himax_hx83112b.c
index 8f112e3038dd..6cabc0fadb68 100644
--- a/drivers/input/touchscreen/himax_hx83112b.c
+++ b/drivers/input/touchscreen/himax_hx83112b.c
@@ -42,6 +42,11 @@
 
 #define HIMAX_INVALID_COORD		0xffff
 
+/* default resolution in points/mm */
+#define HIMAX_RESOLUTION		10
+
+#define HIMAX_SENSING_CHANNELS		1600
+
 struct himax_event_point {
 	__be16 x;
 	__be16 y;
@@ -54,9 +59,32 @@ struct himax_event {
 	u8 num_points;
 	u8 pad1[2];
 	u8 checksum_fix;
+	__be16 p_x;
+	__be16 p_y;
+	__be16 p_w;
+	union {
+		struct {
+			s8 tilt_x;
+			u8 hover;
+			u8 btn;
+			u8 btn2;
+			s8 tilt_y;
+			u8 pad;
+		} p_v1;
+		struct {
+			s8 tilt_x;
+			s8 tilt_y;
+			u8 status;
+			u8 pad[3];
+		} p_v2;
+	};
 } __packed;
 
-static_assert(sizeof(struct himax_event) == 56);
+#define HIMAX_PEN_HOVER		BIT(0)
+#define HIMAX_PEN_BTN		BIT(1)
+#define HIMAX_PEN_BTN2		BIT(2)
+
+static_assert(sizeof(struct himax_event) == 68);
 
 struct himax_ts_data;
 struct himax_chip {
@@ -70,9 +98,12 @@ struct himax_ts_data {
 	const struct himax_chip *chip;
 	struct gpio_desc *gpiod_rst;
 	struct input_dev *input_dev;
+	struct input_dev *pen_input_dev;
 	struct i2c_client *client;
 	struct regmap *regmap;
+	u32 pen;
 	struct touchscreen_properties props;
+	struct touchscreen_properties pen_props;
 };
 
 static const struct regmap_config himax_regmap_config = {
@@ -214,6 +245,52 @@ static int himax_input_register(struct himax_ts_data *ts)
 	return 0;
 }
 
+static int himax_pen_input_register(struct himax_ts_data *ts)
+{
+	struct input_dev *input;
+	int error;
+	u32 x_mm, y_mm;
+
+	input = devm_input_allocate_device(&ts->client->dev);
+	if (!input) {
+		dev_err(&ts->client->dev, "Failed to allocate input device\n");
+		return -ENOMEM;
+	}
+	ts->pen_input_dev = input;
+
+	input->name = "Himax Pen Input";
+
+	if (device_property_read_u32(&ts->client->dev, "touchscreen-x-mm", &x_mm) ||
+	    device_property_read_u32(&ts->client->dev, "touchscreen-y-mm", &y_mm)) {
+		input_abs_set_res(input, ABS_X, HIMAX_RESOLUTION);
+		input_abs_set_res(input, ABS_Y, HIMAX_RESOLUTION);
+	} else {
+		input_abs_set_res(input, ABS_X, HIMAX_SENSING_CHANNELS / x_mm);
+		input_abs_set_res(input, ABS_Y, HIMAX_SENSING_CHANNELS / y_mm);
+	}
+
+	input_set_capability(input, EV_ABS, ABS_X);
+	input_set_capability(input, EV_ABS, ABS_Y);
+	input_set_abs_params(input, ABS_PRESSURE, 0, 4095, 0, 0);
+	input_set_abs_params(input, ABS_TILT_X, -60, 60, 0, 0);
+	input_set_abs_params(input, ABS_TILT_Y, -60, 60, 0, 0);
+	input_set_capability(input, EV_KEY, BTN_TOUCH);
+	input_set_capability(input, EV_KEY, BTN_STYLUS);
+	input_set_capability(input, EV_KEY, BTN_STYLUS2);
+	input_set_capability(input, EV_KEY, BTN_TOOL_PEN);
+
+	touchscreen_parse_properties_prefix(ts->pen_input_dev, false, &ts->pen_props, "pen");
+
+	error = input_register_device(input);
+	if (error) {
+		dev_err(&ts->client->dev,
+			"Failed to register input device: %d\n", error);
+		return error;
+	}
+
+	return 0;
+}
+
 static u8 himax_event_get_num_points(const struct himax_event *event)
 {
 	if (event->num_points == 0xff)
@@ -257,6 +334,45 @@ static void himax_process_event(struct himax_ts_data *ts,
 	input_sync(ts->input_dev);
 }
 
+static void himax_process_pen(struct himax_ts_data *ts,
+			      const struct himax_event *event)
+{
+	struct input_dev *dev = ts->pen_input_dev;
+	s8 tilt_x, tilt_y;
+	bool hover, btn, btn2;
+	u16 x = be16_to_cpu(event->p_x);
+	u16 y = be16_to_cpu(event->p_y);
+	bool valid = x < ts->pen_props.max_x && y < ts->pen_props.max_y;
+
+	if (ts->pen == 2) {
+		tilt_x = event->p_v2.tilt_x;
+		tilt_y = event->p_v2.tilt_y;
+		hover = event->p_v2.status & HIMAX_PEN_HOVER;
+		btn = event->p_v2.status & HIMAX_PEN_BTN;
+		btn2 = event->p_v2.status & HIMAX_PEN_BTN2;
+	} else {
+		tilt_x = event->p_v1.tilt_x;
+		tilt_y = event->p_v1.tilt_y;
+		hover = event->p_v1.hover;
+		btn = event->p_v1.btn;
+		btn2 = event->p_v1.btn2;
+	}
+
+	input_report_key(dev, BTN_TOOL_PEN, valid);
+
+	if (valid) {
+		input_report_key(dev, BTN_TOUCH, !hover);
+		touchscreen_report_pos(dev, &ts->pen_props, x, y, false);
+		input_report_abs(dev, ABS_PRESSURE, be16_to_cpu(event->p_w));
+		input_report_abs(dev, ABS_TILT_X, tilt_x);
+		input_report_abs(dev, ABS_TILT_Y, tilt_y);
+		input_report_key(dev, BTN_STYLUS, btn);
+		input_report_key(dev, BTN_STYLUS2, btn2);
+	}
+
+	input_sync(dev);
+}
+
 static bool himax_verify_checksum(struct himax_ts_data *ts,
 				  const struct himax_event *event)
 {
@@ -264,7 +380,7 @@ static bool himax_verify_checksum(struct himax_ts_data *ts,
 	int i;
 	u16 checksum = 0;
 
-	for (i = 0; i < sizeof(*event); i++)
+	for (i = 0; i <= offsetof(struct himax_event, checksum_fix); i++)
 		checksum += data[i];
 
 	if ((checksum & 0x00ff) != 0) {
@@ -293,8 +409,9 @@ static int himax_handle_input(struct himax_ts_data *ts)
 {
 	int error;
 	struct himax_event event;
+	size_t length = ts->pen ? sizeof(event) : offsetof(struct himax_event, p_x);
 
-	error = ts->chip->read_events(ts, &event, sizeof(event));
+	error = ts->chip->read_events(ts, &event, length);
 	if (error) {
 		dev_err(&ts->client->dev, "Failed to read input event: %d\n",
 			error);
@@ -305,8 +422,11 @@ static int himax_handle_input(struct himax_ts_data *ts)
 	 * Only process the current event when it has a valid checksum but
 	 * don't consider it a fatal error when it doesn't.
 	 */
-	if (himax_verify_checksum(ts, &event))
+	if (himax_verify_checksum(ts, &event)) {
 		himax_process_event(ts, &event);
+		if (ts->pen)
+			himax_process_pen(ts, &event);
+	}
 
 	return 0;
 }
@@ -368,6 +488,13 @@ static int himax_probe(struct i2c_client *client)
 	if (error)
 		return error;
 
+	device_property_read_u32(dev, "pen-present", &ts->pen);
+	if (ts->pen) {
+		error = himax_pen_input_register(ts);
+		if (error)
+			return error;
+	}
+
 	error = devm_request_threaded_irq(dev, client->irq, NULL,
 					  himax_irq_handler, IRQF_ONESHOT,
 					  client->name, ts);
-- 
2.34.1


