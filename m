Return-Path: <linux-input+bounces-9185-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D44A0B768
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 13:49:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CDAF1885F26
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 12:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E91233D7C;
	Mon, 13 Jan 2025 12:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0BTyP3H"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB58231A37;
	Mon, 13 Jan 2025 12:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736772573; cv=none; b=F0MJVhVTfOghaBP2bbZeudX+H49sW3gP8qvGMb+k6+nljCrhy/Dh4quI1niumVIRACQXoFj683E9e+Iah4aFzPD8dUt8uQF0h56RtsjxJQLY5UGNoIl0LWRXm81JHs6nrrby405wr1rbVwC/GoXYa4Wt0LMn3BU78a9Mw/dc4aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736772573; c=relaxed/simple;
	bh=uOwis6hlmUdqAPx3OOxs0TSSf9/smLnpoV7RYqQCfiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rUUIL2QfBNoYArwgLbUK2DLwL68LL4S22Nb37Kwln8vAB4YJlLnnP1v7VggJ/MhtrdjCdX5MDxLOE13J6BkQnKQWWj+PnSmUNlKmxKeDCaj9e3/EUMQqcnsDyo65IWtC0MP+1GnJTh1K4KpHRPLNrE9S+dWgiwhH5U/ompBwMHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R0BTyP3H; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3021ab1f26cso2044861fa.0;
        Mon, 13 Jan 2025 04:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736772569; x=1737377369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSwTM4rkg6mTg+sXCxlqhdfHW0+DFt/7r9xemMl90Kk=;
        b=R0BTyP3H9epmYsmdtkBZdHaETrWlKQcYwu0qCr5LultUPFUrcUu38hhAr1WNFI+oPy
         Pd5jl9Rb3uYQ01w6a/AO9u7PuTABCmPt+5VXrMtsj6hsztDJnMcTy9KbpWSX88r58ymd
         Uq9yeBbC5/r5T/uDnszS/rBYxMPNwgtDqFxYcO9GZ7jeJccAAZXB6Q0aAObCdT43FkxB
         yb5kCxOL0dawmTQNbw2tb5oQnLW7oqnyA9WWCz7UMU8tdY45ReVMcvRbiLsGa8UMmSwI
         XO6UrhBBhnx5q5gAvH4/QbdOorJMiYiPmJl+7yc9IoUlgjBDuX9NNaL3ZC2JPoFewPXV
         +Vgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736772569; x=1737377369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LSwTM4rkg6mTg+sXCxlqhdfHW0+DFt/7r9xemMl90Kk=;
        b=I/c73M65yKZ6+mrnQ4Gm+cccbdguC4wZXwoAd34xpv2GRASnZB4HTljzvFbhrhSJs3
         4S/gI9oxf/uzyapuEX7wjKtPpcmT67ocy4BsvN22rKV7zpuTjOHj7WC5skOrMEsRWYCW
         uS5sjqwgWsPlcGHCI/FfLtItdcZc/W+lFsPPidMCT1/phctbPgQHjyApJRKdPHhaM5sB
         mv5OxSD+CAmcQ/09cNHhIbAgsABxqRs8lKdNln1bN5U4lq8tyojW9LEbbXWt9qF3PtOo
         X2Y6IeXnsA1Q2pdtktycfpfDYA2aj24h2jD7YJC10Y8jmgWzmMUHEgBlxE9rb7CVm7oX
         EdHg==
X-Forwarded-Encrypted: i=1; AJvYcCV6gq1XFNxVhy/VLUMyvDFWAVu+JmWPh9p8ZndfCcOgW4qGFIur6XbHzFEToGa8odofU4+x/wxOAdk7qw==@vger.kernel.org, AJvYcCXLBKSQPBvrTmZVPauSi8teCbBTxHTvYaiabTLS20pb7ZTbOfySxEiViq8isjTtLo68cfceLM9UmARm@vger.kernel.org
X-Gm-Message-State: AOJu0YzkiICl2ULAHy5k38hBG+XD+4YzlbF34Tqx5nDYJYNYSnnLgfZL
	QuQQDEivtGo6c0nvIULvuiIEAa+Q9aa/ldwvAdNqH0ySOh7uGS9fY3UOq0IG
