Return-Path: <linux-input+bounces-1145-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E21825F67
	for <lists+linux-input@lfdr.de>; Sat,  6 Jan 2024 13:12:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D41811F22ADB
	for <lists+linux-input@lfdr.de>; Sat,  6 Jan 2024 12:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2544D6FBB;
	Sat,  6 Jan 2024 12:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=schenkel.net header.i=@schenkel.net header.b="Mb7qSM2w";
	dkim=pass (2048-bit key) header.d=schenkel.net header.i=@schenkel.net header.b="D3PBVymZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605576FC3
	for <linux-input@vger.kernel.org>; Sat,  6 Jan 2024 12:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=schenkel.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=schenkel.net
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4T6fMP2x8Lz9swl
	for <linux-input@vger.kernel.org>; Sat,  6 Jan 2024 13:12:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schenkel.net;
	s=MBO0001; t=1704543121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QMPGfbxz/6ffrwmab9hjevmpmbVTrTKIPS/fHPAGXU8=;
	b=Mb7qSM2wvXygOwLhwFkc2aiQRKEldJABkmSYlsaVOpubyc2oCKOF0pR3JbLWLE5MjXxlLi
	xTjoBB8MdmoAu8FfDi3xM3hXYZT3qXLsr3JCSxgKy/ZZPVHF560DTLFqqQ1ZF4FRZ0+ckY
	D+pp/rmE+WK+Ja04psjEuBjIcZeAfziyN6TnmGV4WljCOgIZd0dGEmXNC+BASoMNiYhK0u
	x7zVPI9ZZrox29M3MQZq2FAaj0Y53i0+vT42DZ2F9AwOS0qfqoeRqw1tVBKVPhm3eMsXlW
	y0plwPOihQV2KyAqo4y4QXJBGL48lsfj2g5VvVkdnwJz6dO3FKAzd8RtAo2EhQ==
From: Leonardo Brondani Schenkel <leonardo@schenkel.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schenkel.net;
	s=mail; t=1704543116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QMPGfbxz/6ffrwmab9hjevmpmbVTrTKIPS/fHPAGXU8=;
	b=D3PBVymZtag1GvOLVp5JyvbmMXOxbsm/haQfWPqZYsbEUhNgiQTe8Ou/IEJznt62ilHMol
	nP9dITk57tUPl3s1zvJyMf3o771pKYzqLNFQTSIyJnPxBnUaFQr9GWNM8trX5X4euxs9nv
	+oBLCYuYzxrckNEhSu/K2qUXZUJ0cl+xLTq2IbEqEqwgQ5pL7P0xZw1jGwDXOIJu6RIchP
	2vxEIKvbAwavanccbPIBA9MRQWMp4UmKVp+srJwz0q0tsH0v6QAk3HBQwH2xLq/n9pQeuJ
	33RYfBA0B4umtpS1+k9ibw4kQKHHaP0dKBYmEy8D07wzgVQVKyES6s20LTuSMw==
To: linux-input@vger.kernel.org
Cc: Leonardo Brondani Schenkel <leonardo@schenkel.net>
Subject: [PATCH] xpad: support 'share' button of 8BitDo Pro 2
Date: Sat,  6 Jan 2024 13:11:33 +0100
Message-ID: <20240106121137.101075-1-leonardo@schenkel.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4T6fMP2x8Lz9swl

I have a 8BitDo Pro 2 Wired Controller for Xbox. This is a licensed
"Series S|X" type controller with a 'share' button below the big Xbox
button. The xpad driver has explicit support for this controller but was
not generating any raw input events when this button was pressed.

Analysis of GIP packet dumps showed that this button is reported via
byte 18, not byte 22 that the driver expects. As this is a licensed
product and the button works in Windows with the official Microsoft
drivers, it looks like both bytes are being used in the wild.

Another user confirmed the same findings:
> I can confirm that the official Microsoft controller I have reports
> the Share button in byte 22 (counting GIP_CMD_INPUT as byte 0) and the
> Hori Fighting Commander Octa reports the Share button in byte 18.
https://github.com/medusalix/xone/pull/17#issuecomment-1470807446

Therefore mark this controller as supporting the 'share' button, and
also recognize byte 18 as a 'share' button press. The latter will
benefit similar third-party controllers that report using the same byte.

Signed-off-by: Leonardo Brondani Schenkel <leonardo@schenkel.net>
---
 drivers/input/joystick/xpad.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 1a58629c12b9..3b67c783b7b6 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -357,7 +357,7 @@ static const struct xpad_device {
 	{ 0x24c6, 0x5d04, "Razer Sabertooth", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0xfafe, "Rock Candy Gamepad for Xbox 360", 0, XTYPE_XBOX360 },
 	{ 0x2563, 0x058d, "OneXPlayer Gamepad", 0, XTYPE_XBOX360 },
-	{ 0x2dc8, 0x2000, "8BitDo Pro 2 Wired Controller fox Xbox", 0, XTYPE_XBOXONE },
+	{ 0x2dc8, 0x2000, "8BitDo Pro 2 Wired Controller for Xbox", MAP_SELECT_BUTTON, XTYPE_XBOXONE },
 	{ 0x2dc8, 0x3106, "8BitDo Pro 2 Wired Controller", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1100, "Wooting One", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1200, "Wooting Two", 0, XTYPE_XBOX360 },
@@ -1008,7 +1008,8 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
 		input_report_key(dev, BTN_START,  data[4] & BIT(2));
 		input_report_key(dev, BTN_SELECT, data[4] & BIT(3));
 		if (xpad->mapping & MAP_SELECT_BUTTON)
-			input_report_key(dev, KEY_RECORD, data[22] & BIT(0));
+			/* official controllers use byte 22 and some third-party use byte 18 */
+			input_report_key(dev, KEY_RECORD, data[22] & BIT(0) || data[18] & BIT(0));
 
 		/* buttons A,B,X,Y */
 		input_report_key(dev, BTN_A,	data[4] & BIT(4));
-- 
2.43.0


