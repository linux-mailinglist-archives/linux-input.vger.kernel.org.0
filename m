Return-Path: <linux-input+bounces-9644-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CEBA24895
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 12:39:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 111667A2B1E
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 11:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FCF6170A30;
	Sat,  1 Feb 2025 11:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSwKOtOn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4376214AD38;
	Sat,  1 Feb 2025 11:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738409954; cv=none; b=Z6NNFFVfqAIUpHiWoOUnqyoXRDokVpPtemkHhaohVT4t6JEqsQRT+esgPvP/BDZZOMh37hUGEF5uHBW7eWQ8f7HmF68BRWelNaif0a2V6Anc1GuqNRKdhpKuJ9tjhypdBGPLAGxqSJWOTnYj3Q2gCXqyUzjZoyHyfi7p8NPR0XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738409954; c=relaxed/simple;
	bh=fJ56SEb8U2EuKJrEZPfGGz1sNq3AQ4BPmyEKP8+5Ay0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=br1d51u6TgaZxoXTpwt6QUOUASUi0sFeK5bhO3VMR+lsArHko0TYhzcUNzTVnBDU8F3etv2L1SyPDU4VDkqyhUPBOJLsUSvKZ2BpmtzRDSeZJK5oBGSG3XaR0f8ynmiqEBpqCRH+cfuWHDnG4ZdPD7R3Suk5t2M0a7c5OpPN/R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSwKOtOn; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d3ea2a5a9fso578439a12.2;
        Sat, 01 Feb 2025 03:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738409951; x=1739014751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ja4x2NihYxQPdmpH9wq3YOQjjZ6z1qmt0MOVDhJRWIQ=;
        b=GSwKOtOnGK1T6UZe+6EThtse6O92KHdmP087KFIb6NUuchnmuON7Flxyixnx9w+fps
         wRMdeVjix8Fo4QG2L/cwMAkRxEQGbgBU+uOXRDsB8wpXWOdqmz5OY4CFC2ebe0y4Oxmx
         SjbpJRo8LwOnw52HEDmWRaTdrCe7Yx8NkEtc5aGsic/O/MzwzaNfhCx7jcmNPopWXhPI
         1Fm9EdMXPhf+YyhT9VAffYuZLEjqXiLDLKUYhASji5QLYDHLWYHEqGIEW6LxVXj7XhYg
         gzzZ3SjztJUMFRhv8K1B58LLXb4MGgr+1EEqtZgna/BII38HeQXBJcsxrz5k9hhzWjSO
         mMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738409951; x=1739014751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ja4x2NihYxQPdmpH9wq3YOQjjZ6z1qmt0MOVDhJRWIQ=;
        b=d/KjFVp9UmOvTK8MHXFuHavTcPWiixYAj+sxZ+g96x1HCwrLQrYQwq29UcpHkWg4xt
         fppy59P1YNNsSwM6u3fVM8PSnQwD/k4WyYqDaIoMObqyVAKxhJyEyuNbfHQ/n8wd4yfS
         UMJtPcineafFWx95BG1DAoBL5UyhSPilEYlnF3RsXIv8gKWqQz1rGOlGTID501c2nHqQ
         dqVdCbJP+vFX7aBLsR0QKQ8h76YL1DydRI9abVPVysHzfh6Xrih2E3E8KJu4cwFPB6yK
         v06FbaA6GWQY1RIFle2ff79FwwB39KF8XB6lFRNCpUDH2n+FrwcKNv6sBmp5ysqp0eJG
         Hhdw==
X-Forwarded-Encrypted: i=1; AJvYcCUGD1pzO8Vpe62hircdyq8K/+niM6uk5Hs9VR3OpMwBiJGO9Ypett33A6bMbZSL0cCBLzCQweZaMw80uw==@vger.kernel.org, AJvYcCUO7Sm5ptPQDqPtQmrUqUWsV7QQHBiUoGZDSMUZFXfwxUDPtm+JYqWN6jHOwW8w9xtNxMh5pLzkjYHp@vger.kernel.org
X-Gm-Message-State: AOJu0YzOoXXAZzwyvwBqGr8LWqUAq+/13LG2ugW1dYFrzcQk+9wfajq9
	dp21gjlwcofRPbvyA2hL7BJaOCkk/hxKtK58cIQhKNtEI96dJiczoRjcfw==
X-Gm-Gg: ASbGncttn90q4NWT4REGEgA8KFEN6pkOzx6i+Erjx9g7Z0zmWL9ZMg3ZHRbTROElCyO
	lVtXxsFYLfcr//UIkziSaQWEVZ687gUXIXmyV5NMGH8Ne6FzFpTFRVYgSNN4KqjlDAiUgU9NNYa
	IotKcPTNr9gorgwPE7i4p3Q3dCWkkTH628JPMARgmGpksfPVRBhRtEi4IhnDpXswySwfkDdFqRu
	o/7CZqmfdOvWW+qXEG7q8L0JY0RZqzlhjKGczr3vk03WuuBCEJBUK/IgdDNBXTkSqjb+spkZvU0
	bnXOq8KtFK4qdRJdTGeis6YIGbvT2NScRac8vp0oEdzkL93z0HL8sYH7tygZQQ==
