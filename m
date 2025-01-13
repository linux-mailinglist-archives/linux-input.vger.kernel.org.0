Return-Path: <linux-input+bounces-9184-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6153A0B767
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 13:49:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A007D1885F3D
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 12:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18DA322A4D2;
	Mon, 13 Jan 2025 12:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CcKwN8x/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F357B1C3BEA;
	Mon, 13 Jan 2025 12:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736772572; cv=none; b=EyGkkkjzDNgaI5ApRJwt0attjTB6HbfLZHlOyvi54fkOgJ/0wVPLhibyP8lsclQN9/94mxiLrXdG8Q7FDXRFZheU+3+XvnogeAAE8NEVBGCCgBzjnmuhKQT5E7vVU0E09nJKVdFiLnzF3K4SXluYSfwoRy4NIihhpK7tNDrUgt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736772572; c=relaxed/simple;
	bh=/+jLhZcLoQEgUQACr+Amn7gI2OvYFrMDEDkQ6DUX/ko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Eh0p4xHAqWhStw24GxgD9Q8o3iS2QUmU+JuGljwAi4mLBOEzbsZoovv4wcp9RyizUaAfNlC28XqzoiZaxtW1l/puq/1QLMaUrb8AcTjHQncjDzyLVoKH2bleARPCKLFguuL9PXAhaLHLQ11k5JW0xDVbz/w5jwK/8tNoeFOmu+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CcKwN8x/; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-303548a9332so1879911fa.1;
        Mon, 13 Jan 2025 04:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736772568; x=1737377368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qGnSXpK3gnCtwYCvW+DUBbmmLGb3BYTBH7tqE4+zHo=;
        b=CcKwN8x/3EI3J+/vRjJTbcRsgOEXpLzQfi6pNBDiMRKlRx0HH2034cqB4dC7Xoz4jW
         LE61EfJzaAqI4vYaqNnCfOrfRY8z4AvT02AUzebw1XPnuwsPw7nz9oOeWWvwYNUB9i+k
         AX3wuF7kQzVHtqz9Ts+KDGnfOrY+P4usLzOmnX3Zwgnq2haVxtqD8tXDflftjAzxV0F/
         DqU8Qu+dUDsM/1OvE3HNdVkz58hh3IQ7oSfJjVtfioX0qhp8VHhDKDhpsQNe/IH5gGO1
         h/hpjgJNi/qn+bD6R01ZNopmVqwN1losbUkpS23jSI5QrCdk1topU5ND1JdBg33JVZw/
         hF2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736772568; x=1737377368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3qGnSXpK3gnCtwYCvW+DUBbmmLGb3BYTBH7tqE4+zHo=;
        b=AKaQsUzShDMjcNhQ11QAOvMLj6PleMWLgxBnIaYogL2W/TrS5ggIpvhE0a2Zo+yjM5
         iPFUSJJXqe9+IToXsNBKc5s58kenrDqNHpoxUDBgNnHknXiuvPZzv89cQTH4DnTxISK1
         /SIeqOqj9IOSJZHSUJdsWoNq0wTQqnDYwsh/bOcQgZYo+3B65oDofd4bhKJ53SaznGSK
         gvolDeTPQ+Mozt0soFihTatDUXHriAeJq3duI9W7Ngi7ZIb3IzU+ybJy7+b8s8vW7JW8
         zYzYkrJf1XyfsmWQKnNzA5/GdF83gzqn+LyeeWlNRtSzflebTORZXW/A+ixnEgG9sXLt
         aHtQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1MImRncI6olFup3+zMHeB6431+hrBWz7YjbrZo/9dt5KzbLdcF/1VsqmWQbZg00QcqMSfD4mX0YB4ng==@vger.kernel.org, AJvYcCXWpFe3Vv+qEfeNsUeCmSxc3xF7B3HI5dxl/O/8FsiBOULqhYNncgBItqlcxf4BUH2l19KXXEeXvppZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzD3lGw2aP2goIlkguCkd//5d6+YjxhU8XETVFfCzgXPB+vM9lo
	Mug3dO+9xKx8wbPIlYwMztslqjNV5Y61w9lz0ndqF+H2ydiowYk9
