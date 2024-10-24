Return-Path: <linux-input+bounces-7685-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD3F9AE6A2
	for <lists+linux-input@lfdr.de>; Thu, 24 Oct 2024 15:34:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D12DC2877FD
	for <lists+linux-input@lfdr.de>; Thu, 24 Oct 2024 13:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C771EABCF;
	Thu, 24 Oct 2024 13:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EVJMBPte"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A741E32A5
	for <linux-input@vger.kernel.org>; Thu, 24 Oct 2024 13:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729776555; cv=none; b=jssiWbruYV9p5XOHOQESjZ2g1Fyf7sQxrVKq6Lu39T7/hRi7rpYDE7d0rCTxyP7cKfDlaYMbfruXbEkc4pEH1LWfWCMKRHH6gFbw4BJnEJqy2KHwdhIj2MkAlLIq4zCW0hnVIij7B2xzBeeM87rgSMTREeA4Dv/CRq4W/9OdLx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729776555; c=relaxed/simple;
	bh=TNFGg/CYQGxNs+Ld3XxJZ5IfmtwWB2COK0LRP9AdQLs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YiMijSZ0k8nvD6OVgCIKQeAMbK6sg1KWinJAjLoeqXpDpaslaek/MQI29aufXpCCTgKNgq38KGa5rG6oGyIRlVUVWrjmS9LC9IFwjw3TfzIJFaQAJZve+5X7K9j6HaBZpsoag7nhgmSTs9BlUOzLNmwEK/Njg9GGwSPBKmJLtlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EVJMBPte; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7b14f3927ddso56405285a.3
        for <linux-input@vger.kernel.org>; Thu, 24 Oct 2024 06:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729776550; x=1730381350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2mADvfbNearZia5yRK0i07ANDp2oc6aBLBYcSmlyDG4=;
        b=EVJMBPteZafBmJap6zDFwn8Z+zsrfzDjto8H3WRlNBNkpzz2XqMSTS2ws2kdzGlgc+
         e4ScBYtOzT1IhMS2UMzXS8mUH8kJQh17+MX9y3MRSMhkj5bBR+tweuQrV5MeAWEVrWx2
         TI9dPpRCLjMJKDtT8H3qZ364tD9RLfze+473g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729776550; x=1730381350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2mADvfbNearZia5yRK0i07ANDp2oc6aBLBYcSmlyDG4=;
        b=YbgBimr3vsYN4pwnedj2S7aHJQlzr17kNKH7edRCIcNwPXhwcaXjK+buRsEcUWky8e
         IgUeSIPvwgVIEsvsn6CHDXCwyp34QegUObzKigFEz/EhwOCK6tRXsQsiFfm/s4x7DHUW
         eYE4UpQkdMPYMu4/3BDFSslhm5emjvUWe5Tbq0s+f+oziYns5lH48vLe4+20GxN7zBTF
         ObWm2J6g9maMCkffZTef48V+K05l6TygMdpugZGD067iRc/uVwsIbq7Rw6baF9GZbjep
         938MUmppF8Pq0esQV5BzFIKbv4kCehTyzCOK4SghQl1XRDq4egmYEsbp0t/2DcejjuuM
         AHrw==
X-Forwarded-Encrypted: i=1; AJvYcCXXZeEaLIhzUIpvop3zP5wva754cjZkfxJP9Fe38JGtf41M8DETr6Vcem1YLkj61ybuNyA67llWP+0dEg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyinl/MqyS0u0zf0wh95nsECk7gAwVRW6Wbg1Rf2SPYFRTwinOj
	9aT0i4329imQLSY0ELl2XIjydJ/9vlrjCKJeW5ZVm/erApdkHiT+8bQVS0vWXg==
X-Google-Smtp-Source: AGHT+IGLbXLa5kyweKu7WefNH+VU10qvs7wfcV2860hFBGJU+bW6CxA3VhN5gpV4uuydTUUtEpHUDQ==
X-Received: by 2002:a05:620a:4720:b0:7a1:62ad:9d89 with SMTP id af79cd13be357-7b186d12a38mr205596785a.64.1729776549881;
        Thu, 24 Oct 2024 06:29:09 -0700 (PDT)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b165a5d663sm484204885a.94.2024.10.24.06.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 06:29:09 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 24 Oct 2024 13:29:07 +0000
Subject: [PATCH 3/3] iio: hid-sensor-prox: Add support for more channels
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-hpd-v1-3-2a125882f1f8@chromium.org>
References: <20241024-hpd-v1-0-2a125882f1f8@chromium.org>
In-Reply-To: <20241024-hpd-v1-0-2a125882f1f8@chromium.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>
Cc: Harvey Yang <chenghaoyang@google.com>, linux-input@vger.kernel.org, 
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Egis620 supports 3 channels: presense, proximity and attention.

Modify the driver so it can read those channels as well.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/iio/light/hid-sensor-prox.c | 161 ++++++++++++++++++++----------------
 1 file changed, 89 insertions(+), 72 deletions(-)

