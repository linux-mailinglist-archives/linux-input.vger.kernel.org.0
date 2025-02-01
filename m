Return-Path: <linux-input+bounces-9656-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D213EA248AD
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 12:40:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99C5B3A8595
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 11:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A78F1ADC76;
	Sat,  1 Feb 2025 11:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhCJxLAC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BECE1ADC69;
	Sat,  1 Feb 2025 11:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738409968; cv=none; b=in8ECkDf9H1V3L952vGWz/bSF0rSZNU8GYh4owYQmkWXYrERg34lnnm9CuOFH4o30EHVtmZne6n0Q3eaoZG7scareFRAp5tnM93U3hBGOSfuf0eObF0YyB23gECSmVnBf0c+1Iq/V3RNLEDovWUTz7k/0u2arOKU6E2gbtheBkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738409968; c=relaxed/simple;
	bh=ODEEFs6QcblolBpyAYvB4QdxvL/26BD6ANbK4ifHq1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bQb0fSo+HboF+MeUg091GFaGS44xO3qdEAdRk8uTuQr5SPHzulYlEIMraNuslPPsVqn4ndjZBs97uhaZfUih6KJGcSOwjs1k9mpVtAiUJK6D5VMb3cXLLGxrU5XzkSKaSGTTh0R/5HQygbBWDPSvsMxox8GPIn6sEfHOWmCHDFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhCJxLAC; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5dc191ca8baso598141a12.1;
        Sat, 01 Feb 2025 03:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738409965; x=1739014765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+eEwI9YsauWYQP4PW4nUrzcrCNyCVVDJRogBqM4pcY=;
        b=KhCJxLACAtM9/9iZjdRxBR/mYx8/Y9awhjnl6URkA0488HYhKEIxPBr+DCYyuot32N
         Sk66o7rjfsfqrCP7L5LpfgGqzGv5mL8Fadb1xjU6NreBMFT/f9ks+SXO9NZxr0T5Asm5
         6ggmUQM49B1W5z0BD7d7efgVao1UZRfly8A+2fE1MqH3j+nsV2lUspLJs1CClUS7xdrl
         pwyz32vcF2k2woHk7bMXQHOeWFMxcRZpmR3k03JnmOteEctRZStNcrUZNsyUJNi+jEcV
         M6xoUIBiC94/8VtB6lLoYCPZxB5oO59K3g1VpCR+PYqHVzPxbQXH9lm7vN9zffK4DgI0
         BZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738409965; x=1739014765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+eEwI9YsauWYQP4PW4nUrzcrCNyCVVDJRogBqM4pcY=;
        b=QvJIdqm2BrhdCsZnxr/E+jaSpW2OLrelT6KGBRku52HMvTFuuviPtfqQnVNAb1i4Dr
         x6XdWqGnCTGS9+Ngm4IcIcMMWxErWpdmMUu1b/0cw9YoJD1MfRf58tlW1U88s1ZKtmcx
         DVxrLH59z8aUm7Ox0Fvd76odqBIRsX4q5r7lvjiQ63Xd6GjrXz05Znc7uOb6iJvJrgvb
         pE+pDpU+jHbrX+qd2WUhFTRvk4cqZSecMqwQXz4EduvqWJF/P1L9K6/Gr1fjkn/Zrqux
         OfcQlVa24mQUB77z8MSReurbrZ4ygVaWFs+294QD/6vY8KJqRqa8GHJC1r8S8QLF3X4C
         4VXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2INdPbg+6G8gDGi6bkUHWwaf6DzL4fBLWI68vdJ4kZxjUtxgtcV+nwRV5KUmd6Cd0wjleEUefJiawXg==@vger.kernel.org, AJvYcCWdP+od3ixJmyBB9Qc8OMGXMwUWI+cP9479374+z4HeJ+JRXg1b8l+ePqvtuSlDQtb/T8l3zJReg7CG@vger.kernel.org
X-Gm-Message-State: AOJu0YyoPMog3KYrrBPDPoulEYtVqPUR7kASyC2nCaO6AzmbRR8Nn/Ue
	BfjM1E8aC2U2bGJNpBCOKRkIE2FZMc4NFGIV4H6jbd4IRkI0SrDAladWzg==
