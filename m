Return-Path: <linux-input+bounces-16746-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FA4CEAC2E
	for <lists+linux-input@lfdr.de>; Tue, 30 Dec 2025 23:18:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 110503012BED
	for <lists+linux-input@lfdr.de>; Tue, 30 Dec 2025 22:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE3125A34F;
	Tue, 30 Dec 2025 22:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ACTQceiB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734E923B63F
	for <linux-input@vger.kernel.org>; Tue, 30 Dec 2025 22:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767133116; cv=none; b=g9EVFipemxcB9lXtHDlgFTAUh1GJC08CoYm+fcE9o+7USOrhT9RfZscgvep+6+SUy2+iIVjUK9Kr5GGYdmNmmpFQWO0xbijtSjwoJ5jn1Mkd1NJApt70ICgUUjfG3xo1Jv9Qj5N57jetYVR/xAmWN8tGLl+HCYgQB51cEWKzLD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767133116; c=relaxed/simple;
	bh=sOp+kd1qCh3MeJ/8yTnJMXHs8RV/SSODMC7ac2xca9s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oO6la5BLR5QYqh3aMhyIGm0qwN/GLpTU3jBJZ8Xoyy6xgKUxQ7kAHk46/g8xrqbMHcRPiavlYL0jQzy3fiaoCyN1t3tcZPhepk1Xoxl2T8ahkDdvcb2l2zj01Kr32rT9ZA6jrTWM81GViUdSg/G8hnhcUXC+sEmbMmZN23zm200=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ACTQceiB; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8c0f15e8247so1177854185a.3
        for <linux-input@vger.kernel.org>; Tue, 30 Dec 2025 14:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767133113; x=1767737913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R79e1i+foFV/YWbiGAa8tDJk4eowJC7pJWmKNNM5++Y=;
        b=ACTQceiBuUuFI2IcG8ZPHgXrRahHqNihuIAFLv2QQsz0NVVoVcSDbnucm948V++yqz
         bGSWfVnBqCwftDFeQe6BTPGALjsRbgIo2G0SNAEmGSc8sKuq9P5EEVpYIIjKIN2a3PY8
         H8z/sRDOaqywx8Q+kqtl5zrA8dZPjK0dGZqhAqqpRVFJWxSY6KfKCecMwGFhZumifEuM
         x9w6E+55iNt1ywjspJUESADhucJh2wjc2havOKtazUx3jrhbhKLSZqmtsevyJrqWkfBJ
         cAxy0OZKfB1ULKAid1qhFHDv2m0DXHDE8Vs25cY8TCAhp+Opw6U4qMlipllAhTk9BBXJ
         ajhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767133113; x=1767737913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R79e1i+foFV/YWbiGAa8tDJk4eowJC7pJWmKNNM5++Y=;
        b=Q/3mJ8ikW+eTN/E4ilKps73aaICkS3D4yQ7JeVYLAbD9vy26/aYev1ulzOMMfIXyGT
         6dq/wYbcdwo4+EnLYNUCNMrzoJ096v98MpVZvQ142pVFO2MCQq8fVPUzZ6Zl/ADcFSNz
         GBmQRz7n5H6gfYfyyJjjp4jlJEChRK/SHfRKTZEQER50mAhdSS1/W+PN9IhGUGjlJJmW
         7F96Hn4wZK1YWQ3CufTkRc4oy0v7HC5Bf1A+cwtSmIPwwbJ+TNeZyVyBKJon4gbq+Syk
         xIGMOuL6RrEqIs3q0U5lndgJurKkCJWT9ThQWx0h6gGw9xQCyyNxog4ELnJVR0wjM4XY
         UKxw==
X-Forwarded-Encrypted: i=1; AJvYcCWJ2UOwQCkGn03xvN+cbsGQ5dHYvkfLTK14ACdMWFZnU4LTzUC91JNCrpa7x8KdfZw4kN/uGRvUMeV20A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKPywxoy8Cg8REZz8BtyHv4KflPEONV+7r7iAr2+9bWiIE0AZs
	vFR1XBXtgCSGZ+uzCIAewruVQZRPemTpweinsJWqFUPF1mT/yfFpLWGa
