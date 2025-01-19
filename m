Return-Path: <linux-input+bounces-9388-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31424A161F7
	for <lists+linux-input@lfdr.de>; Sun, 19 Jan 2025 14:14:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF6AB18862C8
	for <lists+linux-input@lfdr.de>; Sun, 19 Jan 2025 13:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3B001DF26E;
	Sun, 19 Jan 2025 13:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/QycSEe"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A151DF260;
	Sun, 19 Jan 2025 13:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737292451; cv=none; b=U93NjVNErj1VUyXgyTesx0nUXpQbgEKx07VVvN5QGUsx5+A/UlenkwlIep0kPRreaJOzUI4WrsRvWYzj4aGkY1QzUZn43V6uRlzUX3enXm0W+lqXKj25F7r51hcteb65v69L/tsiVZAlRC6H61zeVQU3e3StKq0R0hLBQ+cUBJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737292451; c=relaxed/simple;
	bh=9OkxGMM/TGcKcRwWGvqe/IYhGFYH0CY4+dFUcgVVilA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KHYZEBC8dgLbjXybhJH0NzceIxGICNXWGIILSjRosh3JLAT43MWutATA33nYBCAlDR2JCh5KqEa9u3dMcpfUTn2FXNuVPlUcGSHRqeeK+ZrGWTt4Y9qiNW9w/Ytjrqfs+ukrbahmhvqRj4Vqm/LLABTrkq6YgaeNPyvGBA+pQPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/QycSEe; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d3e5c225aaso649010a12.3;
        Sun, 19 Jan 2025 05:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737292448; x=1737897248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fx9O1Rr6bGhNTFg2p+wdoPNtoibDRRuNmGD7dH6Cr/Q=;
        b=T/QycSEey2h1M9JslAY16eqHFTrNzOHLZVegse8zzFody+HEddpfT3WzTagQwTrnXM
         jE5z63Pd/Rue8iJPR3BxJWo2MSa9lzoHykVt6KIMppOD81StCdhJVkCkJNBnF731SGdN
         WdVpQ57z3Ulw2SrJkYjDP/wlB/arovbkXr2bfARZjDExb7OpU4Kbumf+fniE0dhbslEU
         odrnG5l7htg6PXbESYX3p6Pc4URtOCB9F74kaYiNY30kS0/22Wb3qpSzdvTeB8rsUPfW
         vkZ9x2FZPEdp5HNlGuz9L2XU6j8Ysggkh5ecKLLA3E865L416junuB+78ZDnfGSF3P7y
         J00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737292448; x=1737897248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fx9O1Rr6bGhNTFg2p+wdoPNtoibDRRuNmGD7dH6Cr/Q=;
        b=Z+0CDuKMLXpX9DYzabN2krIdjGExfrjNI4fRnsC+487zmN2nd0z/hOd4O5W12Zr5tL
         eaM4NWKIWsvcgSpjfdY5raZmj6Zd7oi9/TN0qi4Ac/yNIhoV1QDY2vV09xDgSglqI5N+
         tfM8dVVLpsOAPrUP+g0d/tCNU8NGb9IW9j7KSY8H7KZnQq3JoIVBLnPxZYbT+BUJVQ9d
         3t/O0sih8H8BSmJPCvXuv+9BD23JP4a0JLqfRo7g8UIyvSr6kCwcR118UeogkQQ2AvKJ
         NF/evH8CBtXZ7WjHmd4eQV8PFV0XcQDIjZTNgXlgh9PpvFNCmDppVpR/h9tC2OCR3nFq
         uTTg==