X-Gm-Gg: ASbGncuBoX3rmqb9SsyZxM8RodTxLTk/tE3l4PGmwd/qxucx8XeXRnI3m0SNqk48g9g
	ARcv3OPU6wUpXAMVLn6XgzZo1QiahKkmrnw+nyWGEeU1xCo4wRtV7lGTg+vFledatvqmW2Ke3Hv
	INqhYJ3Q+dah2a9keKlcTVKrzZG9lM9GYpBLf6KfhY3b05Wk5Enxm5UAfoiHFA/XtK3BsUstT3v
	cQV8YSisQuemZ8WKDO2BwYlqdQRprsuuYMC8t/wNj76yawBPd3NrXCMfDXGZT/m++4fphyJSPi+
	6kq78jnWDjBx2s9MJMVfimHTUAqGCk4kA6QK6dN7IV/2dWFZTFNLbrv9ZWaycA==
X-Google-Smtp-Source: AGHT+IHz9vReuNWDDYQiCnNbFs95U/V0fby6C73cqoq6QfCy9qZDm5NMKKSXvDo/OPt8oAxSbULuXw==
X-Received: by 2002:a05:6402:524c:b0:5d0:214b:96b4 with SMTP id 4fb4d7f45d1cf-5dc6e6e5440mr4636815a12.1.1738409965271;
        Sat, 01 Feb 2025 03:39:25 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723e9fa7sm4304577a12.20.2025.02.01.03.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 03:39:24 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v9 14/22] HID: pidff: Simplify pidff_upload_effect function
Date: Sat,  1 Feb 2025 12:38:58 +0100
Message-ID: <20250201113906.769162-15-tomasz.pakula.oficjalny@gmail.com>
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

Merge a bit of code that reqeusts conditional effects upload.
Makes it clear, that effect handling should be identical for
SPRING, DAMPER, INERTIA and FRICTION.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Reviewed-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
Tested-by: Pablo Cisneros <patchkez@protonmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 54 ++++++++++------------------------
 1 file changed, 16 insertions(+), 38 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 7db63d686c62..a8698593e432 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -770,48 +770,26 @@ static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *effect,
 		break;
 
 	case FF_SPRING:
-		if (!old) {
-			error = pidff_request_effect_upload(pidff,
-					pidff->type_id[PID_SPRING]);
-			if (error)
-				return error;
-		}
-		if (!old || pidff_needs_set_effect(effect, old))
-			pidff_set_effect_report(pidff, effect);
-		if (!old || pidff_needs_set_condition(effect, old))
-			pidff_set_condition_report(pidff, effect);
-		break;
-
-	case FF_FRICTION:
-		if (!old) {
-			error = pidff_request_effect_upload(pidff,
-					pidff->type_id[PID_FRICTION]);
-			if (error)
-				return error;
-		}
-		if (!old || pidff_needs_set_effect(effect, old))
-			pidff_set_effect_report(pidff, effect);
-		if (!old || pidff_needs_set_condition(effect, old))
-			pidff_set_condition_report(pidff, effect);
-		break;
-
 	case FF_DAMPER:
-		if (!old) {
-			error = pidff_request_effect_upload(pidff,
-					pidff->type_id[PID_DAMPER]);
-			if (error)
-				return error;
-		}
-		if (!old || pidff_needs_set_effect(effect, old))
-			pidff_set_effect_report(pidff, effect);
-		if (!old || pidff_needs_set_condition(effect, old))
-			pidff_set_condition_report(pidff, effect);
-		break;
-
 	case FF_INERTIA:
+	case FF_FRICTION:
 		if (!old) {
+			switch(effect->type) {
+			case FF_SPRING:
+				type_id = PID_SPRING;
+				break;
+			case FF_DAMPER:
+				type_id = PID_DAMPER;
+				break;
+			case FF_INERTIA:
+				type_id = PID_INERTIA;
+				break;
+			case FF_FRICTION:
+				type_id = PID_FRICTION;
+				break;
+			}
 			error = pidff_request_effect_upload(pidff,
-					pidff->type_id[PID_INERTIA]);
+					pidff->type_id[type_id]);
 			if (error)
 				return error;
 		}
-- 
2.48.1


