Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22800160807
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2020 03:19:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbgBQCTo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 16 Feb 2020 21:19:44 -0500
Received: from inva020.nxp.com ([92.121.34.13]:42300 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726183AbgBQCTo (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 16 Feb 2020 21:19:44 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5EC701A1E03;
        Mon, 17 Feb 2020 03:19:42 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 2240C1A0018;
        Mon, 17 Feb 2020 03:19:37 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 8AF0B402AB;
        Mon, 17 Feb 2020 10:19:30 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     dmitry.torokhov@gmail.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        robh@kernel.org, linux-input@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH] input: keyboard: imx_sc_key: Remove unused includes
Date:   Mon, 17 Feb 2020 10:13:56 +0800
Message-Id: <1581905636-25830-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There is nothing in use from device.h/init.h/property.h, remove them.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/input/keyboard/imx_sc_key.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/input/keyboard/imx_sc_key.c b/drivers/input/keyboard/imx_sc_key.c
index 5379952..193c534 100644
--- a/drivers/input/keyboard/imx_sc_key.c
+++ b/drivers/input/keyboard/imx_sc_key.c
@@ -4,9 +4,7 @@
  */
 
 #include <linux/err.h>
-#include <linux/device.h>
 #include <linux/firmware/imx/sci.h>
-#include <linux/init.h>
 #include <linux/input.h>
 #include <linux/interrupt.h>
 #include <linux/jiffies.h>
@@ -14,7 +12,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/property.h>
 
 #define DEBOUNCE_TIME				30
 #define REPEAT_INTERVAL				60
-- 
2.7.4