diff --git a/drivers/iio/light/hid-sensor-prox.c b/drivers/iio/light/hid-sensor-prox.c
index d38564fe22df..97550d0d21a9 100644
--- a/drivers/iio/light/hid-sensor-prox.c
+++ b/drivers/iio/light/hid-sensor-prox.c
@@ -13,16 +13,26 @@
 #include <linux/iio/buffer.h>
 #include "../common/hid-sensors/hid-sensor-trigger.h"
 
-#define CHANNEL_SCAN_INDEX_PRESENCE 0
+static const u32 prox_usage_ids[] = {
+	HID_USAGE_SENSOR_HUMAN_PRESENCE,
+	HID_USAGE_SENSOR_HUMAN_PROXIMITY,
+	HID_USAGE_SENSOR_HUMAN_ATTENTION,
+};
+
+#define MAX_USAGE ARRAY_SIZE(prox_usage_ids)
 
 struct prox_state {
 	struct hid_sensor_hub_callbacks callbacks;
 	struct hid_sensor_common common_attributes;
-	struct hid_sensor_hub_attribute_info prox_attr;
-	u32 human_presence;
+	struct hid_sensor_hub_attribute_info prox_attr[MAX_USAGE];
+	struct iio_chan_spec channels[MAX_USAGE];
+	u32 channel2usage[MAX_USAGE];
+	u32 human_presence[MAX_USAGE];
 	int scale_pre_decml;
 	int scale_post_decml;
 	int scale_precision;
+	unsigned long scan_mask[2];
+	int num_channels;
 };
 
 static const u32 prox_sensitivity_addresses[] = {
@@ -30,17 +40,23 @@ static const u32 prox_sensitivity_addresses[] = {
 	HID_USAGE_SENSOR_DATA_PRESENCE,
 };
 
-/* Channel definitions */
-static const struct iio_chan_spec prox_channels[] = {
-	{
-		.type = IIO_PROXIMITY,
-		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
-		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_OFFSET) |
-		BIT(IIO_CHAN_INFO_SCALE) |
-		BIT(IIO_CHAN_INFO_SAMP_FREQ) |
-		BIT(IIO_CHAN_INFO_HYSTERESIS),
-		.scan_index = CHANNEL_SCAN_INDEX_PRESENCE,
+#define PROX_CHANNEL(_indexed, _channel) \
+	{\
+		.type = IIO_PROXIMITY,\
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),\
+		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_OFFSET) |\
+		BIT(IIO_CHAN_INFO_SCALE) |\
+		BIT(IIO_CHAN_INFO_SAMP_FREQ) |\
+		BIT(IIO_CHAN_INFO_HYSTERESIS),\
+		.indexed = _indexed,\
+		.channel = _channel,\
 	}
+
+/* Channel definitions (same order as prox_usage_ids) */
+static const struct iio_chan_spec prox_channels[] = {
+	PROX_CHANNEL(false, 0), // PRESENCE
+	PROX_CHANNEL(true, 1), // PROXIMITY
+	PROX_CHANNEL(true, 2), // ATTENTION
 };
 
 /* Adjust channel real bits based on report descriptor */
