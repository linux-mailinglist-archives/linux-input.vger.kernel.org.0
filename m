Return-Path: <linux-input+bounces-16763-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99067CED9D9
	for <lists+linux-input@lfdr.de>; Fri, 02 Jan 2026 04:13:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAF103007C60
	for <lists+linux-input@lfdr.de>; Fri,  2 Jan 2026 03:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F6C22FAFD;
	Fri,  2 Jan 2026 03:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="LKRobFsr"
X-Original-To: linux-input@vger.kernel.org
Received: from relay-us1.mymailcheap.com (relay-us1.mymailcheap.com [51.81.35.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C613E2B9B7;
	Fri,  2 Jan 2026 03:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.81.35.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767323608; cv=none; b=hNxQEdWEGrAWcfuT0k/wQ1GXCPK+nj/uMZNnMF+cD6GVeVoQGHjk1R9cA6r+pjbe+Lt/mao47EJngFJI9DfXL8ZjoGylg0k7qgwTh4KKd/NHZq9ecyQv4Xl+Na7papJ/z0fLxC6KwuX+wZLJ7W1UpRjhO2feZcdagwPsAkxtPzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767323608; c=relaxed/simple;
	bh=yGzsLCXX9ZbCHywDk0tUWkSpKUqqNrBmPdwkwPMEjB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nyLbVnk5ChQCR/LylOvrqzy4eJl8PoxLrbXCMogaZvty9hNayI7dNfiyNqK3RpuIjkrPDOJoPVaMTed0DvvhCh1FNRUBEyj2InvTpcHOsjFkE10YnKREc60fVgi8nKKdQyfzFU6rwIE6iF0EV+5bbuii8ZJpychwxTg1tFEl1MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=LKRobFsr; arc=none smtp.client-ip=51.81.35.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.241.64])
	by relay-us1.mymailcheap.com (Postfix) with ESMTPS id B190C20535;
	Fri,  2 Jan 2026 03:06:01 +0000 (UTC)
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com [149.56.97.132])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id C3F7E20229;
	Fri,  2 Jan 2026 03:05:52 +0000 (UTC)
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
	by relay1.mymailcheap.com (Postfix) with ESMTPS id A80123EBDA;
	Fri,  2 Jan 2026 03:05:45 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf1.mymailcheap.com (Postfix) with ESMTPSA id 7D96C40086;
	Fri,  2 Jan 2026 03:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1767323144; bh=yGzsLCXX9ZbCHywDk0tUWkSpKUqqNrBmPdwkwPMEjB4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LKRobFsrOqJcX7hKBgooxNPns3aAQLoxNcuD0zrgpMPKPNDOftoPHMAFUvM0llg8+
	 t7cwmehkWhAIJVuJUctRPYwN4vyZhIandThVOcBx+HEqw+AS+ytMWI4CXpIO4qvJyq
	 Uio6Y+em/dLMn7Y6azCYVcZaCdtvWw6t6krdDMzE=
Received: from liushuyu-p15 (unknown [117.151.14.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 01E1140191;
	Fri,  2 Jan 2026 03:05:41 +0000 (UTC)
From: Zixing Liu <liushuyu@aosc.io>
To: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Zixing Liu <liushuyu@aosc.io>
Subject: [PATCH 1/1] Input: xpad - add support for Beitong KP-series controllers
Date: Fri,  2 Jan 2026 11:01:55 +0800
Message-ID: <20260102030154.197749-3-liushuyu@aosc.io>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260102030154.197749-2-liushuyu@aosc.io>
References: <20260102030154.197749-2-liushuyu@aosc.io>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: nf1.mymailcheap.com
X-Rspamd-Queue-Id: 7D96C40086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.40 / 10.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.00)[34.12%];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[4];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,aosc.io];
	SPFBL_URIBL_EMAIL_FAIL(0.00)[liushuyu.aosc.io:server fail];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[]

This commit also adds a field to usb_xpad and changed
how xpad_prepare_next_init_packet determines whether init packets need
to be send in order to handle special quirks needed for supporting
Beitong KP-series controllers.

Signed-off-by: Zixing Liu <liushuyu@aosc.io>
---
 drivers/input/joystick/xpad.c | 57 ++++++++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 363d50949386..fa874e4cb586 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -106,6 +106,7 @@
 #define PKT_XBE2_FW_5_11    4
 
 #define FLAG_DELAY_INIT BIT(0)
+#define FLAG_FORCE_INIT BIT(1)
 
 static bool dpad_to_buttons;
 module_param(dpad_to_buttons, bool, S_IRUGO);
