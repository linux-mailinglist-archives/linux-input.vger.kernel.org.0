Return-Path: <linux-input+bounces-9009-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB2BA04A33
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 20:28:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E74173A6662
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 19:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28DAA1F5438;
	Tue,  7 Jan 2025 19:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DNPB5hfy"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655DC1F4E55
	for <linux-input@vger.kernel.org>; Tue,  7 Jan 2025 19:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736278121; cv=none; b=eUdMfYr2pGDG9knVr0NBQrpnQi46VwsNiPIXrvSGQgvg6dzE/kAKz60EMpguTrHXG5Ywb24ppKlBz7wIvRl7zNPNMwwi/jPfDtnIbaRvSrpsd6HHgmIxpkuVpVhe716RX0uANnRGmqhyuxy654wNm1jNQ6CIFO09ZXdqkA2EGew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736278121; c=relaxed/simple;
	bh=VcDwpjk6KJUHo/uzoQgaCABrXZ4h2VaDFz+uODcJd4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sA5wQMVs+5yvYGo9R+1iyww0J3zj6pHhw0DyKcLxX7GkrciV65EffJL5PCj1d3uD6GhJJkIF7fPWk2FweoHyNHBehfI5fQ4q8JlM3S4+y2Ww8CCWby/K0neOQi1R0UsZhIHnmgSNptvsdXwu8CiplhUJFhwTQKit/Zy2kPoDR3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DNPB5hfy; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so28868645e9.1
        for <linux-input@vger.kernel.org>; Tue, 07 Jan 2025 11:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736278118; x=1736882918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OtjfiX1TgghECvJ0Ub+XLyC/gZPAng4XPAdFrElJu90=;
        b=DNPB5hfy6Ken+UETjG16txE1yTPsLhSKs5XzPgm/OioxBo/ucm+t/tm8OLIjMzoQGC
         iHB2PTSmuQsWiWfHQXIubi+PAiifhfz8BACFwm34+jNjFVacdjEJdXD8I8bQCevURA9G
         xmLw3L6fX/bBnjPE7/9kdOUTp9eq2G2jH0qkEAL5I44sAAVt7DrqzcAC0/F+pHBbRIXr
         HObjW6UeT57aFwMb3rrNQjySWR9dLhiJRkLX/YZbMP+lTSuSu4BONMjT5ZkDGDj20nY+
         mO6hE9b+FKQH3irQhYOzJVf5q/evkzQ/+3MVfvkS1fuMccfsbSo1U+I/eSsXr/DRtc/E
         7lHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736278118; x=1736882918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OtjfiX1TgghECvJ0Ub+XLyC/gZPAng4XPAdFrElJu90=;
        b=EpdpHaLMrS+PvdJHoIejA1f8YO5qDSNpNMBSsR18Cxs3oOrjNt5B5PtQ8a2Kqxm55B
         efDSQJ9eDUsoZYKhIRnGpKx4LCMsGxJiI8CcALJc9b3WcEfj4RjhbogvdQuGk1opVAB8
         vVYYrycMay6/7ksrTWbzgDQuOTZwLaKMrr7VtNin3ouZk2xRtfPL87FMM1I1iCgG2EpW
         TaqrbpakOQULcQstxPfFkxmSZIXQQqgjfrGvoUnYHOC2MjGh3fv/hqSb8vZiwS23JVZH
         lNmtWMIPogsVbpjPBwl98vSa4g11Yh+AiIQ6v+6aen1BcFxaCmpDo4dVWEUQFE2KQ3tB
         b6ZA==
X-Gm-Message-State: AOJu0YwQEYHwJBPRGzsth51hX360429Il0v30D4IqdNNWnzxFzqsmGfh
	sUgVX6YsFpTs97pl0CYtenE4W7gljxrZGiiBjWYk6dBgoa4cXHPFfB62QMIVockaiA==
X-Gm-Gg: ASbGncv2PqBNRFR8goXTDUxkvaqB1HyMAUnTGT9E5ilsRrODN1ylQ4k6yfsZUHrLVWx
	ib/xebevOqZIGe9uyFGi3CPpo/8Db1LJWR0qHll17xAhCn48h5/O0hdJl2vA+yCk+fY85OUwIan
	DPrwRdoruusaRt7KrXgsrpjzj5bjglMeMFvjc9MX1vyudO1LXY9CdVAVVlxp3Lxh1aWEHVsGPyz
	m+0ubdLaa+ngzWtfnx9ldJVcEYRoxWpvOGJOoq50nGYmaEcj25bxtXsOlyv4F+KnYp/
X-Google-Smtp-Source: AGHT+IEf9Lzqo9L+vgYJFZsQhqogJS1VL2IscedUDGM2W6CAZPVmTU2OKlBME2cguxvR0N+0Uk43cw==
X-Received: by 2002:a05:600c:1c1a:b0:434:f0df:a14 with SMTP id 5b1f17b1804b1-43668548500mr492152145e9.2.1736278117481;
        Tue, 07 Jan 2025 11:28:37 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b4a8:4000:2867:420d:1978:6fdd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acb17sm50456700f8f.97.2025.01.07.11.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 11:28:37 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Jocelyne Jones <bumpycarrot@gmail.com>,
	Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH v3 03/11] Input: xpad - add support for SCUF Instinct
Date: Tue,  7 Jan 2025 20:28:22 +0100
Message-ID: <20250107192830.414709-4-rojtberg@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107192830.414709-1-rojtberg@gmail.com>
References: <20250107192830.414709-1-rojtberg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jocelyne Jones <bumpycarrot@gmail.com>

Signed-off-by: Jocelyne Jones <bumpycarrot@gmail.com>
Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index ceb08c541b18..7985b7a5cf0e 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -376,6 +376,7 @@ static const struct xpad_device {
 	{ 0x2dc8, 0x3106, "8BitDo Ultimate Wireless / Pro 2 Wired Controller", 0, XTYPE_XBOX360 },
 	{ 0x2dc8, 0x310a, "8BitDo Ultimate 2C Wireless Controller", 0, XTYPE_XBOX360 },
 	{ 0x2e24, 0x0652, "Hyperkin Duke X-Box One pad", 0, XTYPE_XBOXONE },
+	{ 0x2e95, 0x0504, "SCUF Gaming Controller", MAP_SELECT_BUTTON, XTYPE_XBOXONE },
 	{ 0x31e3, 0x1100, "Wooting One", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1200, "Wooting Two", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1210, "Wooting Lekker", 0, XTYPE_XBOX360 },
@@ -529,6 +530,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOXONE_VENDOR(0x2dc8),		/* 8BitDo Pro 2 Wired Controller for Xbox */
 	XPAD_XBOXONE_VENDOR(0x2e24),		/* Hyperkin Duke Xbox One pad */
 	XPAD_XBOX360_VENDOR(0x2f24),		/* GameSir controllers */
+	XPAD_XBOXONE_VENDOR(0x2e95),		/* SCUF Gaming Controller */
 	XPAD_XBOX360_VENDOR(0x31e3),		/* Wooting Keyboards */
 	XPAD_XBOX360_VENDOR(0x3285),		/* Nacon GC-100 */
 	XPAD_XBOX360_VENDOR(0x3537),		/* GameSir Controllers */
-- 
2.43.0


