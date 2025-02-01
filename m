Return-Path: <linux-input+bounces-9648-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9DCA2489D
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 12:39:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8BE8165309
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 11:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 293F4191F72;
	Sat,  1 Feb 2025 11:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZMDDR9AL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5893F17CA12;
	Sat,  1 Feb 2025 11:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738409960; cv=none; b=iYDwy+n7h99uFMiT6TkfbSlhIjpVxbXAI7/zz+yR7irYSVTq5q4fdMFO/PoUkt5IW2V31dOZ9cFnHU+VFXLhGC+PFsXXuwnFhbZ5iQL700V2c86+QV6Wdjcoy1Q6LfCfH9Fic2HUa/izh1HsWzKe9edzBrtc6xu/kEvWfLuR09M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738409960; c=relaxed/simple;
	bh=b5AWzeHI8d8dMQr8TmNVU+eM332U5LBwkIMgI341bWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n7XIEojpEnQeYVNYPLPOXX2VqA/kCfgMR0gipcntDuQm9IQf+yorUJBstluzeEMc+VHV8yAY4MhYp3yewzr6IRYKYySBzB0dFqMBAIJO8BaJlDmV9HEyFU/uYN5R7Idd1LHeB4QVT2HNj0dY7YqQN64GgEwuIwclSAyM1mziynU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZMDDR9AL; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d3ea2a5a9fso578452a12.2;
        Sat, 01 Feb 2025 03:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738409955; x=1739014755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6PwbBbS6M7koMjDVRjKrgiU6XmFc9klIKPaT4H2PlU=;
        b=ZMDDR9ALRzdi/zWTlZZhQSuyq9XypnbrneKf+DSWjIDo3IJ0D7APNc3qNibAW5e9Tf
         8EPH/hXPTIv9fmc17sQJmWAREV4Fu5tdi9KzvEBklRK1Kek1XivBpz+yVt794NEt0n8j
         LwwvjsR/RAlryw4sSbCHcQ7dvTPm0TwGih0PRDrnn0MOMLiXGseLX1s4qMVa2CjShjGW
         VDdMm9mH5wkpRn7t3wZcqGfQkGWxt/NtJ+syHxcR7+O/LejhDODMkq9+Jrdxy8gXa/ZO
         WfSk96BWrd/kpnd8kZX3QqezNbuccVtjHgV5QgRhqEPMzPyH8YEcoax70f0KJKkLb2X4
         PcnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738409955; x=1739014755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P6PwbBbS6M7koMjDVRjKrgiU6XmFc9klIKPaT4H2PlU=;
        b=oT5TJuwSv/YKlF2HPGzyAZaffJ9Bb+rnCigkMO6MzWHUhOdVUU+KGzFOqo8ZAgfjmZ
         ZntAE6tsSMHRy3/7OYjDacE+IIb9QHstnnKhUvimglwE4SqC7BsmsGdtanLEy5fpwKsj
         7b3cVCWs4g6IfGZtMyUIyoqu7AMa+j413afIKk/8jgixkf7qxm4RIJiAQrPKCHsmHeK5
         H2at1lJ41qe7t+BuJJeQQ/fQqXLyGXFBWAuj+2Wd919WHDnbfU0VYHmlD01RsgqTiYti
         szubAT3UMxIFVYTPBiusIs+rcEamu2UtThvuH0t6hoJCjC++WkSSwIKp49n8bMdbK0I8
         4kfQ==
X-Forwarded-Encrypted: i=1; AJvYcCU++PYwlzQlyPo10jgN91uVktNAWnfCESDnRWBERBgqyMf5/N/MkydXHvT6QQuhq2YCdGnbpx0LjYfp8Q==@vger.kernel.org, AJvYcCUrYGMdp8CkqX7iiqcx6frvyZaJLkTy9EDOe/gN4o9xezsQZZDl47aHBaHZVCLwj35X/xiL7Ey2lGB1@vger.kernel.org
X-Gm-Message-State: AOJu0YykHl62PC1JokLc5YOcsE8mPAlVezzuboIfjU87E4NSEt3ZzFM2
	g9txDccTUpaWjRGc+b35vbbAELN+Vi3PtxoXz8UmDLMMJlQfZFUJmMhPng==
