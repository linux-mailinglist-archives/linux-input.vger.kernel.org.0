Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDCBA30E8FC
	for <lists+linux-input@lfdr.de>; Thu,  4 Feb 2021 01:54:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233991AbhBDAyK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Feb 2021 19:54:10 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38146 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234521AbhBDAyK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 3 Feb 2021 19:54:10 -0500
Received: from localhost.localdomain (unknown [IPv6:2607:f2c0:f00e:4a00:5c27:6477:b42b:3c29])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: tester)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5684E1F45523;
        Thu,  4 Feb 2021 00:53:25 +0000 (GMT)
From:   =?UTF-8?q?Olivier=20Cr=C3=AAte?= <olivier.crete@collabora.com>
To:     linux-input@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH] Input: xpad - Add support for PowerA Enhanced Wired Controller for Xbox Series X|S
Date:   Wed,  3 Feb 2021 19:53:18 -0500
Message-Id: <20210204005318.615647-1-olivier.crete@collabora.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Olivier Crête <olivier.crete@ocrete.ca>

Signed-off-by: Olivier Crête <olivier.crete@ocrete.ca>
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 0687f0ed60b8..742a17c3ea3e 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -296,6 +296,7 @@ static const struct xpad_device {
 	{ 0x1bad, 0xfa01, "MadCatz GamePad", 0, XTYPE_XBOX360 },
 	{ 0x1bad, 0xfd00, "Razer Onza TE", 0, XTYPE_XBOX360 },
 	{ 0x1bad, 0xfd01, "Razer Onza", 0, XTYPE_XBOX360 },
+	{ 0x20d6, 0x2009, "PowerA Enhanced Wired Controller for Xbox Series X|S", 0, XTYPE_XBOXONE },
 	{ 0x24c6, 0x5000, "Razer Atrox Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5300, "PowerA MINI PROEX Controller", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5303, "Xbox Airflo wired controller", 0, XTYPE_XBOX360 },
@@ -429,6 +430,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOX360_VENDOR(0x162e),		/* Joytech X-Box 360 controllers */
 	XPAD_XBOX360_VENDOR(0x1689),		/* Razer Onza */
 	XPAD_XBOX360_VENDOR(0x1bad),		/* Harminix Rock Band Guitar and Drums */
+	XPAD_XBOXONE_VENDOR(0x20d6),		/* PowerA Controllers */
 	XPAD_XBOX360_VENDOR(0x24c6),		/* PowerA Controllers */
 	XPAD_XBOXONE_VENDOR(0x24c6),		/* PowerA Controllers */
 	{ }
-- 
2.29.2

