Return-Path: <linux-input+bounces-8409-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E633A9E561F
	for <lists+linux-input@lfdr.de>; Thu,  5 Dec 2024 14:02:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51F4D16C3F4
	for <lists+linux-input@lfdr.de>; Thu,  5 Dec 2024 13:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E7A3218AD1;
	Thu,  5 Dec 2024 12:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oYN0ZAhy"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB57B218ABF
	for <linux-input@vger.kernel.org>; Thu,  5 Dec 2024 12:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733403567; cv=none; b=BCOx9DAVpMWKlQgI+f31QM3anyKgt5HYW755t3zVOF/5rSi1sxQcRqwZK6AxuQoGhk6OHmUJ26yD04Tkb9TTocrQyeTSXQRMB6n5A3jsoDShr9KGjMx4m3zuGMoiJtSid4xvF4r/oky5a9YPp1U7lY/wrl0Oc3XRn77xWAxq0GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733403567; c=relaxed/simple;
	bh=ebx+GgY3hNlUc59VsaJ6hQUiwXrTKNYfGaLlqqc/Vzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=d0BFcXzD8MUzqOiOMNq8b+X+msu/J8KuAHiPmpAl7F9B33AeniHklJ0w3U4B+tn0uOvgG+KWICGZOwM69mgLH7/XQrcngUZIlY0Wk0qbXhv9RGJDD4LDK2agiE1bbdik368yaXeo7vwbMbtlhvTfXkVNM1gKivNQtFpjRkFTZ1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oYN0ZAhy; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-51544e9a0abso1020450e0c.1
        for <linux-input@vger.kernel.org>; Thu, 05 Dec 2024 04:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733403564; x=1734008364; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VwfcoPBjO/Q1HvZfrTkBp1X4/TXkK2jPxvYFzVie8mc=;
        b=oYN0ZAhyWAadi65bgqyi3OBNDykGmEXE99qDKNiXZI1VX8Y5rimkX4KiQ9HdsOuJ+R
         rXj3K54cS8AqR/jWx9puxmFWsPiL+VsrOjDeU36+P1/RgKtH7bCMvRzVWY20+R16Gtit
         4R2xuhmd+aurIh9p/brDxFj2LjSlcX3LLMLbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733403564; x=1734008364;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VwfcoPBjO/Q1HvZfrTkBp1X4/TXkK2jPxvYFzVie8mc=;
        b=vt4OAnt29ip3DRv2Z+V6PZbOMSHBmcSrf5ktm9gW0hUzF3RQ9cbJ9Ty3jsk0bO9ma9
         OD9iczK9Z0p29q0//f5KO1dUo/vy1dZqRyW7wyN/S9dOFzQnxBV27z6rK1OywALW2lhV
         wrFxeI7xdC+dNJpihVD1PsQzDmN6qD3RnbpQ+r+qxHJEMmBng9ARuDTqgIPXb08Jk3xZ
         SlS40CUXESfSxvbwkZ9/BT/vX+bDM6RDr0yvKdFPlIBKaQV1atTElzJ4inCCxbC8hu4c
         OkAQaO4iV+IX27AUoARBhATEgawm/Qktp/z3IeB48haD8UARRie8KCOHQ2G0bcpLRX03
         SkVw==
X-Forwarded-Encrypted: i=1; AJvYcCUH2+HYvUWNFxpS+zwN66/mqcSt4lJviiWay9YG/NjlfX2tCTk7MX4DuEcrkz6Fp/yn59IPZs0u688taQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHMphdzmvCNySbuRhT0o4T2tbJALjfkpr6GvjEfKz/V6yFtdKg
	bAl9RPLn64UAuCo7adSu/U+BBZvyeKTXrYqRRswrq13spd2oDuycqEkzh+FEBA==