X-Gm-Gg: ASbGncvsuL1hnbsQYZGmTGIrKLwTN4Je3zM2Z+FUG8UT61YL7UpLb6+fLRPZtkoaLe0
	hJ6olfyDWQc1OFtmdWo9ier9wntEx4cZSdMeht5sNpQgttiU9m7PkdNWD9OGypJp9GSacOrHXLD
	th7+hvJ6PEVZQDtI8P1dOqJecM1pqsaM0NRKuPKFwzmeC4oF4NMNIv8JZssjL1Pwp86dg8u7NpA
	psbOLThLs5OApvIa1TtKFqBZQiKaYTlNppjSX3G4Vva6FiPpm+uMiIZ0W6vEKgO9CmUonASfCEY
	9AF3LrnH/XB6x4blBYN98wtZoJCoyIseoI6W7g04cadSp6pWLjAEe1tYceSCYA==
X-Google-Smtp-Source: AGHT+IGr8u9CiFp/7aiY/xbsEdbAYiBHBKO0F3vKcruy6eCjtx822JS4OQ6RY4LjclX8zqWUVl0H3A==
X-Received: by 2002:a05:6402:321f:b0:5d9:cde9:2bc6 with SMTP id 4fb4d7f45d1cf-5dc6e944677mr4756183a12.6.1738409955356;
        Sat, 01 Feb 2025 03:39:15 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723e9fa7sm4304577a12.20.2025.02.01.03.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 03:39:14 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v9 06/22] HID: pidff: Add PERMISSIVE_CONTROL quirk
Date: Sat,  1 Feb 2025 12:38:50 +0100
Message-ID: <20250201113906.769162-7-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With this quirk, a PID device isn't required to have a strict
logical_minimum of 1 for the the PID_DEVICE_CONTROL usage page.

Some devices come with weird values in their device descriptors and
this quirk enables their initialization even if the logical minimum
of the DEVICE_CONTROL page is not 1.

Fixes initialization of VRS Direct Force Pro

Changes in v6:
- Change quirk name to better reflect it's intention

Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Reviewed-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
Tested-by: Pablo Cisneros <patchkez@protonmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 3 ++-
 include/linux/hid.h            | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 89a1b6a55c1b..3f429936d537 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -982,7 +982,8 @@ static int pidff_find_special_fields(struct pidff_device *pidff)
 					 0x57, 0);
 	pidff->device_control =
 		pidff_find_special_field(pidff->reports[PID_DEVICE_CONTROL],
-					 0x96, 1);
+			0x96, !(pidff->quirks & HID_PIDFF_QUIRK_PERMISSIVE_CONTROL));
+
 	pidff->block_load_status =
 		pidff_find_special_field(pidff->reports[PID_BLOCK_LOAD],
 					 0x8b, 1);
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 29f0a91f505f..92a484f65a87 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1228,8 +1228,9 @@ int hid_pidff_init(struct hid_device *hid);
 #endif
 
 /* HID PIDFF quirks */
-#define HID_PIDFF_QUIRK_MISSING_DELAY	BIT(0)
-#define HID_PIDFF_QUIRK_MISSING_PBO	BIT(1)
+#define HID_PIDFF_QUIRK_MISSING_DELAY		BIT(0)
+#define HID_PIDFF_QUIRK_MISSING_PBO		BIT(1)
+#define HID_PIDFF_QUIRK_PERMISSIVE_CONTROL	BIT(2)
 
 #define dbg_hid(fmt, ...) pr_debug("%s: " fmt, __FILE__, ##__VA_ARGS__)
 
-- 
2.48.1