X-Gm-Gg: ASbGncvCbC9fEKXSt/HIChYWUvy61e/gll0rhSt/36rN35vmZmX6lEnwhK3ejMoxIP/
	nkzWRtuuapq7XzYVMtpGCKpNfUe8iI10P0ApwewWrIBMCzDj4IM9PdA9eS6NegQGv+UksoSkrvs
	bEnh3XpIZGVlVLZXdn7Oh9e3SzFxHTCbtJgVHzSEhs4gRH24m/YnXxfDrbIRbFQGhHq6ITuP7z1
	a7pkwblhovbLje12+dWp9DdBeBZwrYL5Crju+Re142szKRD3jvZKaaXZmSi7fJ3Tqyrar2cD8F+
	IrJ1ODGOIzBWkZ5SBAr36zu5lNQ=
X-Google-Smtp-Source: AGHT+IEf1gt4wTM7Wp6+h7CttpZ0BBPYilkBhC30/6Bb57FoZi/MxkP/pDxcaka/6S1WlkrEAQLfaw==
X-Received: by 2002:a2e:a54b:0:b0:2ff:c3d2:b0a0 with SMTP id 38308e7fff4ca-305f45591d2mr22451381fa.5.1736772567947;
        Mon, 13 Jan 2025 04:49:27 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff1ec162sm14256181fa.101.2025.01.13.04.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 04:49:27 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 02/11] HID: pidff: Do not send effect envelope if it's empty
Date: Mon, 13 Jan 2025 13:49:14 +0100
Message-ID: <20250113124923.234060-3-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250113124923.234060-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250113124923.234060-1-tomasz.pakula.oficjalny@gmail.com>
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

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 39 ++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 3899d72a0b02..cf8163d92ea4 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -261,10 +261,19 @@ static void pidff_set_envelope_report(struct pidff_device *pidff,
 static int pidff_needs_set_envelope(struct ff_envelope *envelope,
 				    struct ff_envelope *old)
 {
-	return envelope->attack_level != old->attack_level ||
-	       envelope->fade_level != old->fade_level ||
+	bool needs_new_envelope;
+	needs_new_envelope = envelope->attack_level  != 0 ||
+		             envelope->fade_level    != 0 ||
+		             envelope->attack_length != 0 ||
+		             envelope->fade_length   != 0;
+
+	if (!needs_new_envelope || !old)
+		return needs_new_envelope;
+
+	return envelope->attack_level  != old->attack_level  ||
+	       envelope->fade_level    != old->fade_level    ||
 	       envelope->attack_length != old->attack_length ||
-	       envelope->fade_length != old->fade_length;
+	       envelope->fade_length   != old->fade_length;
 }
 
 /*
@@ -579,11 +588,9 @@ static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *effect,
 			pidff_set_effect_report(pidff, effect);
 		if (!old || pidff_needs_set_constant(effect, old))
 			pidff_set_constant_force_report(pidff, effect);
-		if (!old ||
-		    pidff_needs_set_envelope(&effect->u.constant.envelope,
-					&old->u.constant.envelope))
-			pidff_set_envelope_report(pidff,
-					&effect->u.constant.envelope);
+		if (pidff_needs_set_envelope(&effect->u.constant.envelope,
+					     &old->u.constant.envelope))
+			pidff_set_envelope_report(pidff, &effect->u.constant.envelope);
 		break;
 
 	case FF_PERIODIC:
@@ -618,11 +625,9 @@ static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *effect,
 			pidff_set_effect_report(pidff, effect);
 		if (!old || pidff_needs_set_periodic(effect, old))
 			pidff_set_periodic_report(pidff, effect);
-		if (!old ||
-		    pidff_needs_set_envelope(&effect->u.periodic.envelope,
-					&old->u.periodic.envelope))
-			pidff_set_envelope_report(pidff,
-					&effect->u.periodic.envelope);
+		if (pidff_needs_set_envelope(&effect->u.periodic.envelope,
+					     &old->u.periodic.envelope))
+			pidff_set_envelope_report(pidff, &effect->u.periodic.envelope);
 		break;
 
 	case FF_RAMP:
@@ -636,11 +641,9 @@ static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *effect,
 			pidff_set_effect_report(pidff, effect);
 		if (!old || pidff_needs_set_ramp(effect, old))
 			pidff_set_ramp_force_report(pidff, effect);
-		if (!old ||
-		    pidff_needs_set_envelope(&effect->u.ramp.envelope,
-					&old->u.ramp.envelope))
-			pidff_set_envelope_report(pidff,
-					&effect->u.ramp.envelope);
+		if (pidff_needs_set_envelope(&effect->u.ramp.envelope,
+					     &old->u.ramp.envelope))
+			pidff_set_envelope_report(pidff, &effect->u.ramp.envelope);
 		break;
 
 	case FF_SPRING:
-- 
2.48.0


