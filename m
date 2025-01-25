Return-Path: <linux-input+bounces-9537-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C389BA1C560
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 23:25:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 004F2167952
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 22:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF6C02066ED;
	Sat, 25 Jan 2025 22:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULl+jr/J"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12F52066DB;
	Sat, 25 Jan 2025 22:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737843937; cv=none; b=lJPhz+nOnMpAoOVAGgJA/fW9hAqUmm8Ko5ZGa1R9g1JPHYtRoUvR4N5kFB8P4i+/1AFo0unYRY9wg6zD5PwewL5W7qUyEfv6qXGPcdU+hBN/mUPMZ+5bhmNLJeMC/6ZDfbDTlDhsFLtYJgmet1lUU1Eyng3UqHn1szH9g3TM4tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737843937; c=relaxed/simple;
	bh=DhKOlDN0J91JsCofHQMVQCBR/3u/HEqZUulpq4EyNyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SAfuvVW+xhvcUL+RFzESyoNedwW634WgsjcbevlzftmHs0ikFFcyIaduAR2t26nzFXGDXzHTXfp8ksDm+FaslkrLyEvZgn7nytW90vn5zJ7dEJlzOb3CkUu9nmqRnI+j00eMmAze5Voa1G1UxpNfuHglSvsyVVAzlDazo9bmZb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULl+jr/J; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aa6647a7556so63025966b.2;
        Sat, 25 Jan 2025 14:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737843934; x=1738448734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssFFA6NC5w0PkH/hxlG/5x9jpkiDdQm3Ywo45Mto8CY=;
        b=ULl+jr/JuhOxZ0meMsSbaCx7oaNpoBEWQQ0mNhAwo5QZAOCtUsVdd6DKCLXUopdg0G
         /fPFa3VKs5K/fX7WAtJUK+G/yPULFPMZKjJGHhNsKsuYMfmfIeqdyWB8BKCKn4k+mPv+
         9Dyp9Yw1CCYA+UKIaK/t6TRx8bcfc+RNB0xVrVIQsi/x/4RGlTmrz/ikMK3+nSi4x6UR
         8/ny8mNRvHKXlqXRAB+6twhrhZy1X4PpSJ/FqF1bPi2Glb3pGWe4zhqjALqSrpaEGbyh
         kmdkvLoKCjuLyx7+RZrLLKjo1x9lTpOkxPU7nqe88PChwR/+yhk9P75H8NpttnCjcFc5
         av0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737843934; x=1738448734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ssFFA6NC5w0PkH/hxlG/5x9jpkiDdQm3Ywo45Mto8CY=;
        b=pC0wTHOW/i7oTmN6tEX2GZcomsy7Ekgkxo5beNnKabRTNIPkoMRLFA10wv4+lsRV15
         KzHcd9MlGBam5rb1YTi4d8IfuWeey3Jg82lLaTBby/Gb/kqznTJEaMFusZC/LPUlvYK+
         LfQKlXojZjFhycPa4vqzUjLCr9Rk8tYwPFtkQHEWWkySI3ThAP7QTVi+1QilpL0J+AE0
         JEL4Ry52QgV+tGM9XM5N2IPFV+TBJlp97XV5PEmf7nvstr1aJFLdpXdJIMZ1WDYBhJtE
         nqxyYF+tmy9zShuPVAb9gfRic5+wFHRCy8WTfhAC6ggMkeEat8HgMeQyadFXXLdBqfsn
         ok3Q==
X-Forwarded-Encrypted: i=1; AJvYcCV0oLY3vmRcwP+SQlFGloSNusQWmnjUNdsuX02QvO0btLC5CZG0Kd0/a1VhTGZbr6Dhd2qVP+5i6h07yw==@vger.kernel.org, AJvYcCX//aN2c/pDbTeFzSDbezASCneQdTm/MLJ4mSxBG9JyCuKaXWxH/ZfSkP+apyhN+4lbyel466vS2qhb@vger.kernel.org
X-Gm-Message-State: AOJu0YzjkjuSATRZdI4Gao5BBedgD21LLN4fY1IIltXN3XpeGK95j9j/
	v3cDUxAmZ2QYuWAsMYKxpjisbLA6ose10kRh8B8TNbiV8CqN9me0
X-Gm-Gg: ASbGncuYXVI6vvlT/fX6yoCa709vuViQLsd+kf8Ui0EMTLojwQfWv6C7DYhFh8QHvEN
	HgOTHwPGUsy61xtQ5anhLuSpLOOJbf/mO00cpbulYWZWe6qjytm/WCGJUXEmdTe2Rtha8+3SRcS
	B7+unDepwjF9VUuwpgXl6WHz9Wf7KN2qUwrFQZLOmBJwcr1trZ2XvmjiVDqdAJyIVUglc8TFyUl
	qrsFPSPJyX40op0SZ/c3gp++Xq7e0UrYG2l7p5CZBTleHZbbi+FoenFWGkG6e3xV1R5MPY1Dp02
	lMMqEyP1P0kYnsvkT7uk3cPb0oSfU+GWV7xYW4tc+xEgJIXOO4ofmXPnXAL25w==
X-Google-Smtp-Source: AGHT+IEQINPHzFomOilX+j16FdHzw/+Am7mg9VZNpIwO3dfNOUVWyhXKJUjhD27p8TpkrcWREsCqEw==
X-Received: by 2002:a17:907:97d4:b0:aa6:6f12:aa45 with SMTP id a640c23a62f3a-ab6515b6a78mr563317666b.7.1737843933933;
        Sat, 25 Jan 2025 14:25:33 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab68f1ef7besm136540166b.62.2025.01.25.14.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 14:25:33 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v7 01/17] HID: pidff: Convert infinite length from Linux API to PID standard
Date: Sat, 25 Jan 2025 23:25:14 +0100
Message-ID: <20250125222530.45944-2-tomasz.pakula.oficjalny@gmail.com>
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

Linux defines 0 length as infinite in its force feedback API
while USB PID defines NULL (0xffff). Most PID devices do not expect a
0-length effect and can't interpret it as infinite. This change fixes
Force Feedback for most PID compliant devices.

As most games depend on updating the values of already playing infinite
effects, this is crucial to ensure they will actually work.

Previously, users had to rely on third-party software to do this conversion
and make their PID devices usable.

Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
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


