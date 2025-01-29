Return-Path: <linux-input+bounces-9612-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B40A225B9
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 22:30:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FBA816729D
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 21:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 190091E376E;
	Wed, 29 Jan 2025 21:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="As/7MvSP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419171E47DD;
	Wed, 29 Jan 2025 21:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738186194; cv=none; b=rm05/wqTW8k9gJYvQ5CbtWSchH3ucTTzmo3Kul5aR72Mp0q9c2+wC/Y7i3qNpBuMgC5NzQdZoR7JsJxZWw/QDfQzryEmNMcR7dzK+ApXyXKn+CeTUKcoGrdRcffCo2f34BA/AmZcoDGL+sSjUZ8yg9YtBzmtNGhhMQ+T7YJg4qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738186194; c=relaxed/simple;
	bh=XLm4V3Ze9t17wM+VoNs4tDLsZs8WPJADkXyUV7Nn4w8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZVaAD0fJ5OUI+16i1EpIT1nBGtq6sUZHPEwYIbIw0fVCLqWiPutzSrK0s0O1d9pkuA55Lxtr6fy6aCAssYZGaWEtxVelLp+xVyWZGrbKh8ip29zlySuw6xKFGXNRTYnmpRBZWUC+GYyCH18oiJ9D1o00wKFs0sCZR44wt0GoyAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=As/7MvSP; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5426f48e501so18036e87.2;
        Wed, 29 Jan 2025 13:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738186190; x=1738790990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ktHgFkTVslflOhEjLg50+3HiEgbMXCVE0QKnjgwZ1VI=;
        b=As/7MvSP1Zug61GghUE5ozhmPYLQT6mtrrAOHAJ7p5X4qzYtOZbM6KA4rDXCgY+bz2
         zMFGuQwE6AlV6T7tOgtwdoi0qKtXILVg5+X/98o2u63Hed1zexwWvNDzBP65F5R7zJRg
         rTIDXbbeemQmVwfdILSZ8deYl5dBqRLp16ezzZd0vj6A5tjLZjcmEDvLdVRfX4vgAl6N
         udNM3qq7t8rh1V4+uSSioV4PvlMYZHAIen8aOe765RxV22hyiUo6Zb0CEKfB7frZzvI6
         LoON6w8QoFWZ0N27C5d9e5kLF3zaL9rUau0SnMhAg50n/xENTh0x6LMdtVNljdIkROot
         CEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738186190; x=1738790990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ktHgFkTVslflOhEjLg50+3HiEgbMXCVE0QKnjgwZ1VI=;
        b=Y2XgGbcXjBgMsKviBcoeZWoXP0sGCkikQa6HA4ZCEyuhfvLFaiv6b24S3uN99mUvOV
         e4ss719LYFz/xRYWR0ouG9vTnmaFiMMUyadauFc/4ANp5HfmDXFtka+HnplMzrIvhHJW
         iWfyZfvrM6RA3tkaDvuxZviF3DEsLHvmPzE3z/aYuaCsDitlP+8FJwM/Hja/YEg2m7v6
         Apf9IgckC4MhcMGYQphlTnE38zuhSg3GPyoYLub6sxDcQ9+2QxYIvfSmKrhXvY/2QDdY
         4kGEpSP7a9H5+S+0c6ZWEdO58U4VotHAYX2v5VZnrn0QjJgIiiXk4RZxJfeFWP61GRJs
         sb7A==
X-Forwarded-Encrypted: i=1; AJvYcCW7Qi+AeZvJXjjTDbIVOvsqP3YMeQzz7NewgosS+Fcs1I1WprZCPCKaCn34kSv2bMBDhZnCLaKGOFNi@vger.kernel.org, AJvYcCXgpQy+ffPnTjH4gGyUB6Gec3tvZ6ByS9jqOq2QhtwcW+XdynoCp5SWAqPmerhxENZkksVEmEgqeIPFGA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6BULbfsB4ba0PBbI4iMTiq0dttn+06Nr1WrSEsOZsXK299/lN
	6lebfIZB1z+qyYTWtTX3537UkkZFJftdsoPIu1z6TEoxEFIlTtjs
