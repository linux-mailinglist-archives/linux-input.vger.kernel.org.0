Return-Path: <linux-input+bounces-9389-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6655FA161F9
	for <lists+linux-input@lfdr.de>; Sun, 19 Jan 2025 14:14:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73BA57A303A
	for <lists+linux-input@lfdr.de>; Sun, 19 Jan 2025 13:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82EFF1DEFEA;
	Sun, 19 Jan 2025 13:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YwwGA7jM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43891DF276;
	Sun, 19 Jan 2025 13:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737292453; cv=none; b=HVvPpJpFDjkhXY+WoxlTJQMy84JebuKyEuR3ncq4/c2hwd2wZnPeIp6KYOBdLooOnmhrZVztcmlRw4pEmM9byTaYTPHqVgn2XFce2vPoAwstjdYL3UpEY2Owcxqh38sevAHDyFLlL1MupDIC+hhSOvgCwlkBXXWD5kJdf4cX1NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737292453; c=relaxed/simple;
	bh=ozLOBf+HgXIdD1CSxTdGgwHIY8gHldGUPDjNzKsNMgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sXfUJnCA0x4hKUG1Wr6966l2EcxeidB96p/hDzAPBAbpvPIgrR6KgPyUQVXq3t/n0fhbdnopuJ3XEXiPLFenolg9XfoY7UTakQIdFdBdD3n15Cxd9za9cG9LIhEWPKjC3+97ah9lVw6Hx4I+LVGV+OLpoOmbfFKqmMT4yBJjkmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YwwGA7jM; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d9f842f237so662201a12.1;
        Sun, 19 Jan 2025 05:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737292450; x=1737897250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AKygA3bnrgOWG91lmMVcCS4m4zZ5VN+Yzt3sSqeFq/Q=;
        b=YwwGA7jMryLmJLcuFWpYooS+aooMD+6qInhUSiYeJIJOi/dLdvJ4zVmhLT4JdfCuI5
         lFP251Vl4sVEw+SQieL9rSLg8nn/vpWC7STnooANNL6LZLOnpo/5L9xC7M/+ZxsoIJH7
         +pmEZC8Ro7gUQD/q9D8zKvR4+pbT9J4Jedra+4S3n8MstyuS5eHWTQPQpT8dK8h0tFnD
         0Y1kPmY+avjrCWX8gJI01xmcvt0nWYrqurIiXLSe8q9NivyYY8CHdz5E34ziB7okBw/T
         XropgzLoGoaj1vWNWCw1Ws3lwMKCrKTs3UJlMqEySAjqynAzdX0yXZphd5sdV7U0uK2t
         h8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737292450; x=1737897250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AKygA3bnrgOWG91lmMVcCS4m4zZ5VN+Yzt3sSqeFq/Q=;
        b=p3tjiPz3Ce+EBzVPofwGcDcOerVGViOB///Qi3j98nRJkpxEdhbOBwqUDVIQAqdHvl
         GnMYbl2t/p+RloBwCYQ7iofXjrYaSLO2RG49y9pP0of6be03TiWBUOv1+1DKpVVHUxT4
         eivQ3vXAw/m5lKMYGR5IOcTbZ8gs12cpEgN2HMwTIMQ/z0xAZah7K3zAvoiNgiMnoJVP
         a25aKXn6Bbd34nX33yZ60k5C0+il/WCEEaqGqYMdc+RTUJkdy0v2v6MWdO+2wXzUfKcU
         Vtb+KVnbQpSo4ToQ7sRRaABCBhRSLm6OZE5RGOCGl6WNyvRNTDo6ZjG6hV3cUoOc57+N
         hmuw==
X-Forwarded-Encrypted: i=1; AJvYcCW2HOYeuMum97On4phB1+SdfvBuDGuyjJst7zt8I2kLRHYOsp5aZKtyrlYMyFjz8zakSmNS6T8JUHqmnQ==@vger.kernel.org, AJvYcCWbGnl8xO/JFaG+TAAFx8/tK0n1tS6ona1b1sAioZXT0VwMSx5h4Nmo1RqhdtC7jvjtmMKcI15Ml/zl@vger.kernel.org
X-Gm-Message-State: AOJu0YzPeIDWvBavk1rNnwUn7BimXAwtVdM2Iw4uWlQ8lslj09qEqpTc
	gJed3cX+7Z5lE1TdA51LdLi9Xm524wcSN8cMprDUgS38SEnS7j0I
X-Gm-Gg: ASbGncvwn7o1pn1bGH+ICGU2el/MjVafKLYE235mXK07lCDKxYmjDK9XLiG42TW36yu
	5zNoUsCqnQ8bf38zzaqJPHyv7wy6YH4at9gGPTmUcoPb7uXPAr1Mr00jAYizG2UCAQ+zWnKLaaK
	hqsbbvTrfvA5HK4LT9Ojw1FYVBYBbhQZv78V4LL68Bqt/b4SkfMr8Ea6F0TbNODqZga7Pxeu6Ic
	P5BqSZmldzkvlxEHUEF2j8vSVG/Esz9IqBiTPNkyMAVL2Q+w3IXPL7yfiSWahTC9h2yslv3uodn
	2s9sCh/MR/+KU0wb4Z7Wuojs7Hgbl8GoPWEdy3au
X-Google-Smtp-Source: AGHT+IHdOuRt4mB1GxMgwzUCqG+oC8jdRtX/Dme9EjgOQo4P23XlRIPBkby1dyxzrbjaJ5luqa05PQ==
X-Received: by 2002:a17:907:9803:b0:aa5:163c:69cb with SMTP id a640c23a62f3a-ab38b49a5cbmr271095466b.12.1737292449840;
        Sun, 19 Jan 2025 05:14:09 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384d27117sm481155966b.75.2025.01.19.05.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 05:14:08 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v5 07/12] HID: pidff: Add hid_pidff_init_with_quirks and export as GPL symbol
Date: Sun, 19 Jan 2025 14:12:58 +0100
Message-ID: <20250119131356.1006582-8-tomasz.pakula.oficjalny@gmail.com>
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
2.48.1


