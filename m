Return-Path: <linux-input+bounces-9650-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E982A248A1
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 12:39:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E83BD1884D43
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 11:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADA22198E9B;
	Sat,  1 Feb 2025 11:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RBqYLXgW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99C415C15C;
	Sat,  1 Feb 2025 11:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738409961; cv=none; b=aQTITqSira7bX6TV4+t2jafetfMEgHIyV0WkS2FJrRy8nQO1hvtdILaPbOq5oSJcsExR7VZ0mSKWN5gEKjIddRAzUWa9pjuB9+wi3/OwK9qPJDoo23IdBx8d5sjOGcC0oZP0C7aeg/Sygrdk9HvLJFgw8ai/jHUKbojXwTYywQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738409961; c=relaxed/simple;
	bh=cKMQxhufQL8VekFejXcHHOhtc1h4AiSN3OXkML6No20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D90Lz/2G3yoLlo4MoRO95NVFNjXxjWF8/IIse0qPktIPcE7hQLwsgwy5DEWNSh9dXb5TSCM4jb82BNE94Byl+s6b6TvXDt5UR4mh0px17x0GQvLqBVX5K6Ff17of4XDamVNwiZ985EXv/qypt7xhM2MX+dTTjwqhE6AJWt01bVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RBqYLXgW; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d3cd8e59fdso495328a12.3;
        Sat, 01 Feb 2025 03:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738409958; x=1739014758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hiVUhAAIDv4+MyBAU0QWqGizN9/DirOuQTI3jo6M3F0=;
        b=RBqYLXgW6fZRAfIrQPL6nZ4gpsvWd9BX3RN/yZRIiK7NYBkxAyOaPJfTvTeJcAlPhk
         lTuCwDFyKP0muwfohSTgdqDhq4/0lQWquW9TayECPDkKRUCWiItFmnTGwD4Dbg2eNNDT
         HxpBNG8iBqxz9gFl58KH35XyhGYA+c/Nt90paG9hAX0xSyU4szUiXr5jNv8LnSJuCH/G
         ydOQc6IC45AJ7Dx19RhxppEHVJO67CZo7T9kU7wosh4/dMKTK/RwudKZRx1DC4MQucJI
         G7Xu3gW2tBOrtXNj5u6n4w7ZSqfT19Zgvcb6u+5QYqF3z7uNTrXPzC+0fmX3oFljqRfQ
         zQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738409958; x=1739014758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hiVUhAAIDv4+MyBAU0QWqGizN9/DirOuQTI3jo6M3F0=;
        b=Kzl9Ed4gF6UixMjDNFvZvmFy4WHi3DOzt5H6E334r2rvb+NNatzZdhKq262KzhdjBd
         gYNvsYZfyVJor+SQUOOCF8nV5cOyyHP85agp4jDlIfs2fGzr7CkLElPTFD08v/APGXOA
         tnGGNRSC1ico13VK8Y7krx1oCZ7B+Of6sYShjcNDABaSZXOoU9/3vmA9DPVG6+LaTGjS
         lM4H59kgHwS8J2wsg/zq7JFr4WOReBRnsUALReqyMYJnzfMHgQO0lVYIfvUiIBKZju6j
         y/pYg5UFiwM9vOI3EY8Pnt/8tXA808Id/aWf3zoT5s+rsCixO2VPX40vvwySuzz/ydfj
         PXVw==
X-Forwarded-Encrypted: i=1; AJvYcCUQutWiwRYD8efqu1EPFJPMq4+5cHbi981SdfEiHhebOI3KjTSRygHZVdrFDWPubQiS/URZ7ixJ4HzZ0g==@vger.kernel.org, AJvYcCUua77faPwukOcFzCo9+S+0WnCxetFEMCjGDR1tIdeNFfx+foVFZTmUbIXNzALQ9ETy/yH87QSGoYcV@vger.kernel.org
X-Gm-Message-State: AOJu0YwN2xA6o51rm2EhFODueFV5gAvDW5+Z3R+YrobIKd1cwy1PHWpH
	UrFmiyNNcj7pfTvoHfbuzRo/7ZexWobH4Ox7zCdiYVuQKWN4b/8y