X-Forwarded-Encrypted: i=1; AJvYcCUvx9P0/ZNDldnL4uXC8v8KcOsfTToL3X+QSl5/rBJ2WuSEhYXKOObSv3ixdF+08wFn12FxT5y/5T4dFA==@vger.kernel.org, AJvYcCV99cQ+CjKWmsyUuR/cfvKJPPMpsxuPUnL7rNAkNkkV/1ULC3ytA4GRUA06JAfhYT9z5mat3bh5+O+Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5YTTI+kfcD+zCS/WPRj7a/94mftylOneMv2vhKOvKIH2TIXZG
	wy85y/s8xuoNpsp4tgcgzC5f+B19IgK8QakVLWu2Ffo0s1kZopKG
X-Gm-Gg: ASbGncv9fSXuRWoF4TtSWc+hTtTamggKB1w/hgZWfYbcKkCD3tARUFQ9uam0tslwRHc
	SH0fV1702SmCf+hMgVdbBAgwiIUr9ozm3o4T5Z98EX/Cs1R+rPcUI+GKYNHqt3kKKPlkCbuAF2M
	2YQqKRR3bqvRE0R8LjkdtFm0fnaJ4yVoFcIHMMrHTWwnvV9H4yifTHCsC9GSwkt4CyulvYd6LKg
	I7pqEvKlba/9wlj0SNnteyDiPtgzqhBVU1vlU9BGGbLXdTOY9wJWtSTL0pn+Bd7TmbkYR0OLhBO
	izRBijgkXNxrrIKqJRbvfv7MWXI8ZdJAnckjWXwd
X-Google-Smtp-Source: AGHT+IEesJ9GVcp+VUrILhjU6mxoodHH28y+Q91Ulex9zVM00flzkVAI6ALq0/8U6IQWV9JQQM9KrQ==
X-Received: by 2002:a17:906:f59e:b0:a99:a6e0:fa0b with SMTP id a640c23a62f3a-ab38b24bd88mr294164166b.5.1737292448197;
        Sun, 19 Jan 2025 05:14:08 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384d27117sm481155966b.75.2025.01.19.05.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 05:14:07 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v5 06/12] HID: pidff: Add MISSING_DEVICE_CONTROL quirk
Date: Sun, 19 Jan 2025 14:12:57 +0100
Message-ID: <20250119131356.1006582-7-tomasz.pakula.oficjalny@gmail.com>
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

With this quirk, a PID device isn't required to have
the PID_DEVICE_CONTROL field available.

Some devices like VRS Direct Force Pro do not implement PID_DEVICE_CONTROL
in their descriptors while still having the necessary control fields like
PID_ENABLE_ACTUATORS or PID_RESET.

Fixes initialization of VRS Direct Force Pro

Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 3 ++-
 include/linux/hid.h            | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index d792a07b5a5d..53b16a4e54a6 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -1000,7 +1000,8 @@ static int pidff_find_special_fields(struct pidff_device *pidff)
 					 0x57, 0);
 	pidff->device_control =
 		pidff_find_special_field(pidff->reports[PID_DEVICE_CONTROL],
-					 0x96, 1);
+			0x96, pidff->quirks & HID_PIDFF_QUIRK_MISSING_DEVICE_CONTROL ? 0 : 1);
+
 	pidff->block_load_status =
 		pidff_find_special_field(pidff->reports[PID_BLOCK_LOAD],
 					 0x8b, 1);
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 29f0a91f505f..2af9db0296d1 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1228,8 +1228,9 @@ int hid_pidff_init(struct hid_device *hid);
 #endif
 
 /* HID PIDFF quirks */
-#define HID_PIDFF_QUIRK_MISSING_DELAY	BIT(0)
-#define HID_PIDFF_QUIRK_MISSING_PBO	BIT(1)
+#define HID_PIDFF_QUIRK_MISSING_DELAY		BIT(0)
+#define HID_PIDFF_QUIRK_MISSING_PBO		BIT(1)
+#define HID_PIDFF_QUIRK_MISSING_DEVICE_CONTROL	BIT(2)
 
 #define dbg_hid(fmt, ...) pr_debug("%s: " fmt, __FILE__, ##__VA_ARGS__)
 
-- 
2.48.1


