Return-Path: <linux-input+bounces-16843-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E537ECFEAD6
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 16:49:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03A8C3081113
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 15:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F12A38B99B;
	Wed,  7 Jan 2026 15:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TR6BiNHZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A402938B99A
	for <linux-input@vger.kernel.org>; Wed,  7 Jan 2026 15:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767800571; cv=none; b=FYwHpa4BlHVAnGc4qLw5xmnl4J/amG6zYj9t0qwysVgl3eDQpHFYKMbr0l+Ti/sYhBqQJkDiA8WH4GlidIZdML7wmCmBqKXUYoolxeui/7F55mec9KnKUw4B3do/RqtsYxuIVJTIYvH8r8DCU1N1iIxv3iom3f18Dv747BfoMPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767800571; c=relaxed/simple;
	bh=QA1UL/S5jJ1ZUknddi/FOJm1WzobzTiZU88KEGULpt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qd5Y/qiq3EkFB3U6ZjWrBw3LGvhqhlFAlGPoCGeaGAz0flH79rsaCnbQuhYfEfavRukwVPsIQyOS06nQK7zv0V22rG+rS1aNO5kOVqC79BXDUSs0dEKms01wk3vhr7n0vsePv7vPhVHiIx4jVhyIDj9H2EiP0OpB1esvarj33zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TR6BiNHZ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4327778df7fso1304250f8f.3
        for <linux-input@vger.kernel.org>; Wed, 07 Jan 2026 07:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767800568; x=1768405368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUF3d7YHbibnTwOkio7fbPwxM6xch+CyKh0nAQoNa8g=;
        b=TR6BiNHZwW+dmfSFk0wXjWwawH/qTHxl6LoHOKFjo3jDrlx4VW9eXBDgAIxjfrrQRj
         TDQZUdn5CnVIpixFt0rC7mc2WbK3tjryfXRFsoHRWZXJHcPf1DihiVkuGhwyqGnIYzr0
         A80JjwRgguvWpWaqEmzpVgdgLMxlNTkR+4ghR00IhniNxvs8tRJRPdsPtvsPnHiKaOK4
         V7UFBtYPrtpXXG212NhEA6Vl6v7ikSKj71TsG7OJjfpa3h89lY0XwfuGFTGi8PEN/hbe
         j9zIYtBt2GSFeSE+7YIMhnhrpZ8HP2DTg/1oDRUKldaIJIQzWKOo8UQw6+pPYpJBo0dX
         ck3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767800568; x=1768405368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aUF3d7YHbibnTwOkio7fbPwxM6xch+CyKh0nAQoNa8g=;
        b=mpRG+LruQj+hO5ylwQgQ2DPxod1FGaqqUQeQpJSVU7VWoyH7wsQBijc9B7OHufyhSW
         aSPgp2tU5+CZisnYH2wV2GGVYyvokG0yiqRJIAy5yBG10x6xCwjCBs186/DWoau2teIn
         xzu4Z0GaChryMJAwJlqDNJ3H7m4MfejIuK8Lgay9nAf/YE1vlgdsVHEIr5v6bN3QZgWQ
         t4guQ6Jgm3dR8i8oy+si3ZosuTQJBSF9LqL+GeNqYWH0e15gJivTOjM1csXCVjN05zQw
         9JRtE9dbuvLtqKRZcFISapUlrWSxL++bPGRKI3TJQWwhM57p3dscO7mgfD4RZClAzm8G
         iBrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXq7kUvS0eM1SaMf/1J35r5xCqP4PhAYPv0ZfSDvUHC1QRf2TNK2lauIIBdEvUuY/X2zGtND/U/4QhlAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYBUZ1y9LXEwhvEPHcUZ5jwRg1AzQGDNIeeVhh0W24Y36QqxFy
	FQ7ncx5oW5NMVdLGvVL23dN2K10G6n3QHqFNug1UBzPfxcmCkHbO3rvxbTJcTQ==
X-Gm-Gg: AY/fxX5FDx0l0P6NKS9RLhcRce2Ww/+Yo6Zqg2YNrYiNsPdOTqQW2/MO6oaeTnBcYMk
	XD6SNa3occskcMxXcwIFkmHrCW88ag32fcCE6k+ehirIPh6BQfO3hsk+mjBAnfmz4Ljwhpr8ZLA
	ShAF+PnhtQwrAgbej1GYsxLP92H/DwGIO3tFIBuuWyivSgPerxd1qypCjOH39Xp6qEXzXGQihkd
	Ybmat05mTqJpTSxnigHM9YRXrsNQa9uGVaRSNQiHwqviQ3vqzNLG8CP70lfzKLjvtAqUODnXwdl
	qrb5BES3yMe0NPXdq7q2mi22WWbAhp3M9DQQBakJpQynBhcYBG1Oxpm0y+/BUwb8v63cWcWybCO
	VXK6IaosPIt7wD0Qk1V5KnQSYdIpxZClTAcFHKStx+Sec8/CWZ26srevBuJBsJHcVa0loIKbiGM
	Vzv5A/+qFf56ZAGkRN5tiIOeB7IHFY72+nlFgX7js=
X-Google-Smtp-Source: AGHT+IFgjsof+vom+8Br6bX47ERmFdf62CBu0rmdTxo0GwiSnw/e03sCNN3LYXHNwfIDpxQZkCLs7g==
X-Received: by 2002:a5d:64c7:0:b0:431:5ca:c1b0 with SMTP id ffacd0b85a97d-432c3628fd3mr3666484f8f.4.1767800567817;
        Wed, 07 Jan 2026 07:42:47 -0800 (PST)
Received: from ionutnechita-arz2022.local ([2a02:2f0e:ca09:7000:33fc:5cce:3767:6b22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm10897704f8f.31.2026.01.07.07.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 07:42:46 -0800 (PST)
From: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>
To: benato.denis96@gmail.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: ionut_n2001@yahoo.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sunlightlinux@gmail.com,
	superm1@kernel.org
Subject: [PATCH v5 2/4] HID: asus: Filter spurious HID vendor codes on ROG laptops
Date: Wed,  7 Jan 2026 17:42:20 +0200
Message-ID: <20260107154219.164514-6-sunlightlinux@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107154219.164514-2-sunlightlinux@gmail.com>
References: <20260107154219.164514-2-sunlightlinux@gmail.com>
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
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
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


