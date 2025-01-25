Return-Path: <linux-input+bounces-9539-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16382A1C564
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 23:25:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 908353A5844
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 22:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C83206F0F;
	Sat, 25 Jan 2025 22:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYKDvDbe"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9157B2066F9;
	Sat, 25 Jan 2025 22:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737843940; cv=none; b=MZ3EtxgYI5koA1RGxMa6Q3pp5xcKFk3C8rBUFOxbott2GtP0et7PbSktjWGcMS9iN9G64W4lURrCx/uTU8ozPl7pgvlyyiWfLh5Wen2OXUfqDCL7i8IVFDEr5BP8Brob4hPBSvDPJFsj0QeoMHX4NFagBMkp5mcJiuP9WUtfLLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737843940; c=relaxed/simple;
	bh=CGtZyHW/IhLJ8G2ImtmjQ9/dyeUyd5xFN1CHprzhZSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YHd2elqcRSAyL2c+Bj0NMnTt/qTx/Pcj4+w2Su4n74Bg/PczfxQiw2xFQBAuHjbygs96Y8+nnjtX+MHSV0JfkKMNLhMIsQKM5YmDHujQGDx/M8gm+Xg2h4RxnYf6ShYEKTLqasb3dXEXAV/+xjHtFPhLIK7mcbxAZri9vzAsik8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IYKDvDbe; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3e5c225aaso687831a12.3;
        Sat, 25 Jan 2025 14:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737843937; x=1738448737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCzGE/w6ShAbewfgFQBX/+PHxEYx9n5v+vKkrVVffh0=;
        b=IYKDvDbe/DWKvBQ7c180PkdTLwIqwoyTEp7h8w78kPaDoJjdkwlNzpMX3TUkxbA/DS
         4pA+K8FRetGs5aGNVx95dejFB26ZRM7G4zqle22bbGbaufa23skiTHZJj2rv5VjhsXqK
         a0pg/QAiCKZPPz60mEdz/Yww3fymZ079tVpYr8wezysuAMyLb7RzGxIONJHIYeEczyRW
         ne1gLJBM93s9ZNdWwFA9tv572WrVbgFWY+8nxsy+qVWEXTn6Af/tVV0S++32tChJFprU
         BqbmmB7RPHX2U+QX5BQ0RoIoOkTUASwjKtybXGqEHLWfCYskINJO/V9eMDqtClis2C8G
         MtPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737843937; x=1738448737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bCzGE/w6ShAbewfgFQBX/+PHxEYx9n5v+vKkrVVffh0=;
        b=Lg8sBF1P6dLg1NMkl1WHU2WIKQqhZyYjlx2Oqk6uxhvvQecLFcGQeKU5pdDjElP0j/
         pjaIHKrF36pvuCQ9NHDHlXbgPFZbJWEtmb04FBM5WsvL0/PM0XKwv6fZOhhRSzyZKXVu
         svwaWZ2bUTNK/NDdxBubjqcFGQmz4lL9eYKaeWfJ/fD01UC0du+qNCEOhrhXlk+fBgyF
         2U1eu7R4sFkD5ZtEESy6ntczumMqqvj/6zQOJGyM4fCo1Z1jNgRT2tvQmStpeXEws0/G
         wikAsXpuOXtm/S36MuiUfsf3pbrM4uqhRgwDkkJAX6XmAR5z33MMX2D+/2/1IW+fr14o
         kB4w==
X-Forwarded-Encrypted: i=1; AJvYcCUOQ3wNtEJG81YhyphRVuSBc38GfFm5sdOb4w+rcbTDYgmdWIqffAfNmEZL1xZSjMkg92ZRcFiq99tnSg==@vger.kernel.org, AJvYcCXpfsRVMy2ujOpef8XAwGfKhw1PQfsyGhzHYo8h+n3Cd1fkIcxzYrDEraZLdJ7kAFleOSB4ylPiodwX@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx9hkBhZk1QDYg/v063mbx1sxXEVnlV4KwejKUKUqMDZJDzttw
	sQC4+gGUiUPyqJ8kRwB7psdtJltVdUtDcqWDLFdN7X8BROtjZwkB