X-Gm-Gg: AY/fxX74dSVdgYd8Fj3cHKnK2fNUgXQ1NXDSn/Cabr5v1gT2amea4ERlrIpYSDHpqha
	ExRTT9gZumVsA7uP2xk+Gc9usiszdA3jYvuA9plQYG7IGq7EiQkRjsklGjW5o/M4VGcBezK0Bup
	kidTniIBBZAGfqA6+WGZrVeEaC+RbdEpDA/G9z0XSOwdXJA6+6FgQSC/5V1WMTFp43Al+SBDQgU
	/lABQSriDe6RHsRVSynVs//RrM8F/10/IOI7daIeyOM4/RwDDgASTqn/UdxPpPw4pdalv4Sq/P9
	q24vsr8ug12GgdatwYMdys+7RTtbFNXgZGVYlgqLJUjvXqmCD/hbNIHHCqhc9IbT7gUvnb29VPG
	cSQxEyoKnK5fVis6MKKxs5wogjd7Mt/YoBt4+ugEsy4Dx9B9EBXLBzTBIa604hXW8kAk+f0Wj8O
	oZ7CSLP8RubvtV0XBuyKyQz/pFiJ4oHhukA2FqPrxR2W6J+VgX3RfJQNZDXA2bBFV9Zwgm+A==
X-Google-Smtp-Source: AGHT+IEISVv424OHohSbsA5+ZXBe0V5aT6h7gqVV5xL/pj/8lhTfGyO23QccIK2/X876HtDEgdFPeg==
X-Received: by 2002:a05:620a:710a:b0:8ba:41b2:da01 with SMTP id af79cd13be357-8c08fd058fbmr5132069085a.71.1767133113290;
        Tue, 30 Dec 2025 14:18:33 -0800 (PST)
Received: from YAJAT (lnsm3-toronto63-142-117-56-201.internet.virginmobile.ca. [142.117.56.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d997aeebesm253586526d6.35.2025.12.30.14.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 14:18:32 -0800 (PST)
From: Yajat Kumar <yajatapps3@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org (open list:GOODIX TOUCHSCREEN),
	linux-kernel@vger.kernel.org (open list)
Cc: Yajat Kumar <yajatapps3@gmail.com>
Subject: [PATCH] Input: goodix - fix inverted Y coordinate on SUPI S10
Date: Tue, 30 Dec 2025 17:16:39 -0500
Message-ID: <20251230221639.582406-1-yajatapps3@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The touchscreen on the SUPI S10 reports inverted Y coordinates, causing
touch input to be mirrored vertically relative to the display.

Add a DMI-based quirk to invert the Y coordinate on this device so that
touch input matches the display orientation.

Tested on SUPI S10 tablet with Goodix touchscreen controller.

Signed-off-by: Yajat Kumar <yajatapps3@gmail.com>
---
 drivers/input/touchscreen/goodix.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index f8798d11ec03..d675a85a9312 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -160,6 +160,22 @@ static const struct dmi_system_id inverted_x_screen[] = {
 	{}
 };
 
+/*
+ * Those tablets have their y coordinate inverted
+ */
+static const struct dmi_system_id inverted_y_screen[] = {
+#if defined(CONFIG_DMI) && defined(CONFIG_X86)
+	{
+		.ident = "SUPI S10",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "SUPI"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "S10")
+		},
+	},
+#endif
+	{}
+};
+
 /**
  * goodix_i2c_read - read data from a register of the i2c slave device.
  *
@@ -1212,6 +1228,12 @@ static int goodix_configure_dev(struct goodix_ts_data *ts)
 			"Applying 'inverted x screen' quirk\n");
 	}
 
+	if (dmi_check_system(inverted_y_screen)) {
+		ts->prop.invert_y = true;
+		dev_dbg(&ts->client->dev,
+			"Applying 'inverted y screen' quirk\n");
+	}
+
 	error = input_mt_init_slots(ts->input_dev, ts->max_touch_num,
 				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
 	if (error) {
-- 
2.51.0


