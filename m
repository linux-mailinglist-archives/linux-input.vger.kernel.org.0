Return-Path: <linux-input+bounces-16837-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 60674CFE9B3
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 16:36:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A83F30D80D7
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 15:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B137A3563C4;
	Wed,  7 Jan 2026 15:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eTynPtg3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DEB3557E2
	for <linux-input@vger.kernel.org>; Wed,  7 Jan 2026 15:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767799364; cv=none; b=mYZBBPdQvTP2UZJVMX3NCTkWer17TSnhxd0YlnLviM7xR9tivlG4R8KW9zSfiyWxR7+r6Kqs09/sPua+9JlSH1PTt1xdg+i6YiSTqIZ2xvcv27sNc+T0w2EqdHfVCEpJeQzt8UWIA+auwVycM2LW5Pq4Vv3WQjrOnCgQmsmcUbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767799364; c=relaxed/simple;
	bh=5JDdGl+quViVSh5qS3L0JGYIdYs74ZyF6u5b0yPu52E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QOZ+kybjo94gdMmSYrw5bX8eMBzrT0YVbMdByFkFPqH2lC3S802go1aT18ZRqMYDo/bX75K9v31kg9DDLjbjCGgJROrhA1BbTCiw54iTJnQWKzhtw1jbrrIZOgHetkYf2TlEyjEUv6Joquuy8g+PO6ILP2Cpye85/6lY0X2nm9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eTynPtg3; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47d5e021a53so16358595e9.3
        for <linux-input@vger.kernel.org>; Wed, 07 Jan 2026 07:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767799361; x=1768404161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UlZqCvlR28QUY2P8NX6QpqNVUlqFNPjRtevgdWt+0i8=;
        b=eTynPtg3F1CnMYz2HyfoPQjk5E/iqD1Ztug2wWHVAml6PeVBh5X9YvByljTE3j8UH9
         hZgmP1PV9vyWDKKCahVgNWC+x6zjIOrmKiyzsA7v4UQQ1xJCrjpflMvJgb6dqYPBCfVP
         +jf7LnWPv/2M9kmDbMGh1B8QAX5rmCKT6fLMaFCCXkf5TeAjDQVZm8/fgySkXgADqND2
         OUeNMUMr5T3y3EMXmhxw/bGQcxJxEOFcbs9pd83+H+1Qj3TYlo5YnIYajg1Qf608YRTv
         58pZIuJlLMPzRtFPCkLcekLcS4qA5xqMCnDiYVACi9Nw/Yb903a6taaIb4YWqxaNLbQS
         wHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767799361; x=1768404161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UlZqCvlR28QUY2P8NX6QpqNVUlqFNPjRtevgdWt+0i8=;
        b=foKFx6XeZBtDWmziB4F4ZdKRuCh0q6oMIwIzjdrR+vsTT0KidcRZcS0WrHxz71hnUo
         7iUGmSmd7GzIIBK7Is9uiD3hBuNLQVP8T1nUPcBl9XjTWNqZDGpbMWEdCWPztqTqCuEy
         LRGZ94Owzr0RI4YwiUbQZ85AXDluBLqIG6RQuxd6jyDp3ECy+Q2ufQWNzN29wWKRxzrJ
         wZypyg6PyNTPoyObPb1uCljeVf+/cxsI3VykIapw3heuYj67JrD8+OuBoNVkoJkQjzZy
         oS5a10Do0J5S489mzQwztq3HS6+QuxMpUGSzx/PjfMnWJVBgVlI1JuaAe6L+DgB6Y5MN
         dn8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVAt+5FJd/Bmb5xc2wYM+WvfW6cyXcRws6MPFFqGXRkKs0iM2WLLspkmDbMk/XCztcZ5HSXkxSNwKT+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo1XJ2D1ZBPWhO+kjSmU3dX88ViV/4ZUD/HRSWrnF1GtapJW6I
	aldnWbSLwWgeK9egl5UqgJm5vucHVt1QX4pefQ+fcr2RUa1ujSnbxFWH
