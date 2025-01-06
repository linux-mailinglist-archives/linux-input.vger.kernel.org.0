Return-Path: <linux-input+bounces-8979-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8041EA032F4
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 23:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1866A188482C
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 22:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F2A1DAC95;
	Mon,  6 Jan 2025 22:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LPIWAguc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508C41E0DC3
	for <linux-input@vger.kernel.org>; Mon,  6 Jan 2025 22:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736204103; cv=none; b=dt7yoYZVpcXDPgHcviMlxv2IeGMzJ6p/zTgctktA1R8alWgQQ+Cn4z6z7yDzIvklFZnZSI4yJWZYUXFM73AcARsHKLf37Q/cifXimb6lwFH+ORe+T6RPkr563VMlEWkWpe66zImYK0Q+d2Fp0k03rRznFNcwK5TeP2Bhw/Zc9YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736204103; c=relaxed/simple;
	bh=1Ese8EMl34HOd+M629dtCkoZAKm9OfX8Wib/r97aCZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L6Pd1auha8UDulMvTJW0dyBHEr0XCSOTG6D7D8wa9CSmioYhZ0iNjiNYZLEavEZdYu8lazm3c/9vg2sTH259+pCKle23fbR6OywM4oXkwISZ2JwuzebT/O3PFqgXBZ2cvFUDZwQ5JTGvPTAbcbzF77NtvBtZfyWDnpLWdalERGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LPIWAguc; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso99332115e9.3
        for <linux-input@vger.kernel.org>; Mon, 06 Jan 2025 14:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736204099; x=1736808899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6iNoALGEjdQHmdTVB6T0aNRr90vJ37917pkhjH+wEmk=;
        b=LPIWAguc6hWBvfKWXU6T9xmPmsDCWm43BYgEyifWq3bo8iNtfEhTIzhZIi7thVoB4b
         38UqCP4dLz+kCdsuak/QuoL3FxwRTeBikwoGUYJimq3XalE+WXNnQBBBFQMhsJW5J7by
         1LGWEBDQIHCemNyxNsZDC4iF3DVkqfiMKlWNRuCrWfnuyVBqXHDVRjVlnpclFolLn97x
         SFsrodMxU62jt+oyHe3SzB4wl39yDjUBdwMvcfUPlhodvvW8Dmtg9NLm+gbQhQHa7uJo
         iWU617VjSvx6pxQh3AhLJuHWptfEkcjs61JaZg7HxEDIygkKPOHSidJWgz6sX46OD6cJ
         X+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736204099; x=1736808899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6iNoALGEjdQHmdTVB6T0aNRr90vJ37917pkhjH+wEmk=;
        b=mng5gIP3X5HSdO+TgWrui4sYMZWO34Y0+A/7QTbiQNfiikGrXckCKFLC44wbQxaDJP
         nAybmZ26Fp3C5DEvjrm7Okr6BUJ745aaj+ee420zLafJ9j3nT1Q30Zlryf0lH2OCFHYx
         n5ZlKxkWXh5+5WWEs4V5QmUhxxMcdixsuhQ96wKo+tVCTSMVjA59+CQzLGjrGCm/4TPA
         xZZ49cit9vfvYzW8oS3k/WRhKi2ZcHdkO5vnLU/gzwYM0X24SvugoLuUU+eyg9Q64bTh
         RIjmdV9/Oxgc0EvdKEQvjQIm/6caYzqiuTY1rubVlsmxLT1zuf+lB3+UItmAzIBZB3Wi
         CnMw==
X-Gm-Message-State: AOJu0YwbDk5+thOgqJSQgxyKkcQ0GHBGA3uRGVYSFAaYEs5O4GLw6ysn
	S63cmOi69wmvFvIEA6ZiFmNnTP5fJVItg/9j+ZioPj7ymqKhoF2HBBOrbgLYYZmJZw==
