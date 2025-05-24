Return-Path: <linux-input+bounces-12556-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF36DAC30D4
	for <lists+linux-input@lfdr.de>; Sat, 24 May 2025 19:48:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 760D0189F026
	for <lists+linux-input@lfdr.de>; Sat, 24 May 2025 17:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA931F3B85;
	Sat, 24 May 2025 17:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Doq59GBD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BED1F1531;
	Sat, 24 May 2025 17:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748108860; cv=none; b=R4u0Yy0RUDlISIQbbS/azsnyHZniZIzdmUEVBKIxo8pq/DuFhhNdTKnNb6GQrnPT0jmCgULWNr9I0jEMvHXSNpm7484fsYnZs7sgZJiNYtkwbr8HRnZ2FZ+1ONK75wrLUkhEzV4+O87nKpIiR/drJ04gxAfaMfo1oO6aa3NFEAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748108860; c=relaxed/simple;
	bh=nTZ6r0Tda4xGcagX9QEjNojbjy4ea8auhWMH6Rp3B3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bKAIUAPQt3QxyZBYzKGxogJN9ld9hHaClsPU20VwiGIHJhN1Z5wBWdDEQ6GS4v3U0ft0ybS8pp5GPHLnIKV7FA48I/rpJGYN6gNgBW4Tif3scBFTWqEEd3jEpYpYsUOQmFVY8najeDDlyPQQ7LiBzzfzLdQSrl2qMxfn5soI1io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Doq59GBD; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-604583107c9so41698a12.1;
        Sat, 24 May 2025 10:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748108857; x=1748713657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTp4yJzrpEAf36Dg0kswN0Ez0D2ZNwqFBQu1Ab6aMnA=;
        b=Doq59GBDb3g7LfFKSdUtjBOLZ41oxOnuYkyRVUiMaZk/1VpH8BGa7le8DO1QUWi9J6
         c2CI+nak1SQRMsBHoNk/j3Rn0BMK6gSdyiNJZcgBZLeJsQp/UZoqMQBKn3Zx/5L8W8rx
         bHemxMvoPxmlnVYtD5+vSn2SG3Oz8jBPNyvZEiWyDx/M797Em4ePXDX2acrNDm+rsLIF
         it7zhfrDYJp7+BuN1NGZneKqpK0RBV4yy/bGIYsPXoR/QP6eUGm4ftSYlrlysdn5eUM6
         WzAEhJ0gQPFBn6Eg1kGiY/thslLfIWK4uLdn6s4J7xDBqkcG+60yWmisu//PTKKeKXQq
         fbIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748108857; x=1748713657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTp4yJzrpEAf36Dg0kswN0Ez0D2ZNwqFBQu1Ab6aMnA=;
        b=R+WN+8dJlIKW7WeThiJ+roACdQVRcLE89U9AZ2K7+bTy24G9H7ACeECpWnmMygMzqv
         p1UZg1t2QQe+zQ5oIys2Uju66nVVCxprUgcOPEW7lF2mRzd+M3f0xyp4dz7a1lo7nZce
         2c76BCOLx4Kb4T8UuqMoMrBT36F0rak2wZOkWY7bOZM+WWXB29Hg+OuBx5KOavZvtApG
         yC2KlIeXmokIRxx4humEMjZSX11twQCgZ3efGpfpQkNuM9VpRi62HyfntH0NQDl1wd+L
         Fww/A7J/JiDswch3pnHsgP/GxlkfcdrEWlEWbsmBy58QI7zOCXKPovBK9KBPc8mVzm2z
         UPrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWCjiAKnGKqtGymQrOUI6YbNGDu41EP6GU/5hfb9TgmAZ+vR+q+Gr3tLJfa++tN7A7E1uWfR+opYHb5g==@vger.kernel.org, AJvYcCXyyqi1wic9IwkKSeIAnMwUTQSx04+kc49gAG2NEabmfoobA1Xup9ybqnYYmPxNV3i9HZ0gMbuTwjMI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8dJQ6kQICMz9XRUR3nqZtsOMduyaKnPDwPUIJ+XiRERtjwg8y
	xFzJTfNnJkkqgjt9HRf2Zs/Pbv/z4qTrJ5EMrb7dz3hwA0g694Xmh91jWcVncA==