X-Gm-Gg: ASbGncuwW1JrlzcGQpkkeh/tjBJQ7GVYdgKsFA51eDa5caXapX/G9Rn9fYaZ2OHNLgm
	UeBUCig0NGqk4toHVGQrEIH3978gAGkfzynV33wbeiyVMr0bXZqrmg3zEHdkeAvcHxd9PHOgJGw
	VFkyQr7FMQkR0AWdC25PU4VvCA6m7/jZ7w4an56YJnPQtSumAMC65a7imuWdxcBKhCHCDP0rewu
	K2Eqe9mZCy3G9GqIQtDyXQSaT14aQtLwNMV/tJ0ZcYslfw7WfOoWo1D524/c2uhfS9marR5oGOQ
	tPZaytTkwZ7PdFtcQuToWUsIaPY5FmI7pC8CsPZkKSAiuFAKQq7FGz2A6pNK8A==
X-Google-Smtp-Source: AGHT+IFmg/ioAkTa++LuIIL4+dQtB7e3EzFV8istwNO45PQcHo+eP9MIiLsvP1z9F1i9kmZROrsR4Q==
X-Received: by 2002:a05:6512:4023:b0:542:297e:94e with SMTP id 2adb3069b0e04-543e4ba63b1mr622138e87.0.1738186190249;
        Wed, 29 Jan 2025 13:29:50 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c83799c0sm2100778e87.190.2025.01.29.13.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 13:29:49 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v8 07/21] HID: pidff: Add hid_pidff_init_with_quirks and export as GPL symbol
Date: Wed, 29 Jan 2025 22:29:21 +0100
Message-ID: <20250129212935.780998-8-tomasz.pakula.oficjalny@gmail.com>
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

This lays out a way to provide an initial set of quirks to enable before
device initialization takes place. GPL symbol export needed for the
possibility of building HID drivers which use this function as modules.

Adding a wrapper function to ensure compatibility with the old behavior
of hid_pidff_init.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 15 ++++++++++++++-
 include/linux/hid.h            |  2 ++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 3f429936d537..298a971c63fd 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -1281,8 +1281,9 @@ static int pidff_check_autocenter(struct pidff_device *pidff,
 
 /*
  * Check if the device is PID and initialize it
+ * Set initial quirks
  */
-int hid_pidff_init(struct hid_device *hid)
+int hid_pidff_init_with_quirks(struct hid_device *hid, __u32 initial_quirks)
 {
 	struct pidff_device *pidff;
 	struct hid_input *hidinput = list_entry(hid->inputs.next,
@@ -1304,6 +1305,7 @@ int hid_pidff_init(struct hid_device *hid)
 		return -ENOMEM;
 
 	pidff->hid = hid;
+	pidff->quirks = initial_quirks;
 
 	hid_device_io_start(hid);
 
@@ -1382,3 +1384,14 @@ int hid_pidff_init(struct hid_device *hid)
 	kfree(pidff);
 	return error;
 }
+EXPORT_SYMBOL_GPL(hid_pidff_init_with_quirks);
+
+/*
+ * Check if the device is PID and initialize it
+ * Wrapper made to keep the compatibility with old
+ * init function
+ */
+int hid_pidff_init(struct hid_device *hid)
+{
+	return hid_pidff_init_with_quirks(hid, 0);
+}
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 92a484f65a87..e6e9081d7dac 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1223,8 +1223,10 @@ void hid_quirks_exit(__u16 bus);
 
 #ifdef CONFIG_HID_PID
 int hid_pidff_init(struct hid_device *hid);
+int hid_pidff_init_with_quirks(struct hid_device *hid, __u32 initial_quirks);
 #else
 #define hid_pidff_init NULL
+#define hid_pidff_init_with_quirks NULL
 #endif
 
 /* HID PIDFF quirks */
-- 
2.48.1


