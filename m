Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 889F3160840
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2020 03:41:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbgBQClW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 16 Feb 2020 21:41:22 -0500
Received: from inva020.nxp.com ([92.121.34.13]:38262 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726183AbgBQClW (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 16 Feb 2020 21:41:22 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A94631A1E30;
        Mon, 17 Feb 2020 03:41:20 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3EE1C1A1E64;
        Mon, 17 Feb 2020 03:41:17 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id B7FEC402A7;
        Mon, 17 Feb 2020 10:41:12 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     dmitry.torokhov@gmail.com, swboyd@chromium.org, robin@protonic.nl,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH] input: keyboard: snvs_pwrkey: Remove unused includes
Date:   Mon, 17 Feb 2020 10:35:39 +0800
Message-Id: <1581906939-26163-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There is nothing in use from device.h/init.h/of_address.h, remove them.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/input/keyboard/snvs_pwrkey.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboard/snvs_pwrkey.c
index 2f5e3ab..9e1e855 100644
--- a/drivers/input/keyboard/snvs_pwrkey.c
+++ b/drivers/input/keyboard/snvs_pwrkey.c
@@ -3,9 +3,7 @@
 // Driver for the IMX SNVS ON/OFF Power Key
 // Copyright (C) 2015 Freescale Semiconductor, Inc. All Rights Reserved.
 
-#include <linux/device.h>
 #include <linux/err.h>
-#include <linux/init.h>
 #include <linux/input.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -13,7 +11,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/pm_wakeirq.h>
 #include <linux/mfd/syscon.h>
-- 
2.7.4

