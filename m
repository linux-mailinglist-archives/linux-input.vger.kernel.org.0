Return-Path: <linux-input+bounces-9611-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C72ABA225B7
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 22:30:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B1DF167281
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 21:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96FD1E4929;
	Wed, 29 Jan 2025 21:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dylGTqNs"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED4C1E376E;
	Wed, 29 Jan 2025 21:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738186192; cv=none; b=QsBBeFPOv+N011wZozsIjWZC8t/awFeKqhqAQXE0pJVsT3d1OVUJoKMHidtUqWOWeObKVoWO+CyVRsp4+VqQ9ludg6AiZLdYHaPX8TtKmDIiaqSD3bVVFpXEjulYCx06+4+5lDWXsNVh+lSThHt5tm+jGcMHYsl++Y2aFMkMNUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738186192; c=relaxed/simple;
	bh=7OK3kSXT8WXbIC+h689s0p7Orl1J24mMYIxRhrQmLSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZX09s45WqatPSOZhhBDmcjzOqu7Kii98nftT7HFc1dI6IDfVFmBYD68X+3/Ng1APPzs6RzXMdv4iVcesa/XvwHK3HXQcSfbM+65TyZKJ3tWMPpdGghYIe6B09x+xX1ecE0YSz+48xGMyASkQBNYNZcYATCI01xys+/vy/tKRon0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dylGTqNs; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-543e070cda6so14307e87.0;
        Wed, 29 Jan 2025 13:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738186189; x=1738790989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAox7vgqHfqQyvbiR5yl/AP6DguG21dSsc6sjrWJibM=;
        b=dylGTqNsGk7yT+o0vqqU0TT/4YR4rXfXRYywyJDFGmidM2sIJ3SIhGQFQuo9Y+p37d
         TDfC7tW1qwV4sbW1a8TEju0DOkCIRrAH5R9LCQt6fBd52Ya0Hg5DDdfdOQji19Sop9Wd
         0VXUXb+1I7JkAqeSSQpGDL0uYod0/yvx56xK7C2Y2xnCpk7PN99Ta+Q2OVq/dJWbg1Y1
         TF1KTDozhFlg1gxERNbPZG0kyjllfVDAhYIzKIgq2Pvsmpkm7F16HGRko87X0yVZeAa/
         3kO5/L2hv3BWb1Xp7gywAKUwnejkJ3ILWwapBIfXaDdvehsk2SMHaCEIqVeVtMyNyuyk
         95sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738186189; x=1738790989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAox7vgqHfqQyvbiR5yl/AP6DguG21dSsc6sjrWJibM=;
        b=LbMaay9UZh2WG57VxBJLijdoi3ZpE+oVq4mz03C2qmVukf3Xg5K1iXeFCYckqtccQa
         CkPqdQZVLNu0NhX7dW/9pQHNxayxcS7TyhusSt++IYjeS0zOsbLh9HBC1+bnynsXGo04
         PvNVa+9boOU+pm/SrfaRDiBVFC8wb0FF6zFhQVoevHb6DAnLuUjxdwyd5m7v/3AEEgqi
         P2Cvkk6P3gJufjDPbqqxZ/qLhM1hYJG05c7zr3tqn/fSNnGSCkPkj0iMzmBLy7yqBzRS
         dYPx5a1en8/l2PwEPf8hvdwSDhRNBjIytOyWnIWXc69m/2novovbwZgkrn2TPh3OhOI+
         kLvw==
X-Forwarded-Encrypted: i=1; AJvYcCUZf9XGPk/q7Wy/L718TNAILG69iR1j6O2fRm2Jz6DwQI6dLE+vNGZI+G4Hwe30xK3vhjLHcQVv4xX2hw==@vger.kernel.org, AJvYcCWgjLLam8e3lfQQstSsdXMvHHOS010eT7NdkVN+mPIRKs1suLtYKBFH6skD/Q6Wt/H8X76m/5vc6N0P@vger.kernel.org
X-Gm-Message-State: AOJu0YyK/dV9eLgiYenjW4uIVLS8RwkNYWKlv0tiux4DvnDkgRx3apFD
	LWqfBLpzqFwUE8VBxGRqq/tufOAjNjpHxjwQaERwPLoPyx5IOaUbJdk3y6WE
X-Gm-Gg: ASbGncuvo+fHPTU6qIKLSND+K+1ob5Hag0SXiwNuRAgkKU0mrzeN/D5S7AF8T/4tVof
	Bz7VV6OBqqArHA3Gl+dZA1pxY2b36efcg0ucv1BbtsWcUAPUvGgc2Y7kRJqxOhTw8Oi0iApGiYu
	qAAJKkdj4cq/XAQjW2JVOgTdy9bGIwIFTr2lxx01W49188dokthpet9XAjYPRFIiCc+vHlOuOZv
	PmLxaLBldprp6CgXHaWRyUqPDLIMHcQPjjAm5y7NAZisGPOKJkXcT6IeZ7eaSv4K/sSF5DAsEyW
	bcTalRnrNbgWP6xuhwb3d3Z63tAqZMJO4ESfCBJNeZcBK8HHpGBUXDLkBCWTXA==
X-Google-Smtp-Source: AGHT+IGc12f9Zx1YQczPYLPJCN29rZm47XftBVaGtqotFS2QFk7/6bb8Jmun/0azbZtyW4QV+LuQ4g==
X-Received: by 2002:a05:6512:15a5:b0:540:353a:a87b with SMTP id 2adb3069b0e04-543ea404074mr73968e87.7.1738186189015;
        Wed, 29 Jan 2025 13:29:49 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c83799c0sm2100778e87.190.2025.01.29.13.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 13:29:48 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v8 06/21] HID: pidff: Add PERMISSIVE_CONTROL quirk
Date: Wed, 29 Jan 2025 22:29:20 +0100
Message-ID: <20250129212935.780998-7-tomasz.pakula.oficjalny@gmail.com>
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
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
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


