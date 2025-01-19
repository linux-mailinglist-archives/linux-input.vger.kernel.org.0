Return-Path: <linux-input+bounces-9384-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 286C9A161EF
	for <lists+linux-input@lfdr.de>; Sun, 19 Jan 2025 14:14:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DEFCE7A2AE7
	for <lists+linux-input@lfdr.de>; Sun, 19 Jan 2025 13:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E491DEFF9;
	Sun, 19 Jan 2025 13:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YfhQp+Co"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24CC1DEFD8;
	Sun, 19 Jan 2025 13:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737292446; cv=none; b=RkISXgwI5c4f57X65cCTdmcVqcAGd6lCg8U37cCfgb3X/jU9AVP3rTB+xFQR/HqBdVusLkDaGjAw4MJVUhOHBXI+7XjqO2aMpklyNRkvX8CwzBrtxTjBmZQ5AVr78srjXC/SAfTQhTfvbWt93g8BR7BUIf7dLPoFvQwVXWFUwng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737292446; c=relaxed/simple;
	bh=hO16TzVqb5tj1+/tTTtpg/9gXWGHQ75X9yytJHjMq0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H8rxR2DlIfzFSQGeSp1pjguvLm1WIJoO365uN7nFb3bTRn+E0Xo+hNUyldopdCfMvrt/I9X35/m+8NrBlX/GO49AowYwwz3j+Nmy8cUlfY8wlcBih82MILk6Iv2eob1V1KAtPUadRnzAjf6F45ynu/1QoY4PNsNExxoOM5ZeStE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YfhQp+Co; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d44550adb7so639175a12.2;
        Sun, 19 Jan 2025 05:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737292443; x=1737897243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=butHZSIttOBt4Y00NnVVBUDnKFliuYeU3sUg3vrDx2Y=;
        b=YfhQp+CoishW/eduxkUoskCh4mIWWpJMNyLWhdgIELYypowoPszP8TGRKltUvH6EWG
         jM/FqmJOic9VRJ8zgmLPQHaPWz1TjpYhTARthJz3nRQhBwriekbVd+wOT8kUhM92XOgy
         iFl1se/ewayNDGvsDEbBqv1PKAHH8mn/cKC99Hmz7AVvvybB3VzWUQzqQ0+KydEtG/U1
         oiY9B0UkskIV6B+X/hxmVr7uiE3G1hqb16UYGpzaEhX96soKMQ5OJmIweTEqQdpNze1M
         DGApJpzi8FqDdkBhAtA4oMDPwKRhoLdXNgoQq1jNw30ITJJObARZ7fpmlayT181drw74
         DYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737292443; x=1737897243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=butHZSIttOBt4Y00NnVVBUDnKFliuYeU3sUg3vrDx2Y=;
        b=ug/PWcSX7PPyVkrp8YB1CHAFIaZQEyppGnUNn2Wc/AD+17opuW//8dH9HI0chaXILw
         dliXhPYNLuaalv83+70npW1TbwdsO1priP3XyRP47k5/m7i/Oi6OBCaYZl4+z6qWKKT4
         Yk9jsp3Yx0R5/O68lDjnLcVyk0mPIpxKpXUo1/mxKy706xNZrnO8nfHiSueU1l9HWTE1
         qs3YObZSI2yRCs3lw5rSRrauUATF7qcYJg/4FFANMXYP+K6Oigo9oF5Xw40+sz6YI6xR
         FAG31O+7QJeF35ROqKzMaL7xvZ8GosYLxEovOaHwDSHgGOmJzMBbe1NKAy/kKE+ArwP2
         ywWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD+YrbBegcS8+xAbGf7zBOFGMzAQIddFr62bv94h5SDiA2k2nh5ic8IZfJPHJ3EJ3MHy7vJEcgN+IuUg==@vger.kernel.org, AJvYcCW3rkQXIRjs2Li01RkWwxcbge02Eon3SSzLTPBeYxixc84SysfmVvyK30Ond6YAR5RcmkMhxhcPpP+2@vger.kernel.org
X-Gm-Message-State: AOJu0YwUfKhVSedIeiVyXOkV56UFDNU5QMBrH6BLQf0hZBBJV1q4uVcG
	dJj+2DOo7QaLGwyzytI5zvfKGzjWG8HGqhjcw5piry7jYCdjAO8dN1p9mTwf
X-Gm-Gg: ASbGncsiL60xyzIT77jEw31owpQ3oYVF0AH0+4cNz6bKFRQf+jb6WVercdCVp0OmsOo
	LyhTRebtvD+tg0bBVq7BCSKCqLLR0kXnL/W2H4KvgEXES2cAKuA4tM3UCzPNiZBtDVEnSg9tmee
	maxIc0IDO3Y/MoKbU2cAcH8+m+JEZgum87SPKfUtkPHvskbchxT7doQ+Sx0s8boV9CrCX4Qb7N5
	aumLAObBnEhNCwPcXunu3eF7Q/zr6bEz+q0yM3RQonCuIGCkXn1jenIxPrXUKqKhOagUmV7ghEv
	ZXQbVwVLjZFkEv4KxHfs7TUHCwzJeUulKrhFRpIwtom6QNnvroA=
X-Google-Smtp-Source: AGHT+IHyHuNLm+9inx8nLXegf7u8+9dWpDarccmSVIWb+SP+2Bq7u5fCOKWXoy6FiEcUzRR4E0cTfw==
X-Received: by 2002:a17:907:7f8d:b0:aa6:9c29:86d1 with SMTP id a640c23a62f3a-ab38b0b962fmr249568166b.3.1737292442923;
        Sun, 19 Jan 2025 05:14:02 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384d27117sm481155966b.75.2025.01.19.05.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 05:14:02 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v5 02/12] HID: pidff: Do not send effect envelope if it's empty
Date: Sun, 19 Jan 2025 14:12:53 +0100
Message-ID: <20250119131356.1006582-3-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250119131356.1006582-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250119131356.1006582-1-tomasz.pakula.oficjalny@gmail.com>
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
2.48.1


