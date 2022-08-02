Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0999D5882BD
	for <lists+linux-input@lfdr.de>; Tue,  2 Aug 2022 21:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbiHBTnj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Aug 2022 15:43:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231775AbiHBTng (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Aug 2022 15:43:36 -0400
X-Greylist: delayed 450 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 02 Aug 2022 12:43:32 PDT
Received: from smtp.smtpout.orange.fr (smtp-11.smtpout.orange.fr [80.12.242.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2764452FEB
        for <linux-input@vger.kernel.org>; Tue,  2 Aug 2022 12:43:32 -0700 (PDT)
Received: from pop-os.home ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id IxgNoBmAN9qatIxgNogHcQ; Tue, 02 Aug 2022 21:36:00 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Tue, 02 Aug 2022 21:36:00 +0200
X-ME-IP: 90.11.190.129
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Ping Cheng <ping.cheng@wacom.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-input@vger.kernel.org
Subject: [PATCH v2] HID: wacom: Simplify comments
Date:   Tue,  2 Aug 2022 21:35:57 +0200
Message-Id: <7eec2e24a231510577647853a32bddb89a762128.1659468931.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Remove a left-over from commit 2874c5fd2842 ("treewide: Replace GPLv2
boilerplate/reference with SPDX - rule 152").
An empty comment block can be removed.

While at it remove, also remove what is supposed to be the path/filename of
the file.
This is really low value... and wrong since commit 471d17148c8b
("Input: wacom - move the USB (now hid) Wacom driver in drivers/hid")

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
v1 -> v2
  - add wacom.h, wacom_wac.c, wacom_wac.h
---
 drivers/hid/wacom.h     | 5 +----
 drivers/hid/wacom_sys.c | 5 -----
 drivers/hid/wacom_wac.c | 5 -----
 drivers/hid/wacom_wac.h | 4 +---
 4 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/hid/wacom.h b/drivers/hid/wacom.h
index 3f8b24a57014..4da50e19808e 100644
--- a/drivers/hid/wacom.h
+++ b/drivers/hid/wacom.h
@@ -1,7 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
- * drivers/input/tablet/wacom.h
- *
  *  USB Wacom tablet support
  *
  *  Copyright (c) 2000-2004 Vojtech Pavlik	<vojtech@ucw.cz>
@@ -78,10 +76,9 @@
  *                 - integration of the Bluetooth devices
  */
 
-/*
- */
 #ifndef WACOM_H
 #define WACOM_H
+
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/module.h>
diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 194a2e327591..21612fdae9c3 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -1,13 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * drivers/input/tablet/wacom_sys.c
- *
  *  USB Wacom tablet support - system specific code
  */
 
-/*
- */
-
 #include "wacom_wac.h"
 #include "wacom.h"
 #include <linux/input/mt.h>
diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index d049239256a2..1bbd24ebacad 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -1,13 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * drivers/input/tablet/wacom_wac.c
- *
  *  USB Wacom tablet support - Wacom specific code
  */
 
-/*
- */
-
 #include "wacom_wac.h"
 #include "wacom.h"
 #include <linux/input/mt.h>
diff --git a/drivers/hid/wacom_wac.h b/drivers/hid/wacom_wac.h
index fef1538005b5..5ca6c06d143b 100644
--- a/drivers/hid/wacom_wac.h
+++ b/drivers/hid/wacom_wac.h
@@ -1,7 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * drivers/input/tablet/wacom_wac.h
- */
+
 #ifndef WACOM_WAC_H
 #define WACOM_WAC_H
 
-- 
2.34.1