X-Gm-Gg: ASbGncsknyXquvcTq7GY3+A5tqBQDIDDA+n0Bcwc+R2cxldGeu+AZbXfgeXva1IojAN
	RTGExZS6MO71fMIyKGZxxPgebXWlD+nt2GIiaIUljEYt1DCH+CiCzfVe+0Yv+oWJTNffIEuNW2c
	IymNa/SJFuBDWVi2dsxhfL7aPvkvy6dpjqsi0ARQ78wJYFrDi2pnrwhFuEk8PeRUTohAhEWDXbC
	j3tDrz+k2XKhFldZUpfC5eYJBEtre35+v4D1G6ZWbkF+reUtWkVP/gHvfnIWTrPexZg5FKDfZFV
	X6emWU2fQedAA3fVQy4d55uVru3egxQr2WosCh//wqGpSMef6WA=
X-Google-Smtp-Source: AGHT+IG6L76WXOnBEYR2BaZbN4Cb6yQTQK7X0KAFpy35uHWYpoGtpduVrbJwGvhwL+vKT0nQ7kfing==
X-Received: by 2002:a17:907:3da1:b0:a9a:1a17:e1cc with SMTP id a640c23a62f3a-ab38aefa8d4mr1170214266b.0.1737843936588;
        Sat, 25 Jan 2025 14:25:36 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab68f1ef7besm136540166b.62.2025.01.25.14.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 14:25:36 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v7 03/17] HID: pidff: Clamp PERIODIC effect period to device's logical range
Date: Sat, 25 Jan 2025 23:25:16 +0100
Message-ID: <20250125222530.45944-4-tomasz.pakula.oficjalny@gmail.com>
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

This ensures the effect can actually be played on the connected force
feedback device. Adds clamping functions used instead of rescaling, as we
don't want to change the characteristics of the periodic effects.

Fixes edge cases found on Moza Racing and some other hardware where
the effects would not play if the period is outside the defined
logical range.

Changes in v6:
- Use in-kernel clamp macro instead of a custom solution

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index a01c1b2ab2f4..488e6a6a14a6 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -15,10 +15,9 @@
 #include <linux/input.h>
 #include <linux/slab.h>
 #include <linux/usb.h>
-
 #include <linux/hid.h>
+#include <linux/minmax.h>
 
-#include "usbhid.h"
 
 #define	PID_EFFECTS_MAX		64
 #define	PID_INFINITE		0xffff
@@ -187,6 +186,16 @@ struct pidff_device {
 	int pid_id[PID_EFFECTS_MAX];
 };
 
+/*
+ * Clamp value for a given field
+ */
+static s32 pidff_clamp(s32 i, struct hid_field *field)
+{
+	s32 clamped = clamp(i, field->logical_minimum, field->logical_maximum);
+	pr_debug("clamped from %d to %d", i, clamped);
+	return clamped;
+}
+
 /*
  * Scale an unsigned value with range 0..max for the given field
  */
@@ -361,7 +370,11 @@ static void pidff_set_periodic_report(struct pidff_device *pidff,
 	pidff_set_signed(&pidff->set_periodic[PID_OFFSET],
 			 effect->u.periodic.offset);
 	pidff_set(&pidff->set_periodic[PID_PHASE], effect->u.periodic.phase);
-	pidff->set_periodic[PID_PERIOD].value[0] = effect->u.periodic.period;
+
+	/* Clamp period to ensure the device can play the effect */
+	pidff->set_periodic[PID_PERIOD].value[0] =
+		pidff_clamp(effect->u.periodic.period,
+			pidff->set_periodic[PID_PERIOD].field);
 
 	hid_hw_request(pidff->hid, pidff->reports[PID_SET_PERIODIC],
 			HID_REQ_SET_REPORT);
-- 
2.48.1


