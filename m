Return-Path: <linux-input+bounces-8146-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3639D2492
	for <lists+linux-input@lfdr.de>; Tue, 19 Nov 2024 12:08:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD7C9B27DC3
	for <lists+linux-input@lfdr.de>; Tue, 19 Nov 2024 11:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFF8B1C1F1A;
	Tue, 19 Nov 2024 11:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8JkSagJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5C313AD03;
	Tue, 19 Nov 2024 11:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732014492; cv=none; b=h6AbqCjDfioMM8oZ2MWLO+2+AUiEw/Zv0HEvioJpKX2QpVcfJjmNrLF/ppkA1BI5dPc2q0SktsSaU8bMRK8jC4G2rkJdbKdNgyX9FuD8TztncmdHRhasoY3G7KqrwYa6hy4sgYG2LpKKuHdzJtm7VDlaG8G7gucQEkUWIKgeGSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732014492; c=relaxed/simple;
	bh=NnQqv284DeZx0yJ115xajPnypfjklVXqLNlqJ8G0eio=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dThXeLQ/71T9QPmulSLyJ3IjnvszniQOvAbux/Ei82zzLzMmb1YQHD5imnJmCQ0Q0uszsCpamLWRIRsZzg+b/d7UHMQhTEDKGwXSlBdp5FvYre+wqKOqE3SjDgWvHdJM34fFdZbSJ2yJMWfDZdAhvWpXibwW6ba4KXCU7oyb4+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8JkSagJ; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-720b2d8bcd3so636434b3a.2;
        Tue, 19 Nov 2024 03:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732014490; x=1732619290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VBVbvGteYAbnOd6dtVKtRw9lJSMVBqcwKMWI6ANtGUI=;
        b=h8JkSagJhF9FLV+XMy1vlFhYKPpazQeQmTmHvVKphkJMJgFBftAPZI0PKFQ01yXpGx
         ALiMgqj/8K4zpYBegeRxa3ti3eJaKZKPymtGZZGrztRD/7t+sQm2DWcg5FHF1RULDb8n
         U7Nk6DYEh7UUq0jo9hkDsy5Nukm7iiw5dRWgejZqMSDGyn1i/iwHKVyBBEjpNLzLCd+Y
         /hpEYZfYQx8MD6pYFv26DANIab1YhMGkLXykwBOu8O+A4AetkTCNiPUx71h4ja6LgsMR
         /TgkUOs8p2eOic74h6lROkWbWu7vIvz8c8jnotuMW/4YjZcyuAzMJ0nNilULl88DYCiR
         05DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732014490; x=1732619290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VBVbvGteYAbnOd6dtVKtRw9lJSMVBqcwKMWI6ANtGUI=;
        b=i4rJ1YZZ2oJO9ZYzSy7y5M+xxBtvQWK4TLzP511kvnPYhC3G1w8q2xT0W9q2KMQJqF
         0TZiihAPOpEpYMX/sfXALZWWLE4zsAyb65EPfcSv2UK66tvFc+mTRLYUx6FqTrKSRyAq
         aeWiiDJKI+av9/EGQ7XXrQ6IkQMNsbcslF0gJtfzUzFfO70eRRygeyuOTxVGZrGEqvzw
         3GPRoW8J9uR/I9RJ6O3AwQphdo9uHvg2R0whpDpOS9DfbD3VtqdLc4nCbQx1kPaO7cvL
         trS5D2xLKaSQeccOvtxXdudLiE270veofMFZpPR24UI7gYUbH4wVxatPFjHV84U73o7H
         yVTg==
X-Forwarded-Encrypted: i=1; AJvYcCVicYA0Ud6QX2U2ZoNGGJkGA+MjnCYtT56TI4k6RK4+KHnNXAWPHpGrmLVzb+wr5054aye/vEUtX3IO+Gvy@vger.kernel.org, AJvYcCWDn0KHWLiTTHm+SbZWR1gJi6PsdCf2cxpCVcksyr0IWKJ6PoGNYI0R91BM6ZEswBY427xptXU18HyMLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQfvObCrfOF2sC9DiZuFhxKBWGUG89PFPEGIWG+AxumSLa0PlO
	vxjmJq07FAC9p7AEkjiR2a49eHrYZ9q615atwovSyftQatB5Vjk/
X-Google-Smtp-Source: AGHT+IEY+qqclgk1sLsNIJveQWZE8CQMYxA+YREdsjVGQcVOzRKskM/zZ7sjX4trkzry0gwmO4ugEA==
X-Received: by 2002:a05:6a00:21cd:b0:71e:cf8:d6fa with SMTP id d2e1a72fcca58-72476bbaa1bmr19100917b3a.15.1732014490344;
        Tue, 19 Nov 2024 03:08:10 -0800 (PST)
Received: from pikaa.domain.name ([163.53.179.60])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72477120a1esm8108617b3a.68.2024.11.19.03.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 03:08:09 -0800 (PST)
From: ajeetsinghchahar2@gmail.com
To: 
Cc: Ajit Singh <ajeetsinghchahar2@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org (open list:HID CORE LAYER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] hid-core: Indentation fix
Date: Tue, 19 Nov 2024 16:37:59 +0530
Message-ID: <20241119110801.9735-1-ajeetsinghchahar2@gmail.com>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ajit Singh <ajeetsinghchahar2@gmail.com>

Signed-off-by: Ajit Singh <ajeetsinghchahar2@gmail.com>
---
 drivers/hid/hid-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 582fd234eec7..b90159b621e4 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2844,10 +2844,10 @@ int hid_add_device(struct hid_device *hdev)
 	/*
 	 * Check for the mandatory transport channel.
 	 */
-	 if (!hdev->ll_driver->raw_request) {
+	if (!hdev->ll_driver->raw_request) {
 		hid_err(hdev, "transport driver missing .raw_request()\n");
 		return -EINVAL;
-	 }
+	}
 
 	/*
 	 * Read the device report descriptor once and use as template
-- 
2.45.0


