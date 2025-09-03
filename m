Return-Path: <linux-input+bounces-14463-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D05B426C6
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 18:23:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BBCF3AE3E2
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 16:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C94C32D2389;
	Wed,  3 Sep 2025 16:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmpYVXQ7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BF42D060D;
	Wed,  3 Sep 2025 16:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756916619; cv=none; b=uumeX/DKwIzhYakG3VVoEAbOKZpCG7jd7k7hSO87D9ravCSXW0pF5AB6g1PlJQWGgV+l27AiNKW37J8KXty4zi5oNs9eWbw6vdyeOeC7rEOIh1dUmvkGJgi2o21zxaKj8MvBG/wl61P1iDMZEQJ5dnGfcftp5Du+q5vsr7h3U6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756916619; c=relaxed/simple;
	bh=TJ5lxHVYWBSBJTcjNqsWmR5Ye/X+58ulc0qIwXZUCB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e53DO1xtTpOSjAkKpRQHlZyREMsr0M7GNV9Uusu8FWmFo5DweQhbTlpDzP56gSp7S7W2WnrzeVbWLTKkIeEO1DLBNTGyUkj0mv8Xw5v3EEGuAedOybC445hW+6WLKMu5cqIN/zF9ayC0CebugdUFICE6KhWlS73vY4r3x28s7z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmpYVXQ7; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55f6ad5146eso15233e87.0;
        Wed, 03 Sep 2025 09:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756916616; x=1757521416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O708xsZOBgWwFjnWY+qzmKxcC8D6pc1i2hZ7VtZjolY=;
        b=cmpYVXQ7MzQpABenS0oFIDpDYKDKGhIlzrou3RXYZoVR24TDDxKmR/RfPi5mEd2QIq
         pRBtiuzKnmXebMMcQJ5YC5DSMlcnaY8yHpcqSK6MU8wGe+y2+pC3zAv8cOIma1BMWBxt
         /CI24bHM04In3GQXSx/zudO8z5bgFluUKdDEBXsFmxeClBkrnX8q3uBUULGM88oTqO4i
         CyPKU0S2CCwQOjv2UE6hbkatclnkRguUmg/6ptcC7Qn2LaFwyLx0XmVF7Ql4Az1qw7+X
         /giLPLd8YZQUiLk+Zliz/6dGZm7XT6KnLLo1m3wQboEUBwPmY8KcSN2l+gfuGCc7dHZ2
         Ia6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756916616; x=1757521416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O708xsZOBgWwFjnWY+qzmKxcC8D6pc1i2hZ7VtZjolY=;
        b=hFTdOEm3U1ktnsjrBOcd/3788FrkBp9CnSk6EA9xJhZlVzbZdnfzNh3HjGZdk8kZhQ
         aIB9uk5tN5359G0lyvGuHU2hHAvh7fWv9dbke8ASRaQuSk6QY/ZyFvtUQVq3bSxDqdBm
         2FHHjEqkIXKoy8XBkM3G3tB00/aNd/DK324umSjYmWZOO3DGGzmbNjl7X6vcUs9IDMwa
         VNOTObpTc+TgrSlZD9GTVNtYjMDPSau37xz0ygUAO3ika7qTjyJko41saz220tVZCFoL
         F2hGODB1mgyM3HvhPOz/EQhww6pjvR4K03c0YGN9vZvmPI+O+mZvyvCr5io1YiqZiUFy
         kW1A==
X-Forwarded-Encrypted: i=1; AJvYcCWS85FQeWZ0/tjtIz6K+xiXBjhhkRhRiDRbhn922juUvKhrxu0DL9EjTEGUV6UXrp25F0gA4FH5tJBNeaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN1PVB0m2cknIX27hzLMArHHfEBmRxvk8YQSuhiW9NH7OCSbAZ
	dgm30EUmBgDLDxf+6BrZOK8S5omusHOyY6j8l9Oq6gdGB9dbBb6+1YpL
X-Gm-Gg: ASbGncsq8XGAStmpcvnorWRV9q8SM/YkgO23jw95S8FG9/nLYWyF4N8M7RNWcpG/u5U
	LzhPAqTI0QuI6JOpQqi3HaI6A+QINElLYaQSCv739ZZ4pRwg30G0+N2Jpn4aIGD3a9K1U+xIFUY
	vZo4UGsAFAMAamEEzdSXnMIHVHAAFYUQb1obeX918+yJaPzAaTk9KBVEbQ89UsMQkPbhsXJyXZp
	F24m67f6ZoNqlUdeAMvjWlr1FZYNp+XXU5Sq7DgF0D4xqiXrlyvd2YICY/gBrnUT3uxw/i8w5DM
	9d3wX3gt6QXVe+kDwSetmi07GVTUzQqJ+nUBG9RP5++s0sVznf615t29cQKMZ1sFNPrBlCUFsgo
	RRXsVQQoFqClQ5pCzV3lrPB5S
X-Google-Smtp-Source: AGHT+IEMmRe9s/e9sl6RC5X1tZ8xGAxJrlXiZsBjr1sDTI1kCQf7dUewifjBhXLA3cKvSMUaqKuWew==
X-Received: by 2002:a05:6512:ea0:b0:55b:96e4:11b5 with SMTP id 2adb3069b0e04-55f708b3417mr4343733e87.1.1756916615945;
        Wed, 03 Sep 2025 09:23:35 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f508fb9esm10472361fa.56.2025.09.03.09.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 09:23:35 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Nick Dyer <nick@shmanahar.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] input: touchscreen: atmel_mxt_ts: add support for generic touchscreen configurations
Date: Wed,  3 Sep 2025 19:23:27 +0300
Message-ID: <20250903162327.109538-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250903162327.109538-1-clamor95@gmail.com>
References: <20250903162327.109538-1-clamor95@gmail.com>
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


