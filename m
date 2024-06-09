Return-Path: <linux-input+bounces-4274-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C82F0901862
	for <lists+linux-input@lfdr.de>; Sun,  9 Jun 2024 23:58:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37242B20E29
	for <lists+linux-input@lfdr.de>; Sun,  9 Jun 2024 21:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FA36558A0;
	Sun,  9 Jun 2024 21:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iTcD/EDS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B3F55884;
	Sun,  9 Jun 2024 21:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717970306; cv=none; b=jN6kgdzbQMuu/EcAVxz5kzyBxpp5sfrBZnJ738R9h6FmpMWLc/2wIGQ+Wr6GM/zSsorB23oJ4GLM2ZYAaa3Zw99uYXNNcJ5fcr+7O1zbW1DPT9AD0fWPZbRwlWiC0Rp4Q/10bHMrLtPj2LbI4mIhaBI6nrjYmOooylPc96Q1mw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717970306; c=relaxed/simple;
	bh=BLNRlLZcSZwJWL6MzAWuQ1g07yuob1shfIQpjGpM5GI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nHSWNZRbx28YTxC1b9fvRQvTK2ZoEOvbyQ/KTQK97oxmIfZXdIjLDDLNFs71ZE1M7tcY9V+C4AlbTkA/OFIA3ZW9NTjnqLVSlcxFq1ZN4dVoCZ1FI1pMgJs4+OTn7aFHyLWvAmiWYadsSLawB0+S70N+kQ7iNo3fRmCWvMKwgsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iTcD/EDS; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7043102dcc1so831210b3a.2;
        Sun, 09 Jun 2024 14:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717970304; x=1718575104; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q7HmtlL/AvgF2fjjEGHzRGXw6ggXYXkPlkojjmn4GzI=;
        b=iTcD/EDS66RtBx3MG8skj5a0MbiPb4HWmFgZNWqnpYui/CCjn1GSD+iHCBnSFO6Jo0
         dsyLxsHX5jHW0+cZ9eOoQ18vVrWnuCwkr6cVzXzrxtDM5CNrKCV+sHwl/HkXYgA45aRy
         rpAAQnCrG6+KPAvU8G3EFCi7ia8BvjBptTNMPEXG+LXhMLGBhF/Bzei0TV75AIjq0hX/
         wpeM3lD3FHBMqezcf0HmcoBW4lp+OM+HIqbZDY3V7Ntw2/4wkdU8vtfPtW5v4Stf96gR
         N1O4rrIhfuFwkiijWwWoOyiZ7qfWSisOxy6gvvPHULytcK+n6M/6RIDyRwu5ddVPKVGI
         vRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717970304; x=1718575104;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7HmtlL/AvgF2fjjEGHzRGXw6ggXYXkPlkojjmn4GzI=;
        b=l8GoSuylGrLclK+ltwqZCRSw1zeYDh3+kcYGZsIkZ0Yf8hdEXcbroS52QEXReQGcsz
         7Tk6b+oPx39BnmG3S2By7VetJoClGwNUkqlUkKH1BPSdapa0sh1FgffmjsaIgo5u6ddr
         xiobwivyljkz0rXwAhd2R7whwTq+lVEw4p/k9nTcfT0+g4+8YclOPwJrOy8BF+DUMP4I
         At7NPenFt4W/FXUq6H98uargorly0FFBm54Vss44H4q2xi/Q4NLOc+l7+9V63H73G45T
         DyKivx4uHtVdAWVt+MSoMYqRsBl74Cxy1Gz8tk61iMXbcp5dyJ3LD6lDbP8nBJmZ09Eb
         318Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2NXK6Cm5nrZAwUoy16otOOY2o1ZQ+Si+kV8yCAH3tFJJddWTV+i5P44mpAgzMAo2Ku9MaqCfqlCCY1/m8mjjOZxZ+mScUr47KqnoY
X-Gm-Message-State: AOJu0YzN1+ESYFa9ef4NcNHNQOOOsQHfny5kYZVec8Jq5F37l0TkJn95
	Lr6UQZ3G2nV45njjmub1PCyUPiHarqiWx7N1rUNBNjvqZe9GKSEBlxW6Ww==
