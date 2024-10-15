Return-Path: <linux-input+bounces-7396-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 150C299E01D
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 10:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97FAAB23CCD
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 08:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C918F1AD418;
	Tue, 15 Oct 2024 08:00:47 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657141714C4
	for <linux-input@vger.kernel.org>; Tue, 15 Oct 2024 08:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728979247; cv=none; b=S0fDwFLpo8jnpkVbjwbkCL3/ddiDvc/aXfltLjX8JSTe2fKZo6eglLXerX1kub9A2Qkic8Azj6w95AjIZww+prDtQKlGbXVBXiXaHlJ+AC95nP2J4H+eNOC3b3+U1oCkcJPTYqX2phORNEPIQJP34t5bZ/kQ/E8skaCTYSGsR74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728979247; c=relaxed/simple;
	bh=pmwW+tOs+N5jagoqr7bkdbmCxXTZVTeVRCGFEp4ItqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=R/VuK1G5mgSdug3GK6EhxzY0zVtgcglEt9Jq7UhTQfWtPnNIJX1XYVt7KUj0fvIF1FfSyAMNHmgx5HHW568rCkfmvCuISwBqts4kkaO1Bbpwfd6z1TuP/CtLa+fvCQqc/ESpRUFksGRVObOVPbfx1wFzoeoB4v3BUfEvdifvQ0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.kerkmann@pengutronix.de>)
	id 1t0cTy-0006Ph-Ps; Tue, 15 Oct 2024 10:00:42 +0200
Received: from [2a0a:edc0:0:1101:1d::54] (helo=dude05.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <s.kerkmann@pengutronix.de>)
	id 1t0cTy-001yrn-AM; Tue, 15 Oct 2024 10:00:42 +0200
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.kerkmann@pengutronix.de>)
	id 1t0cTy-006i66-0r;
	Tue, 15 Oct 2024 10:00:42 +0200
From: Stefan Kerkmann <s.kerkmann@pengutronix.de>
Date: Tue, 15 Oct 2024 10:00:30 +0200
Subject: [PATCH] input: xpad: add support for 8BitDo Ultimate 2C Wireless
 Controller
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241015-8bitdo_2c_ultimate_wireless-v1-1-9c9f9db2e995@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAB0hDmcC/x3MQQqDMBAF0KvIrBtIYrTFqxQJar52wKpk0iqId
 2/o8m3eSYLIEGqKkyK+LLwuGeZW0PDqlgmKQzZZbZ3RplKPnlNYvR38Z0787hL8zhEzRFRflm4
 M7l6j0pSHLWLk478/2+v6AYznm8FtAAAA
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Stefan Kerkmann <s.kerkmann@pengutronix.de>
X-Mailer: b4 0.12.4
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.kerkmann@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org

This XBOX360 compatible gamepad uses the new product id 0x310a under the
8BitDo's vendor id 0x2dc8. The change was tested using the gamepad in a
wired and wireless dongle configuration.

Signed-off-by: Stefan Kerkmann <s.kerkmann@pengutronix.de>
---
 drivers/input/joystick/xpad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 4eda18f4f46e3..30b4cca8b69fb 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -373,6 +373,7 @@ static const struct xpad_device {
 	{ 0x294b, 0x3404, "Snakebyte GAMEPAD RGB X", 0, XTYPE_XBOXONE },
 	{ 0x2dc8, 0x2000, "8BitDo Pro 2 Wired Controller fox Xbox", 0, XTYPE_XBOXONE },
 	{ 0x2dc8, 0x3106, "8BitDo Pro 2 Wired Controller", 0, XTYPE_XBOX360 },
+	{ 0x2dc8, 0x310a, "8BitDo Ultimate 2C Wireless Controller", 0, XTYPE_XBOX360 },
 	{ 0x2e24, 0x0652, "Hyperkin Duke X-Box One pad", 0, XTYPE_XBOXONE },
 	{ 0x31e3, 0x1100, "Wooting One", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1200, "Wooting Two", 0, XTYPE_XBOX360 },

---
base-commit: eca631b8fe808748d7585059c4307005ca5c5820
change-id: 20241015-8bitdo_2c_ultimate_wireless-b334fd476e50

Best regards,
-- 
Stefan Kerkmann <s.kerkmann@pengutronix.de>


