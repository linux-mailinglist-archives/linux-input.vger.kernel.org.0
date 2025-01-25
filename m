Return-Path: <linux-input+bounces-9531-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B51BA1C37F
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 13:56:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16B2D1889B2B
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 12:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C8D209F5F;
	Sat, 25 Jan 2025 12:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPeNqB/A"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA66208989;
	Sat, 25 Jan 2025 12:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737809720; cv=none; b=eu4ZMhYxM7UMLbLDvY5OAawPwSYRAKHV+L8QpsdSgWHRdhg2cRSAkmHmbkSX5mPhF/bTaz5/I/kk4mq23W7eKwZekjzyK4NoCQucJDhQISdtX0fmfWz4JZM8HoqfBxudmxX8MVy8fX1j6aFq8J3RzOQ3MxUM554fNpurnpdthzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737809720; c=relaxed/simple;
	bh=BpcDj71JhMPvMyeASILOGmRF1KyRQ+8x/f2HGcPJcSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vCPf8+tnKlDhZXrAh9CZIGNHdUIqTWSEp9bVeIaibDVtPYuvsLx//Knai4sZOH8jgP4HBQccL9pd//iDguVpRfDE4CQpN/s804WFiQS24lY2eaE3DKfDeSdXDRD7/8Hs6N+wxoj+DKgVGj4U+mpyNZYHUIYw9wzP7ZRq4XFFhQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QPeNqB/A; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3003ae21db4so3249051fa.1;
        Sat, 25 Jan 2025 04:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737809717; x=1738414517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ef1OPYDeIgI/wuc0omzhDlsfW60n85scRMgVKKIlzyU=;
        b=QPeNqB/AScauGt8W7be5b0T1poTJjpIkidap+ET8y9NdsMu7Vo33fwhFY+7pbMLPQs
         CvyqMLTTHmqq5Bhjzco2Cerqb27z7coiHhSgXvBOWZFy1vRdBOpCgtBWZmNnKy89npXk
         KOW25D3TqPOZOIP5rMIMsgFk5MGEvzTs97DD4IjBMrU6w1qTGoHyQIcx+sH7WFDAaZub
         EakxhamBrDWoYnbSOBFQRNq2V/crCM/kBJdgb1O6wwQE/i+VBYpZBBTp5mFNZlyh2TFq
         amyUzGBuJ1rw5I03FYFfdOiqj9BRCsZ7u4xS9lHLvDFAqdwWLyPr+5eS3KApw6lGBpIw
         xzkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737809717; x=1738414517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ef1OPYDeIgI/wuc0omzhDlsfW60n85scRMgVKKIlzyU=;
        b=M9Q1Sq2PAGvcU4navZ5kJdPyMMueEiwWMckqlHjkLSveKvUMAKrrUFHbQgJrfd1L5Q
         iITui71NUwhgN+gcknBjvRct+uRRtPI2cZNSSGjLinpt0KNs0CTlrZlkEpbUkaazrppj
         hbBLmn8DYY5XimPDzSvWcxa74zU08wmQ+OX/b7Am/4BmU4vExaCL+QN+7XK0XtonKe/X
         NzfmW/PcY8cp09NZ60kKyNLnopISYaXmxOAAqgzX+mmw/HPNtvQXrkHv6AhLmvoT3miO
         FGNmt8QhktGKviFMUk9myQS1JoTCYsMVxZq8oBSapmUSikGw1tQ9vjXv9wbd5v4/okHc
         Bdsw==
X-Forwarded-Encrypted: i=1; AJvYcCW4po99kkImuCudseUd6cgsy6l7hdJjjoL/CU0hIhVGHdgy7GThIdJJHSt5slS37qC4F9ZVzplZ6BVU@vger.kernel.org, AJvYcCXWLJyhqp245Lci79aqkUCFccZdZlYxYRsh8oRevCaWgTs6H0pO8qlJVeq3ZeC/kf431JQheEcsRFoibw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRBQftYTK0UKiI4Mn05yYiXYjOyXegOfHXPp8DRwbaXJ+Rt58l
	CIi9FOcSUyMNDmOqCAyebUx5LK0Gv1EGnaVme4qhYjs1bu+n/yb1
