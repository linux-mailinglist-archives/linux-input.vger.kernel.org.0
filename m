Return-Path: <linux-input+bounces-9620-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A0CA225CA
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 22:30:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36FB3188748B
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 21:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE9F71E991B;
	Wed, 29 Jan 2025 21:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DjrJRYPk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E861E4106;
	Wed, 29 Jan 2025 21:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738186204; cv=none; b=ZhwGhSwOh/mFOmjOitc/tXsCi+Bq+fsPMXzTJqDCtnrtgkCgpq0flvxQZIPp0xj0YkT/ERp9dwZxeiur3gAg/pPa4Zj3aHyu6inFUxS2Wp0ku9C1ON4R1voCGtmRRZYLNEMS5sMmimMsM8EbrzAmsKjr5ZKNNRro7bL0Fxbuomg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738186204; c=relaxed/simple;
	bh=eLUNB+4RlHA4Tq3rt6ZMV4vSxBclxw6o8dFzoRVq1+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=imnnUbOO6aBCqXUdShJsh7UV157gU1yFfRXngPiMHScPM8omI7L5y1mzgpor19K/n41DaPg6gFUrcC0sDSzd/z5KlWqIyIExsaR9w0caSrPieiSXSWeC2pqAQwWq+HAA0IeFd0Gj63wQEsXTfEHveXARWonLXIZBEdsob+B9hr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DjrJRYPk; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5426f715afeso16854e87.3;
        Wed, 29 Jan 2025 13:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738186201; x=1738791001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/xJMyZ09aGkbfeQ3yyWVsxqsm6ay0kI5dasieVFCsQ=;
        b=DjrJRYPk59ROg//q4MXXzbnwmKyWOO9mVBMyGo9ZzPYGX9GCsVCYH4CZMu6WYSgNm6
         hXYIudZzbprX5sw4kPzrNm3XmmVhYmmpr3B33Ybx6Qd9OpjFkgEJ2tKuH+exUGwlPjOP
         q1Hic4j8Po0R3Deiw2CC2L4kLG+7ap7YybB8T4pWAad76Y8P38Is060QaacJvMktXMRQ
         Brqjr0qHvak1IT9Ucr24/57BrMTlzV16dV+x/eYdtUEBQsyxeg80aDNydT/aGw4aC64V
         U7MIzKU2Yq7aKUtBMIvCn72H0SYTDTkCx3ImDp5lAwpR4ID10KY/HHZHLrpJsZKdMPMc
         3zvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738186201; x=1738791001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4/xJMyZ09aGkbfeQ3yyWVsxqsm6ay0kI5dasieVFCsQ=;
        b=IMq6L+Hn5TtQjCB3dxMVf03IsJVhb7PZCiHMbtsJEWpax18Iz62DZtSnEGAevXwt81
         Dhesvb+rnkf3M9EXfLARJBGSxVxMkG+CwlFz4GihHetnR3ESAtTEAqxwbpRY5r0rXCHb
         illJicsRpJevnoiAh8oWFb25lAh1BLNmb3iy6jRWu+1hNRItBUbSF4I+sR9SAeeWXIs9
         23g5mzQW/7j9BKopGWeSeId64wsqZGViwZXTYD+L0TjYS8HmWKCLRwCeqbAIlWGx73fC
         IMjgVTSSAcYcR6TYMD9at36FUhWxgSvrxxpA+ChUvUDOgee1+WOsekiXwBXjxRldKVMT
         QU8w==
X-Forwarded-Encrypted: i=1; AJvYcCVf8mTnkuc1g8lDNnaMl79lpnO/qiLGY/Q0w/y0YfTrKjsJMHlBkOjtc4Q+sn35nq+wUjaWOYQQQpBaKQ==@vger.kernel.org, AJvYcCXtN/2PvV7pmY3IE7iq+ARJVjHPtfw0kCWJG3X5nQZ8t9Z+iVgVKtAsItM7vxCecpVVPLfvWkqxkUxr@vger.kernel.org
X-Gm-Message-State: AOJu0YwgxcfqOi7VpfDH7Jtbl6vj1eZ+H0zlMenvwGsH4lS/IfS4xnr0
	M6f4U4SjIWm8mE5GJ4RmKxHUFogTUP+mUYnQtY+Ew/mhjhkDxPCI2OYP/naU
X-Gm-Gg: ASbGnct+/HH6Z6Lls0cZWpKYkKazZ3Mpo63el/A2TYeB05MJNqV3uRoR8ID9FHdEZml
	iMZcuvrriEKetduhwZYzKKofsII8tpcwRCYMd9HNlWeLY+w0oXWUOeXvn/ldg7R4XrBCiIcfWyo
	XPi90pKTEGA2EotH7dI7ZLnQvdPPYbQ3SPDUmdj2PFMkT/NheWciiHvUz7Luexmf5p4wAvungJU
	zAaISFwg3Ejb6Jp0vViMMoYlOHKccnCsgT+pleZrArY3DzGqjtfNI1SdPTbzy2Y+bE3yUB7DzI1
	3CEJGi5ejFRRsaui5tkbjo3a7J0AN27SZVbn1aHfyv2apbuRryn3yOLmlS9aU3uUo0pLkMIx
X-Google-Smtp-Source: AGHT+IERHO8kxOpb5L5OjuAmlyMAHU2ATPQeSyfAlKNQVwllV/r27rarl2eo+0sRWoJLM228bgUkNA==
X-Received: by 2002:ac2:4e0e:0:b0:540:75d3:95ad with SMTP id 2adb3069b0e04-543e4be96f7mr595638e87.5.1738186201210;
        Wed, 29 Jan 2025 13:30:01 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c83799c0sm2100778e87.190.2025.01.29.13.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 13:30:00 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v8 15/21] HID: pidff: Define values used in pidff_find_special_fields
Date: Wed, 29 Jan 2025 22:29:29 +0100
Message-ID: <20250129212935.780998-16-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129212935.780998-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250129212935.780998-1-tomasz.pakula.oficjalny@gmail.com>
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
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index a8698593e432..fbb79179e02b 100644
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
@@ -1046,23 +1054,24 @@ static int pidff_find_special_fields(struct pidff_device *pidff)
 
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