X-Gm-Gg: ASbGncvFHy0saRdblSe2Mx+YntQRUvrkHPcU0QzxxaNN/TlacoIwQb9FfWFK5a3ZTzw
	4YmuTpr0t8Bq857SmSm/O+3jMeLFgqVBsQkkM3szB3jeleGkDfh80xbUrrLTw+FFsPYusJowE8b
	5ouPu44FEmeMu0LXEALIfKymMAVmSEVWIVPbTWGjGr9O8lklktgP3w5zobtFRZEYx+x8PGLJEpV
	x4RJYtS+ZRh7IvTkd7/NBcuj1vliF0Vnp3Ct1tyKqokkvrxFDmmMcLmABUNeDGu6TXhhOtVaBOi
	DXy7I6zIhItM8te5xP+/gziB
X-Google-Smtp-Source: AGHT+IHRLV21fZ2rD9jYQl6Ini+eOswxWXzZy6lQU7eAzpT6Z49VS53HCUoS496Q7JbrKuLSk5piYQ==
X-Received: by 2002:a05:6122:4a:b0:515:43ff:6ed8 with SMTP id 71dfb90a1353d-515e6fee69fmr2528809e0c.5.1733403564563;
        Thu, 05 Dec 2024 04:59:24 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-515eacb5775sm119244e0c.0.2024.12.05.04.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 04:59:23 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 05 Dec 2024 12:59:20 +0000
Subject: [PATCH] iio: hid-sensor-prox: Merge information from different
 channels
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-fix-hid-sensor-v1-1-9b789f39c220@chromium.org>
X-B4-Tracking: v=1; b=H4sIAKejUWcC/x2MywqAIBAAf0X23IKPKOxXokPolnvRcCEC6d+Tj
 gMz00CoMgksqkGlm4VL7mAGBSHt+STk2BmstqOx2uHBDyaOKJSlVJwsGT97ClE76NFVqRv/cN3
 e9wNNr+8gYAAAAA==
To: Jiri Kosina <jikos@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 linux-input@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The device only provides a single scale, frequency and hysteresis for
all the channels. Fix the info_mask_* to match the reality of the
device.

Without this patch:
in_attention_scale
in_attention_hysteresis
in_attention_input
in_attention_offset
in_attention_sampling_frequency
in_proximity_scale
in_proximity_sampling_frequency
in_proximity_offset
in_proximity0_raw
in_proximity_hysteresis

With this patch:
hysteresis
scale
sampling_frequency
in_attention_input
in_attention_offset
in_proximity0_offset
in_proximity0_raw

Fixes: 596ef5cf654b ("iio: hid-sensor-prox: Add support for more channels")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/iio/light/hid-sensor-prox.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/light/hid-sensor-prox.c b/drivers/iio/light/hid-sensor-prox.c
index e8e7b2999b4c..f21d2da4c7f9 100644
--- a/drivers/iio/light/hid-sensor-prox.c
+++ b/drivers/iio/light/hid-sensor-prox.c
@@ -49,9 +49,11 @@ static const u32 prox_sensitivity_addresses[] = {
 #define PROX_CHANNEL(_is_proximity, _channel) \
 	{\
 		.type = _is_proximity ? IIO_PROXIMITY : IIO_ATTENTION,\
-		.info_mask_separate = _is_proximity ? BIT(IIO_CHAN_INFO_RAW) :\
-				      BIT(IIO_CHAN_INFO_PROCESSED),\
-		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_OFFSET) |\
+		.info_mask_separate = \
+		(_is_proximity ? BIT(IIO_CHAN_INFO_RAW) :\
+				BIT(IIO_CHAN_INFO_PROCESSED)) |\
+		BIT(IIO_CHAN_INFO_OFFSET),\
+		.info_mask_shared_by_all = \
 		BIT(IIO_CHAN_INFO_SCALE) |\
 		BIT(IIO_CHAN_INFO_SAMP_FREQ) |\
 		BIT(IIO_CHAN_INFO_HYSTERESIS),\

---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241203-fix-hid-sensor-62e1979ecd03

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