X-Gm-Gg: ASbGnctIxlVlxJVzzxWcO2HqaB/J7ZEYqKPPF6PR6bPcUNb4LaDLUK9rEnXzWf50X5N
	4bk+p1WnolHI1XB2nVHKb8xqJWeo20p/zmfw3iqvTvIRJeUWkPF0t1mu3j/Uzbbcrn/3FOrJfqc
	3KmNXJuf/mjn+T0jjQCvOb3cx7HjZumRjtmgPxwWMNfDUWGNjSOrrAs4BSMJIe2FNFtsk8clhcZ
	mpiLvDFcH9+bUZrMMjzm/b9MlIiE1w2td4lBzgAiLZYFeWw0lvjpG5lOGrBNnrpCH5yUPpXbesh
	3CgnKGWlg6Jm/DJHlzKB79kFKl86BlNA2OKIFfqDOx5YuvxZhbqzYvla3YKe4g==
X-Google-Smtp-Source: AGHT+IFsJSiSHeN/z8BfWQPszgzCywuNz/G9aJ5vcGDbxjP2XeB6jLQLIfKKCKKW6B9AvinvnMPjJA==
X-Received: by 2002:a2e:a984:0:b0:300:1975:97c4 with SMTP id 38308e7fff4ca-3072ca63aafmr37981981fa.3.1737809716381;
        Sat, 25 Jan 2025 04:55:16 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bc1981esm6960701fa.75.2025.01.25.04.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 04:55:15 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v6 17/17] HID: pidff: Improve ff gain handling
Date: Sat, 25 Jan 2025 13:54:39 +0100
Message-ID: <20250125125439.1428460-18-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125125439.1428460-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250125125439.1428460-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Makes it easier to set gain from inside hid-pidff.c

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 5ada097c967a..9b8615197d5f 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -525,6 +525,16 @@ static int pidff_needs_set_ramp(struct ff_effect *effect, struct ff_effect *old)
 	       effect->u.ramp.end_level != old->u.ramp.end_level;
 }
 
+/*
+ * Set device gain
+ */
+static void pidff_set_gain_report(struct pidff_device *pidff, u16 gain)
+{
+	pidff_set(&pidff->device_gain[PID_DEVICE_GAIN_FIELD], gain);
+	hid_hw_request(pidff->hid, pidff->reports[PID_DEVICE_GAIN],
+			HID_REQ_SET_REPORT);
+}
+
 /*
  * Clear device control report
  */
@@ -852,11 +862,7 @@ static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *effect,
  */
 static void pidff_set_gain(struct input_dev *dev, u16 gain)
 {
-	struct pidff_device *pidff = dev->ff->private;
-
-	pidff_set(&pidff->device_gain[PID_DEVICE_GAIN_FIELD], gain);
-	hid_hw_request(pidff->hid, pidff->reports[PID_DEVICE_GAIN],
-			HID_REQ_SET_REPORT);
+	pidff_set_gain_report(dev->ff->private, gain);
 }
 
 static void pidff_autocenter(struct pidff_device *pidff, u16 magnitude)
@@ -1391,12 +1397,7 @@ int hid_pidff_init_with_quirks(struct hid_device *hid, __u32 initial_quirks)
 	if (error)
 		goto fail;
 
-	if (test_bit(FF_GAIN, dev->ffbit)) {
-		pidff_set(&pidff->device_gain[PID_DEVICE_GAIN_FIELD], 0xffff);
-		hid_hw_request(hid, pidff->reports[PID_DEVICE_GAIN],
-				     HID_REQ_SET_REPORT);
-	}
-
+	pidff_set_gain_report(pidff, 0xffff);
 	error = pidff_check_autocenter(pidff, dev);
 	if (error)
 		goto fail;
-- 
2.48.1


