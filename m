Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 062BA175604
	for <lists+linux-input@lfdr.de>; Mon,  2 Mar 2020 09:32:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727131AbgCBIcW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Mar 2020 03:32:22 -0500
Received: from inva020.nxp.com ([92.121.34.13]:38532 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726758AbgCBIcV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 2 Mar 2020 03:32:21 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 046361A0F79;
        Mon,  2 Mar 2020 09:32:20 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 55B6C1A0F83;
        Mon,  2 Mar 2020 09:32:14 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id B3F78402A7;
        Mon,  2 Mar 2020 16:32:07 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     dmitry.torokhov@gmail.com, m.felsch@pengutronix.de,
        andriy.shevchenko@linux.intel.com, arnd@arndb.de, robh@kernel.org,
        ping.bai@nxp.com, ronald@innovation.ch, krzk@kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH] input: keyboard: imx_keypad: add COMPILE_TEST support
Date:   Mon,  2 Mar 2020 16:26:13 +0800
Message-Id: <1583137573-16628-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add COMPILE_TEST support to imx_keypad driver for better compile
testing coverage.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/input/keyboard/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 4706ff0..9709137 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -457,7 +457,7 @@ config KEYBOARD_SNVS_PWRKEY
 
 config KEYBOARD_IMX
 	tristate "IMX keypad support"
-	depends on ARCH_MXC
+	depends on ARCH_MXC || COMPILE_TEST
 	select INPUT_MATRIXKMAP
 	help
 	  Enable support for IMX keypad port.
-- 
2.7.4

