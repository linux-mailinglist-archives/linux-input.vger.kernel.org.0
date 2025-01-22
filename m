Return-Path: <linux-input+bounces-9482-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CD9A19A84
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2025 22:49:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA83A16579A
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2025 21:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B1F71C5D4C;
	Wed, 22 Jan 2025 21:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+BFOKZP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CD11C54A5
	for <linux-input@vger.kernel.org>; Wed, 22 Jan 2025 21:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737582540; cv=none; b=t3cY1uojaVdG1Ym94Mm2lrAuUnmIr8Lbfimv371u2vnlzgRlPJv0FRR7UG3141Jssa8yr3ccd1y7KlSdjYsSkgBQInUvS4HryfI4mAa+DD/IKT/2vJb5NsSUmPLhxA7TWrDn8+jVnHxMYdmMyz5AdLUeuOFy5nbMi4FrTsjCeAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737582540; c=relaxed/simple;
	bh=0nmjl3piNZ0SyRy19rTF9B0Bp4JduOMs0GtDIxBjoIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iZ1rgBpUadPs6OS0Je6ospa8JaRIEwaMQZ+DaUN+Zaj97RGuS3t9GMSC0zymcFJm93jQtjOUtCGMPJ0qTsXp2gaWlR6P3s3P+QVKr8fRXGqJ4Mk2ckgVGVmTOvc3CiDx1cIoNYegtP3Z1n4q6WxZxIiluxDHzi7QMcVZ93YyJ/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e+BFOKZP; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21a0374a1fcso391455ad.2
        for <linux-input@vger.kernel.org>; Wed, 22 Jan 2025 13:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737582538; x=1738187338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tS9jIPXyaZ7MKpk1glePTwAO4RaWO/qqEB16kh3l0uA=;
        b=e+BFOKZPhTIa2XTSlxVTAjghRqlBkdmozVs7SahY0oBmtbLc2umK38JeHVMDsWxYwN
         WcNZXFWQnVRxSdKaXC8cB7xH9mm523ptIGR6O5N5fXu+dHRUSyGL52VDn7vsR1sIpQ9G
         PWtu2UaH2vM6caS6iCHa7J5yB7+SVetx18T71MmXqFZ2GwdZnZ1xUCNXfDCSopnEv86o
         cqGnw0daKwRElG/LrEdh2h9SVWeSUHllWl+ne9NQEUXVkTH6GQB2kAluW6Qhl8221APS
         Ty4c1XL+CrUJPk9vQaSVz9EC/26CdGOsNPzCQZhxX45Abe65ajGObMoz5KLMeP1OdEp5
         onGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737582538; x=1738187338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tS9jIPXyaZ7MKpk1glePTwAO4RaWO/qqEB16kh3l0uA=;
        b=al41knRqnODAgRaIyM3m2dNZm1E4KOiy9AwGLDg7uCike471QLVr1kRYTU14DyUKzs
         bD6WkmDwhs7pRRo3CARygiBrnaDG0Q7rkLxQjVIkkPQ3Uf6+h3xlSanofbxMTrB70iwn
         Xc1tJXoxwlSVxdG9HKvOS3ClsU8DvybMTpfy38pvQPhWVdZSu/1dlAo+U/ET3bQeRadF
         +b8jlD5vhNVi/loAZKxR218ABZhX0qfr3mmRRSYOXjE+jI8j6SIhMchneS0ZeYPl46s1
         h8PGOMU5ovYuBHpC8FegXzekOapkY9yfAOtsC5ayiCHV3rGWoMLVrIUcGlwFbPVAxh3Q
         A+LQ==
X-Gm-Message-State: AOJu0YzSxt8Mz7NIDg/CvkeqlrI8v1/R4X448Qk0Hu9o3ER1EqUSqiHr
	CbQ2R7ssrJbiPPQqKqky/h2k0fDjlGDZD9G+EvEpEaMaQB2OlRuf+cAm9QNd
X-Gm-Gg: ASbGncsE37p5i7VoYLG8oAqXceS3o9VzHpjQ5RpiNhzV2gSU0S9Uh/TCuY5tCQh3BPT
	PkKOhjKIzDPA2usPwJ3xS6GLlPKNVvx99/9vTo5O81UUCOFsURdyVoMgpzi0ix6HaJCQeJS6nOM
	V6q6Yw+sHXnbVLUVZWMyCt3PaOBWbrhWOsi+ExHVHpHqq2iVifLJfH9g8gLa0mUDBeJA3kObvfA
	nPYBoTCu+spwlqyD4yNo2Xv3iL6eCHR3XKO+Sju7By/yfPUF0F2Xut2rS4GDiSlGZ8hfAQRWso=
