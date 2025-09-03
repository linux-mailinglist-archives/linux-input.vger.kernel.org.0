Return-Path: <linux-input+bounces-14466-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DEFB4274D
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 18:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FBEC16630F
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 16:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56BD22ED860;
	Wed,  3 Sep 2025 16:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="cwMUS9j1"
X-Original-To: linux-input@vger.kernel.org
Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59953239562;
	Wed,  3 Sep 2025 16:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756918414; cv=none; b=QuYjaHg6nyqvV3dcgrz9+2wHW/nvAuDwWC840dBlX9hjK+zHhSTiYkXNmBfCMfdESzP/AQl+a3VL7snJNIYtOuU1hRPGeSxSdrt+x9cF3Xqes6pQhAW/ulSAyOPMhU536bWJG0K2sccx3eXkPqb4EBaFASzrdW04XR4+fZgIEgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756918414; c=relaxed/simple;
	bh=rO3y0t3FVyscOLSeKTryl3TdxMAiqPuI2R3kQAzoeeY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xb714rWs6EWf7K4oMnX/h+rLt+PRSN/T54/Z28p0nhKE2tu0ma9M7jNdC/PX37tHTexhs2viOoHDhLzBvIPjYgXhip+oteaD6aTrQuviIHMxHaHld/dfYPpxMvUB0dgjERO7Lv36lEkZ5g5MkVqTj3ygU0eQMgEsuPb76cBJo3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=cwMUS9j1; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id 4331F46A5F;
	Wed,  3 Sep 2025 19:53:20 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id 2578446A85;
	Wed,  3 Sep 2025 19:53:19 +0300 (EEST)
Received: from antheas-z13 (x5996a855.customers.hiper-net.dk [89.150.168.85])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 4168E1FD1A3;
	Wed,  3 Sep 2025 19:53:18 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1756918398;
	bh=J4DJtxZEt2TvI0HWJjt7s1F20dy08A1KMG7yar4cqLE=; h=From:To:Subject;
	b=cwMUS9j1Etr7vhBHRqf032uv17Udb0FaFr070BH4X2Fj4vt4LS78fFtphgZ5M4ajb
	 /vdLnZ26mHWzYWPZGTzk4rq2iYBlLHcL7ruFchlbuGvl9Pb92FhDIEYcv0yyis17SK
	 aZUjPPoqEDExzRJKu9MHlhyDwjK9HSVdx29gSg2YMrIhsBbysmN3NeNHifFtXdCLNX
	 ho6t6V5LZY0Q5EaW3lSaooC/m1yMyGztN3UXBxv4ltoPsHWHzU+8DbGbeuKotvy8gP
	 XKC9Zzt0rkDv7uUsVbBtW6Fz8C48h1VuyWU1DhmVv7bNC7FrdNs3FIbodWCVc7ovqo
	 0q7/FkmEgHclQ==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 89.150.168.85) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Antheas Kapenekakis <lkml@antheas.dev>,
	Brandon Lin <brandon@emergence.ltd>,
	Sergey Belozyorcev <belozyorcev@ya.ru>
Subject: [PATCH v1] Input: xpad - add ID for Flydigi Apex 5
Date: Wed,  3 Sep 2025 18:51:14 +0200
Message-ID: <20250903165114.2987905-1-lkml@antheas.dev>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <175691839867.88460.14228523301174771666@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

The Flydigi Apex 5 has an XInput mode. Add the vid and pid for it.

Reported-by: Brandon Lin <brandon@emergence.ltd>
Reported-by: Sergey Belozyorcev <belozyorcev@ya.ru>
Closes: https://github.com/ublue-os/bazzite/issues/3014
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 4c94297e17e6..d72e89c25e50 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -422,6 +422,7 @@ static const struct xpad_device {
 	{ 0x3537, 0x1010, "GameSir G7 SE", 0, XTYPE_XBOXONE },
 	{ 0x366c, 0x0005, "ByoWave Proteus Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE, FLAG_DELAY_INIT },
 	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
+	{ 0x37d7, 0x2501, "Flydigi Apex 5", 0, XTYPE_XBOX360 },
 	{ 0x413d, 0x2104, "Black Shark Green Ghost Gamepad", 0, XTYPE_XBOX360 },
 	{ 0xffff, 0xffff, "Chinese-made Xbox Controller", 0, XTYPE_XBOX },
 	{ 0x0000, 0x0000, "Generic X-Box pad", 0, XTYPE_UNKNOWN }
@@ -578,6 +579,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOX360_VENDOR(0x3537),		/* GameSir Controllers */
 	XPAD_XBOXONE_VENDOR(0x3537),		/* GameSir Controllers */
 	XPAD_XBOXONE_VENDOR(0x366c),		/* ByoWave controllers */
+	XPAD_XBOX360_VENDOR(0x37d7),		/* Flydigi Controllers */
 	XPAD_XBOX360_VENDOR(0x413d),		/* Black Shark Green Ghost Controller */
 	{ }
 };

base-commit: 1b237f190eb3d36f52dffe07a40b5eb210280e00
-- 
2.51.0



