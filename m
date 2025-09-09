Return-Path: <linux-input+bounces-14555-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E87B4A18A
	for <lists+linux-input@lfdr.de>; Tue,  9 Sep 2025 07:49:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FBDF4E5783
	for <lists+linux-input@lfdr.de>; Tue,  9 Sep 2025 05:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C362FF147;
	Tue,  9 Sep 2025 05:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLaGt75c"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF21B2FB08E;
	Tue,  9 Sep 2025 05:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757396970; cv=none; b=FWn8Ctf8VVu7wg5pHe9aX0uimbRrSCABFxIRKtDo76jAt7uGbPWiE1snjEKv9msfP/RDpvEd2Gnwqry+3uoRguzMmjlql9+mJt18+MhHCMJ8f1mg0GkBmq38rHhku/pFL7I+tWLzdDGXGvxwV6sbVvwnHR6ncrHOKehe9v8vpEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757396970; c=relaxed/simple;
	bh=TJ5lxHVYWBSBJTcjNqsWmR5Ye/X+58ulc0qIwXZUCB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NuvLbEFolcnJ0viiclOXXs+qGPVNHrmRTI8be1hbHQ+16LUXbj/HgcsP6089axcBCJ4m/58f76QORoR4PLfLl2ZXC6OtXOXR340at+ksMbDy6o1m0tc9NUbl8g3Ap1Y6FKcDX051bJftoD2QqmyudAkj5j81N2uEOOkA4z1nOL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLaGt75c; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-560888dc903so3128790e87.2;
        Mon, 08 Sep 2025 22:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757396967; x=1758001767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O708xsZOBgWwFjnWY+qzmKxcC8D6pc1i2hZ7VtZjolY=;
        b=XLaGt75cRocNlp9Vk28Cpi8DcgbUs8BmlS6mhUiEmxKadSag3TK6akdjCI02YXljd0
         /2UfCcCQzxCyToDBr6xSR9AUyFmDcH2XjC7/Gx6UvHh3q4JiASiA8JFEdzdHdwsNXbI+
         r9eYp4KE2YWLDp/8sB2k36iHcI3mtHnAed6KjnplpqLpMzRmSAYVaBlNSgcPaNmPd0of
         MfQUKuK7z34xJ2M6CeJeESibI6FfY1m9+IpdRYl7mOKH/4Moq2fKd5/x0z2uLEB4GvdY
         t3OYxiHT0v8CczT7llJkgxJd8Q822fVIQEXDjFBjaYpf4d89IW7mmoWCwd4GEMDYGeE8
         0I3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757396967; x=1758001767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O708xsZOBgWwFjnWY+qzmKxcC8D6pc1i2hZ7VtZjolY=;
        b=uKGc5pWjx697DvccGHCkR6PDVVWOJJL2svCOzPRj1HRX4gE+6+O6vRqR/WLsYZwv+Y
         Jigj9JxhLs2iQwgQl5pKdKafeD7sItXcbR1NnQiRMrWos+Pj6fOD4a/nCKqaL4g0mjwy
         tWrVJmfF52oSuSnOu+FBVAL2jPr+zkhJKZfE2R367rDm9qRsOFLrx7aLHvjY3eMqn06e
         1tAuUsE7rkhuG/G60L4D5OeunB1HubW8ZYQQT/7dA6HrQO2gbU2Q4ojylLSQ/v4y3K/C
         TH3tBqAeZv3/wkTmZrohnEp0qhw0nTozR9YjJiEOkZpd8KK7oavyQo9bMYApgjWg2YEt
         Fh6w==
X-Forwarded-Encrypted: i=1; AJvYcCVnyokYFfUpORC0Cmf2HWpiRvUIuzkaJvL6PqOFLu3ImTut1GKAjV5ZImC0MlmrqMEuZpyOwelt9Pn/@vger.kernel.org, AJvYcCXWzHiDs/UkXorAqcc4Ly9XbXwdq5uznLYZd8z53mVjW07eA388QVzboCLu5M3bMRYv2/a8dy/TI7SUjr1V@vger.kernel.org
X-Gm-Message-State: AOJu0YxS8ZNwPTytMPhrYnnuDBvZognWqn0IgTNUUFgbI2CvCfirNyx1
	JtdT7uBPv6ZRJl6RZMVPnfMo2SEJXH3hHgsY65lg3RwIM+stUJNKRf7n
