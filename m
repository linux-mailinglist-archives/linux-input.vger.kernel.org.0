Return-Path: <linux-input+bounces-16399-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D54C4C938EC
	for <lists+linux-input@lfdr.de>; Sat, 29 Nov 2025 08:38:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A872C4E0472
	for <lists+linux-input@lfdr.de>; Sat, 29 Nov 2025 07:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 150EA22B5A3;
	Sat, 29 Nov 2025 07:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6IUsPWC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0501D8E01
	for <linux-input@vger.kernel.org>; Sat, 29 Nov 2025 07:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764401891; cv=none; b=Z/teNgCLrweKeQQqPW2w/rOZPyG8Tk3NoKFGYyY//957duWXdVsjAjE79oM/olZ4ynNgwBUajucRt5BKNGvTM7KCf0rnBGnsaO59grg7Cmy32U1eyhRphLLbif5by5wLBCIlhkMEfrWV/ybI4z4sJ8DmarErI6DKAk3+HjT3lDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764401891; c=relaxed/simple;
	bh=ZnmMhnIMx/8oZJClfY21PtsuntIEhv7Ffu87j8UjY/M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KZvZ22Tc45TvyrQ9dx7LIHVLAvMM36GrSKkVezG3a2R3TreAkz7x1D92ZYLDa5TE5j+f6YOl10dRxqW4I809QG5wpYK/MW3dd4WhTN5zSCtbTvJMiU3h+yRtAdo7oeSOoMjvMUd4njeLcuXxlTNPK0Cg42w6i/DJGXnFHUR9dD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6IUsPWC; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7a9cdf62d31so3327961b3a.3
        for <linux-input@vger.kernel.org>; Fri, 28 Nov 2025 23:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764401888; x=1765006688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0cCkMAzEZ54PhuWFTX9Iqy7PFwpHCux+GQm/nGaIQJo=;
        b=l6IUsPWCSXTi9eOpWNKRiW/MKQ8pRRlxgkjPUMJFrHlLqnqP558QJ+0hqmhVkBv9Xc
         NI6zo6duj8e2u54kdVOOzlQzunXe1GoJxLlxkxuwDUZihDlMA/6mmiqmnEeWuHhWxQNz
         9S9ct4OxpKjzF5KKLTp4RPMSTVztrRd6LftlcKOSY5wJunVpsTZ0PqcgIkvsHYPWRwCs
         aPawQu+wPGGpgcsErBu+0JnSrTLcUKIu/rbMrUTGzJh6kyoxsL+pDBo1Y3nq6gygcUz7
         Hj1hSqub1qSXrGMpVefz25UBNhpzOUGbPkhIh3JNNeiNCn4ZnlJcPXI6HOrdN60Db7R/
         aL5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764401888; x=1765006688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0cCkMAzEZ54PhuWFTX9Iqy7PFwpHCux+GQm/nGaIQJo=;
        b=qepUuAqk4rMRpFp3FhpmVyP+K9EuTksOL7+jEfRv6wh/DwJQ1VFvVD7J7USavtuZFc
         dEzKHAQd1t1kN+2LIvLJ3aqPewKlN9aYSZ3bW6JXH+ze2Q3TxnnVc4xwZ+5Kqdok1Wc3
         Nd+3e5JH1/4xNQgqXNZ2yf38TZKxhrFXGTCDPXutasE+/YCgnKioAs9Vow25wz0k9pO+
         OzgTN4FywoNB5Y/XHA4cfRKsksA3e1YIDjwweNGw+AIRwS9+RxtuQlNwbnNN3rliH9ph
         1cRKLb2t1jly8DZOenGz5JwcXupBJR9N0Dd5/LITEUD6XAr/RDvB4Yg56mJ6VSJveUhR
         +sgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTN4O3qMkkl2+qADabGDqgh0OGbOYJ1Fvys6n9VBkUI2QPJHFoBCkwkynB4lpEq8/nni1cmKzLK4UAhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwP3NwqVmkxDq1iM2r/eBNcAF9jbDYI1pat21iI/YvadoWlZLHY
	vKBeMiP0hNTKIy9RWGt9Nc5l06oHL8HaktnoAO4t1CpZRNAUX/yc1nfu