X-Google-Smtp-Source: AGHT+IFV9A6cZYguclHg3mn7kpqunmjVWGrcCPYP1zu/6mQHH4EgLeuNoaOpMuMM3xHMLlUJ2Nhe3Q==
X-Received: by 2002:a05:6402:5025:b0:5dc:8ee8:6b15 with SMTP id 4fb4d7f45d1cf-5dc8ee87639mr1560635a12.5.1738409950501;
        Sat, 01 Feb 2025 03:39:10 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723e9fa7sm4304577a12.20.2025.02.01.03.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 03:39:10 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v9 02/22] HID: pidff: Do not send effect envelope if it's empty
Date: Sat,  1 Feb 2025 12:38:46 +0100
Message-ID: <20250201113906.769162-3-tomasz.pakula.oficjalny@gmail.com>
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

Envelope struct is always initialized, but the envelope itself is
optional as described in USB PID Device class definition 1.0.

5.1.1.1 Type Specific Block Offsets
...
4) Effects that do not use Condition Blocks use 1 Parameter Block and
an *optional* Envelope Block.

Sending out "empty" envelope breaks force feedback on some devices with
games that use SINE effect + offset to emulate constant force effect, as
well as generally breaking Constant/Periodic effects. One of the affected
brands is Moza Racing.

This change prevents the envelope from being sent if it contains all
0 values while keeping the old behavior of only sending it, if it differs
from the old one.

Changes in v6:
- Simplify the checks to make them clearer
- Fix possible null pointer dereference while calling
  pidff_needs_set_envelope

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Reviewed-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
Tested-by: Pablo Cisneros <patchkez@protonmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 42 +++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 5fe4422bb5ba..a01c1b2ab2f4 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -262,10 +262,22 @@ static void pidff_set_envelope_report(struct pidff_device *pidff,
 static int pidff_needs_set_envelope(struct ff_envelope *envelope,
 				    struct ff_envelope *old)
 {
-	return envelope->attack_level != old->attack_level ||
-	       envelope->fade_level != old->fade_level ||
+	bool needs_new_envelope;
+	needs_new_envelope = envelope->attack_level  != 0 ||
+			     envelope->fade_level    != 0 ||
+			     envelope->attack_length != 0 ||
+			     envelope->fade_length   != 0;
+
+	if (!needs_new_envelope)
+		return false;
+
+	if (!old)
+		return needs_new_envelope;
+
+	return envelope->attack_level  != old->attack_level  ||
+	       envelope->fade_level    != old->fade_level    ||
 	       envelope->attack_length != old->attack_length ||
-	       envelope->fade_length != old->fade_length;
+	       envelope->fade_length   != old->fade_length;
 }
 
 /*
@@ -580,11 +592,9 @@ static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *effect,
 			pidff_set_effect_report(pidff, effect);
 		if (!old || pidff_needs_set_constant(effect, old))
 			pidff_set_constant_force_report(pidff, effect);
-		if (!old ||
-		    pidff_needs_set_envelope(&effect->u.constant.envelope,
-					&old->u.constant.envelope))
-			pidff_set_envelope_report(pidff,
-					&effect->u.constant.envelope);
+		if (pidff_needs_set_envelope(&effect->u.constant.envelope,
+					old ? &old->u.constant.envelope : NULL))
+			pidff_set_envelope_report(pidff, &effect->u.constant.envelope);
 		break;
 
 	case FF_PERIODIC:
@@ -619,11 +629,9 @@ static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *effect,
 			pidff_set_effect_report(pidff, effect);
 		if (!old || pidff_needs_set_periodic(effect, old))
 			pidff_set_periodic_report(pidff, effect);
-		if (!old ||
-		    pidff_needs_set_envelope(&effect->u.periodic.envelope,
-					&old->u.periodic.envelope))
-			pidff_set_envelope_report(pidff,
-					&effect->u.periodic.envelope);
+		if (pidff_needs_set_envelope(&effect->u.periodic.envelope,
+					old ? &old->u.periodic.envelope : NULL))
+			pidff_set_envelope_report(pidff, &effect->u.periodic.envelope);
 		break;
 
 	case FF_RAMP:
@@ -637,11 +645,9 @@ static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *effect,
 			pidff_set_effect_report(pidff, effect);
 		if (!old || pidff_needs_set_ramp(effect, old))
 			pidff_set_ramp_force_report(pidff, effect);
-		if (!old ||
-		    pidff_needs_set_envelope(&effect->u.ramp.envelope,
-					&old->u.ramp.envelope))
-			pidff_set_envelope_report(pidff,
-					&effect->u.ramp.envelope);
+		if (pidff_needs_set_envelope(&effect->u.ramp.envelope,
+					old ? &old->u.ramp.envelope : NULL))
+			pidff_set_envelope_report(pidff, &effect->u.ramp.envelope);
 		break;
 
 	case FF_SPRING:
-- 
2.48.1


