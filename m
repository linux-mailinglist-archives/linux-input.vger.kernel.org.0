Return-Path: <linux-input+bounces-10233-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D3FA40A76
	for <lists+linux-input@lfdr.de>; Sat, 22 Feb 2025 18:00:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41DDE16E09A
	for <lists+linux-input@lfdr.de>; Sat, 22 Feb 2025 17:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C64A720AF9A;
	Sat, 22 Feb 2025 17:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="v21FOFdu"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B864F1514F6;
	Sat, 22 Feb 2025 17:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740243621; cv=none; b=R3tIgRtlUwTCVHQ6wcxqq9EWv5Uf/CXSKR2y+T9YOzB/RrwuwgiO7rYGq1TiDpGKU/aetamle/LVfJ4tm1sJ59mH0o3SInx7tU487+6Zv827+SW5VdJpAWeUX/TR9Mh8Ev2HM6t7R0gU0rUfZ0NOeos6eGiN0zMGyVk0smL5Lq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740243621; c=relaxed/simple;
	bh=AQZQ4KH5ogJIBTkSvGVsnaiOSKOCXOouK5r+7IOIskU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XMy5gYndrOOvnLwFGzGso42DuHakj9kKfYy6g3ORmCsjY9QtQxfV3mnKLANQBwea+JcSr2NqGDSYRb0eCx9HlTB1C7vVZ0cwiZkG7OsXdmpMuxR0caqHKUORl91n8rEkgle+XUAQ63DeCYYz8orw9YNybf33ni46iiOKbKL5Wpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=v21FOFdu; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id AFE792E08FB5;
	Sat, 22 Feb 2025 19:00:16 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1740243617;
	bh=VbRepp5JRjH1jo+cVKlZdFwYWatA/RPjFmSs1bga+aE=; h=From:To:Subject;
	b=v21FOFduo93Xx1Zs2I7m5cMVMAxFQNBI1AXoYES3dt6FZ67KqNv78FDlzFP6SV1+g
	 lr2uS8RgaOvvDi6XY4k6aSnpAZjt0xGZoiV6JFoTs8ogjhPlKutl+gHQeDn3d4Z7jV
	 bOAjT9555HZlwBUPUuI93F09bjPOhCULt//IBNk8=
Authentication-Results: linux1587.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:cbc0:999f:73ad:33bd) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	pgriffais@valvesoftware.com,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH 3/3] Input: xpad - rename QH controller to Legion Go S
Date: Sat, 22 Feb 2025 18:00:10 +0100
Message-ID: <20250222170010.188761-4-lkml@antheas.dev>
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
 <174024361744.6873.15221054006938041226@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

The QH controller is actually the controller of the Legion Go S, with
the manufacturer string wch.cn and product name Legion Go S in its
USB descriptor. A cursory lookup of the VID reveals the same.

Therefore, rename the xpad entries to match.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/input/joystick/xpad.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 1a64cd576c66..e1e006ade813 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -306,7 +306,7 @@ static const struct xpad_device {
 	{ 0x1689, 0xfe00, "Razer Sabertooth", 0, XTYPE_XBOX360 },
 	{ 0x17ef, 0x6182, "Lenovo Legion Controller for Windows", 0, XTYPE_XBOX360 },
 	{ 0x1949, 0x041a, "Amazon Game Controller", 0, XTYPE_XBOX360 },
-	{ 0x1a86, 0xe310, "QH Electronics Controller", 0, XTYPE_XBOX360 },
+	{ 0x1a86, 0xe310, "Legion Go S", 0, XTYPE_XBOX360 },
 	{ 0x1bad, 0x0002, "Harmonix Rock Band Guitar", 0, XTYPE_XBOX360 },
 	{ 0x1bad, 0x0003, "Harmonix Rock Band Drumkit", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x1bad, 0x0130, "Ion Drum Rocker", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360 },
@@ -521,7 +521,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOX360_VENDOR(0x1689),		/* Razer Onza */
 	XPAD_XBOX360_VENDOR(0x17ef),		/* Lenovo */
 	XPAD_XBOX360_VENDOR(0x1949),		/* Amazon controllers */
-	XPAD_XBOX360_VENDOR(0x1a86),		/* QH Electronics */
+	XPAD_XBOX360_VENDOR(0x1a86),		/* Nanjing Qinheng Microelectronics (WCH) */
 	XPAD_XBOX360_VENDOR(0x1bad),		/* Harmonix Rock Band guitar and drums */
 	XPAD_XBOX360_VENDOR(0x1ee9),		/* ZOTAC Technology Limited */
 	XPAD_XBOX360_VENDOR(0x20d6),		/* PowerA controllers */
-- 
2.48.1


