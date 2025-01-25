Return-Path: <linux-input+bounces-9543-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C70DA1C56C
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 23:26:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3527167967
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 22:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D8872066E6;
	Sat, 25 Jan 2025 22:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SROOn2lc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B1B2066E4;
	Sat, 25 Jan 2025 22:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737843946; cv=none; b=HpGrUksEqijZokKzBay42pq3zekAqzHWlMIaWIySWE3PbFbh12idW+Ht4YRhdLvmA4ETMTB+Gd2aCskTLkKQoNU0zbT7HVrQINHyKc54NWOL+TgU7W3JeWUsg5iNZt/nNSfYSpk3s3jVxQPYQaT2NzNDwdEywoSwtdauYc2zwnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737843946; c=relaxed/simple;
	bh=lhNyDbqPT/A5BuGm77CZdSiqP3jG/Vu6qUEGM5mTO38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TL0aX9qCcDIx9OU75CXGCRwFLhaG/Ujm6aACoxoln1WDuBz/rG6edSh/IUhYDEV8Ikgoe9frPKDT+dcme03w5GjtH3ZCVbq21AZUe/wHYb1V8FJRnXBGzCkZSkik71r8vfg5NgHZ/u2MTlulXt26E8B90MyjXQi9AzO87i6Ac+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SROOn2lc; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ab30614c1d6so61134266b.1;
        Sat, 25 Jan 2025 14:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737843942; x=1738448742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmnykWrVlt0sJdJV1uVzbEe7K1M5/Cz3pmV3NtFHvbM=;
        b=SROOn2lcc0cI8dxaspGi47bCCpvMnm/k7H5v0pI0R7t52XiDxLC/SbE8ktLqX3t5n/
         QmP0M8d8fIT+CtAjO+hjm9jZPAFSlRhSkR8N4oLSD28CpFMqpZbk7sYn6zSJsqwooPtn
         9/2bnu0pkJzdq6g/QIQAY7pkVr0THFG9ELy8/9IX7LH0uuXil/hS/kxwgpV8mVTB1wau
         nC9o/vy7LJwH2Vtf0MBTi3xnja9+hixGdpW08XeqknW0sXJ2dlstfXXrdc8vzUhkkWT8
         K+eUlwYaDVce+DlxumULDbpyEglu2JAJ/O5ZmRscncTkZpqq1/+ocK5oIAQYhV6HhPzQ
         ROYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737843942; x=1738448742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmnykWrVlt0sJdJV1uVzbEe7K1M5/Cz3pmV3NtFHvbM=;
        b=Uw4O9nJGbGb+VDdM/brpOiz7tMsAzOyWzmGdP6YQBbk+EJVKZc9tg1Utz/peRZI/jO
         Dq+r/LAArlj34V1YyY2LWSZlI8+d4mKfd4J/AsMcpUSQrKvskesiJD3ZUYGUJM8C4wK1
         ZyWGFB95Sc37YQ6dB44QaaKxkPl7ku62KoR11uFOcvjDBd4uPF1raUrLLe9VI8o7568O
         9UyVywEL0qOVBpVu17CS4FwrNcHMTQyTtgcimAbXgHzzJfP//34oqBv0lGZ9hKp4Edqf
         vAKy8cg9lNi/bDdO4IOBxSICP20+2Eul5hGTXs/Y0HwTjQozihMX3v9eN59nP4VJtRI/
         MZDA==
X-Forwarded-Encrypted: i=1; AJvYcCWGS0RiyhjdijhSfJf5jttik7b0zji1s+itD2LtLDdvH+SBHXgWFfCHBVPKzVXqlf6B5/mhszTbhb9EFQ==@vger.kernel.org, AJvYcCXznWHUtb/g3L7z4VhiDkJjneXQOqJ58/XGZjP490Q6V9ZQvu4wjJKiK5Kr3UU5Q1d+PkoY2MZuH2wB@vger.kernel.org
X-Gm-Message-State: AOJu0YxTb+VoDyFaoHMYv4Ra71dn0w+bzPPuLmrXu/ulp9Nc1Xs1zM9n
	0saKX0eUdyWMbClPqMVC2gag6OkRgaokPnhi3aLsWNNb4KHHwy4W
X-Gm-Gg: ASbGncvqMJUwc5qmnF4nfCmp1Ae0izZrR4uO/I7NpwKPSrD5zlq3ZJ3pd0pQHSBL2gq
	aRFOsZ2M2W18UxQHIhhHJ8HRnmNq/Y8Cz8R7Q4vmqZw06Xq23rQ2v8kYFb9sGUjtQp7gVHXzMWb
	0KanFPXIcp4OGquXC35JZRyCrwa5gBZ+x4f2fIzeHdPA/ujNmPIPQBlCr70eUBqahMDugHKYsu9
	U5OSi4Ug0yy2wk8gS2Gt5yRUX+HJrKLMUtTUVhZU5dJwp3Y7m81DxLy1zwwXGVoL+TuzFdNZ4za
	xwwQ8aDOdvVtcjdCBccTzbyQie1aRfscUJyO20qGtasODFABHFc=
X-Google-Smtp-Source: AGHT+IF6KtGnHcD4d603Q4TS9ycR6P93F4Jnz9431WOD4+3YutAFIdXozpzO2c/2MsIsHO+nnJwAXQ==
X-Received: by 2002:a17:907:7d92:b0:aae:c058:b8d5 with SMTP id a640c23a62f3a-ab651653889mr670134366b.10.1737843941565;
        Sat, 25 Jan 2025 14:25:41 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab68f1ef7besm136540166b.62.2025.01.25.14.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 14:25:41 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v7 07/17] HID: pidff: Add hid_pidff_init_with_quirks and export as GPL symbol
Date: Sat, 25 Jan 2025 23:25:20 +0100
Message-ID: <20250125222530.45944-8-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125222530.45944-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250125222530.45944-1-tomasz.pakula.oficjalny@gmail.com>
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