X-Gm-Gg: ASbGncv2z6kPR9OMhCe3Jy9UGL1xAvXpNmZLqknGl3/PbH9NsjWRe3MrIy6sGjzoV04
	iZEJ34GlaeLug9alwMqMNWYMg8BXEb4jYAVZ1lf8KhDQKThSVnLtPCbeQH5SI75RwGNKL47vspJ
	E1TjsPIGkkH1cOkhD0QoeaZXY58jX3jMJSRVX4sSOASRKlxa6bFqL2i2ACZvg4RFwnEOstlfMJz
	lODjjjyS3Wc7OpJsJIZsvDsfjpOZGhQeM4f0OrM98NLSvp6/urq95b77WgES8omrVZf
X-Google-Smtp-Source: AGHT+IEM6h4EJcrbr8VZ7vJrS5hVGGHy00u4gGTupm3zYX58uaxvfvy2V+hAFv88FK/JAhk0cyJ6kw==
X-Received: by 2002:a05:600c:548e:b0:431:5e3c:2ff0 with SMTP id 5b1f17b1804b1-436686431a0mr474435875e9.8.1736204099478;
        Mon, 06 Jan 2025 14:54:59 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b48c:8600:daac:3967:7eaf:8e73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea387sm586000725e9.6.2025.01.06.14.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 14:54:58 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Thijs Reus <thijs.reus@trimplement.com>,
	Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 06/10] Input: xpad - added Turtle Beach Recon support
Date: Mon,  6 Jan 2025 23:54:33 +0100
Message-ID: <20250106225437.211312-7-rojtberg@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250106225437.211312-1-rojtberg@gmail.com>
References: <20250106225437.211312-1-rojtberg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thijs Reus <thijs.reus@trimplement.com>

from the diff from https://www.spinics.net/lists/linux-input/msg75512.html

Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 1cd946b26451..237704b3fab5 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -176,6 +176,7 @@ static const struct xpad_device {
 	{ 0x06a3, 0x0200, "Saitek Racing Wheel", 0, XTYPE_XBOX },
 	{ 0x06a3, 0x0201, "Saitek Adrenalin", 0, XTYPE_XBOX },
 	{ 0x06a3, 0xf51a, "Saitek P3600", 0, XTYPE_XBOX360 },
+	{ 0x0738, 0x4503, "Mad Catz Racing Wheel", 0, XTYPE_XBOXONE },
 	{ 0x0738, 0x4506, "Mad Catz 4506 Wireless Controller", 0, XTYPE_XBOX },
 	{ 0x0738, 0x4516, "Mad Catz Control Pad", 0, XTYPE_XBOX },
 	{ 0x0738, 0x4520, "Mad Catz Control Pad Pro", 0, XTYPE_XBOX },
@@ -283,6 +284,7 @@ static const struct xpad_device {
 	{ 0x102c, 0xff0c, "Joytech Wireless Advanced Controller", 0, XTYPE_XBOX },
 	{ 0x1038, 0x1430, "SteelSeries Stratus Duo", 0, XTYPE_XBOX360 },
 	{ 0x1038, 0x1431, "SteelSeries Stratus Duo", 0, XTYPE_XBOX360 },
+	{ 0x10f5, 0x7005, "Turtle Beach Recon Controller", 0, XTYPE_XBOXONE },
 	{ 0x11c9, 0x55f0, "Nacon GC-100XF", 0, XTYPE_XBOX360 },
 	{ 0x11ff, 0x0511, "PXN V900", 0, XTYPE_XBOX360 },
 	{ 0x1209, 0x2882, "Ardwiino Controller", 0, XTYPE_XBOX360 },
@@ -366,6 +368,7 @@ static const struct xpad_device {
 	{ 0x24c6, 0x5510, "Hori Fighting Commander ONE (Xbox 360/PC Mode)", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x24c6, 0x551a, "PowerA FUSION Pro Controller", 0, XTYPE_XBOXONE },
 	{ 0x24c6, 0x561a, "PowerA FUSION Controller", 0, XTYPE_XBOXONE },
+	{ 0x24c6, 0x581a, "ThrustMaster XB1 Classic Controller", 0, XTYPE_XBOXONE },
 	{ 0x24c6, 0x5b00, "ThrustMaster Ferrari 458 Racing Wheel", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5b02, "Thrustmaster, Inc. GPX Controller", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5b03, "Thrustmaster Ferrari 458 Racing Wheel", 0, XTYPE_XBOX360 },
-- 
2.43.0