X-Gm-Gg: ASbGncs2glbD6bRwNhWjWIzTZ+JlIxuJhXyPnmUjyi4c+5TB0iueLFD8OnUA5kRLIqH
	1KNhneecydg4y5zOkYvlcUuNamIZkprKN39rvGtxncIIWLvnkSQlzBWsBtyiU+pILo3du0h0Bpa
	ZAxdnDyINiTklv6ueKOTAglZlUT9qs8tbW4eBjgsr8t9VJOAhwdMbGu2fOfEOMwDHl6nLa74lNy
	zvfKBgFA1HJPBTp0vs5PMeY1qKuIjVGBWfXjxMsrgfxAbCL4KHPSn261HqGZU0gEeRMDqAFutt5
	m3TzZuVIGxASbly2Jv11WRkZz/X/B4KugiE6xPAz4Dc97I5iSMJvVTXXXIBU8Q==
X-Google-Smtp-Source: AGHT+IEYnT5yXak9RUjju1duaZ8gPTnPzROagQBvUg1bIyARNQs/48kKa7QFxToU8Voi2LQlTtuI4Q==
X-Received: by 2002:a05:6402:5019:b0:5dc:7fbe:72f1 with SMTP id 4fb4d7f45d1cf-5dc7fcdb68amr3217789a12.2.1738409957991;
        Sat, 01 Feb 2025 03:39:17 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723e9fa7sm4304577a12.20.2025.02.01.03.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 03:39:17 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v9 08/22] HID: pidff: Add FIX_WHEEL_DIRECTION quirk
Date: Sat,  1 Feb 2025 12:38:52 +0100
Message-ID: <20250201113906.769162-9-tomasz.pakula.oficjalny@gmail.com>
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

Most steering wheels simply ignore DIRECTION field, but some try to be
compliant with the PID standard and use it in force calculations. Games
often ignore setting this field properly and/or there can be issues with
dinput8 -> wine -> SDL -> Linux API translation, and this value can be
incorrect. This can lead to partial/complete loss of Force Feedback or
even unexpected force reversal.

Sadly, this quirk can't be detected automatically without sending out
effects that would move an axis.

This fixes FFB on Moza Racing devices and others where effect direction
is not simply ignored.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Reviewed-by: Paul Dino Jones <paul@spacefreak18.xyz>
---
 drivers/hid/usbhid/hid-pidff.c | 12 +++++++++---
 include/linux/hid.h            |  1 +
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 298a971c63fd..9e03dfb2b1e7 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -136,6 +136,9 @@ static const u8 pidff_block_load_status[] = { 0x8c, 0x8d };
 #define PID_EFFECT_STOP		1
 static const u8 pidff_effect_operation_status[] = { 0x79, 0x7b };
 
+/* Polar direction 90 degrees (North) */
+#define PIDFF_FIXED_WHEEL_DIRECTION	0x4000
+
 struct pidff_usage {
 	struct hid_field *field;
 	s32 *value;
@@ -337,9 +340,12 @@ static void pidff_set_effect_report(struct pidff_device *pidff,
 	pidff->set_effect[PID_GAIN].value[0] =
 		pidff->set_effect[PID_GAIN].field->logical_maximum;
 	pidff->set_effect[PID_DIRECTION_ENABLE].value[0] = 1;
-	pidff->effect_direction->value[0] =
-		pidff_rescale(effect->direction, 0xffff,
-				pidff->effect_direction);
+
+	/* Use fixed direction if needed */
+	pidff->effect_direction->value[0] = pidff_rescale(
+		pidff->quirks & HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION ?
+		PIDFF_FIXED_WHEEL_DIRECTION : effect->direction,
+		0xffff, pidff->effect_direction);
 
 	/* Omit setting delay field if it's missing */
 	if (!(pidff->quirks & HID_PIDFF_QUIRK_MISSING_DELAY))
diff --git a/include/linux/hid.h b/include/linux/hid.h
index e6e9081d7dac..856bed149246 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1233,6 +1233,7 @@ int hid_pidff_init_with_quirks(struct hid_device *hid, __u32 initial_quirks);
 #define HID_PIDFF_QUIRK_MISSING_DELAY		BIT(0)
 #define HID_PIDFF_QUIRK_MISSING_PBO		BIT(1)
 #define HID_PIDFF_QUIRK_PERMISSIVE_CONTROL	BIT(2)
+#define HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION	BIT(3)
 
 #define dbg_hid(fmt, ...) pr_debug("%s: " fmt, __FILE__, ##__VA_ARGS__)
 
-- 
2.48.1