X-Gm-Gg: ASbGncvT0969deTQioE0H7pJRPdEiCoVEBu8u8APyHH0/OQClUeJVuqRqAzq2ZEY6Ga
	WuOGYiWDqv9QXmltDfYj+bJ4qNe++2tFyiTJOr58Cbp2HhurNeB8ZnSF0lgOQq2y1jsT+pHACdd
	KC5L6tly3YJsRgNFCm7dsdDZ925uuvOB10hSKI4aUkKOpjKpTI8EkEB31iXJ0d+0kYRJjxlp/Nx
	shl431RuZbFVLBCohz/mrEqc/chT20mHb2m22RgCJjMIW+aPR7qFN4XwaT7og/HYksR7BJ7BEJh
	Qg12wdzcSn9JYrJNdELlqROiQoGeyQTFunjt6flOn31ROCA3xCeDOuXt1YRCuqKB43LNQVeIsBh
	J3Umiy201A8uWXCTUi2XvdL0uKe9yzcVFvNi8FxvVwIPEAhwAHHr0/RJn8dvIFlcUR4SZA9z/st
	HlnTkzQTpTVCG8yk/2ujt6erWQ5BY3ZdrAIj1ByJdnN3N94NmIz+ZYSCXuHi8L0aROtwW2bL9LA
	yfaBL+Sx1lKP9VLNA==
X-Google-Smtp-Source: AGHT+IEtmgRk6eze9tTmBtLdk/P4Jh344YQzAelRT/qHaiuNHUa+gDXym6pX5LoWNyBcFPphyKQT7w==
X-Received: by 2002:a05:6a20:3945:b0:35d:d477:a7d7 with SMTP id adf61e73a8af0-3614eb276f1mr33369010637.7.1764401887685;
        Fri, 28 Nov 2025 23:38:07 -0800 (PST)
Received: from sanjays-pc.govzhome.govindz.co.nz ([180.148.109.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15e9c3e41sm7170574b3a.33.2025.11.28.23.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 23:38:07 -0800 (PST)
From: Sanjay Govind <sanjay.govind9@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Vicki Pfau <vi@endrift.com>,
	Pavel Rojtberg <rojtberg@gmail.com>,
	Nilton Perim Neto <niltonperimneto@gmail.com>,
	Antheas Kapenekakis <lkml@antheas.dev>,
	"Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Cc: winston.tan@middleearth.com,
	Sanjay Govind <sanjay.govind9@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Input: xpad - Add support for CRKD Guitars
Date: Sat, 29 Nov 2025 20:37:11 +1300
Message-ID: <20251129073720.2750-2-sanjay.govind9@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds support for various CRKD Guitar Controllers

Signed-off-by: Sanjay Govind <sanjay.govind9@gmail.com>
---
 drivers/input/joystick/xpad.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index d72e89c25e50..363d50949386 100644
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
@@ -420,6 +422,7 @@ static const struct xpad_device {
 	{ 0x3285, 0x0663, "Nacon Evol-X", 0, XTYPE_XBOXONE },
 	{ 0x3537, 0x1004, "GameSir T4 Kaleid", 0, XTYPE_XBOX360 },
 	{ 0x3537, 0x1010, "GameSir G7 SE", 0, XTYPE_XBOXONE },
+	{ 0x3651, 0x1000, "CRKD SG", 0, XTYPE_XBOX360 },
 	{ 0x366c, 0x0005, "ByoWave Proteus Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE, FLAG_DELAY_INIT },
 	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
 	{ 0x37d7, 0x2501, "Flydigi Apex 5", 0, XTYPE_XBOX360 },
@@ -518,6 +521,7 @@ static const struct usb_device_id xpad_table[] = {
 	 */
 	{ USB_INTERFACE_INFO('X', 'B', 0) },	/* Xbox USB-IF not-approved class */
 	XPAD_XBOX360_VENDOR(0x0079),		/* GPD Win 2 controller */
+	XPAD_XBOX360_VENDOR(0x0351),		/* CRKD Controllers */
 	XPAD_XBOX360_VENDOR(0x03eb),		/* Wooting Keyboards (Legacy) */
 	XPAD_XBOX360_VENDOR(0x03f0),		/* HP HyperX Xbox 360 controllers */
 	XPAD_XBOXONE_VENDOR(0x03f0),		/* HP HyperX Xbox One controllers */
@@ -578,6 +582,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOXONE_VENDOR(0x3285),		/* Nacon Evol-X */
 	XPAD_XBOX360_VENDOR(0x3537),		/* GameSir Controllers */
 	XPAD_XBOXONE_VENDOR(0x3537),		/* GameSir Controllers */
+	XPAD_XBOX360_VENDOR(0x3651),		/* CRKD Controllers */
 	XPAD_XBOXONE_VENDOR(0x366c),		/* ByoWave controllers */
 	XPAD_XBOX360_VENDOR(0x37d7),		/* Flydigi Controllers */
 	XPAD_XBOX360_VENDOR(0x413d),		/* Black Shark Green Ghost Controller */
-- 
2.52.0


