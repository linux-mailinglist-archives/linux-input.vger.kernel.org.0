Return-Path: <linux-input+bounces-9645-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB75A24897
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 12:39:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 518941652CB
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 11:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C59186294;
	Sat,  1 Feb 2025 11:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQkZ9Bz0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1A016F858;
	Sat,  1 Feb 2025 11:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738409955; cv=none; b=f0uFdDL02UtlBuD18wNenOFzWpy8WYtrtBU2rdXAahHdPjJ3ECC13cwXApXKq1JddcHoP4JNghvqom5pBLP72T+pKZw18oTmllYeM7B2u/jn33oTkjIg2wRHwMz59DfPQsQmDAgqgyLb4CB2t9FW6QdE0sbH41b4PgYz1Huls8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738409955; c=relaxed/simple;
	bh=vT0NxbdrI6fSbYoeYU2IxQVUUt17vurL1Wne66n5fmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XVFC4cftTNrbPt2MbWZCgMhShx8GqubRbO6vzgpTeVQHhcP5H8e0jonsFVktz2uB7YpkDXXHiJijzyybVb+hXXfpu6fsLxaqhYvbjnuAUUbj0bp6Jl2PsD1xok3hRtnOkzRq1BUPD1MXnZOjwErTvFvvuFxlxpruf/mCx62eDbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQkZ9Bz0; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d3ea2a5a9fso578444a12.2;
        Sat, 01 Feb 2025 03:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738409952; x=1739014752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I38Qk1RTm5p9rwY7xvBkTCqFaYfLmI8D5AidGoGrF4o=;
        b=NQkZ9Bz0YA2Uttfa1C2UjYEFC22hKnJFMLLrpGoRmyHcaTpInPKGPfOHhbpKiGiDS6
         NPp48XcjPKFgmAvu/o9tVNjlA96Cn4KnV7ZdR5wvEJ1jETC5gTJAul9FRcSMNwIC4Sv7
         DrZYZofXMmpBxMbaECprN2MgiEzLKnO3nWKbvr73K0HXKSJu6xtuo8C/43UtIEkGg57T
         zDYsgeBOS4nEDOASPunQrsbcqE8JuOtFZI2IgU46rZOkoE/rr4xSRcoTbaIvHuwaMxZn
         QVrn27e0hles6N+4iFb5HuRboUbOQqyowHJVYNc6MGRYXKlPMYmbyE31zwx23IUbUOhz
         2v+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738409952; x=1739014752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I38Qk1RTm5p9rwY7xvBkTCqFaYfLmI8D5AidGoGrF4o=;
        b=OpF+VKdTprqu7cNWmyf0gYNAVAToANDL9ELCLyDhzR5fOox435/yaAARPP1jiFci3q
         Gr5k+XFi2Rq/eDS+GS4+qgmED2h67i+z+ZgZR2bq2i9eSf4bzB1Z6c+vZDmlYKG3NkQr
         9IlTsspSD7B0MKrw1l4u0P+DQrE2ToheZLLGQgpqdxcLTSkC5qXQiqWkkiNKcwawmSAF
         lcNqxdP7HkyRvVeOtV8tWJshc5biCVI/3hJBhOgRYyoUMG6/g9+OjeY7IdZJ28BX9CA0
         vmTr59jnh8Hm7aF3A6aR8D3QEwBVSCsnVFqa4NuhS9DOsh43qkNs6pZ8weRuaUmMes5s
         P5tw==
X-Forwarded-Encrypted: i=1; AJvYcCWF9TnC9Hz4nRx7ret6NoJUi26EAAf4A9kaIzXV+1sGEauGC9FQ5u9xrvfBPjwFvdhjS/7rX4HQ97+i@vger.kernel.org, AJvYcCWXvi5gFlWtiRccZktsCoD4zHPaGflCJVTSERM58vfOutdLsWCC4K4mtjO3qIhk1ldto2dfTmmn/rN+MQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxH7Borc4ICHhRxU5lAtTcuIk7kHSRdYqpYQAR2D6TQJ18cYM/u
	IzbKwdPK+TUFJGCFd130jRqkG+K7mXiGA5m2OIZsYE6sp6HdUicc
X-Gm-Gg: ASbGncvvulXS+WU6SVpSnfmdRetN4YZXSUsqZ1K8OZSi41FVEBYPvwvhO9ptMGxah9P
	FhUgvyAJi+cK1h5IDxwL/wHkwg5lF6nbQGAv+KrTPONJ4hxm9uf3Pn3Ymx4dSnc+XmRj86fOkCv
	eN5WogI3ne5+X8XvrofH4jppeBkUISmyVHuQy4dKEIfBVTIZoocBnRje86dWxnuyDAJBVzsWzOH
	pfKgrQTVzYx+i1Z3b8hfe4gePr6T0tbJ8LkQwPbshJsQ4gPkDkNbl4TBsC1Pegn71P6NxAXRdNz
	B50RI9u7viYCLBc4ZY7We3/3MoHe3qglXFmc3Xq2I5wg3FeHzu23eXftmIJfsw==
X-Google-Smtp-Source: AGHT+IFCjAGP1p3Wq4QJ5aS60JfotjkIa0f7D4cCvDXHVmUyXllLzsQ7bK2n+UwtZm1GHO+ZKJguwQ==
X-Received: by 2002:a05:6402:51ce:b0:5d2:7262:9492 with SMTP id 4fb4d7f45d1cf-5dc6e6e53eamr4360160a12.2.1738409951890;
        Sat, 01 Feb 2025 03:39:11 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723e9fa7sm4304577a12.20.2025.02.01.03.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 03:39:11 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v9 03/22] HID: pidff: Clamp PERIODIC effect period to device's logical range
Date: Sat,  1 Feb 2025 12:38:47 +0100
Message-ID: <20250201113906.769162-4-tomasz.pakula.oficjalny@gmail.com>
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

This ensures the effect can actually be played on the connected force
feedback device. Adds clamping functions used instead of rescaling, as we
don't want to change the characteristics of the periodic effects.

Fixes edge cases found on Moza Racing and some other hardware where
the effects would not play if the period is outside the defined
logical range.

Changes in v6:
- Use in-kernel clamp macro instead of a custom solution

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Reviewed-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
Tested-by: Pablo Cisneros <patchkez@protonmail.com>
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


