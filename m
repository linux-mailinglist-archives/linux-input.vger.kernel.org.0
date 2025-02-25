Return-Path: <linux-input+bounces-10373-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F6AA45048
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 23:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41B6F3AA43A
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 22:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0A6C217701;
	Tue, 25 Feb 2025 22:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K7j+iEYX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F237F21764B;
	Tue, 25 Feb 2025 22:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740522617; cv=none; b=ASP5CvgitDnsP1GDRY+GsiuKumaWxBVKdHovdTcc2HWYzBVC8uMG7rLnqi1CRQJSwJOUTWrORYvG2ZS/x7lic/xP0wNPDXmuhYOuw3jmq/a+Zy+Q9o8ieAzj8ORjqjgpb49cmifyZQrPGY1Umtw2eJzCa6HD6YvoaPrcikEJNUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740522617; c=relaxed/simple;
	bh=LxP1w2fDXhSKHW4DmQrxZDK3o4bs4aHBt/iXf7J3zJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OLvBjE3OUo4NHNr8jjTZy6056cTIgwn5k1o22a40T8arC/7ftTcgwJk52KLPaekwHwAo86/bQaJ5QhWELGybVIP1jhLuHPFUuOXsj7hPMbxH1F7QXjtZJVe9KpOuwKiBgwcDh//6ZGWz/JUvd5ksIEdYx8BXLsWhFTc9aWx9NVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K7j+iEYX; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-abc28af1ba4so58241166b.1;
        Tue, 25 Feb 2025 14:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740522614; x=1741127414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WP49R5haUfKyNUf4TSS1VSNg1Ke2bHVz8VYWeoVRzB8=;
        b=K7j+iEYXALAx19tG3jS7hRbhruguK6YFWm0mOBAkT2XzkEBkXpV7DD0t7qaSb8iCnX
         wmH8zR8whAun8+LYAKM5Y6FK84NdVFQ5w6nDMpHD2hcQPzVxVi5cMYQ7WkAG9XCyHn89
         P6yOt2J+lwadqEu1Qo6UGd1wyA5CHxNA8NIOA4SPSsTG022sefQO2NR8ruAHYg2uIEzp
         4w949MzZb0UoM8cYc7G0llUQxMDttB+XwBtZ31Y4YdVHZfuhfgip6I9/Kt0gGINE+M/A
         XpIDdLQTnrMNsZvwaOqfgPY9mT7EFXb4AhToCd7sst8Ui53Bo9IZTfrN5ZYKRvPIqUvy
         igxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740522614; x=1741127414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WP49R5haUfKyNUf4TSS1VSNg1Ke2bHVz8VYWeoVRzB8=;
        b=XIj2mBus8lZ8sCbOW3K6j0G33/rvzfiOE+IuM+ZHqkAMiuvNSRXwhvEGv7C+VBp9iD
         3C4oh/+CKZoOGMTHCoz8wdyFx02WeFotiBr3g8tuRkv1t65I0xabJdS1CnQYbR7dLPrW
         EDNuVvfDOVE3xYU6MH2YjlRJUOtAhYGZedBmBgMwtOyHuA/lCvYQL1+Mj9bbjTYcKJbv
         NmRivoXTuTtHqYAsYAP1nCyFFc/Yl4FqRdWelsDVGMgiRrcAjOWi1JItcvZzv/3AVWQR
         9qZzRChqsrWRfNB5kW72mV0+DR1unN2+FEMI5+LZPC4i852qIuziRlFG9oqS/ruZeBKx
         C/Ag==
X-Forwarded-Encrypted: i=1; AJvYcCWZWBtu2uCKEqVieVlWOFUl/iPw0OvLTl/b/nr0Fn1/fAWtTfpftyhnLcqJnFd9OI6XbUCUeNaycfql@vger.kernel.org, AJvYcCXtnr/QwZBkWsApZbC8jv4Tp20WV+zD/coggfGQaa0XInqfr0sD7KDSsamhABUi/dYXBGBqCBv91eqsjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJvuxWFv0b/yBESvL0tBI7dTa7LHJdEilhLCq7nwPrQaIckawQ
	qQ9RivCQuP6YgaTdtMPd18yq7uJA16fOj8tIHQ36vDIkDo+szIgdpxoxItGc
