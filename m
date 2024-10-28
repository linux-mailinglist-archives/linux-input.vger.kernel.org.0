Return-Path: <linux-input+bounces-7746-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CA99B37CC
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 18:39:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42A851F2274A
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 17:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A5A1DE8BC;
	Mon, 28 Oct 2024 17:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8dIViFS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0D91DEFFE;
	Mon, 28 Oct 2024 17:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730137164; cv=none; b=F2cReDUz2+rzxqPnL1RzmNWfT6PBzwUaV2uV4PA2TZ6YukwFnRcc5S4F0aW/vgXY5d6PLS3Jp59bzCLDSHsaaOxrAiitOWGV9zb9EjfPj2nfPmJNvgpiFOMwvP6+XJXIXHn1GbtoZCl+Hu3OIRzxbWyuBCxvAmU+rAZNrdbFyDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730137164; c=relaxed/simple;
	bh=ONuuDiYLRjdUk08u6t8h92cYxGhFK3fxHfskWa+DLg4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YjVBMjTmv6t8Vg/RUBNpgQ+NjeNEAUABnkjZQbV/S1WgLu5M+gZ2UZqsm41BMsrlzLVHSpy8Dk3I+MH7W+5+mX9aqhQV4fYbcacfFrqSDW44mf2j3P6UM1vm09IDYwX7CIq4Wo4YbrFg/3YVm6yuFbw9F+zSMq4NP93CfYhggP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8dIViFS; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71e4244fdc6so3234865b3a.0;
        Mon, 28 Oct 2024 10:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730137161; x=1730741961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=52cHL+kkoHexuQnNy/1lv0K/vO+Nk3Hw8bZvy1tjRmc=;
        b=S8dIViFSEXU8I6xbIiYfdSJJIUiQlxerRKRCxHfa4XtSkLbd3c+egJdtNohxaE5bbF
         EoSEsNuiilv0zF4flkNt+XMv2jKULAjr4jO3bgHcAKCU4G9vwQY2p6FKmtTWTTkymZQN
         inabE3lqQjLPsCwRHz9SNjXAKdbIdTuOTnFn4TbUdFyT1JznKC3k5imGyddMDGkbFwpP
         tK/f1Znm8wsdzCANmffuLy6mHo95m7xKrjyrutbghsK8BIS6unHyMMhq5jbsDQBsMREm
         H+5HyKYjNYLrkN5omxoyIM+XnpQsj4BbMFud5k9Oe4ZLGHqarSm30RTiabHDqyhTV0lr
         Kszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730137161; x=1730741961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=52cHL+kkoHexuQnNy/1lv0K/vO+Nk3Hw8bZvy1tjRmc=;
        b=TQXcygby9w/X9OjRJmIXrEkq65t/NwuxmjCIM/sxZ2Zu80ZaPcuOXBEl12L9BGojJy
         Td2feCdUcvSGEpsiG+/vxG6lsd6HuC2mIJDetQWoOE0fK5OAiUKuUCIqpyy4D5FefAlQ
         NqQRgBeYsPWX8bCOV99WAkB4D4F3FEkzTxio364CgMtmdACIEPFn2MtYTjbiwlJO9pCb
         l2wnT6fX/DGVmEKkF7Bxl9eLswZ0dMthFQgJZgbpfeV3dWwWhDyJdllEsaTPCTnszb+W
         JElp6etKh3dLon4kOsotWMBpbeat3i4XW7avBTlFwqAM5d8MjAjmMZJemFbKLyByHtVy
         STCw==
X-Forwarded-Encrypted: i=1; AJvYcCX1u/PYsoG+L7bL3IgaDvbK13zsN7A2q6d8RYgjMIGqvMz11KRlU0e66mvvI2PFoNqzCWpud9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6dgCr3w7lRlqZ/yruQiBsgxVAcCnAjTmewp9vXAYZ2TRlXlTG
	cL33tIv6Hxn5CH0B13xFvBfmPg6yTXGB4beM/8if2uIf31PeozUUJQi9rA==
X-Google-Smtp-Source: AGHT+IHt7NIir7gDJOM7rc6D9fF3NSTV0liYf3gnMw3XzO3e2ts76eWtU9RJPgtXqCL8qx9smkL+9Q==
X-Received: by 2002:a05:6a00:3d55:b0:71e:3b8f:92e with SMTP id d2e1a72fcca58-72062f4bdc7mr13140274b3a.3.1730137160973;
        Mon, 28 Oct 2024 10:39:20 -0700 (PDT)
Received: from localhost.localdomain (75-164-192-68.ptld.qwest.net. [75.164.192.68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a1fbb9sm6009449b3a.158.2024.10.28.10.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 10:39:20 -0700 (PDT)
From: "Gerecke, Jason" <killertofu@gmail.com>
X-Google-Original-From: "Gerecke, Jason" <jason.gerecke@wacom.com>
To: linux-input@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Ping Cheng <pinglinux@gmail.com>,
	Joshua Dickens <Joshua@Joshua-Dickens.com>,
	Erin Skomra <skomra@gmail.com>,
	"Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	stable@vger.kernel.org
Subject: [PATCH] wacom: Interpret tilt data from Intuos Pro BT as signed values
Date: Mon, 28 Oct 2024 10:39:14 -0700
Message-ID: <20241028173914.68311-1-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Gerecke <jason.gerecke@wacom.com>

The tilt data contained in the Bluetooth packets of an Intuos Pro are
supposed to be interpreted as signed values. Simply casting the values
to type `char` is not guaranteed to work since it is implementation-
defined whether it is signed or unsigned. At least one user has noticed
the data being reported incorrectly on their system. To ensure that the
data is interpreted properly, we specifically cast to `signed char`
instead.

Link: https://github.com/linuxwacom/input-wacom/issues/445
Fixes: 4922cd26f03c ("HID: wacom: Support 2nd-gen Intuos Pro's Bluetooth classic interface")
CC: stable@vger.kernel.org # 4.11+
Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
---
 drivers/hid/wacom_wac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 413606bdf476..5a599c90e7a2 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -1353,9 +1353,9 @@ static void wacom_intuos_pro2_bt_pen(struct wacom_wac *wacom)
 					rotation -= 1800;
 
 				input_report_abs(pen_input, ABS_TILT_X,
-						 (char)frame[7]);
+						 (signed char)frame[7]);
 				input_report_abs(pen_input, ABS_TILT_Y,
-						 (char)frame[8]);
+						 (signed char)frame[8]);
 				input_report_abs(pen_input, ABS_Z, rotation);
 				input_report_abs(pen_input, ABS_WHEEL,
 						 get_unaligned_le16(&frame[11]));
-- 
2.47.0


