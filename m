Return-Path: <linux-input+bounces-9551-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B633A1C57C
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 23:26:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C94E3A925D
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 22:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14961208969;
	Sat, 25 Jan 2025 22:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SMr4E5l1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CDD207A23;
	Sat, 25 Jan 2025 22:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737843954; cv=none; b=jNUv20iLuCs2Ei5T4tL+zoZ4TXKA0Kd6wPv84MhBG8b2FlOsz553sgdcPYfe3opMJh3Tr1dwZ3ZVxc38h6UHLQhXqFnJEVHX1kwFnYNgNf+QlnM6lXHwY1JYVj61r1/FfS2VhgycXn8wpM0F2v9nzgZJSwLZvy19xeVN8KLn1xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737843954; c=relaxed/simple;
	bh=czFo3ZdNRhdH5Wqqju9Ed8/gfHuPubW6sMBfyGq7+Ak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t3q+XuFtE58mLxuU1l6CSBJiQIcEG7ZcwjlEfUCFEjV6uJriAxXCB+SKjQ7sFigjUFdeXup83unyTwephtgdkHknKXq6+pKEg7kr/sKQSv6L4pFXJReQOR25M+JzkT3ICBhTq0HtuYhvQX5DVieNdjy3seCvO8D/Jmae975w634=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SMr4E5l1; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d3cd821c60so682895a12.3;
        Sat, 25 Jan 2025 14:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737843951; x=1738448751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hcrUmuW546Nve81KKGIZzMNKIw4a92ChiOh5+g10Y7E=;
        b=SMr4E5l17k9CZ4Pfog6mCCt1vyAbz4179y+RbuhY8IOikKq8K0Rzxz2mhjKPU0QnUh
         UTvDzvlcXoD+TSSFn670q3dO1B/LvsuTcUz9gDo7ep6B3auYcLQp8oS718zrLDyL7kX6
         XYbwiWFhQtbqtxoa98sAF6UdsQNfbxhIDjRL+r9JaWLD9jx149wPhkP3ANEkC5q5/0Z5
         4MDVIvpAS2QetYP6Bus3L9kqVLv/XoC+yzWJzzMLoYY4kc4ByHdFhxgiUefDzcVODVK9
         b9F4Sqtl5EmNX74g9FoFx/BDrRuSzr+fxar1tqQE3+qU06dGptFtDr01Y0eRgibWMO0P
         Nytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737843951; x=1738448751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hcrUmuW546Nve81KKGIZzMNKIw4a92ChiOh5+g10Y7E=;
        b=nvu/5kCR5brsBo2kK6+62rOZbQKvwE3RliCDW5mSbkaF+eUvVqEla4PvZ4TW2lCV1U
         bJZS/x5MCRwcHqQECvWttGd7jclLnVAp8Z2HQWSx95PG4rJ8eUZIj6gEoFOLJxfdZ3De
         /jNnXAPRdOvHtze1g46pmVnvi2GlWpk+DvXaENZdm3x2tcYbdj2v+SiIwVlfUZttVaM2
         ng5buKUdVWKRNC2l1Wk7HDFmZDoF1pvd25TxSZwXNd//UQAN5o9fgrGuEKCw6ukZRZtG
         uPAmoJyfHpEps7IEoTeALrQSwlpJBrJi/LPXg37qHRauD+S8BXnsIrMfNPw09wTbFrTR
         KpLQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4Yko4E9d2oLIPLhE8rULFJ7+F+EnqQ49OJ2gsycBQBdB7AybV0+vH4RR4QSjUqSFunpigdOny2WqbaA==@vger.kernel.org, AJvYcCXjk9VKyH8GD9mmms5utRDiPni/IgDpepR7qEj+yXIErBF5XBTeLh2MwF/efYA+luieuwWKXBXvPbqv@vger.kernel.org
X-Gm-Message-State: AOJu0YxfSFNBRngbC26EiYCFmkQi4NUgnPvN/Jd6AP9QEhHRziV/4gQY
	a+6dAm9n7Sotsnqo6FgSiaKk6xkUiF8+yNDpNKTfcWQlW/hX6ZQJ
