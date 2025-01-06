Return-Path: <linux-input+bounces-8965-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 374B8A0321A
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 22:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C09E3188626B
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 21:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 488651E0DC0;
	Mon,  6 Jan 2025 21:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VX95oteZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D621E00AC;
	Mon,  6 Jan 2025 21:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736199351; cv=none; b=j/OEVkKhlOOBuD6EWmeU5jV3QRLvMhJ56w/jm2y0pez4W0WrOfE3GAYj0Uung517llgXvEuR+FWfDZKE/3a4xZcKZesSKp28tI2C/1pe4jQq6VoQRkk7tFeV08K9wyuwvgukRY0TnIzFLRpz9V5kRz1PMj3FcihHbymkiH1lPZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736199351; c=relaxed/simple;
	bh=eJ/IPvw5UT6F1TJJeyixqWwLsKzSSiRHTTNylaWJIo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jq0i+yEKtXvMBWF1G/GhRWFaouitr9hM01vOWKpyNzoBkCiHXa9p0qI7iTs5mAz20zMxy07DuaaOR+nXX3OWPQ99+3iGXk/ioqZHJSb0fQBnTEMHRrQ4r4/UFqqzccOQrY7Xyyx5+zs7tl1sq+Z62FOQX2T+ui+8hgKxKmkUCSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VX95oteZ; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d3ea2a5a9fso2221300a12.2;
        Mon, 06 Jan 2025 13:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736199347; x=1736804147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ERMQSDSSP4kaB35zxEBbEdMyWN68eRlF2X7GLXmoNs=;
        b=VX95oteZxX104CjbS32lQplXiiJRE9185ZUToxXsx2dy69RYbqSDKh4UFA9woBf+Fx
         w+tCO5zj/+p+WmvQ8U34+Ps6Pv1IqdAcQkbv21Imxf0It+PytjMFmY0KDAMiZu4wch65
         2iIG8cSJ/dth7cIWld2b+DLZdSAS+xQmNRpKNm4jn1DsYlgFDSO4jnmM/Jjx5cNdS02+
         Yb//CAfe44nOuOplP+6WDid+KGdEsMmMgsET5lRCPGdFk83v8xHWpYLRqixt8kFdjHYN
         o3RV4N+9mZR3Fbo2fSwcSLutqPnTW8o5dokYaShF4E+z7bghPvd6sZ3nw+525fPA/iUa
         DpvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736199347; x=1736804147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ERMQSDSSP4kaB35zxEBbEdMyWN68eRlF2X7GLXmoNs=;
        b=sR3ypJkyKTJlyrQNIxzMQJlfpWTfJS+0Cp2V7tzeV+EDajuYct6kyGkUlkiAyczpNe
         NflVVPYctDEyzhC0DCSw3erfl+icAtEvjvWL+oupYtt9Ot0TyWOwk1izd3D8jWegU3k1
         MrSRd1YwwQaGAm8R3Ud2n1H87fPMU1wIHmFkH7MIC+/vBNx1RnsorM0/QKEYFqd7PJMJ
         5p7A+HygzF68uWjdtaSBA8tCPXlNp0d9oEjoVSjQ1S7KiFnld+GGRWAvT5w5nuEbEoD+
         e50eUwGQTqMuRO4S03tr0GSUQAYGXlQdlXpT1KpoxRO3E/HcWNswSbBJuAkeIaU74qnz
         WbaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyODoEthuKPmsXUC4IdBwuMxFAY++II0A7h5M7GzpimUHePmaso0h80mWAzcOj/zdWLP+6C4YEfsg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAg0aU7/HAdRoIrz+7OVUMQe00Bx7LXUvW5LG3sy2BrDEnb1ek
	9pg1yAJ5TulOjwl1vLuEmw5mmKIwknx6d+53S4gUoJf5qYkpzhU4yN1vbJR/
X-Gm-Gg: ASbGncto3G+YBmg4sVvpvwcwPLb73OY10dcrnkH2/7Sw/LCfnpFG0cT7vmb5PeXu3GV
	rAMm3VDRfKguWWFUOc+wsyG7d4/qI6RSMNultxoeiYeieKVF7jaPV1enSta/fwYgL3tdhBMj284
	OPOiTZD2tiGxFiQJEaM2Jr+O59WWtHOkNbSRxPDNXpcBD2uITeseXmgQNyWiOEfKHcvrz+Z91aE
	VQxYTzvOPFEpfhcWYz0d5LexsPXOH6FzNtIY49Ny1kRAwm/d50knsj73mVDGxaWoNOFidj8I71T
	e9+DdH2P9hghVpoK4fn3mZs/ZFs=
X-Google-Smtp-Source: AGHT+IGkC0T67Noi5JaQ8ju/83mrKDBlN+hzKnLF8YwXNSZFgYcLrXRRlrGnKvwj2B8clvzeLPIH7g==
X-Received: by 2002:a05:6402:2790:b0:5d0:e852:dca0 with SMTP id 4fb4d7f45d1cf-5d81de1c377mr21066376a12.11.1736199347450;
        Mon, 06 Jan 2025 13:35:47 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f9acsm23375991a12.31.2025.01.06.13.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 13:35:46 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 03/10] HID: pidff: Clamp PERIODIC effect period to device's logical range
Date: Mon,  6 Jan 2025 22:35:32 +0100
Message-ID: <20250106213539.77709-4-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106213539.77709-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250106213539.77709-1-tomasz.pakula.oficjalny@gmail.com>
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
2.47.1