X-Gm-Gg: ASbGncvE/J23WIYJVQS4WNhSsEOFgr3VdKoF6JBcP5y2l18cNwpqD4cX7BRi+b1mk1B
	ihdfJ3Gc1uHr90nSyNgwbAnMGXMNoau5JbgMIL7mVkrlDsDUWYuZj6HuziUWbWaY1HaFTuwoDeq
	45I2QCCuSigTYA4ycPUZSyxW6/nz61voXnEc8k1StLdUW/G3ldn4XvJ33SaE/w6YfSrTbxtP4De
	7pW5c4TIN99kBxk4+GWpjhD9k0yV7oLyga5kgV70iwguBPWBCXRjxbWWkVFfZkP7MpALaKLA2Wa
	KbMDsrGk+McSMz+FO6uPX8o2m/kuGOrNMKVhU13VXLHE86qmHjDfpa9AIpUD0PEn9pTqC334
X-Google-Smtp-Source: AGHT+IH69g//NfxWb0Kab5MOLwotpee9YXDyBgsgymsMk09zCHxIXCf9doYTp0X8ia0bVf1kt3pymg==
X-Received: by 2002:a17:906:dc8b:b0:aab:8f0f:6919 with SMTP id a640c23a62f3a-abc09c12d97mr741445366b.11.1740522614081;
        Tue, 25 Feb 2025 14:30:14 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2010f74sm209122566b.121.2025.02.25.14.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 14:30:13 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 5/5] HID: pidff: Fix set_device_control()
Date: Tue, 25 Feb 2025 23:30:04 +0100
Message-ID: <20250225223004.415965-6-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225223004.415965-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250225223004.415965-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the search for Device Control report is permissive, make sure the
desired field was actually found, before trying to set it.

Fix bitmask clearing as it was erronously using index instead of
index - 1 (HID arrays index is 1-based).

Add last two missing Device Control usages to the defined array.
PID_PAUSE and PID_CONTINUE.
---
 drivers/hid/usbhid/hid-pidff.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 6eb7934c8f53..8dfd2c554a27 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -118,7 +118,9 @@ static const u8 pidff_pool[] = { 0x80, 0x83, 0xa9 };
 #define PID_DISABLE_ACTUATORS	1
 #define PID_STOP_ALL_EFFECTS	2
 #define PID_RESET		3
-static const u8 pidff_device_control[] = { 0x97, 0x98, 0x99, 0x9a };
+#define PID_PAUSE		4
+#define PID_CONTINUE		5
+static const u8 pidff_device_control[] = { 0x97, 0x98, 0x99, 0x9a, 0x9b, 0x9c };
 
 #define PID_CONSTANT	0
 #define PID_RAMP	1
@@ -551,21 +553,29 @@ static void pidff_set_gain_report(struct pidff_device *pidff, u16 gain)
 }
 
 /*
- * Clear device control report
+ * Send device control report to the device
  */
 static void pidff_set_device_control(struct pidff_device *pidff, int field)
 {
-	int i, tmp;
+	int i, index;
 	int field_index = pidff->control_id[field];
 
+	if (field_index < 1)
+		return;
+
 	/* Detect if the field is a bitmask variable or an array */
 	if (pidff->device_control->flags & HID_MAIN_ITEM_VARIABLE) {
 		hid_dbg(pidff->hid, "DEVICE_CONTROL is a bitmask\n");
+
 		/* Clear current bitmask */
 		for(i = 0; i < sizeof(pidff_device_control); i++) {
-			tmp = pidff->control_id[i];
-			pidff->device_control->value[tmp] = 0;
+			index = pidff->control_id[i];
+			if (index < 1)
+				continue;
+
+			pidff->device_control->value[index - 1] = 0;
 		}
+
 		pidff->device_control->value[field_index - 1] = 1;
 	} else {
 		hid_dbg(pidff->hid, "DEVICE_CONTROL is an array\n");
-- 
2.48.1


