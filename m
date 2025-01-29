Return-Path: <linux-input+bounces-9606-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79450A225AD
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 22:29:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FFEC3A2432
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 21:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944AA1E3DCD;
	Wed, 29 Jan 2025 21:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KTiIsdCr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EDA1E3793;
	Wed, 29 Jan 2025 21:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738186186; cv=none; b=T5D69Q5TovCtZO/Loye0hlpT3T3vwo/YRx3j9QMGLQ9neX3jM+Z6AJhSNId86kp1AxF3KdK9PRQmD6rV2+sS35d5szZmX84jmvdW2KCYwNdJDi1hdxF3oOqgHSz7Ynqaxh3D4HIP31vRuLg0R4NyvejX2R2amZsPMn5x48y7PhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738186186; c=relaxed/simple;
	bh=PBSW4fuTwFIRCoXWqVpX+8v2HMvFjX6w5ecsvytNEnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ixivqHWBuCOs+RkGK/DpUB82x6IoCb9ET0aEkHZlS9fkzBnfn47saIEdG8rmSmmL8M6Zv9wUXaCJdLZ/1JJPQQeK5TS7SVG5fwtzoprGCk1Y/x64jH3vlGw11RrVjFgZBCVw8FU4CXB04hF/jU/5mOwzCFCob08sjlNhZx03lwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KTiIsdCr; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-543e070cdd2so14980e87.0;
        Wed, 29 Jan 2025 13:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738186182; x=1738790982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHWpDui6ndTWaDwIggrwI88oJ0Z65ncmkdvxeGqa1dA=;
        b=KTiIsdCrlQytbJgeduLuYnd8TFL7nVeU3CaB3i53YeSqNXkW27r3YIwaYv2u8pRnc/
         4tQBBFPJtKdYR0mzxxtz0fwnrPoq+L+oB+EZJVks1Z+7jXTOd/1PW2bxv/jnlZWhJssn
         Giy0IZsxRUU6QAStvR+OjtMuImKWiF9G2UuKU+gBoZl30a9g0G1Yu7Mj8/29C1FFxNEQ
         70/FQ2oASC2/upBokHuJMJe7wb4LnF4HjhqTZ8fCm0dbbFJTyuX/WtUiGwSosVjF91U9
         OLCz/4ZJlg5LKW+cFaovJ9p6rVv8oyuS5tDHkBr3AJIuqfZTQz35JmffUkB59JaNQzzC
         YwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738186182; x=1738790982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pHWpDui6ndTWaDwIggrwI88oJ0Z65ncmkdvxeGqa1dA=;
        b=UurYvSS4MOqVn+jfY2g9pgYYoKlQRJy7dvg/YBC8syrrIz6D+EkkF/WGz/XTH5OO7F
         3Lbvhq5D6KCuOEwiJ7jbKc6UvdHZr8W108gbrY9B9EVl6KmK4KuBn+jZuCBGHPNqkPTD
         vsiV2vCTaNpPOy8FFzVAZtNviOINraZqwQRA/uU7EsTS78zVZMualyAWV7xb2gaGcZ6/
         zm0lGu6vHi6kUMT5TIRjc/NAPfqSiFfU4nrWdUEnFGeYNqVCv6DO2UaSRkIpGdF/1JYe
         FBICiFR7fDVwlXWLFA3Zb2nP3bcL+a9q08zhrp/oQyGoJy5kwu2CjAIXe+THqGsr1nUK
         CzGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHAXFkIV9oHDMZkT1CduLNaU4+uo6RxJKXXJNDphxi+F0iiu+RmD6Jys30/4ICNBSHE5SIzatH1CyE@vger.kernel.org, AJvYcCXy0VFhECdAv/wF9mbXAxoYOXvbGhQAZXWmayoU1EQq5whNs5Y2Pb1Ylc548u05stIMATOrI6dqpjXNrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgjSW7iG/91gIh23SIyDBST3cNxTtsSLfhNiJK0A9HXeaAHClD
	oWlkXyVTR5qKd+8tKQsELWjxrTf/x1nZAd9tE+NJdpJgQz5GRQkm
X-Gm-Gg: ASbGncvkf8Ldf1AfUQ+pPL8tT83fv/dZgtgfTBFg34Esx7L9G8amdNOlrgMqK/j3gq7
	CRFrR2a/qoLEbMMTNjePXtLHByuww/JVNKWVedYGEIT+bnDC4eSafb8Rov4aGZ6hByIqK1N7HMn
	wXGvc/+SHgPYWTNmobg9/gjyJ+62RTfZHr9P0WMGfTM/zgDCgNoMox2YaLQYHgo/PXkRtV4qwNf
	SxFw8MbzV4m/prAbvbZ6/dETmvaTlkX4lcDaQNkjPrKXwhzeHFBlriurKM/H+myoh8WAGEmDTpH
	iMV8gz9BWXSwqmsgeH71oZbZjtGaexuFTy8ZB0GcrbLr0pEQp85D/Ah3z5nX0g==
X-Google-Smtp-Source: AGHT+IES9brpqM+XCzSVy7WyDC9AOjiHcXNPqxTs84JzPGrmUMZyY3JBWKva5sKxvozRlBJ2BsAkhg==
X-Received: by 2002:ac2:4e0e:0:b0:540:75d3:95ad with SMTP id 2adb3069b0e04-543e4be96f7mr595552e87.5.1738186181536;
        Wed, 29 Jan 2025 13:29:41 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c83799c0sm2100778e87.190.2025.01.29.13.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 13:29:41 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v8 01/21] HID: pidff: Convert infinite length from Linux API to PID standard
Date: Wed, 29 Jan 2025 22:29:15 +0100
Message-ID: <20250129212935.780998-2-tomasz.pakula.oficjalny@gmail.com>
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

Software uses 0 as de-facto infinite lenght on Linux FF apis (SDL),
Linux doesn't actually define anythi as of now, while USB PID defines
NULL (0xffff). Most PID devices do not expect a 0-length effect and
can't interpret it as infinite. This change fixes Force Feedback for
most PID compliant devices.

As most games depend on updating the values of already playing infinite
effects, this is crucial to ensure they will actually work.

Previously, users had to rely on third-party software to do this conversion
and make their PID devices usable.

Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 3b4ee21cd811..5fe4422bb5ba 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -21,6 +21,7 @@
 #include "usbhid.h"
 
 #define	PID_EFFECTS_MAX		64
+#define	PID_INFINITE		0xffff
 
 /* Report usage table used to put reports into an array */
 
@@ -301,7 +302,12 @@ static void pidff_set_effect_report(struct pidff_device *pidff,
 		pidff->block_load[PID_EFFECT_BLOCK_INDEX].value[0];
 	pidff->set_effect_type->value[0] =
 		pidff->create_new_effect_type->value[0];
-	pidff->set_effect[PID_DURATION].value[0] = effect->replay.length;
+
+	/* Convert infinite length from Linux API (0)
+	   to PID standard (NULL) if needed */
+	pidff->set_effect[PID_DURATION].value[0] =
+		effect->replay.length == 0 ? PID_INFINITE : effect->replay.length;
+
 	pidff->set_effect[PID_TRIGGER_BUTTON].value[0] = effect->trigger.button;
 	pidff->set_effect[PID_TRIGGER_REPEAT_INT].value[0] =
 		effect->trigger.interval;
-- 
2.48.1