@@ -62,7 +78,7 @@ static int prox_read_raw(struct iio_dev *indio_dev,
 {
 	struct prox_state *prox_state = iio_priv(indio_dev);
 	struct hid_sensor_hub_device *hsdev;
-	int report_id = -1;
+	int report_id;
 	u32 address;
 	int ret_type;
 	s32 min;
@@ -71,29 +87,22 @@ static int prox_read_raw(struct iio_dev *indio_dev,
 	*val2 = 0;
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
-		switch (chan->scan_index) {
-		case  CHANNEL_SCAN_INDEX_PRESENCE:
-			report_id = prox_state->prox_attr.report_id;
-			min = prox_state->prox_attr.logical_minimum;
-			address = HID_USAGE_SENSOR_HUMAN_PRESENCE;
-			hsdev = prox_state->common_attributes.hsdev;
-			break;
-		default:
-			report_id = -1;
-			break;
-		}
-		if (report_id >= 0) {
-			hid_sensor_power_state(&prox_state->common_attributes,
-						true);
-			*val = sensor_hub_input_attr_get_raw_value(
-				hsdev, hsdev->usage, address, report_id,
-				SENSOR_HUB_SYNC, min < 0);
-			hid_sensor_power_state(&prox_state->common_attributes,
-						false);
-		} else {
+		if (chan->scan_index >= prox_state->num_channels) {
 			*val = 0;
 			return -EINVAL;
 		}
+		address = prox_state->channel2usage[chan->scan_index];
+		report_id = prox_state->prox_attr[chan->scan_index].report_id;
+		hsdev = prox_state->common_attributes.hsdev;
+		min = prox_state->prox_attr[chan->scan_index].logical_minimum;
+		hid_sensor_power_state(&prox_state->common_attributes, true);
+		*val = sensor_hub_input_attr_get_raw_value(hsdev,
+							   hsdev->usage,
+							   address,
+							   report_id,
+							   SENSOR_HUB_SYNC,
+							   min < 0);
+		hid_sensor_power_state(&prox_state->common_attributes, false);
 		ret_type = IIO_VAL_INT;
 		break;
 	case IIO_CHAN_INFO_SCALE:
@@ -103,7 +112,7 @@ static int prox_read_raw(struct iio_dev *indio_dev,
 		break;
 	case IIO_CHAN_INFO_OFFSET:
 		*val = hid_sensor_convert_exponent(
-				prox_state->prox_attr.unit_expo);
+			prox_state->prox_attr[chan->scan_index].unit_expo);
 		ret_type = IIO_VAL_INT;
 		break;
 	case IIO_CHAN_INFO_SAMP_FREQ:
@@ -178,48 +187,63 @@ static int prox_capture_sample(struct hid_sensor_hub_device *hsdev,
 {
 	struct iio_dev *indio_dev = platform_get_drvdata(priv);
 	struct prox_state *prox_state = iio_priv(indio_dev);
-	int ret = -EINVAL;
-
-	switch (usage_id) {
-	case HID_USAGE_SENSOR_HUMAN_PRESENCE:
-		switch (raw_len) {
-		case 1:
-			prox_state->human_presence = *(u8 *)raw_data;
-			return 0;
-		case 4:
-			prox_state->human_presence = *(u32 *)raw_data;
-			return 0;
-		default:
+	int chan;
+
+	for (chan = 0; chan < prox_state->num_channels; chan++)
+		if (prox_state->channel2usage[chan] == usage_id)
 			break;
-		}
+	if (chan == prox_state->num_channels)
+		return -EINVAL;
+
+	switch (raw_len) {
+	case 1:
+		prox_state->human_presence[chan] = *(u8 *)raw_data;
+		break;
+	case 4:
+		prox_state->human_presence[chan] = *(u32 *)raw_data;
 		break;
 	}
 
-	return ret;
+	return 0;
 }
 
 /* Parse report which is specific to an usage id*/
 static int prox_parse_report(struct platform_device *pdev,
 				struct hid_sensor_hub_device *hsdev,
-				struct iio_chan_spec *channels,
-				unsigned usage_id,
 				struct prox_state *st)
 {
+	struct iio_chan_spec *channels = st->channels;
+	int index = 0;
 	int ret;
+	int i;
+
+	for (i = 0; i < MAX_USAGE; i++) {
+		u32 usage_id = prox_usage_ids[i];
+
+		ret = sensor_hub_input_get_attribute_info(hsdev,
+							  HID_INPUT_REPORT,
+							  hsdev->usage,
+							  usage_id,
+							  &st->prox_attr[index]);
+		if (ret < 0)
+			continue;
+		st->channel2usage[index] = usage_id;
+		st->scan_mask[0] |= BIT(index);
+		channels[index] = prox_channels[i];
+		channels[index].scan_index = index;
+		prox_adjust_channel_bit_mask(channels, index,
+					     st->prox_attr[index].size);
+		dev_dbg(&pdev->dev, "prox %x:%x\n", st->prox_attr[index].index,
+			st->prox_attr[index].report_id);
+		index++;
+	}
 
-	ret = sensor_hub_input_get_attribute_info(hsdev, HID_INPUT_REPORT,
-			usage_id,
-			HID_USAGE_SENSOR_HUMAN_PRESENCE,
-			&st->prox_attr);
-	if (ret < 0)
+	if (!index)
 		return ret;
-	prox_adjust_channel_bit_mask(channels, CHANNEL_SCAN_INDEX_PRESENCE,
-					st->prox_attr.size);
 
-	dev_dbg(&pdev->dev, "prox %x:%x\n", st->prox_attr.index,
-			st->prox_attr.report_id);
+	st->num_channels = index;
 
-	return ret;
+	return 0;
 }
 
 /* Function to initialize the processing for usage id */
@@ -250,22 +274,15 @@ static int hid_prox_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	indio_dev->channels = devm_kmemdup(&pdev->dev, prox_channels,
-					   sizeof(prox_channels), GFP_KERNEL);
-	if (!indio_dev->channels) {
-		dev_err(&pdev->dev, "failed to duplicate channels\n");
-		return -ENOMEM;
-	}
-
-	ret = prox_parse_report(pdev, hsdev,
-				(struct iio_chan_spec *)indio_dev->channels,
-				hsdev->usage, prox_state);
+	ret = prox_parse_report(pdev, hsdev, prox_state);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to setup attributes\n");
 		return ret;
 	}
 
-	indio_dev->num_channels = ARRAY_SIZE(prox_channels);
+	indio_dev->num_channels = prox_state->num_channels;
+	indio_dev->channels = prox_state->channels;
+	indio_dev->available_scan_masks = prox_state->scan_mask;
 	indio_dev->info = &prox_info;
 	indio_dev->name = name;
 	indio_dev->modes = INDIO_DIRECT_MODE;

-- 
2.47.0.163.g1226f6d8fa-goog


