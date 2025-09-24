Return-Path: <linux-input+bounces-15091-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A064B9C37D
	for <lists+linux-input@lfdr.de>; Wed, 24 Sep 2025 22:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 156D84C398D
	for <lists+linux-input@lfdr.de>; Wed, 24 Sep 2025 20:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A246D27EFE9;
	Wed, 24 Sep 2025 20:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mi1ntqAV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CAD274670
	for <linux-input@vger.kernel.org>; Wed, 24 Sep 2025 20:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758747581; cv=none; b=OizDk9ZqVmlekNq0MMP9/tABTR/7sJ3EOA6y+QgaAOSYpTDkunjsvot2IMECdWsB0fv3SzbAr5sn4zPMZ8hm5mmy2Pvg08hnXqzqDxQKtI7SJ8JUvn571r2ECmEvlVAe5mz0SROS5tjaH3gXw7KA9r1qXRMAJgozVNYYQL0Tp7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758747581; c=relaxed/simple;
	bh=WWUhycMgvhzyeaLAv3HRCxsWk3YeZlwvEpXzRathUBg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JcHibW8ieqjGgglrDczX1GrdWNJmZ9L9vK/7pwZ8gsU5L8axmgqbwPjm29+nea6NFFO0YmaRbjUJfTGFYNDhYbep4V4BqJVaUDKASSvPYEeBYFNtEd/FfoYaNoaWsMp7JqX8fpFWxm+X6IGaJJG93X/zfJb7vVmsMypg3kTuH94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mi1ntqAV; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b555b0fb839so203412a12.3
        for <linux-input@vger.kernel.org>; Wed, 24 Sep 2025 13:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758747579; x=1759352379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bRuDgtKnLQenDF5rrcxOy2nEN1e01GeSQLdOvaR9vtc=;
        b=Mi1ntqAVuTfkVvNFGerOBgft6kEpumvmgdr53jBOh7CtJQVqwCu9jF4b8oz1nHWbP1
         wvlu7l3Y+kKnT+L+nNMpxRXnzghtyRdWpTtJdniZ1j/yHqKKHN4L+Pg14TUU1W/KY4rm
         SeSGrN0Zoqtp0xwkSf0AulOhJU1rqEp4564jmxXbaqodbuWpjyKFZqLEmTBW67igJJkq
         3lw+jJy4+ZMwX3BEFdHImXFpwRD5zhS1FdKK/V4CgxSKciFPOBy3ASOKlAj3jcAEvMgE
         UxBZiqX6TzaZLcriE3g4YZTtwnpSveut+pASlhWkZfO1zVMby1aOw/xQYwzkmvRTCzX9
         ezQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758747579; x=1759352379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bRuDgtKnLQenDF5rrcxOy2nEN1e01GeSQLdOvaR9vtc=;
        b=k5NqCYnoye5TvYKlpm9vJHydWLQ90/d8axzkiOwpQAPIIU5uSMviM4WrK46svQoBxW
         7EoxAGIwkGYw+x9wuDmZ1kbTdZKb1EdEwlJiSrjhnfZoWo9VJfi7b80bHCtmWJD26tIG
         LtZiqmVKoi9b+JaMx+MnHJir317TenvJ1A8Hym8tjXbYtLmSNV5+6Z7+89sUU8UFJDyW
         ccEAzfpIi9PuM/eL0s4MjmQWUzQTIlq9B3tXcYAWiMFS4smPlIKNoWydeNCW6KESsihr
         T1252pg6E4DeKyffvq0ZaUvBl1AkUA1LjlkEXA+bHgIXj5+oJUpD/xegu/wuxfWTx+ay
         Qybw==
X-Forwarded-Encrypted: i=1; AJvYcCUHZrKVwc7u8eBfh4VZi20754SzXZN/uxQOfuEbFGTNEaJEKt4NKbsR0BANp8N1NDOIwVSw28y2cCaL9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YziFOponx+ueCT+gvUcOol1Wi+daADtJ5JGY/Q2o4jq9JQ01QHm
	IciG4RkeCrA3qI81q9Z67lX3fqYNknj9UE+4v923IFZkFo5gt0y1Ackt