@@ -360,6 +361,34 @@ static const struct xpad_device {
 	{ 0x1bad, 0xfd00, "Razer Onza TE", 0, XTYPE_XBOX360 },
 	{ 0x1bad, 0xfd01, "Razer Onza", 0, XTYPE_XBOX360 },
 	{ 0x1ee9, 0x1590, "ZOTAC Gaming Zone", 0, XTYPE_XBOX360 },
+	{ 0x20bc, 0x5125, "Beitong KP20A/KP40A Controller", 0, XTYPE_XBOX360, FLAG_FORCE_INIT },
+	{ 0x20bc, 0x5126, "Beitong KP20A Controller", 0, XTYPE_XBOX360, FLAG_FORCE_INIT },
+	{ 0x20bc, 0x5127, "Beitong KP20A/KP40A Controller", 0, XTYPE_XBOX360, FLAG_FORCE_INIT },
+	{ 0x20bc, 0x5128, "Beitong KP20A Controller", 0, XTYPE_XBOX360, FLAG_FORCE_INIT },
+	{ 0x20bc, 0x512f, "Beitong KP70A Controller", 0, XTYPE_XBOX360, FLAG_FORCE_INIT },
+	{ 0x20bc, 0x5130, "Beitong KP70A Controller", 0, XTYPE_XBOX360, FLAG_FORCE_INIT },
+	{ 0x20bc, 0x5133, "Beitong KP50B Controller", 0, XTYPE_XBOX360, FLAG_FORCE_INIT },
+	{ 0x20bc, 0x5134, "Beitong KP50B Controller", 0, XTYPE_XBOX360, FLAG_FORCE_INIT },
+	{ 0x20bc, 0x5145, "Beitong KP40A/KP40B Controller", 0, XTYPE_XBOX360, FLAG_FORCE_INIT },
+	{ 0x20bc, 0x5146, "Beitong KP40A/KP40B Controller", 0, XTYPE_XBOX360, FLAG_FORCE_INIT },
+	{ 0x20bc, 0x5149, "Beitong KP50C Controller", 0, XTYPE_XBOX360, FLAG_FORCE_INIT },
+	{ 0x20bc, 0x514a, "Beitong KP50C Controller", 0, XTYPE_XBOX360, FLAG_FORCE_INIT },
+	{ 0x20bc, 0x5150, "Beitong KP50D Controller", 0, XTYPE_XBOX360, FLAG_FORCE_INIT },
+	{ 0x20bc, 0x5151, "Beitong KP50D Controller", 0, XTYPE_XBOX360, FLAG_FORCE_INIT },
+	{ 0x20bc, 0x5152, "Beitong KP50E Controller", 0, XTYPE_XBOX360, FLAG_FORCE_INIT },
+	{ 0x20bc, 0x5153, "Beitong KP50E Controller", 0, XTYPE_XBOX360, FLAG_FORCE_INIT },
+	{ 0x20bc, 0x5154, "Beitong KP40D Controller", 0, XTYPE_XBOX360, FLAG_FORCE_INIT },
+	{ 0x20bc, 0x5155, "Beitong KP40D Controller", 0, XTYPE_XBOX360, FLAG_FORCE_INIT },
+	{ 0x20bc, 0x5158, "Beitong KP20D Controller", 0, XTYPE_XBOX360, FLAG_FORCE_INIT },
+	{ 0x20bc, 0x5159, "Beitong KP20D Controller", 0, XTYPE_XBOX360, FLAG_FORCE_INIT },
+	{ 0x20bc, 0x515b, "Beitong KP40D Controller (White)", 0, XTYPE_XBOX360, FLAG_FORCE_INIT },
+	{ 0x20bc, 0x515c, "Beitong KP40D Controller (White)", 0, XTYPE_XBOX360, FLAG_FORCE_INIT },
+	{ 0x20bc, 0x515d, "Beitong KP40F Controller (White)", 0, XTYPE_XBOX360, FLAG_FORCE_INIT },
+	{ 0x20bc, 0x515e, "Beitong KP40F Controller (White)", 0, XTYPE_XBOX360, FLAG_FORCE_INIT },
+	{ 0x20bc, 0x515f, "Beitong KP70A Controller", 0, XTYPE_XBOX360, FLAG_FORCE_INIT },
+	{ 0x20bc, 0x5160, "Beitong KP70A Controller", 0, XTYPE_XBOX360, FLAG_FORCE_INIT },
+	{ 0x20bc, 0x5169, "Beitong KP40F Controller (Black)", 0, XTYPE_XBOX360, FLAG_FORCE_INIT },
+	{ 0x20bc, 0x516a, "Beitong KP40F Controller (Black)", 0, XTYPE_XBOX360, FLAG_FORCE_INIT },
 	{ 0x20d6, 0x2001, "BDA Xbox Series X Wired Controller", 0, XTYPE_XBOXONE },
 	{ 0x20d6, 0x2009, "PowerA Enhanced Wired Controller for Xbox Series X|S", 0, XTYPE_XBOXONE },
 	{ 0x20d6, 0x2064, "PowerA Wired Controller for Xbox", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
@@ -562,6 +591,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOX360_VENDOR(0x1a86),		/* Nanjing Qinheng Microelectronics (WCH) */
 	XPAD_XBOX360_VENDOR(0x1bad),		/* Harmonix Rock Band guitar and drums */
 	XPAD_XBOX360_VENDOR(0x1ee9),		/* ZOTAC Technology Limited */
+	XPAD_XBOX360_VENDOR(0x20bc),		/* ShanWan or Beitong controllers */
 	XPAD_XBOX360_VENDOR(0x20d6),		/* PowerA controllers */
 	XPAD_XBOXONE_VENDOR(0x20d6),		/* PowerA controllers */
 	XPAD_XBOX360_VENDOR(0x2345),		/* Machenike Controllers */
@@ -724,6 +754,15 @@ static const u8 xboxone_rumbleend_init[] = {
 	0x00, GIP_MOTOR_ALL, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
 };
 
+/*
+ * Beitong controllers require a specific sequence of
+ * acknowledge and probe packets during initialization to
+ * enter the XINPUT mode correctly.
+ */
+static const u8 btp_ack_probe_packet[] = { GIP_CMD_ACK, 0x3, GIP_SEQ0 };
+static const u8 btp_probe_response_packet[] = { GIP_CMD_ANNOUNCE, 0x8,
+						GIP_SEQ0 };
+
 /*
  * This specifies the selection of init packets that a gamepad
  * will be sent on init *and* the order in which they will be
@@ -739,6 +778,10 @@ static const struct xboxone_init_packet xboxone_init_packets[] = {
 	XBOXONE_INIT_PKT(0x045e, 0x0b00, extra_input_packet_init),
 	XBOXONE_INIT_PKT(0x0000, 0x0000, xboxone_led_on),
 	XBOXONE_INIT_PKT(0x0000, 0x0000, xboxone_auth_done),
+	XBOXONE_INIT_PKT(0x20bc, 0x0000, btp_ack_probe_packet),
+	XBOXONE_INIT_PKT(0x20bc, 0x0000, btp_probe_response_packet),
+	XBOXONE_INIT_PKT(0x20bc, 0x0000, btp_ack_probe_packet),
+	XBOXONE_INIT_PKT(0x20bc, 0x0000, btp_ack_probe_packet),
 	XBOXONE_INIT_PKT(0x24c6, 0x541a, xboxone_rumblebegin_init),
 	XBOXONE_INIT_PKT(0x24c6, 0x542a, xboxone_rumblebegin_init),
 	XBOXONE_INIT_PKT(0x24c6, 0x543a, xboxone_rumblebegin_init),
@@ -800,6 +843,7 @@ struct usb_xpad {
 	time64_t mode_btn_down_ts;
 	bool delay_init;		/* init packets should be delayed */
 	bool delayed_init_done;
+	bool force_init;		/* send init packets even if it is not a xbox one device */
 };
 
 static int xpad_init_input(struct usb_xpad *xpad);
@@ -1275,7 +1319,7 @@ static bool xpad_prepare_next_init_packet(struct usb_xpad *xpad)
 {
 	const struct xboxone_init_packet *init_packet;
 
-	if (xpad->xtype != XTYPE_XBOXONE)
+	if (xpad->xtype != XTYPE_XBOXONE && !xpad->force_init)
 		return false;
 
 	/*
@@ -1814,6 +1858,15 @@ static int xpad_start_input(struct usb_xpad *xpad)
 		 */
 		u8 dummy[20];
 
+		/*
+		 * Some third-party Xbox 360-style controllers
+		 * require sending Xbox One messages to finish initialization.
+		 */
+		{
+			guard(spinlock_irqsave)(&xpad->odata_lock);
+			xpad_prepare_next_init_packet(xpad);
+		}
+
 		error = usb_control_msg_recv(xpad->udev, 0,
 					     /* bRequest */ 0x01,
 					     /* bmRequestType */
@@ -2104,6 +2157,8 @@ static int xpad_probe(struct usb_interface *intf, const struct usb_device_id *id
 	xpad->name = xpad_device[i].name;
 	if (xpad_device[i].flags & FLAG_DELAY_INIT)
 		xpad->delay_init = true;
+	if (xpad_device[i].flags & FLAG_FORCE_INIT)
+		xpad->force_init = true;
 
 	xpad->packet_type = PKT_XB;
 	INIT_WORK(&xpad->work, xpad_presence_work);
-- 
2.52.0


