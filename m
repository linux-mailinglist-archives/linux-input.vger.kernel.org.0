Return-Path: <linux-input+bounces-7684-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAD09AE696
	for <lists+linux-input@lfdr.de>; Thu, 24 Oct 2024 15:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ABDA5B20D4B
	for <lists+linux-input@lfdr.de>; Thu, 24 Oct 2024 13:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E85D1E379B;
	Thu, 24 Oct 2024 13:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MBggSU1S"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E061F1E2607
	for <linux-input@vger.kernel.org>; Thu, 24 Oct 2024 13:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729776552; cv=none; b=rgpmwMqirTGMKOc+xEvafgOPKo6I1X5coQq3REWXOA7K1IvsAv0gzhyYWae4LUmhlEvgc0falWVHrKVF1wEEUOLwloutrDThy2U/JiWBM6BtlxH2OX7rQAu/b5KOZ1diao40eJV7I4TlZ28oS3mzyLkIUl0pN23PNSg8dQWcUAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729776552; c=relaxed/simple;
	bh=NTUbVMYf2x+7q0/8Barwlk+9iZKYWLsfR/svD0SOK6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EY7+xddvjybC0+0zg3Ew78Unc0YHjU0siJz8N5pi1X1MUXK0mWn+MGm8ZmbvSftG9tt3p5zZ31EixxdgTBuD+wFKc3nLQ/CY8gBf43ebamBe+8/h2p55uA2iL14lPtwymK0bT992Edd+DFIAizaE0PAQtaNfGAbOa6C+8zmgXkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MBggSU1S; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7b157c9ad12so59772685a.1
        for <linux-input@vger.kernel.org>; Thu, 24 Oct 2024 06:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729776549; x=1730381349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQttLL6CFS2JGt87dEF+H1Jt5OZPaXEa5P0U/qvO3f8=;
        b=MBggSU1SDh8XMM99Bnet7Qijn7f47FNPTREisuC15Ta1JXf0yr0iPgFre/vdLI0/bR
         ynPbTIFaYR7inb6obo/2l9jjCt0Fim8vTyKAtGfbIFk4DyoL2IncraFmLagcy5keEU/j
         K4uNpbJPF2r+0UsEerz3yM+s/htsi25UvYp5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729776549; x=1730381349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQttLL6CFS2JGt87dEF+H1Jt5OZPaXEa5P0U/qvO3f8=;
        b=oFRfJRSBo/c0OjwXShf3AS6CN1k6i7VzRGJby0orUYOsQEDdxFIS1XhHgeeTcG2Rfx
         2VPc5fLit+RbxVaA367CyPy/l8kJrlkfDlxxT2KAcMISrXuWtrHklKoN4DBxMgruJePC
         AIIFzXtcwfHe4ius7ynjLKOenV6Dc6zltyX8oujfe7i95aFj6KCmD0PH6xY3j9g6xuSd
         6Bw33PHc5Cor4QuZZ1nzZrcIrJ9XL4zjcYRVGMYjKYauM9OPsKhQvJ8jglob3mL43zxl
         hEPJ97Xa8PA39C8OR9BEJqDCU39xXHw+ldU+vqp8WahPkXzCZyXEFQcQgN+q8l9utXex
         ExYg==
X-Forwarded-Encrypted: i=1; AJvYcCXoUhIeYYaOTu/g3arxcIJd0+isEbcG+G1I90xYpr6Vgq9MtqeHJcbS+TH4YEA2XMwbXftFLkhjjttj7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpqLvBZldDDwKCK7MoDfum42RYM9AvctJ+T1G2y2XL3AHW080u
	8ZQ4Wtc+aSWpIl3jGMvr5jA1kMSMSOP5szP7MyAGgUVL3GnToGVK7hWlj2R2YQ==
X-Google-Smtp-Source: AGHT+IG7U0KSHWrmCe91AVXiWEDTh9XeuV5+Nzyo+RoW/0JSWl+BTa9POmrQvviAAOmkiVGmWOnsOQ==
X-Received: by 2002:a05:620a:2994:b0:7a9:cd41:9c0b with SMTP id af79cd13be357-7b186bb3431mr206876585a.17.1729776548724;
        Thu, 24 Oct 2024 06:29:08 -0700 (PDT)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b165a5d663sm484204885a.94.2024.10.24.06.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 06:29:08 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 24 Oct 2024 13:29:06 +0000
Subject: [PATCH 2/3] iio: hid-sensors-prox: Factor-in hid_sensor_push_data
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-hpd-v1-2-2a125882f1f8@chromium.org>
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

The function is only called from one place and it is a one-liner.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/iio/light/hid-sensor-prox.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/iio/light/hid-sensor-prox.c b/drivers/iio/light/hid-sensor-prox.c
index 26c481d2998c..d38564fe22df 100644
--- a/drivers/iio/light/hid-sensor-prox.c
+++ b/drivers/iio/light/hid-sensor-prox.c
@@ -153,14 +153,6 @@ static const struct iio_info prox_info = {
 	.write_raw = &prox_write_raw,
 };
 
-/* Function to push data to buffer */
-static void hid_sensor_push_data(struct iio_dev *indio_dev, const void *data,
-					int len)
-{
-	dev_dbg(&indio_dev->dev, "hid_sensor_push_data\n");
-	iio_push_to_buffers(indio_dev, data);
-}
-
 /* Callback handler to send event after all samples are received and captured */
 static int prox_proc_event(struct hid_sensor_hub_device *hsdev,
 				unsigned usage_id,
@@ -170,10 +162,10 @@ static int prox_proc_event(struct hid_sensor_hub_device *hsdev,
 	struct prox_state *prox_state = iio_priv(indio_dev);
 
 	dev_dbg(&indio_dev->dev, "prox_proc_event\n");
-	if (atomic_read(&prox_state->common_attributes.data_ready))
-		hid_sensor_push_data(indio_dev,
-				&prox_state->human_presence,
-				sizeof(prox_state->human_presence));
+	if (atomic_read(&prox_state->common_attributes.data_ready)) {
+		dev_dbg(&indio_dev->dev, "hid_sensor_push_data\n");
+		iio_push_to_buffers(indio_dev, &prox_state->human_presence);
+	}
 
 	return 0;
 }

-- 
2.47.0.163.g1226f6d8fa-goog