X-Google-Smtp-Source: AGHT+IE+T0mcgA3oqpaAithZ10ld7xjH0Laug6lhQYvWg2lWGljnFl1Ev7B3Qgxun7haop8JRV5UrQ==
X-Received: by 2002:a17:903:2412:b0:216:42fd:79d8 with SMTP id d9443c01a7336-21c3563c7b2mr136769575ad.12.1737582537825;
        Wed, 22 Jan 2025 13:48:57 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:bba6:4b7d::1f4b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcc3232c0sm11159085a12.28.2025.01.22.13.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 13:48:57 -0800 (PST)
From: Nilton Perim Neto <niltonperimneto@gmail.com>
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Nilton Perim Neto <niltonperimneto@gmail.com>
Subject: [PATCH] Input: xpad - three devices added
Date: Wed, 22 Jan 2025 18:47:07 -0300
Message-ID: <20250122214814.102311-2-niltonperimneto@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added to the xpad driver the following controllers:
8BitDo SN30 Pro, Hyperkin X91 and Gamesir G7 SE
Also changed the VIDs to better describe them

Signed-off-by: Nilton Perim Neto <niltonperimneto@gmail.com>
---
 drivers/input/joystick/xpad.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index ff9bc87f2f70..58aff8015645 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -374,8 +374,10 @@ static const struct xpad_device {
 	{ 0x294b, 0x3404, "Snakebyte GAMEPAD RGB X", 0, XTYPE_XBOXONE },
 	{ 0x2dc8, 0x2000, "8BitDo Pro 2 Wired Controller fox Xbox", 0, XTYPE_XBOXONE },
 	{ 0x2dc8, 0x3106, "8BitDo Pro 2 Wired Controller", 0, XTYPE_XBOX360 },
+	{ 0x2dc8, 0x6001, "8BitDo SN30 Pro", 0, XTYPE_XBOX360 },
 	{ 0x2dc8, 0x310a, "8BitDo Ultimate 2C Wireless Controller", 0, XTYPE_XBOX360 },
 	{ 0x2e24, 0x0652, "Hyperkin Duke X-Box One pad", 0, XTYPE_XBOXONE },
+	{ 0x2e24, 0x1688, "Hyperkin X91 X-Box One pad", 0, XTYPE_XBOXONE },
 	{ 0x31e3, 0x1100, "Wooting One", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1200, "Wooting Two", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1210, "Wooting Lekker", 0, XTYPE_XBOX360 },
@@ -384,6 +386,7 @@ static const struct xpad_device {
 	{ 0x31e3, 0x1310, "Wooting 60HE (ARM)", 0, XTYPE_XBOX360 },
 	{ 0x3285, 0x0607, "Nacon GC-100", 0, XTYPE_XBOX360 },
 	{ 0x3537, 0x1004, "GameSir T4 Kaleid", 0, XTYPE_XBOX360 },
+	{ 0x3537, 0x1010, "GameSir G7 SE", 0, XTYPE_XBOXONE },
 	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
 	{ 0xffff, 0xffff, "Chinese-made Xbox Controller", 0, XTYPE_XBOX },
 	{ 0x0000, 0x0000, "Generic X-Box pad", 0, XTYPE_UNKNOWN }
@@ -522,12 +525,12 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOXONE_VENDOR(0x24c6),		/* PowerA controllers */
 	XPAD_XBOX360_VENDOR(0x2563),		/* OneXPlayer Gamepad */
 	XPAD_XBOX360_VENDOR(0x260d),		/* Dareu H101 */
-       XPAD_XBOXONE_VENDOR(0x294b),            /* Snakebyte */
+	XPAD_XBOXONE_VENDOR(0x294b),            /* Snakebyte */
 	XPAD_XBOX360_VENDOR(0x2c22),		/* Qanba Controllers */
-	XPAD_XBOX360_VENDOR(0x2dc8),            /* 8BitDo Pro 2 Wired Controller */
-	XPAD_XBOXONE_VENDOR(0x2dc8),		/* 8BitDo Pro 2 Wired Controller for Xbox */
-	XPAD_XBOXONE_VENDOR(0x2e24),		/* Hyperkin Duke Xbox One pad */
-	XPAD_XBOX360_VENDOR(0x2f24),		/* GameSir controllers */
+	XPAD_XBOX360_VENDOR(0x2dc8),            /* 8BitDo Controllers */
+	XPAD_XBOXONE_VENDOR(0x2dc8),		/* 8BitDo Controllers */
+	XPAD_XBOXONE_VENDOR(0x2e24),		/* Hyperkin Controllers */
+	XPAD_XBOX360_VENDOR(0x2f24),		/* GameSir Controllers */
 	XPAD_XBOX360_VENDOR(0x31e3),		/* Wooting Keyboards */
 	XPAD_XBOX360_VENDOR(0x3285),		/* Nacon GC-100 */
 	XPAD_XBOX360_VENDOR(0x3537),		/* GameSir Controllers */

-- 
2.48.1



