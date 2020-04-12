Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC6F1A5DA8
	for <lists+linux-input@lfdr.de>; Sun, 12 Apr 2020 11:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbgDLJHu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Apr 2020 05:07:50 -0400
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:60407 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbgDLJHu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Apr 2020 05:07:50 -0400
Received: from localhost.localdomain ([90.126.162.40])
        by mwinf5d55 with ME
        id Rl7m2200n0scBcy03l7nwK; Sun, 12 Apr 2020 11:07:48 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 12 Apr 2020 11:07:48 +0200
X-ME-IP: 90.126.162.40
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] HID: fix typo in Kconfig
Date:   Sun, 12 Apr 2020 11:07:43 +0200
Message-Id: <20200412090743.8236-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix 2 typos:
   s/Uninterruptable/Uninterruptible/
   s/should't/shouldn't/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/hid/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index c5b0bd5283fa..008bf44bc2c3 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -42,7 +42,7 @@ config HIDRAW
 	---help---
 	Say Y here if you want to support HID devices (from the USB
 	specification standpoint) that aren't strictly user interface
-	devices, like monitor controls and Uninterruptable Power Supplies.
+	devices, like monitor controls and Uninterruptible Power Supplies.
 
 	This module supports these devices separately using a separate
 	event interface on /dev/hidraw.
@@ -1140,7 +1140,7 @@ config HID_SENSOR_CUSTOM_SENSOR
 	  to decide how to interpret these special sensor ids and process in
 	  the user space. Currently some manufacturers are using these ids for
 	  sensor calibration and debugging other sensors. Manufacturers
-	  should't use these special custom sensor ids to export any of the
+	  shouldn't use these special custom sensor ids to export any of the
 	  standard sensors.
 	  Select this config option for custom/generic sensor support.
 
-- 
2.20.1

