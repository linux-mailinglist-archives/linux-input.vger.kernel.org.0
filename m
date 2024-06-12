Return-Path: <linux-input+bounces-4317-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD247904A79
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2024 07:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6363C2861B6
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2024 05:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7298017554;
	Wed, 12 Jun 2024 05:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nrSolmhU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D49EBB;
	Wed, 12 Jun 2024 05:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718168455; cv=none; b=MYrnguLjnEu3yAJHbOND/GnpJ3t7uww5RkSEeuyAi7XgcXJdpudMrM3ILXVFzwZZhotIOlrvb05R/goxttfOEKAqQP+szwzISWBza8zzQ6QnDA0AjbWq9KcXvYWfhG2c3JTgCOibihzOFYHlSW8IL4NaLyw3nxbs0klJ6dvYaL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718168455; c=relaxed/simple;
	bh=pUZbG4dRw6DOQHVtB7eRBiZagwUVQ+Rn/8Jy0h8c/bo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GGQVOojWWCCU9o4HbgvJzwt6rkwJjamiu2VAINU+VJ7qAspKG0H0cY9DZQhH6kUmj2kd9yJmH1Y003cHOz+ccgIl2YJXrpBRALRiGNjLhSGEtP4jhgaUQlRGLzf4OlqaEiZPD/l8WCzHLxix95osqPhVzZi5JQGccuo8pr0A6Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nrSolmhU; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5b96a78639aso2374065eaf.1;
        Tue, 11 Jun 2024 22:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718168452; x=1718773252; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MPQ0qcV02FjoRMfjP+xCv710BIEkoePevH4s4xiN0Mo=;
        b=nrSolmhUgxBEinECgyifZqCVeo8ZamvGia114j7Zb4lYeF85PIN7dDmYQNY0VTbolt
         LEwTbtTjI5pKlA84XtgYW1M6RxlGyswJGSNsMJzXtGJLAmOv2scSQYFqDElxJ84c7fN2
         hHUGQY3rqO6dncz6oX1lhMwvek6xBapUh+zKZjAgcDRNVcPK2UO8M3NEi+Qyziw4TukZ
         iJdCaiA8AT7FQq31u98L0f75TjgIxaj74gFnPr+8WNc0wKBr1n8R5b2hjqjqQsS9ar15
         /OzwpVWPE5Lpqb94m0d4sCENnR9PDhVK2ogQLKDa0kWHNhvd1kpjRFfeMeqpuEH74NSq
         9++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718168452; x=1718773252;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MPQ0qcV02FjoRMfjP+xCv710BIEkoePevH4s4xiN0Mo=;
        b=TZE80fkVt7VSYH/+lDEEzI30CwnobRxjgIH1yaxbFOp0h7Fq/36Qbv92sgVkaG2LB4
         sVHxrN1Szj033ZBmY549HPHVXoninJydckdlmErK5kupze2Q/HgammyAPjtHTTn0f3xn
         +c0eOEjoXo1FUAnPp3Z7896edgN2im6p9ZB29IHtGwTqic3OL/k8tJ0zHE9Unjn7xgkf
         eaDxaLCqAGeIwfUu4qFjXb9qBM+6tTm/mGaDbRreufv5Om9DWX6+TYmbKJjF7T80aoYj
         MpAGjD8ZKPZiZKEQ9X/1uo0bUfmUXRCtVRDXvbz8WGeEGw8olFswGWRuh04qNUcrbVpI
         mBbw==
X-Forwarded-Encrypted: i=1; AJvYcCWWd0LqPQA61Ep9No0eYTXcYtAy1lJYx7XvtERRIpF5PNuVM3lSfnlICyThbLiy9wA5iuKPwSGJ92dyECBM++Att+4gG5amxT1FVULl
X-Gm-Message-State: AOJu0YxWcdSSD2yWbR5bQVAiDbchsPmnp8OCYdlieOW9nKIq2uveicpo
	VsSVsWLW8ogCBATcJ6vRnywjvLLaZ7cjxo0u8Nxj2eDaJU6t5at3fGhM0g==
X-Google-Smtp-Source: AGHT+IE7cwQlnP8XssjdJ4I32Wzy2I2kiJur6j6ONQonjsYJAd8BlEnMWlqSVONd6cfUlCmPuiFDGw==
X-Received: by 2002:a05:6358:568a:b0:19f:36bc:9d7a with SMTP id e5c5f4694b2df-19f69d2a221mr112265255d.1.1718168452304;
        Tue, 11 Jun 2024 22:00:52 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:3077:52c7:3e56:8d61])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6de212bdbf9sm8083820a12.28.2024.06.11.22.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 22:00:52 -0700 (PDT)
Date: Tue, 11 Jun 2024 22:00:49 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
Cc: Artur Rojek <contact@artur-rojek.eu>,
	Chris Morgan <macromorgan@hotmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] Input: adc-joystick - move axes data into the main
 structure
Message-ID: <ZmkrgTlxNwm_oHxv@google.com>
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

v2:

- fixed issue with uninitialized "axes" in adc_joystick_set_axes()
  pointed out by Dan Carpenter
- fixed issue with checking wrong variable in adc_joystick_probe()
  pointed out by Dan Carpenter

 drivers/input/joystick/adc-joystick.c | 113 ++++++++++++++------------
 1 file changed, 60 insertions(+), 53 deletions(-)

diff --git a/drivers/input/joystick/adc-joystick.c b/drivers/input/joystick/adc-joystick.c
index 916e78e4dc9f..1e30cbcd8c61 100644
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
@@ -135,9 +131,11 @@ static void adc_joystick_cleanup(void *data)
 
 static int adc_joystick_set_axes(struct device *dev, struct adc_joystick *joy)
 {
-	struct adc_joystick_axis *axes;
+	struct adc_joystick_axis *axes = joy->axes;
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
@@ -206,23 +196,49 @@ static int adc_joystick_set_axes(struct device *dev, struct adc_joystick *joy)
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
-		error = PTR_ERR(joy->chans);
+	chans = devm_iio_channel_get_all(dev);
+	error = PTR_ERR_OR_ZERO(chans);
+	if (error) {
 		if (error != -EPROBE_DEFER)
 			dev_err(dev, "Unable to get IIO channels");
 		return error;
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

