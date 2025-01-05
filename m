Return-Path: <linux-input+bounces-8901-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 866B2A01B8B
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 20:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29B883A32DD
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 19:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D311D5143;
	Sun,  5 Jan 2025 19:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZsL07ntB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9E41D515B;
	Sun,  5 Jan 2025 19:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736105804; cv=none; b=XgFLP0MS+l/8+NsB0LZmrrs9O9LxQHqCFQqW8yxjKAzfjjJYLB/bJW1xNgQ26V7YXTrkoJKaz8/IBLuWISP1JCfrASBG0FbrZF9ec4AExZ5aDpZ3PW635c/DxUSMxTYr+7mGVfwC0QVrpF6/a1Lm/3YMFyDtn90Kb6pEsThRmyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736105804; c=relaxed/simple;
	bh=QpcFmZSNF3TCKbFLUHLW4V0YOIJt0/4SLo+cWhmfzTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SPT61Hleu2TEjtPd8osXrylSB90jgt5D8v3nQ05PmnTM8X6qfqh2Kcv7BYHirTyVG2TSXgZTQetvWY2WwOU/w0Zzx7RgHP8Dl9KVRIZ2K81m/Exbsdf+XGv/Zt1z9wx1mNRD+sY0UY6K7fNX8YNDOU2WrVPAZEEgh/yMwg695x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZsL07ntB; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3003a95a173so13819611fa.1;
        Sun, 05 Jan 2025 11:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736105801; x=1736710601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uL/zqFXHROf9ZEt+23hat/TCGZHaDdrfMcQYQykn+sQ=;
        b=ZsL07ntBQr5K321CpxyYxgY/AXfYDkIhw1bsWMyXL9x3Z+zbIQeFCRc5//5pKf7UOh
         up9QTbNlF0GQj4YyISpAELVxgD1BmpNIH758YIXoDFrkeofuURqyUuT/ym1yoXqQLw3j
         IttRqjFUs7QGnD+GR1DmpT/PboF+VWG0jdgHcTrtV6ByG7sQronMoIm1oH4EAJ8NN0F8
         YzzZt1cDzXwsGMMQofFREdYFrOMETmuaH7KdfAhJSUxAbxi+1Vgig34nDlhqlBIYzO8s
         6SPVMXklEpuy83w8OCsIgdJDl+y1JoQsWXJBXqzFtlYsOyU9WVVtYBmBizbY/4f58Vqg
         Dm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736105801; x=1736710601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uL/zqFXHROf9ZEt+23hat/TCGZHaDdrfMcQYQykn+sQ=;
        b=R9c42cGRkc0cTnivgTl35oK1xyXR3ojaimyJT9exU7dIcIEJpcrH8I6RvDFO7pvd8L
         n1ZgRlhMELBjRInU+wbqKmROWMcbFrepEVilYjN5w4JPJlw3szj+Ys6q1T6aJw/Z9Vmi
         skePhKsYg3x81ZgV1V3hyScZPGLLvufALihDgCCHiB0F5mFmeW1Ux3wFMoyoW+AiXDnS
         /TPl22bd1cDWwy0wr6eyBdlCQ5K/bUlXpYVDSNDpaqALqFc7FmP0vjrz9T6BdWP/hCUz
         LokMlVku3wrsivD0XTYgiJmCTZmWVzRJbs5VZyLh+No0YOQBJzE/VBEvj4y70Bfks13S
         llXg==
X-Forwarded-Encrypted: i=1; AJvYcCWSvYIB0Rfhyu6fgl49oPrH9dpBhN4JEDKj5psX1CJ8aZqd3/0Gq4AnCDN5Aaujxx4asXtyW5pyoYs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx07snOOyyroAbDdtOQSpsMQvKJ4sHTrvCC0FL9rhXQk9XH2AjK
	Fk9VDp4ymAt9tZHUhQu7iT9kZLuwmpK85oZ8zv45k6xUgZVtXhVP
X-Gm-Gg: ASbGncvtMhLSVI7CEzN6OaoeySx5IKdbzEO0woXKQ0omWYytMJY2Aed5AC5nqSErAnZ
	UgGDR3g/f30TtluxjVBZDL6HarTonHGjSN0Tzwa586FHHE1fWSOik+3y9sNguJOSi4yZyz1Jon9
	S9G73Q4qRDqawDUwWnvxb8QiFhf83bAGgcVgeYIGfAQxivUijtqjC65PSouPDxCaQ5XvibCokJn
	Jbjq8kRUCslYwKXfJRHZnvE8786/yzkfru4wae0CNaMY5WM1p6wDXVFHDCFkUIECzOZ+NTnE39w
	LOJCvYQnTan4AIce4HOM/l6jIKI=
X-Google-Smtp-Source: AGHT+IFouwwt6HzhvqIxmA4ch7UvnkmJ9mBbYznyfioQomX0QwRXA0RK0gHHtocjaVm9XUf8bORtpQ==
X-Received: by 2002:a2e:be25:0:b0:302:40ec:a1bf with SMTP id 38308e7fff4ca-3046861c063mr72547191fa.9.1736105800607;
        Sun, 05 Jan 2025 11:36:40 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6c586sm53297321fa.11.2025.01.05.11.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 11:36:39 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 07/10] HID: pidff: Add hid_pidff_init_with_quirks and export as GPL symbol
Date: Sun,  5 Jan 2025 20:36:25 +0100
Message-ID: <20250105193628.296350-8-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250105193628.296350-1-tomasz.pakula.oficjalny@gmail.com>
References: <20241231154731.1719919-1-tomasz.pakula.oficjalny@gmail.com>
 <20250105193628.296350-1-tomasz.pakula.oficjalny@gmail.com>
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
---
 drivers/hid/usbhid/hid-pidff.c | 15 ++++++++++++++-
 include/linux/hid.h            |  2 ++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 53b16a4e54a6..5a328860685b 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -1299,8 +1299,9 @@ static int pidff_check_autocenter(struct pidff_device *pidff,
 
 /*
  * Check if the device is PID and initialize it
+ * Set initial quirks
  */
-int hid_pidff_init(struct hid_device *hid)
+int hid_pidff_init_with_quirks(struct hid_device *hid, __u32 initial_quirks)
 {
 	struct pidff_device *pidff;
 	struct hid_input *hidinput = list_entry(hid->inputs.next,
@@ -1322,6 +1323,7 @@ int hid_pidff_init(struct hid_device *hid)
 		return -ENOMEM;
 
 	pidff->hid = hid;
+	pidff->quirks = initial_quirks;
 
 	hid_device_io_start(hid);
 
@@ -1400,3 +1402,14 @@ int hid_pidff_init(struct hid_device *hid)
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
index 2af9db0296d1..93233c5b75a6 100644
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
2.47.1