X-Gm-Gg: ASbGncsv7gDM0/7UrZVEcjOQPG3G5yI8d9J/F/RvbIAasagvBI5jWJLmAMqouMt5tEG
	mVpWztleE/8B/+HVLLzAgU7U8y8QJya5bTm7+Tkboc3S7nztx4ooxAkFe14jtgllUSp/qR0gBPR
	rBRVLKXIO0t52384cHR4G7Vbkny7DMs4k4iXQHcQ9sHrPsxJopjDrpyvYmHCLv/QaRoMgwpPCTt
	4gKRwnCHNX2BLMmMki00Pj9T2mN9DY1Pqz7gIszkntX7Bd38nCs40Q4pKsBetlaTsClgX/DrX4A
	t/cxGXUx67o49IcqQkBqkCDIBReDNYdIGYERodn4iJwPkYjmZJHvFutXmPlo2widlFFnQVE6JFl
	s0fMC6G1a0Yji/7w+sIItX+g2P4QBvzsE0PmrhBcN7tNxy81IRpZjfY6LWRCF+Fu0twSHkU9jKS
	yw56DNW2qTbizfOCvpIuRN9ro=
X-Google-Smtp-Source: AGHT+IFTfcwzlqAQ3hKxw5FC7Jv4ja7YwXZXX4kygX+5Zsmi5Hhkd3KRdxGLAj7nmPNA59hYiV1jxw==
X-Received: by 2002:a17:903:3c26:b0:264:ede2:683d with SMTP id d9443c01a7336-27ed4adb732mr10341995ad.56.1758747579257;
        Wed, 24 Sep 2025 13:59:39 -0700 (PDT)
Received: from sanjays-pc.govzhome.govindz.co.nz ([27.252.49.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341bd8fa0asm3375248a91.3.2025.09.24.13.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 13:59:38 -0700 (PDT)
From: Sanjay Govind <sanjay.govind9@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Sanjay Govind <sanjay.govind9@gmail.com>
Subject: [PATCH] Input: xpad - Add support for CRKD LP Guitars
Date: Thu, 25 Sep 2025 08:58:38 +1200
Message-ID: <20250924205912.29793-1-sanjay.govind9@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds support for CRKD LP Guitar Controllers

Signed-off-by: Sanjay Govind <sanjay.govind9@gmail.com>
---
 drivers/input/joystick/xpad.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index d72e89c25e50..33b0ad041247 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -133,6 +133,8 @@ static const struct xpad_device {
 } xpad_device[] = {
 	/* Please keep this list sorted by vendor and product ID. */
 	{ 0x0079, 0x18d4, "GPD Win 2 X-Box Controller", 0, XTYPE_XBOX360 },
+	{ 0x0351, 0x1000, "CRKD LP Blueberry Burst Pro Edition (Xbox)", 0, XTYPE_XBOX360 },
+	{ 0x0351, 0x2000, "CRKD LP Black Tribal Edition (Xbox) ", 0, XTYPE_XBOX360 },
 	{ 0x03eb, 0xff01, "Wooting One (Legacy)", 0, XTYPE_XBOX360 },
 	{ 0x03eb, 0xff02, "Wooting Two (Legacy)", 0, XTYPE_XBOX360 },
 	{ 0x03f0, 0x038D, "HyperX Clutch", 0, XTYPE_XBOX360 },			/* wired */
@@ -518,6 +520,7 @@ static const struct usb_device_id xpad_table[] = {
 	 */
 	{ USB_INTERFACE_INFO('X', 'B', 0) },	/* Xbox USB-IF not-approved class */
 	XPAD_XBOX360_VENDOR(0x0079),		/* GPD Win 2 controller */
+	XPAD_XBOX360_VENDOR(0x0351),		/* CRKD Controllers */
 	XPAD_XBOX360_VENDOR(0x03eb),		/* Wooting Keyboards (Legacy) */
 	XPAD_XBOX360_VENDOR(0x03f0),		/* HP HyperX Xbox 360 controllers */
 	XPAD_XBOXONE_VENDOR(0x03f0),		/* HP HyperX Xbox One controllers */
-- 
2.51.0


