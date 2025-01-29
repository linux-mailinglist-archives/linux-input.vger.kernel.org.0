Return-Path: <linux-input+bounces-9608-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8C2A225B1
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 22:30:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8DD147A23B0
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 21:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67ADC1E412A;
	Wed, 29 Jan 2025 21:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gmPsYclV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D671E2843;
	Wed, 29 Jan 2025 21:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738186188; cv=none; b=Pamk8XiRarp4ZXqRSTaiz8jBFxz8hqYl/IUYq1Kdcfz4Jy0+OXQONrD9HbuwwMHZ/vjbWxb6q6ezLlDZPQsTRXVpk2KQ31aMYfHwUURZSs0rQFmW3S3MCsevLZfdXyWM49Uwmr2elo3iXpJCcYtNwG5l8iCEI98VtAv7UFNxbKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738186188; c=relaxed/simple;
	bh=qRDqb8/k5nq6eMle1qPeQQV3EN65UDGm60oGvk3aKmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jGrokdR9rLrCzCGQyC6CrHWeiwkeHvxzPa9HeAvd+DunkY/9x1abSvw/xzbMBF59uMGhm3ATuDIUss53gsW6DgbUgH+QLxZMWaMlOopz42tBfi6oxsq60SlmZzJg1qIWAOFmHjTL/Bnj/A7Kl+MVSskxQZzjTNo1+VS1RjYNFro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gmPsYclV; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-543e070cda6so14278e87.0;
        Wed, 29 Jan 2025 13:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738186184; x=1738790984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csgRzIKAQPXaTI2487b6us+Fd8yxvsmEH25L9GNEzxE=;
        b=gmPsYclVlfZoeNYWOrQIwXN6tIR3f6/6YiQxxBS5XVuKU9ihPQQjoHd2PQmr9X4RDJ
         OPGJDIHDDCnHmvGprtpM8dOvuTuJUSoF9Y0z5qZqgtfYFPmYUNmyCNWfFnDbuTEXsHvq
         aDOBA713lRj3fAK+BJgR6xSeZucFZ6ZuGdozCXeyqVnYc9bfyWarHFMuVNt4PpAmbLiU
         KqS7ckq85mGwVSkhKK3g7Q3/Kk2/U88ga3qzAweo+aTUuxa3dQM/WQ1BPN9j87u6FnC8
         k5bTp025e5XzXuHxcpzHMKXr9XP4WgNR2Nd1RLI1zUgdVSiWV1ziYJDFcfxJlwCwCDxQ
         mSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738186184; x=1738790984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=csgRzIKAQPXaTI2487b6us+Fd8yxvsmEH25L9GNEzxE=;
        b=EoyYbf52TLmclfPIV7ebl8nli8t8m4VU+gFuRwBFfViw/5SWymVlMi4h6NQEZm1DxA
         utN+FIdnKI9DamJZVObZzaqilgn+LhHVlETx9TXfjk4HNgduskfIHommi50eHo+FE5ux
         SD7A3irhMBEC9i6DBvTnQ6kRjhWqOqtWqEDtrAc6OfGRQQSTsR64gJHeXw8E94HLzine
         JzzI65X+5v8gcgRUtjHUzuaslAlY3GUNW+JJXZEsECYB1XcU1I+ak+FwCJMMpIk4VE6S
         T3V5OSWzyMi87wOh6Vg/mgt8oIqxU75LKTYmGOXB0EinhBQnLg0NbznW+8PI7AX1xKuf
         ZAAA==
X-Forwarded-Encrypted: i=1; AJvYcCUsNwB+sbhV7VtI5nOsEFzYoNqzeYfrOJcpT1GCBbjMaPj8zBjn8xKvlr42L3SG7NgwFQVfr9SRQlTdZA==@vger.kernel.org, AJvYcCXLHmE+l1n03O1nLm12Wt2AMO81oIPUA65cQlKZqx2tULDJT1PEkgKbpVnxb9QY+87IBntNIuYvOidD@vger.kernel.org
X-Gm-Message-State: AOJu0YwzYHa+9lUc4Y5St8is1H68hac/Qysu8PdJ3L6X4nad2LrDs8V7
	QhzQYA6NA87YGm0xGHnqhi2E29qbx1xo5EcWC55cNjbji6/U0pH/
X-Gm-Gg: ASbGncsxbZKP0R15yPSkTzUS4OzTFLqOF17CI+k7/rm91ri0Cf8J+5TqT7fKfh2L47P
	kUfn5C7vfDY/U1Rr9e08bSnXT9ST2tipqYHDkwaJLlbGpWIniLWUVkqZV0eI4sjmJMjrzpKqfrG
	nbPdB8DV2IzWaNrfuQ754uW4q7klgY1EW6yjhfxq6gDOGiRfJauEd39u5Rtxiu+g7L8N4XrRtbl
	xHoGLXjAbOA2b3X34sM9Rmy5Yyl8mm/MEv7JDo1Ss5GIU4+bX3tbEJtXxfjSJCz9DJZzMr9tC2S
	45oJ2iuKG4TA2j0+7sIKaXycssBCfQJiYVWmTKkSy/1KXB7I3ocnRnE/DrpAGQ==
X-Google-Smtp-Source: AGHT+IG4hNaIgmxt5zGs1ZyQwE7y1R25gWQMpnhq+wO5JHdOJ3W2LLdKPTF13Le3lhAu0JsuvDeEsA==
X-Received: by 2002:a05:651c:54e:b0:302:1b18:2bff with SMTP id 38308e7fff4ca-307a120eccdmr917061fa.11.1738186184405;
        Wed, 29 Jan 2025 13:29:44 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c83799c0sm2100778e87.190.2025.01.29.13.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 13:29:43 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v8 03/21] HID: pidff: Clamp PERIODIC effect period to device's logical range
Date: Wed, 29 Jan 2025 22:29:17 +0100
Message-ID: <20250129212935.780998-4-tomasz.pakula.oficjalny@gmail.com>
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
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
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