X-Gm-Gg: ASbGncuoXFhdeu+rLgwdX4q5ymz5aCWwgeB2tVkmv6jsvHRJHudE0fDR/ycQQTT1xAa
	YPbLECacAKDT+uSziaCFeYDp/3LYm/D4d0V+3g8iJiCNZ8zjhRvqeuZ8DIX9cmn8eZp0u+hT+Mp
	QRgu4PGZ4Ux4E+c6MTRb/rAFHYVujtE1BNTq5rD6890Hh2YRuizdkoJSmUO3qrKOZ/Z9ikERErV
	gsqhf839eaO11VUqpdSKToUxvivtqkurKovdHX4KJu11xQ+SBl55hHKlg4Dl9EQBGDfWdx5F0qi
	9fLEww8hqZNb+uKtER17Ix++BKWGeZssX/i5FS7JBgG4xLqNIfo=
X-Google-Smtp-Source: AGHT+IFNN0OXy0gqmDXMwHxOqlDTXEW08tMiia3rYSa/Bc7bOs8b6ApZsNOvos34mR68TTWOdgahXg==
X-Received: by 2002:a17:907:3ea3:b0:aa5:a36c:88f0 with SMTP id a640c23a62f3a-ab38b3d71a6mr1184258366b.12.1737843950530;
        Sat, 25 Jan 2025 14:25:50 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab68f1ef7besm136540166b.62.2025.01.25.14.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 14:25:50 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v7 15/17] HID: pidff: Define values used in pidff_find_special_fields
Date: Sat, 25 Jan 2025 23:25:28 +0100
Message-ID: <20250125222530.45944-16-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125222530.45944-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250125222530.45944-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Makes it clear where did these values came from

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index f6dc6db0b59e..575f24610269 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -48,6 +48,14 @@ static const u8 pidff_reports[] = {
 /* device_control is really 0x95, but 0x96 specified as it is the usage of
 the only field in that report */
 
+/* PID special fields */
+
+#define PID_EFFECT_TYPE			0x25
+#define PID_DIRECTION			0x57
+#define PID_EFFECT_OPERATION_ARRAY	0x78
+#define PID_BLOCK_LOAD_STATUS		0x8b
+#define PID_DEVICE_CONTROL_ARRAY	0x96
+
 /* Value usage tables used to put fields and values into arrays */
 
 #define PID_EFFECT_BLOCK_INDEX	0
@@ -1047,23 +1055,24 @@ static int pidff_find_special_fields(struct pidff_device *pidff)
 
 	pidff->create_new_effect_type =
 		pidff_find_special_field(pidff->reports[PID_CREATE_NEW_EFFECT],
-					 0x25, 1);
+					 PID_EFFECT_TYPE, 1);
 	pidff->set_effect_type =
 		pidff_find_special_field(pidff->reports[PID_SET_EFFECT],
-					 0x25, 1);
+					 PID_EFFECT_TYPE, 1);
 	pidff->effect_direction =
 		pidff_find_special_field(pidff->reports[PID_SET_EFFECT],
-					 0x57, 0);
+					 PID_DIRECTION, 0);
 	pidff->device_control =
 		pidff_find_special_field(pidff->reports[PID_DEVICE_CONTROL],
-			0x96, !(pidff->quirks & HID_PIDFF_QUIRK_PERMISSIVE_CONTROL));
+			PID_DEVICE_CONTROL_ARRAY,
+			!(pidff->quirks & HID_PIDFF_QUIRK_PERMISSIVE_CONTROL));
 
 	pidff->block_load_status =
 		pidff_find_special_field(pidff->reports[PID_BLOCK_LOAD],
-					 0x8b, 1);
+					 PID_BLOCK_LOAD_STATUS, 1);
 	pidff->effect_operation_status =
 		pidff_find_special_field(pidff->reports[PID_EFFECT_OPERATION],
-					 0x78, 1);
+					 PID_EFFECT_OPERATION_ARRAY, 1);
 
 	hid_dbg(pidff->hid, "search done\n");
 
-- 
2.48.1


