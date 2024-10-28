Return-Path: <linux-input+bounces-7742-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 500BD9B3121
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 13:57:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1306028222E
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 12:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E061DA2E0;
	Mon, 28 Oct 2024 12:57:49 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from ovh2.jfedor.net (ovh2.jfedor.net [54.38.158.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE4A1D63D2;
	Mon, 28 Oct 2024 12:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.38.158.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730120269; cv=none; b=iOqaMTMjGNc8kM/iCfw5nI6/7uwrWvmV6kq8SuTVN8rkzLGFq170upeLj6kIru4yyBJY8o/wLQUpe8vIBQvPXYTpllD2FgiZs06cqIrDJ6mupYgRT4TEMr6x2MCU3P7YOvdaZ7BsraBU6w2BJNg+cIiMv1NPGUaj32u1ceim34U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730120269; c=relaxed/simple;
	bh=nicft+LEEnTwcGU3L90qpU670Tl4HDCIEYTBtlMJ+9I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YX6hUOC4sLmSXpD/Orw3MQZ22b34O06GIVjZc6ZXmD99coulcn+Iy9sfARcV92D5N9L/YTw/N+ue1jCsVdLlMRsQfimpVUkhw/0/CvaTj6LTV7/zyg9P/ZcJEzm3etLQwSSuiCl7VdLT5XTEoOhQcaIO5BVtWNq4PsptDZgglxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jfedor.org; spf=pass smtp.mailfrom=jfedor.org; arc=none smtp.client-ip=54.38.158.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jfedor.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jfedor.org
Received: from jfedor by ovh2.jfedor.net with local (Exim 4.92)
	(envelope-from <jfedor@jfedor.org>)
	id 1t5P3i-0000CV-H5; Mon, 28 Oct 2024 13:41:22 +0100
From: Jacek Fedorynski <jfedor@jfedor.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jacek Fedorynski <jfedor@jfedor.org>
Subject: [PATCH] Input: xpad - add support for 8BitDo Lite SE
Date: Mon, 28 Oct 2024 13:40:02 +0100
Message-Id: <20241028124002.695-1-jfedor@jfedor.org>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add 8BitDo Lite SE 2.4G Wireless Controller for Xbox to known devices
list. Like some other controllers, it needs an init packet before it
starts sending inputs. Tested wired and with the wireless dongle.

Signed-off-by: Jacek Fedorynski <jfedor@jfedor.org>
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 3e61df927277..afaa3a954fa8 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -372,6 +372,7 @@ static const struct xpad_device {
 	{ 0x294b, 0x3303, "Snakebyte GAMEPAD BASE X", 0, XTYPE_XBOXONE },
 	{ 0x294b, 0x3404, "Snakebyte GAMEPAD RGB X", 0, XTYPE_XBOXONE },
 	{ 0x2dc8, 0x2000, "8BitDo Pro 2 Wired Controller fox Xbox", 0, XTYPE_XBOXONE },
+	{ 0x2dc8, 0x2008, "8BitDo Lite SE 2.4G Wireless Controller for Xbox", 0, XTYPE_XBOXONE },
 	{ 0x2dc8, 0x3106, "8BitDo Pro 2 Wired Controller", 0, XTYPE_XBOX360 },
 	{ 0x2e24, 0x0652, "Hyperkin Duke X-Box One pad", 0, XTYPE_XBOXONE },
 	{ 0x31e3, 0x1100, "Wooting One", 0, XTYPE_XBOX360 },
@@ -682,6 +683,7 @@ static const struct xboxone_init_packet xboxone_init_packets[] = {
 	XBOXONE_INIT_PKT(0x045e, 0x0b00, extra_input_packet_init),
 	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_led_on),
 	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_auth),
+	XBOXONE_INIT_PKT(0x2dc8, 0x2008, xboxone_pdp_auth),
 	XBOXONE_INIT_PKT(0x24c6, 0x541a, xboxone_rumblebegin_init),
 	XBOXONE_INIT_PKT(0x24c6, 0x542a, xboxone_rumblebegin_init),
 	XBOXONE_INIT_PKT(0x24c6, 0x543a, xboxone_rumblebegin_init),
-- 
2.34.1