X-Gm-Gg: AY/fxX7RYojEx9mwK5yETyefAdEdArazxJlvqJRinDpuekl1FjYSrSivlHC/989bAxB
	aP3zpQv7BAE3QjUUau2PEdohzZuebq63ypLGC2E32/CoeB78CMba0BKg9Bkz//WHEIuM8VWQhGk
	SU0Hgh/2wqx+BSLIhVm0Sa03hGW24Se33lisZ63CgRNS8YYyIQ5/bTwYkdh6IFxRQu/8fTEb9rH
	cfUs2DMGhk8f/xd6VLA7FPrIZONqY4BKuHXk3rrDsY1os+wejz4NXQQHdXKrhYeYEnkDy9Uvny6
	ApujBIp+v3xX1542lw4raWKuprcAV6CjeoyOqdV32pa7arr1cZwkDqQBd+JWn3Puxw18JLIbguf
	JammtcqEf4u0yCC9YmUHtGWgfuasKj7QLt1mvUosnn3N04pQylSglxL6Su/joOD7y62GeOHhpse
	TycXfqD5Wo2v/DDgm2SlFS3la0UvPG6dsxu6OejJA=
X-Google-Smtp-Source: AGHT+IHj+Mp+36EGlLrtCpsqPagsOpWY2Ltglsq01/QVZWSlfcTdsf7vkUKXFWdu+p6jeFTZ5tOqoA==
X-Received: by 2002:a05:600c:444c:b0:477:9f34:17b8 with SMTP id 5b1f17b1804b1-47d84b0a9e5mr35154215e9.1.1767799361270;
        Wed, 07 Jan 2026 07:22:41 -0800 (PST)
Received: from ionutnechita-arz2022.local ([2a02:2f0e:ca09:7000:33fc:5cce:3767:6b22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f410c6csm112064125e9.1.2026.01.07.07.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 07:22:41 -0800 (PST)
From: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>
To: benato.denis96@gmail.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: ionut_n2001@yahoo.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sunlightlinux@gmail.com,
	superm1@kernel.org
Subject: [PATCH v3 2/4] HID: asus: Filter spurious HID vendor codes on ROG laptops
Date: Wed,  7 Jan 2026 17:22:14 +0200
Message-ID: <20260107152213.143247-6-sunlightlinux@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107152213.143247-2-sunlightlinux@gmail.com>
References: <20260107152213.143247-2-sunlightlinux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ionut Nechita <ionut_n2001@yahoo.com>

On Asus ROG laptops, several HID vendor usage codes (0xea, 0xec, 0x02,
0x8a, 0x9e) are sent during normal operation without a clear purpose,
generating unwanted "Unmapped Asus vendor usagepage code" warnings in
dmesg.

Add definitions for these codes and filter them out in asus_raw_event()
to prevent kernel log spam.

Tested on Asus ROG series laptops.

Reviewed-by: Denis Benato <benato.denis96@gmail.com>
Signed-off-by: Ionut Nechita <ionut_n2001@yahoo.com>
---
 drivers/hid/hid-asus.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index eb14b9d13823b..15c24d5812763 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -57,6 +57,13 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define ROG_ALLY_X_MIN_MCU 313
 #define ROG_ALLY_MIN_MCU 319
 
+/* Spurious HID codes sent by QUIRK_ROG_NKEY_KEYBOARD devices */
+#define ASUS_SPURIOUS_CODE_0XEA 0xea
+#define ASUS_SPURIOUS_CODE_0XEC 0xec
+#define ASUS_SPURIOUS_CODE_0X02 0x02
+#define ASUS_SPURIOUS_CODE_0X8A 0x8a
+#define ASUS_SPURIOUS_CODE_0X9E 0x9e
+
 #define SUPPORT_KBD_BACKLIGHT BIT(0)
 
 #define MAX_TOUCH_MAJOR 8
@@ -348,6 +355,21 @@ static int asus_raw_event(struct hid_device *hdev,
 	if (report->id == FEATURE_KBD_LED_REPORT_ID1 || report->id == FEATURE_KBD_LED_REPORT_ID2)
 		return -1;
 	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
+		/*
+		 * ASUS ROG laptops send these codes during normal operation
+		 * with no discernable reason. Filter them out to avoid
+		 * unmapped warning messages.
+		 */
+		if (report->id == FEATURE_KBD_REPORT_ID) {
+			if (data[1] == ASUS_SPURIOUS_CODE_0XEA ||
+			    data[1] == ASUS_SPURIOUS_CODE_0XEC ||
+			    data[1] == ASUS_SPURIOUS_CODE_0X02 ||
+			    data[1] == ASUS_SPURIOUS_CODE_0X8A ||
+			    data[1] == ASUS_SPURIOUS_CODE_0X9E) {
+				return -1;
+			}
+		}
+
 		/*
 		 * G713 and G733 send these codes on some keypresses, depending on
 		 * the key pressed it can trigger a shutdown event if not caught.
-- 
2.52.0


