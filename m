Return-Path: <linux-input+bounces-8969-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6821BA03222
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 22:36:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFC2418860D9
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 21:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4F781E0DCE;
	Mon,  6 Jan 2025 21:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SfL5ksrF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E951E0DDA;
	Mon,  6 Jan 2025 21:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736199355; cv=none; b=U6EOzwtI6fAdiyep8lACVSAUk5yHklvhoQuRjaVl9I1x4oRyMXiZYiWIlrrQsFkBLONdJI9rF5lVi0x+/JKoNE8jZZ0W8oQingc+E/EwO///0Js/qbQbyvHAwNxzp2RS1elRVW7M4Vm6OCDf96JKO8CoiA6XamT424Ei/F5AdGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736199355; c=relaxed/simple;
	bh=QpcFmZSNF3TCKbFLUHLW4V0YOIJt0/4SLo+cWhmfzTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fl5l9NkFQxktA4dO6aVxqQ69gD7znInSOjRrfGs0BR6qqoRuueis2BhsfjavQql0TdY26LtlNtraJoCGeJHSzhgyUKlaJbUYchuRxgfTNajC4ohOmqrOZJ5osiHc0iu5ngsNXy04itgK9qbyxnKAqaZkj/bZzGgRsga4CfKoIDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SfL5ksrF; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d3cfa1da14so3133614a12.1;
        Mon, 06 Jan 2025 13:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736199352; x=1736804152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uL/zqFXHROf9ZEt+23hat/TCGZHaDdrfMcQYQykn+sQ=;
        b=SfL5ksrFxFYC6QR9Lub4IZ3330ZndWuP2fPy3u8JoZ2Na2JwcQz48OIHhQyC88FLe8
         SReR0VqKtAwGNSdp8V2DZBiVsw4fVuv7LzL7BojUOn2Sj+ddOfA/i/dwqmId4b/fraa5
         sEWZtv+FBOdmpT/ca7/kuhptB0akD9XL6gTdmrA9rqHFvVvfrbhP8XzppZKwNt1a9iIp
         PnonyAObyPKyuj7DYiwfOk7eVkZ0/wJ1rGtiqdK+uAhxtzXWvocoy011NqC5/vjmWH37
         JlIuJqB1TjhMvHn20WFOumSq+6CryHI1TfIBI1tOHDYpjLzjRKpfCunSk2d27K+nkQ0L
         l7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736199352; x=1736804152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uL/zqFXHROf9ZEt+23hat/TCGZHaDdrfMcQYQykn+sQ=;
        b=vGET2RUyOEAC5+o2vnweJhifBuEvLesHYOuxhGKXAEiE7PKlo3/X9rz07DIXYZ/ikl
         WETTm3KU6svlheJPmtfMyOyJ0AQtvS+bO/XW4u+90126sQ6ZK/tfShleEMTga7YNAkpf
         OrUZDkEyKWWvxsxmUhDdU6fPg284uMfkve/KTBk7bvOjiEmy4uYwjpGBTyJupY2RxcIu
         teu02Nj3BjfJlPXn+Mplv5TNrHd5gVcWjN/nfISg3vXNP6DDVhnIfnBWS8CkyJAciTbv
         ws3KZAN6VybCKn8E3oG3JLKG/0f/IIrjYtiA+7SIA+ga3QkqVP0uJjBY1xMs3KFaTjzL
         dY6w==
X-Forwarded-Encrypted: i=1; AJvYcCVI5zHB1AKL4br66Nbbyhds3IRhzMFTMxTcB3zHJYFesjv0v9aATExGAs53Qt6g/ARCtIA/9u+caPM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5qjTKNmEx8PM1M5jgh619Lo4ZHFf8PlFuCPyPXUG1+0Oe5p96
	G3Cj4axTR6QIzf491yCRvF17Hzvc9nKrIj08+txRGPfgHwwlXq+x3RtldOHX
X-Gm-Gg: ASbGncuBY9vwMoLYHOm7/LHIPfaUmcMYfiqZL+NxVS/fSYKQ/2hLRQO+4X+OoGD86Uw
	dC+6n7k6vs7dCRT5Lj897+OKBWk0WVaISKZiT93MolKr4QWObEwc/68ZHyXTl7rdsh+KmcUOcBJ
	+VHU4OvkzcNNXA1CpOudo8iRr1BOtlriSgPsFM5b1028fm+e8o2x0GE/uD80pJglJ9mMR1Z3/Po
	Jz4KJ2ITwIp6Stu2f5EphMv6d0HB9qqtBEV91kWsgrwKfboKyrfXy1uwXUSh9XvbrdY4L6YSC+f
	1hKynNS7k0VKwX0D2ML/gaAZMvI=
X-Google-Smtp-Source: AGHT+IGMvCFVdT5qK9wrMt+xLqgscbsHuH5eO7aFMjBvyrLlO+XxMBjMQ+mpyTVK35pI7Hvm4u6S/w==
X-Received: by 2002:a05:6402:348b:b0:5d3:fdf5:4b28 with SMTP id 4fb4d7f45d1cf-5d81de36c71mr19484232a12.10.1736199352156;
        Mon, 06 Jan 2025 13:35:52 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f9acsm23375991a12.31.2025.01.06.13.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 13:35:51 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 07/10] HID: pidff: Add hid_pidff_init_with_quirks and export as GPL symbol
Date: Mon,  6 Jan 2025 22:35:36 +0100
Message-ID: <20250106213539.77709-8-tomasz.pakula.oficjalny@gmail.com>
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