X-Google-Smtp-Source: AGHT+IHVZysGB0OPFzSHplR3u5dfmdSK9Wf+Bt5m5X3BKMkWi49YY270V/1xYYkTD+DRlWCv2WwUDA==
X-Received: by 2002:a05:6a21:3947:b0:1b6:d83e:a8df with SMTP id adf61e73a8af0-1b6d83ea980mr2708315637.29.1717970303666;
        Sun, 09 Jun 2024 14:58:23 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:55a9:13e9:dec7:f9d3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7041bb50dd1sm3503597b3a.193.2024.06.09.14.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 14:58:23 -0700 (PDT)
Date: Sun, 9 Jun 2024 14:58:20 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Artur Rojek <contact@artur-rojek.eu>,
	Chris Morgan <macromorgan@hotmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Input: adc-joystick - move axes data into the main structure
Message-ID: <ZmYlfKDm5sgB44EU@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

There is no need to allocate axes information separately from the main
joystick structure so let's fold the allocation and also drop members
(such as range, flat and fuzz) that are only used during initialization
of the device.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/joystick/adc-joystick.c | 109 ++++++++++++++------------
 1 file changed, 58 insertions(+), 51 deletions(-)

diff --git a/drivers/input/joystick/adc-joystick.c b/drivers/input/joystick/adc-joystick.c
index 916e78e4dc9f..c71e582aa32d 100644
--- a/drivers/input/joystick/adc-joystick.c
+++ b/drivers/input/joystick/adc-joystick.c
@@ -15,19 +15,15 @@
 
 struct adc_joystick_axis {
 	u32 code;
-	s32 range[2];
-	s32 fuzz;
-	s32 flat;
 	bool inverted;
 };
 
 struct adc_joystick {
 	struct input_dev *input;
 	struct iio_cb_buffer *buffer;
-	struct adc_joystick_axis *axes;
 	struct iio_channel *chans;
-	int num_chans;
-	bool polled;
+	unsigned int num_chans;
+	struct adc_joystick_axis axes[] __counted_by(num_chans);
 };
 
 static int adc_joystick_invert(struct input_dev *dev,
@@ -137,7 +133,9 @@ static int adc_joystick_set_axes(struct device *dev, struct adc_joystick *joy)
 {
 	struct adc_joystick_axis *axes;
 	struct fwnode_handle *child;
-	int num_axes, error, i;
+	s32 range[2], fuzz, flat;
+	unsigned int num_axes;
+	int error, i;
 
 	num_axes = device_get_child_node_count(dev);
 	if (!num_axes) {
@@ -151,10 +149,6 @@ static int adc_joystick_set_axes(struct device *dev, struct adc_joystick *joy)
 		return -EINVAL;
 	}
 
-	axes = devm_kmalloc_array(dev, num_axes, sizeof(*axes), GFP_KERNEL);
-	if (!axes)
-		return -ENOMEM;
-
 	device_for_each_child_node(dev, child) {
 		error = fwnode_property_read_u32(child, "reg", &i);
 		if (error) {
@@ -176,29 +170,25 @@ static int adc_joystick_set_axes(struct device *dev, struct adc_joystick *joy)
 		}
 
 		error = fwnode_property_read_u32_array(child, "abs-range",
-						       axes[i].range, 2);
+						       range, 2);
 		if (error) {
 			dev_err(dev, "abs-range invalid or missing\n");
 			goto err_fwnode_put;
 		}
 
-		if (axes[i].range[0] > axes[i].range[1]) {
+		if (range[0] > range[1]) {
 			dev_dbg(dev, "abs-axis %d inverted\n", i);
 			axes[i].inverted = true;
-			swap(axes[i].range[0], axes[i].range[1]);
+			swap(range[0], range[1]);
 		}
 
-		fwnode_property_read_u32(child, "abs-fuzz", &axes[i].fuzz);
-		fwnode_property_read_u32(child, "abs-flat", &axes[i].flat);
+		fwnode_property_read_u32(child, "abs-fuzz", &fuzz);
+		fwnode_property_read_u32(child, "abs-flat", &flat);
 
 		input_set_abs_params(joy->input, axes[i].code,
-				     axes[i].range[0], axes[i].range[1],
-				     axes[i].fuzz, axes[i].flat);
-		input_set_capability(joy->input, EV_ABS, axes[i].code);
+				     range[0], range[1], fuzz, flat);
 	}
 
-	joy->axes = axes;
-
 	return 0;
 
 err_fwnode_put:
@@ -206,22 +196,48 @@ static int adc_joystick_set_axes(struct device *dev, struct adc_joystick *joy)
 	return error;
 }
 
