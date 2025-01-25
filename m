Return-Path: <linux-input+bounces-9520-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C81E7A1C36A
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 13:55:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F8463A82C6
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 12:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C86E2080F0;
	Sat, 25 Jan 2025 12:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CmRduc80"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811431E505;
	Sat, 25 Jan 2025 12:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737809697; cv=none; b=b77Vhe0uT7nIJhAvRDRA9YJiVUJKyCQ0KYC2imBFf9rmWZ62qE10/skeeFTUTE91GmMTz3H8qnOBjrnTSE5rAWeaXtzlx8j6fXXDkXObbB8heHTJ2/qLZePa7MRW28r2dqh7ifA6m9WeUBW30RzoWwWFQGSn6cwERTnTBfwPgJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737809697; c=relaxed/simple;
	bh=dwCcjto78uvhV6q6g4fAZmQ++Yk3NSDQ80/OcX+fJyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UG40RKyhHo2XKug5elAtcq0djatwh14I8dBoI/a3iyjQtJ81W518vv1AaGIfkHkR42W7f5CxbXrIki9wp1L7TUoVWxwslLhEoelMezO1zJ5tWZmE7jnc/T1o0qSW6Vv4ygssMFJ0C0yjqj6ffcgX77Mz6XtUADkz4eNZlfAZ8LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CmRduc80; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-542678284e3so514759e87.1;
        Sat, 25 Jan 2025 04:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737809693; x=1738414493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yn3SV24FXGrk6D9U/sonjVWTrzb/5doNCYeJXjxGMWM=;
        b=CmRduc80oB2GIQ2gXn3r/812v4RS8c5mJPSQK0VT+OTD/qDrqiie0E9cupTGvrbkl0
         EKbpDnfLCxA6QGFAwTIJ+wIXgeJqhox+I7sQIc/2A1AxRkdJoLnSNM0CZfURs8i3aWGc
         lBLIhkFlTiM/ihfHNdd7cjGY2F4arOjS/2rTRqGWuGkmf8gKOVFGJ7lTDgA21KzS0QaM
         1lI7Q7qfOzFXp9IugSrtCzqwgq4/tgAOYa2RFXtXyNdX0+z9mmYE5uDuGGJZG2hd1tEy
         TXfvk0k/7sORN7GIT6mUUjgX8Ipd47qZjGOpUSTZAtLrOneAh+ms/UH26p/5keKvf+Wv
         Ofvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737809693; x=1738414493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yn3SV24FXGrk6D9U/sonjVWTrzb/5doNCYeJXjxGMWM=;
        b=lqwKlnyXPbYfvGbc2b7WUhSqvAnlvkhtynGQTQ0EJ0Ovl1nUQ34Cdm77G5xlqvSN5k
         lowLtd5dDoyH4ss8Ffn9IVgSHpGi6OuFYt57JOXDQRDuKc1JGg1k0wVDuojP7bxKJ+ee
         WCupupKlSaK/GrrT2lz5vVOurSl3IdYQbL4IioHBviaUWqiI7m+Lkql9SnlmL5TETgWo
         jtzS9FLhPXN8ORgqBfQVTpYzNvPRKP27r2X7eHfnEa61l0+fstAiXyZhoCYbcVSdawC4
         WWWWo6jQXxcbKcpe59cr0YyjcifDMyV58cm9xR7JhfZzw+IaC8AfxHqOAXEgL9dHjNx8
         U/Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUwVp7XMp+9sGEs34ST6wX79UWWh5lrzjZizTk/sJ7Ylo137MErthtX0VO1RQtD+LXSfsYUC0aBKZq4Lg==@vger.kernel.org, AJvYcCVODt2BZgHk9OkMR/Eg5HJh11b7kY8y9kLznLg8vs19EGtWKnaotF9UwU16LfbDXDWbbIX6G49be01s@vger.kernel.org
X-Gm-Message-State: AOJu0YyqXqtISkClpxpBg8rH4AjGoIx04HSdI60P6B5L9VwdlKyjpHiW
	CbMqbELlRyxokKlPYAMHAcxzk3Ti527Tcnrdc+oSjmHMN1m5Dv7l
X-Gm-Gg: ASbGncvQp0j0nozjgRhBKXaHGmFpZfcOa7MxIZKhX6CofIBvDlljXn0LTk5ngNyOf9h
	H1D+XQSholizCijqU3rLvfnaDO94Jg2lRbstMihfu+zgyTRHt+v8y+ExyRs2dfDLS54PIGvLCdl
	f7uNd96GmT/SuQ9x7kA18+78UysB3OhHig3w2cK12y1+nfLHYbmyxPvcVot0zp3MGPYjgHlLGHD
	ES7cNlIUNsFyNU5eIsloT41N64/iyrPcs9UhqQ7ABpdgPZvR/oa/6Zbop9tAuzoAIuYwQdhWUjT
	aARaxozzGRn+iJYPZ0htadJxtDJ88sYvxcNQRYfPteIgGUD6YwD7tIut+rOJVw==
X-Google-Smtp-Source: AGHT+IEXoGtllTfwN8wj0XZoZ/yThGkaXoXZXmSLSoHiarudgfuzxFOQqJw/jP4OzA48Etvey3HwWA==
X-Received: by 2002:a05:651c:a0a:b0:302:1c90:58fa with SMTP id 38308e7fff4ca-307587314c0mr16984371fa.5.1737809693371;
        Sat, 25 Jan 2025 04:54:53 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bc1981esm6960701fa.75.2025.01.25.04.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 04:54:52 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v6 06/17] HID: pidff: Add PERMISSIVE_CONTROL quirk
Date: Sat, 25 Jan 2025 13:54:28 +0100
Message-ID: <20250125125439.1428460-7-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125125439.1428460-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250125125439.1428460-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With this quirk, a PID device isn't required to have a strict
logical_minimum of 1 for the the PID_DEVICE_CONTROL usage page.

Some devices come with weird values in their device descriptors and
this quirk enables their initialization even if the logical minimum
of the DEVICE_CONTROL page is not 1.

Fixes initialization of VRS Direct Force Pro

Changes in v6:
- Change quirk name to better reflect it's intention

Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 3 ++-
 include/linux/hid.h            | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 89a1b6a55c1b..3f429936d537 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -982,7 +982,8 @@ static int pidff_find_special_fields(struct pidff_device *pidff)
 					 0x57, 0);
 	pidff->device_control =
 		pidff_find_special_field(pidff->reports[PID_DEVICE_CONTROL],
-					 0x96, 1);
+			0x96, !(pidff->quirks & HID_PIDFF_QUIRK_PERMISSIVE_CONTROL));
+
 	pidff->block_load_status =
 		pidff_find_special_field(pidff->reports[PID_BLOCK_LOAD],
 					 0x8b, 1);
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 29f0a91f505f..92a484f65a87 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1228,8 +1228,9 @@ int hid_pidff_init(struct hid_device *hid);
 #endif
 
 /* HID PIDFF quirks */
-#define HID_PIDFF_QUIRK_MISSING_DELAY	BIT(0)
-#define HID_PIDFF_QUIRK_MISSING_PBO	BIT(1)
+#define HID_PIDFF_QUIRK_MISSING_DELAY		BIT(0)
+#define HID_PIDFF_QUIRK_MISSING_PBO		BIT(1)
+#define HID_PIDFF_QUIRK_PERMISSIVE_CONTROL	BIT(2)
 
 #define dbg_hid(fmt, ...) pr_debug("%s: " fmt, __FILE__, ##__VA_ARGS__)
 
-- 
2.48.1


