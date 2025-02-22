Return-Path: <linux-input+bounces-10232-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 128B7A40A73
	for <lists+linux-input@lfdr.de>; Sat, 22 Feb 2025 18:00:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC0617A5A48
	for <lists+linux-input@lfdr.de>; Sat, 22 Feb 2025 16:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE30D20A5E2;
	Sat, 22 Feb 2025 17:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="UB6NnFtO"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F68A13BC0E;
	Sat, 22 Feb 2025 17:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740243620; cv=none; b=Niz/2vpK/5tNjOA8KhIYT1Nu/DsQ4GY/AXioGxVGSNbbQgHoCOWVHDBzWI0L+4FJWhqBmtx6ssCQ6iYDRtR8V+xvwwUDpuzQmvE6/sBb6YkH/soTObRa6oblvMIiCSIe7rf9SYG4R0UvqJMl4OAvc6QTJJHhqeZjp6LI0sDquFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740243620; c=relaxed/simple;
	bh=ZEU2Wh0qsO3j972wCVtyCHZaNB1NZIg6ayTUGBMOKJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ERpMUGHBAOS2FyMVImZXPH2IOVh9Sx8zsXb1PQi0V6R3/Iduw6BFRsLDCl9H3DMcAPgHN+bXX+5wZl66elnEmoAXKBQf4jb72MlJcVelzpZ05Vf5MqVuv0XN3syKlkD/5FALjYXUVUsqD02KvifdclhCB5QZXIFUNRU8XRRZw2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=UB6NnFtO; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 3F5112E08F98;
	Sat, 22 Feb 2025 19:00:14 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1740243615;
	bh=mVpxw4OlAnjz3eUJZOoiPMs40UY2decajM4ngq+RYH4=; h=From:To:Subject;
	b=UB6NnFtOMG1ydPRlZK+AUPl3DwXkElHNXl4dHaFavcxyJA41Bv5Zt4juDPo20d05a
	 AKaokSHSQ7CVAdF8IkvXxCmSiuOc9gvfRi7t7RRDBeUoL3Iy2JQtdU3Tnpn9ZPIh6I
	 UI4f3cL9S0ylbSElZsArQcC6vlTQrohwRsNg5+28=
Authentication-Results: linux1587.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:cbc0:999f:73ad:33bd) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	pgriffais@valvesoftware.com,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH 1/3] Input: xpad - add support for ZOTAC Gaming Zone
Date: Sat, 22 Feb 2025 18:00:08 +0100
Message-ID: <20250222170010.188761-2-lkml@antheas.dev>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250222170010.188761-1-lkml@antheas.dev>
References: <20250222170010.188761-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174024361503.6776.12200436753806238449@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

ZOTAC Gaming Zone is ZOTAC's 2024 handheld release.
As it is common with these handhelds, it uses a
hybrid USB device with an xpad endpoint, a
keyboard endpoint, and a vendor-specific
endpoint for RGB control et al.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 8fe2a51df649..a67b493c7702 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -343,6 +343,7 @@ static const struct xpad_device {
 	{ 0x1bad, 0xfa01, "MadCatz GamePad", 0, XTYPE_XBOX360 },
 	{ 0x1bad, 0xfd00, "Razer Onza TE", 0, XTYPE_XBOX360 },
 	{ 0x1bad, 0xfd01, "Razer Onza", 0, XTYPE_XBOX360 },
+	{ 0x1ee9, 0x1590, "ZOTAC Gaming Zone", 0, XTYPE_XBOX360 },
 	{ 0x20d6, 0x2001, "BDA Xbox Series X Wired Controller", 0, XTYPE_XBOXONE },
 	{ 0x20d6, 0x2009, "PowerA Enhanced Wired Controller for Xbox Series X|S", 0, XTYPE_XBOXONE },
 	{ 0x20d6, 0x281f, "PowerA Wired Controller For Xbox 360", 0, XTYPE_XBOX360 },
@@ -521,6 +522,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOX360_VENDOR(0x1949),		/* Amazon controllers */
 	XPAD_XBOX360_VENDOR(0x1a86),		/* QH Electronics */
 	XPAD_XBOX360_VENDOR(0x1bad),		/* Harmonix Rock Band guitar and drums */
+	XPAD_XBOX360_VENDOR(0x1ee9),		/* ZOTAC Technology Limited */
 	XPAD_XBOX360_VENDOR(0x20d6),		/* PowerA controllers */
 	XPAD_XBOXONE_VENDOR(0x20d6),		/* PowerA controllers */
 	XPAD_XBOX360_VENDOR(0x2345),		/* Machenike Controllers */
-- 
2.48.1