+
+/*
+ * Count how many channels we got. NULL terminated.
+ * Do not check the storage size if using polling.
+ */
+static int adc_joystick_count_channels(struct device *dev,
+				       const struct iio_channel *chans,
+				       bool polled,
+				       unsigned int *num_chans)
+{
+	int bits;
+	int i;
+
+	for (i = 0; chans[i].indio_dev; i++) {
+		if (polled)
+			continue;
+		bits = chans[i].channel->scan_type.storagebits;
+		if (!bits || bits > 16) {
+			dev_err(dev, "Unsupported channel storage size\n");
+			return -EINVAL;
+		}
+		if (bits != chans[0].channel->scan_type.storagebits) {
+			dev_err(dev, "Channels must have equal storage size\n");
+			return -EINVAL;
+		}
+	}
+
+	return i;
+}
+
 static int adc_joystick_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct iio_channel *chans;
 	struct adc_joystick *joy;
 	struct input_dev *input;
+	unsigned int poll_interval = 0;
+	unsigned int num_chans;
 	int error;
-	int bits;
-	int i;
-	unsigned int poll_interval;
-
-	joy = devm_kzalloc(dev, sizeof(*joy), GFP_KERNEL);
-	if (!joy)
-		return -ENOMEM;
 
-	joy->chans = devm_iio_channel_get_all(dev);
-	if (IS_ERR(joy->chans)) {
+	chans = devm_iio_channel_get_all(dev);
+	if (IS_ERR(chans)) {
 		error = PTR_ERR(joy->chans);
 		if (error != -EPROBE_DEFER)
 			dev_err(dev, "Unable to get IIO channels");
@@ -236,28 +252,19 @@ static int adc_joystick_probe(struct platform_device *pdev)
 	} else if (poll_interval == 0) {
 		dev_err(dev, "Unable to get poll-interval\n");
 		return -EINVAL;
-	} else {
-		joy->polled = true;
 	}
 
-	/*
-	 * Count how many channels we got. NULL terminated.
-	 * Do not check the storage size if using polling.
-	 */
-	for (i = 0; joy->chans[i].indio_dev; i++) {
-		if (joy->polled)
-			continue;
-		bits = joy->chans[i].channel->scan_type.storagebits;
-		if (!bits || bits > 16) {
-			dev_err(dev, "Unsupported channel storage size\n");
-			return -EINVAL;
-		}
-		if (bits != joy->chans[0].channel->scan_type.storagebits) {
-			dev_err(dev, "Channels must have equal storage size\n");
-			return -EINVAL;
-		}
-	}
-	joy->num_chans = i;
+	error = adc_joystick_count_channels(dev, chans, poll_interval != 0,
+					    &num_chans);
+	if (error)
+		return error;
+
+	joy = devm_kzalloc(dev, struct_size(joy, axes, num_chans), GFP_KERNEL);
+	if (!joy)
+		return -ENOMEM;
+
+	joy->chans = chans;
+	joy->num_chans = num_chans;
 
 	input = devm_input_allocate_device(dev);
 	if (!input) {
@@ -273,7 +280,7 @@ static int adc_joystick_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
-	if (joy->polled) {
+	if (poll_interval != 0) {
 		input_setup_polling(input, adc_joystick_poll);
 		input_set_poll_interval(input, poll_interval);
 	} else {
-- 
2.45.2.505.gda0bf45e8d-goog


-- 
Dmitry