X-Gm-Gg: ASbGnctjV2bmRv8IbwznK96xRaqdISuVEyg4qIfcSI9TLtbbF3gxbvJ1glMqQ1OmKTL
	6j8LI+HgM/LdzVqOUhZ7W+8RCgtY1GQ8J4JIPtAlutJAtTsCHAvWxFIzSBMbe83O99CHaipQWy/
	n5L2qOxe5zQQMHtq4z70QERoCuREFLT8mJaulKRGKMKKFPWpZgUZTjjy7cfoz0zCIJpT/t0UYc1
	ByM1nCrCcmGFl1zdMcSHCAQHrbw2CHRaJ7jVHudfvtnFnSUuxAt2QN+SC5i6ZY2Ex8rmjFInaor
	3cfm1Z/HN4pq307OUpoGIdiDm1gClJg2NvrmfuGtBkPaMcDeSU3xK9I7mZ+7dr1Xn8ixGVcGkpu
	SVdQy/ytxVpJjoA==
X-Google-Smtp-Source: AGHT+IHecHO2xPhzrJIeLz2v8/7ReBgk/mWsEMMAwzRCz1+7h/xAITyrMXhn/4A96LuLtvug+daQFA==
X-Received: by 2002:a05:6512:a92:b0:55f:4423:f52 with SMTP id 2adb3069b0e04-562636d7a39mr3712088e87.37.1757396966818;
        Mon, 08 Sep 2025 22:49:26 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5680c4246e6sm277329e87.14.2025.09.08.22.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 22:49:26 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Nick Dyer <nick@shmanahar.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] input: touchscreen: atmel_mxt_ts: add support for generic touchscreen configurations
Date: Tue,  9 Sep 2025 08:49:03 +0300
Message-ID: <20250909054903.11519-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250909054903.11519-1-clamor95@gmail.com>
References: <20250909054903.11519-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This provides support for generic touchscreen configuration options like
swapped-x-y, min-x, min-y, size-x, size-y, etc.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 322d5a3d40a0..fc624101147e 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -19,6 +19,7 @@
 #include <linux/firmware.h>
 #include <linux/i2c.h>
 #include <linux/input/mt.h>
+#include <linux/input/touchscreen.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/of.h>
@@ -355,6 +356,8 @@ struct mxt_data {
 	enum mxt_suspend_mode suspend_mode;
 
 	u32 wakeup_method;
+
+	struct touchscreen_properties prop;
 };
 
 struct mxt_vb2_buffer {
@@ -888,8 +891,7 @@ static void mxt_proc_t9_message(struct mxt_data *data, u8 *message)
 
 		/* Touch active */
 		input_mt_report_slot_state(input_dev, MT_TOOL_FINGER, 1);
-		input_report_abs(input_dev, ABS_MT_POSITION_X, x);
-		input_report_abs(input_dev, ABS_MT_POSITION_Y, y);
+		touchscreen_report_pos(input_dev, &data->prop, x, y, true);
 		input_report_abs(input_dev, ABS_MT_PRESSURE, amplitude);
 		input_report_abs(input_dev, ABS_MT_TOUCH_MAJOR, area);
 	} else {
@@ -1010,8 +1012,7 @@ static void mxt_proc_t100_message(struct mxt_data *data, u8 *message)
 			id, type, x, y, major, pressure, orientation);
 
 		input_mt_report_slot_state(input_dev, tool, 1);
-		input_report_abs(input_dev, ABS_MT_POSITION_X, x);
-		input_report_abs(input_dev, ABS_MT_POSITION_Y, y);
+		touchscreen_report_pos(input_dev, &data->prop, x, y, true);
 		input_report_abs(input_dev, ABS_MT_TOUCH_MAJOR, major);
 		input_report_abs(input_dev, ABS_MT_PRESSURE, pressure);
 		input_report_abs(input_dev, ABS_MT_DISTANCE, distance);
@@ -2212,6 +2213,8 @@ static int mxt_initialize_input_device(struct mxt_data *data)
 				     0, 255, 0, 0);
 	}
 
+	touchscreen_parse_properties(input_dev, true, &data->prop);
+
 	/* For T15 and T97 Key Array */
 	if (data->T15_reportid_min || data->T97_reportid_min) {
 		for (i = 0; i < data->t15_num_keys; i++)
-- 
2.48.1