X-Gm-Gg: ASbGncun/MWCmjJw8N9m+AJlYFpoiRiYhhiaYgGUUiXB1wfE+1aX0jfsEXuX5TRZ5xV
	25+QOSh5RWaYVfd2Lte3oPH8y8CSgWjvANwjyfJlEcGYVPyBmAjSE50RgWGZYBppuxLO4VIxKRP
	AF8MJgEP8IAhYefe6UyqP7eecCPFe/sxF+hKwQ1O8Vvn2KF4J0uxbOSx0vWcuY2qdY/7fpYbr6D
	6JKAAzL7tKAkSAlryoaSuyMTNVQJHEcYHEq636GkpU6C3J0u3yCKKFoXV4EALPedOZun0VA20av
	6Vi1fPhkBNoJAGpDBHZM4eRNm4A=
X-Google-Smtp-Source: AGHT+IHiVd2xCGBg6PTUNYGR0as/ejQpqtdA0mnIhHJS9C7BEM9tFM1+vhSkMEzCkw+WO9Wl2KExmg==
X-Received: by 2002:a05:651c:b29:b0:302:2bd8:2685 with SMTP id 38308e7fff4ca-305f45cb6c2mr22485621fa.8.1736772569106;
        Mon, 13 Jan 2025 04:49:29 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff1ec162sm14256181fa.101.2025.01.13.04.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 04:49:28 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 03/11] HID: pidff: Clamp PERIODIC effect period to device's logical range
Date: Mon, 13 Jan 2025 13:49:15 +0100
Message-ID: <20250113124923.234060-4-tomasz.pakula.oficjalny@gmail.com>
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

This ensures the effect can actually be played on the connected force
feedback device. Adds clamping functions used instead of rescaling, as we
don't want to change the characteristics of the periodic effects.

Fixes edge cases found on Moza Racing and some other hardware where
the effects would not play if the period is outside the defined
logical range.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 36 +++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index cf8163d92ea4..7af7744e3cf2 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -205,6 +205,36 @@ static int pidff_rescale_signed(int i, struct hid_field *field)
 	    field->logical_minimum / -0x8000;
 }
 
+/*
+ * Clamp minimum value for the given field
+ */
+static int pidff_clamp_min(int i, struct hid_field *field)
+{
+	int ret =  i < field->logical_minimum ? field->logical_minimum : i;
+	pr_debug("clamped min value from %d to %d\n", i, ret);
+	return ret;
+}
+
+/*
+ * Clamp maximum value for the given field
+ */
+static int pidff_clamp_max(int i, struct hid_field *field)
+{
+	int ret = i > field->logical_maximum ? field->logical_maximum : i;
+	pr_debug("clamped max value from %d to %d\n", i, ret);
+	return ret;
+}
+
+/*
+ * Clamp value for the given field
+ */
+static int pidff_clamp(int i, struct hid_field *field)
+{
+	i = pidff_clamp_min(i, field);
+	i = pidff_clamp_max(i, field);
+	return i;
+}
+
 static void pidff_set(struct pidff_usage *usage, u16 value)
 {
 	usage->value[0] = pidff_rescale(value, 0xffff, usage->field);
@@ -357,7 +387,11 @@ static void pidff_set_periodic_report(struct pidff_device *pidff,
 	pidff_set_signed(&pidff->set_periodic[PID_OFFSET],
 			 effect->u.periodic.offset);
 	pidff_set(&pidff->set_periodic[PID_PHASE], effect->u.periodic.phase);
-	pidff->set_periodic[PID_PERIOD].value[0] = effect->u.periodic.period;
+
+	// Clamp period to ensure the device can play the effect
+	pidff->set_periodic[PID_PERIOD].value[0] =
+		pidff_clamp(effect->u.periodic.period,
+			pidff->set_periodic[PID_PERIOD].field);
 
 	hid_hw_request(pidff->hid, pidff->reports[PID_SET_PERIODIC],
 			HID_REQ_SET_REPORT);
-- 
2.48.0


