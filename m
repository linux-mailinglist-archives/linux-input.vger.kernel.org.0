Return-Path: <linux-input+bounces-9657-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A22BA248AF
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 12:40:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA3C13A77D7
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 11:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A4D01ADC69;
	Sat,  1 Feb 2025 11:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WoMnWaBc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB16176ADE;
	Sat,  1 Feb 2025 11:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738409970; cv=none; b=iOauovqwwG4Ouoo7miRsp8AmvxoKrqnxUWehB4/PMV73zDfvT9MwDij4GyisElZVIpSCxY+qdLzcE0Ed+2rdXy0AWjjcglMnL5k4PgWKj+kcprb/+vU1DKmR9hQl0EZUjecK4980dYnYr19R7Y8bPXlpkQVNCXPUWf5SM7OoLeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738409970; c=relaxed/simple;
	bh=H5hN8m4iqAFF9cK8A41mVb8fzEsTKQBZvT+ZETsdgFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N5balo7Q8C/YJFz9nsFTyrRcK/hpIJz8/V1jWMAzsuS0QmWoeSY404JvRaM9VAJ6cR7OYjdeDW1otnEz6hF3GUjO4sVesm8hYjubSW5lczCMJ1dsdpisIgWZKaEHiREq7nQ3B8AX1OfHucN7bsfNFLPx7Wz4x4sEO0aA5Bf+BB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WoMnWaBc; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5dc191ca8baso598143a12.1;
        Sat, 01 Feb 2025 03:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738409967; x=1739014767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTkWfRbnjEBgqmpDmlfEH8FjEcYgquPflvejRjpdc3w=;
        b=WoMnWaBcDxoML0OsRjBAe/6uzA5kyJSXongy7VluVAL83Fs04U/QDaMCDcMHlJvOKS
         9ENGB+FjcfIuXeLI3xpz2c3asQfcujgMM3n5KzOZo98YDV5rlPhsVIqaANV0ZH6fBgxi
         s65yaFcfzQVDLPWI8Jxt8wkVdWy1IzVupfb4ud4vQe+5jlBl7wZWRtR2cVXRXKZwQy1S
         +cVuWB5P9xl1wbwskwdx9GItsWzF3CQmgz79EO6M9u+1F0K7sPLvBFQ/lrSXxbgHhZpk
         yZ5ldGGPHsDM49mez/THvTKVEALKGLf2deJAumFHX3UAjpE/ShfvsP3/b661QqG1FVaT
         HS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738409967; x=1739014767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CTkWfRbnjEBgqmpDmlfEH8FjEcYgquPflvejRjpdc3w=;
        b=UehrV4M9Wp2iQiOVdWYybdTe3fu4WDIoWHZFveGOTGM8D21bY7jfpS+dNJIVI+NG4e
         kIC7wWxuR9bkATyMysAXkmTpjAb+OcHGKi/BjRX6N5nQQWgEyIJLP/0EPjYxvWBxpW7/
         yAM++jtpc572dzHvc0wqE2wvMH1sBRBZJQPEHiWdrenBMru7epEhsNyE7vm6v82NJAlF
         iGRMoBLh4sEqlctKKDlGzS7fy5BNxBviJ7At31QEhQWeKmFexO3GhU+sAR4lDvrSj1UC
         naHGv9Cf4b4++uDpyF/lakyNWKLzHQfhfGVuyUcHQeIh1cHpMpmVQvs/RuIfZIk1bxQM
         jrnw==
X-Forwarded-Encrypted: i=1; AJvYcCWdVzVD9FMFml0t/6o+YNtVlgthc48lWy5J9nRQXMdLU087pzNsbUhbFlHpzO3JC5CPIoAQ+lKLy2TsZQ==@vger.kernel.org, AJvYcCWo7RgcIOZvsBp58JWqZ/SpfABqTSEOdEmnUFcuXz9TJ1wUNdVNIKu8pkgSS4boQb+o4sntr/h5nsIR@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0OMyc2yBnK/BIZaRnREUgshcbUagYuKVv3D3PJDA4tF3VVZPP
	NQKKwCfuDy9k2byBZ+mDvdiof4kdBn3W1fIC3rrG+UnQ20bcpBiV
X-Gm-Gg: ASbGncsiPew0oXzHrwY6DaLPAvg/Ub5r6gu2gsdjwUufPrh/MTZ6dzxKoeu9Oko0yhR
	ik39lPVLXfU2b8XtSXrnKpNDRXKVs6BUiu3vSKUwSScX9FyPg9twt5nXRKm0BoabeEP07AKfqHN
	ZL5MiPo+VFKFl4QDb99edOoDeL7BqFYYpGs/RdCOTnnbH0LRGQiDUlRjiLhRmtofGf/ytJ669zf
	jVGQKnRO+io1jDFC0znxIA0au+kd9oV3a0hL1ojTaT1u8uOYpO4hLU7VvwKQMtfvyl5vyb0cG1u
	UQCqIX4IcQirGN+1IeUwm4mx1G+FwNcU/EBw6olQMo8orOSp1gu5I4VoSodtvA==
X-Google-Smtp-Source: AGHT+IFKz/Kc395vV+Qt1RAorCrCj67VsnHr/L0yUa2rFlspkZGvCPhykwa/XxGRMxy/YxrsxomKXQ==
X-Received: by 2002:a05:6402:1ed4:b0:5d9:a5d:b203 with SMTP id 4fb4d7f45d1cf-5dc6e95e21fmr4692255a12.8.1738409966796;
        Sat, 01 Feb 2025 03:39:26 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723e9fa7sm4304577a12.20.2025.02.01.03.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 03:39:26 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v9 15/22] HID: pidff: Define values used in pidff_find_special_fields
Date: Sat,  1 Feb 2025 12:38:59 +0100
Message-ID: <20250201113906.769162-16-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
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
Reviewed-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
Tested-by: Pablo Cisneros <patchkez@protonmail.com>
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