X-Gm-Gg: ASbGncuvFsbwdOwUOrOLKAMmcBjvIQ8j727mLINV8vUic03wBkdkei3xQGQ9nRT/r3J
	EO6l6+RYPALtbU+W9bOFZXP1X9x9t5d8GJgRzTP5vTBmQNsDC7W42Rnq2QnKkop5ZMkOG2AQhBZ
	6kzjRAZDz8aAjlEce0PQMRFed1cNhjs/lBJWO8iA44qkuq+qQRzbOc3AssW5ypLqS5P/RKwHHAD
	peBDHuDOMaSA6CmY2pt4X+I9PS5qKa0ydLDyfqMcU9noa7wdEo52MDRuFFDDz341GU+hjTm4GiN
	R8XOCvLHZq3McSiAAtJI60wojVQTQh0aAnBwK8NMXofnmQ5s9YQXAo3GL4B+8aaqcw==
X-Google-Smtp-Source: AGHT+IFh/1YhdOhvyRdRQV0WancP9s++sWPxCtKHk3dD1D8TocPQ7CfEIuctsg7Y5aEW3ehDowG64Q==
X-Received: by 2002:a05:6402:26c3:b0:5f6:261e:db8c with SMTP id 4fb4d7f45d1cf-602da0ed590mr1055021a12.4.1748108856677;
        Sat, 24 May 2025 10:47:36 -0700 (PDT)
Received: from laptok.lan ([89.64.31.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-602f11a0e0fsm1138789a12.13.2025.05.24.10.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 10:47:36 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 10/11] HID: pidff: Add missing spaces
Date: Sat, 24 May 2025 19:47:23 +0200
Message-ID: <20250524174724.1379440-11-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250524174724.1379440-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250524174724.1379440-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes checkpatch.pl errors

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 0e19d61f4936..a07c5efddbe4 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -243,9 +243,9 @@ static u32 pidff_rescale_time(u16 time, struct hid_field *field)
 	int exponent = field->unit_exponent;
 
 	pr_debug("time field exponent: %d\n", exponent);
-	for (;exponent < FF_TIME_EXPONENT; exponent++)
+	for (; exponent < FF_TIME_EXPONENT; exponent++)
 		scaled_time *= 10;
-	for (;exponent > FF_TIME_EXPONENT; exponent--)
+	for (; exponent > FF_TIME_EXPONENT; exponent--)
 		scaled_time /= 10;
 
 	pr_debug("time calculated from %d to %d\n", time, scaled_time);
@@ -569,7 +569,7 @@ static void pidff_set_device_control(struct pidff_device *pidff, int field)
 		hid_dbg(pidff->hid, "DEVICE_CONTROL is a bitmask\n");
 
 		/* Clear current bitmask */
-		for(i = 0; i < sizeof(pidff_device_control); i++) {
+		for (i = 0; i < sizeof(pidff_device_control); i++) {
 			index = pidff->control_id[i];
 			if (index < 1)
 				continue;
@@ -620,7 +620,7 @@ static void pidff_fetch_pool(struct pidff_device *pidff)
 	struct hid_device *hid = pidff->hid;
 
 	/* Repeat if PID_SIMULTANEOUS_MAX < 2 to make sure it's correct */
-	for(i = 0; i < 20; i++) {
+	for (i = 0; i < 20; i++) {
 		hid_hw_request(hid, pidff->reports[PID_POOL], HID_REQ_GET_REPORT);
 		hid_hw_wait(hid);
 
@@ -851,7 +851,7 @@ static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *effect,
 	case FF_INERTIA:
 	case FF_FRICTION:
 		if (!old) {
-			switch(effect->type) {
+			switch (effect->type) {
 			case FF_SPRING:
 				type_id = PID_SPRING;
 				break;
-- 
2.49.0


