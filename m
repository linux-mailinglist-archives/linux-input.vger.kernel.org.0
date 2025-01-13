Return-Path: <linux-input+bounces-9189-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C8CA0B771
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 13:50:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CF1C1881AA3
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 12:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA817235C08;
	Mon, 13 Jan 2025 12:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXzoAN5L"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DFC22F167;
	Mon, 13 Jan 2025 12:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736772577; cv=none; b=f9pS0979ka/Bz/8ePkVWocOestR6nwP4ri121lFr3ng6AVJNoVqUdDeAu3cpxY2PtXYkwlkYyBkSKvuIYrjSSyeYvlEqr2H6tu+YW9FzaPSlc9G8TDGXoc7Hch+57wuN37N0EAy0CmOkBM5dGptPU5h/0mPdV0jVvu3owrBE8lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736772577; c=relaxed/simple;
	bh=xv6/VQKKA0wTXkJKfLOQzDXvF9vfFdmkb7fI5OWPcB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KI/PLaPMB0WJIwpUorgzLOUA+8JuYj+e50uYp6+srNsLEreSrlRHgEYcg3uZWtGskR4rQDSxW1jXqzaRnRRfwUYzcHKmqOoZuNqgZAvzvnJL395i1sQmQw9GymbErSisKgQuoRO5sVlRd2+afQpOyt+bYcan5qZfQ2S6ZreRY8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXzoAN5L; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30223aa0b9bso3534701fa.0;
        Mon, 13 Jan 2025 04:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736772574; x=1737377374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D5cu8uBGIOCWVagxBiV8PBceULf5DWlODfYWU4tPWDM=;
        b=WXzoAN5Lc0M6TuqGsNEsc5v9jtDaSwtIoWQ2qu6y4yVBRzTVT4fVzOWiLlrdKiBcTF
         G28eRnHf9E3nIQlLouqd1FcjqJcmQFlUn9FD8RPNpcNkj98kzg939+quco5h+a9tYDAf
         U8VaueQ6QKXCU6mNAbzRju3WC81WGme/fpix9Q6NpybLJFYz1zs4clheF+pjTxtVaLS9
         lm9d/MS65WHL4FGjVIyNLVBL3Y9RNOa43vzmIfzw0TizIZrbWROTlmtEMkB/6sNXBH4U
         hufi7OYxsaWkRWNAZE/aGJOJI+d2NlTfB0sGsjTdXXciCWxfVT+Ah7+UZOHNuofrf73R
         jUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736772574; x=1737377374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D5cu8uBGIOCWVagxBiV8PBceULf5DWlODfYWU4tPWDM=;
        b=wrYsJQubEVEWtr+98iIy9XPFVsguKBPjyFB1C+sT5+SrRb6DDKUCTa+kNHucwWvwXM
         mpz88IYe03OQLEHQ/9cre4OJ++3gE3BXp8TkEaxqW5sgwRYE2yPUfryLjR9xHppFvU7d
         cEutpRanLb6eCn0k1oeIDHGNBp2hDXE7Y/oHZ2mDYM92j4rfKATCeGjVZ5NXSCSrMvDR
         LnrLBHgzJIHjcFZ/vLkoFBXyenp6CaTglNkjgyT6q6d08BObMTbodTsPVuUXyb2wD0V4
         +yv1Ihh3RlvpPRqHUy4ovUbQlphmZI5QNLT4506ntljatLSN+SEYTv2uHworucm3rAu2
         Zv2g==
X-Forwarded-Encrypted: i=1; AJvYcCUVgw8W1aH8UYqTUsUPgjoapzYG1Q8emJoyo02zcd4Vh8onm4dLNtpQuW/8r8sqalQhgSASu2i7LxFq4g==@vger.kernel.org, AJvYcCUwypbXjwSw65/jOoIrPw2VBOyHfiV365fhiiWhPwBfdyaU5dTckFtsWNJ+5+vYc+eqeOV4stY+oiql@vger.kernel.org
X-Gm-Message-State: AOJu0YxdiRESabJSWtxtKC6AV5kEhyRSBxggVpzKhl/JJC8OvCh6p4Kj
	5kGApErb33SovEMZBIlFS9x8xCc4CtGqIwwhJObL2vcN01sRLVPR
X-Gm-Gg: ASbGnctqOE1dRFMZeklqwhzTb+hzGsmyA93o/tA98H6t2jqgovY9qA/tAKW9fccG5nn
	QKlv81nVMRz2rIodBRUhRKssZxV59wxl4r+AqydX7+TqFIgv7RgnwYn/pnmKgJd/JO92FyuMV6/
	A7RgyHwrA6zu/s3z/IAGF9Lwt46y4T6jHoqY8G9WVyAMC1ivCpkupOE3rxyrupdQlmToqlvCOBl
	OTkPxr06O49UHbKekHqUqLlc0a2U5VCIkd3ElqirBy5565yqZGJyUyhw/Fg4OPdTJWul9pXpQUu
	8RQyo3M2oaEMeq9i9Rf60biFNpM=
X-Google-Smtp-Source: AGHT+IG0F/2fvIYEoTGAT8x44dCcAydVTW1FIzhXpv04gFC+MpfV+1CWaqvE3aQJETUKU3/woYS0Hw==
X-Received: by 2002:a05:651c:2120:b0:2ff:d396:a73f with SMTP id 38308e7fff4ca-305f457bf06mr19461101fa.5.1736772573713;
        Mon, 13 Jan 2025 04:49:33 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff1ec162sm14256181fa.101.2025.01.13.04.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 04:49:33 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 07/11] HID: pidff: Add hid_pidff_init_with_quirks and export as GPL symbol
Date: Mon, 13 Jan 2025 13:49:19 +0100
Message-ID: <20250113124923.234060-8-tomasz.pakula.oficjalny@gmail.com>
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
2.48.0


