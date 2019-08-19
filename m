Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD00192596
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2019 15:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727308AbfHSNzV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Aug 2019 09:55:21 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:40752 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726987AbfHSNzU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Aug 2019 09:55:20 -0400
Received: from [123.123.253.197] (helo=localhost.localdomain)
        by youngberry.canonical.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <hui.wang@canonical.com>)
        id 1hzi7x-0003wP-3g; Mon, 19 Aug 2019 13:55:18 +0000
From:   Hui Wang <hui.wang@canonical.com>
To:     linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com
Subject: [PATCH] Input: psmouse - drop all unneeded functions from mouse headers
Date:   Mon, 19 Aug 2019 21:55:00 +0800
Message-Id: <20190819135500.3261-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Recently we had a building error if we enable the MOUSE_PS2_ALPS while
disable the MOUSE_PS2_TRACKPOINT, and was fixed by 49e6979e7e92
("Input: psmouse - fix build error of multiple definition").

We could improve that fix by dropping all unneeded functions from
the header, it is safe to do that since those functions are not
directly called by psmouse-base.c anymore.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 drivers/input/mouse/alps.h         |  9 ---------
 drivers/input/mouse/byd.h          |  9 ---------
 drivers/input/mouse/cypress_ps2.h  |  9 ---------
 drivers/input/mouse/elantech.h     | 13 -------------
 drivers/input/mouse/hgpk.h         |  8 --------
 drivers/input/mouse/lifebook.h     |  8 --------
 drivers/input/mouse/logips2pp.h    |  5 -----
 drivers/input/mouse/sentelic.h     |  9 ---------
 drivers/input/mouse/touchkit_ps2.h |  6 ------
 drivers/input/mouse/trackpoint.h   |  6 ------
 drivers/input/mouse/vmmouse.h      |  9 ---------
 11 files changed, 91 deletions(-)

diff --git a/drivers/input/mouse/alps.h b/drivers/input/mouse/alps.h
index f4bab629739c..74ad10327c48 100644
--- a/drivers/input/mouse/alps.h
+++ b/drivers/input/mouse/alps.h
@@ -326,15 +326,6 @@ struct alps_data {
 #ifdef CONFIG_MOUSE_PS2_ALPS
 int alps_detect(struct psmouse *psmouse, bool set_properties);
 int alps_init(struct psmouse *psmouse);
-#else
-inline int alps_detect(struct psmouse *psmouse, bool set_properties)
-{
-	return -ENOSYS;
-}
-inline int alps_init(struct psmouse *psmouse)
-{
-	return -ENOSYS;
-}
 #endif /* CONFIG_MOUSE_PS2_ALPS */
 
 #endif
diff --git a/drivers/input/mouse/byd.h b/drivers/input/mouse/byd.h
index 8cb90d904186..6f0d16708004 100644
--- a/drivers/input/mouse/byd.h
+++ b/drivers/input/mouse/byd.h
@@ -5,15 +5,6 @@
 #ifdef CONFIG_MOUSE_PS2_BYD
 int byd_detect(struct psmouse *psmouse, bool set_properties);
 int byd_init(struct psmouse *psmouse);
-#else
-static inline int byd_detect(struct psmouse *psmouse, bool set_properties)
-{
-	return -ENOSYS;
-}
-static inline int byd_init(struct psmouse *psmouse)
-{
-	return -ENOSYS;
-}
 #endif /* CONFIG_MOUSE_PS2_BYD */
 
 #endif /* _BYD_H */
diff --git a/drivers/input/mouse/cypress_ps2.h b/drivers/input/mouse/cypress_ps2.h
index 1eaddd818004..aee5a400771b 100644
--- a/drivers/input/mouse/cypress_ps2.h
+++ b/drivers/input/mouse/cypress_ps2.h
@@ -173,15 +173,6 @@ struct cytp_data {
 #ifdef CONFIG_MOUSE_PS2_CYPRESS
 int cypress_detect(struct psmouse *psmouse, bool set_properties);
 int cypress_init(struct psmouse *psmouse);
-#else
-inline int cypress_detect(struct psmouse *psmouse, bool set_properties)
-{
-	return -ENOSYS;
-}
-inline int cypress_init(struct psmouse *psmouse)
-{
-	return -ENOSYS;
-}
 #endif /* CONFIG_MOUSE_PS2_CYPRESS */
 
 #endif  /* _CYPRESS_PS2_H */
diff --git a/drivers/input/mouse/elantech.h b/drivers/input/mouse/elantech.h
index 46343998522b..a5631f120f60 100644
--- a/drivers/input/mouse/elantech.h
+++ b/drivers/input/mouse/elantech.h
@@ -189,27 +189,14 @@ int elantech_detect(struct psmouse *psmouse, bool set_properties);
 int elantech_init_ps2(struct psmouse *psmouse);
 int elantech_init(struct psmouse *psmouse);
 #else
-static inline int elantech_detect(struct psmouse *psmouse, bool set_properties)
-{
-	return -ENOSYS;
-}
 static inline int elantech_init(struct psmouse *psmouse)
 {
 	return -ENOSYS;
 }
-static inline int elantech_init_ps2(struct psmouse *psmouse)
-{
-	return -ENOSYS;
-}
 #endif /* CONFIG_MOUSE_PS2_ELANTECH */
 
 #if defined(CONFIG_MOUSE_PS2_ELANTECH_SMBUS)
 int elantech_init_smbus(struct psmouse *psmouse);
-#else
-static inline int elantech_init_smbus(struct psmouse *psmouse)
-{
-	return -ENOSYS;
-}
 #endif /* CONFIG_MOUSE_PS2_ELANTECH_SMBUS */
 
 #endif
diff --git a/drivers/input/mouse/hgpk.h b/drivers/input/mouse/hgpk.h
index 98b7b384229b..a498b9d60a5a 100644
--- a/drivers/input/mouse/hgpk.h
+++ b/drivers/input/mouse/hgpk.h
@@ -55,14 +55,6 @@ int hgpk_init(struct psmouse *psmouse);
 static inline void hgpk_module_init(void)
 {
 }
-static inline int hgpk_detect(struct psmouse *psmouse, bool set_properties)
-{
-	return -ENODEV;
-}
-static inline int hgpk_init(struct psmouse *psmouse)
-{
-	return -ENODEV;
-}
 #endif
 
 #endif
diff --git a/drivers/input/mouse/lifebook.h b/drivers/input/mouse/lifebook.h
index 573f2ca1983d..546c1427ab03 100644
--- a/drivers/input/mouse/lifebook.h
+++ b/drivers/input/mouse/lifebook.h
@@ -16,14 +16,6 @@ int lifebook_init(struct psmouse *psmouse);
 static inline void lifebook_module_init(void)
 {
 }
-static inline int lifebook_detect(struct psmouse *psmouse, bool set_properties)
-{
-	return -ENOSYS;
-}
-static inline int lifebook_init(struct psmouse *psmouse)
-{
-	return -ENOSYS;
-}
 #endif
 
 #endif
diff --git a/drivers/input/mouse/logips2pp.h b/drivers/input/mouse/logips2pp.h
index 5f9344135f70..e90d998f1e13 100644
--- a/drivers/input/mouse/logips2pp.h
+++ b/drivers/input/mouse/logips2pp.h
@@ -10,11 +10,6 @@
 
 #ifdef CONFIG_MOUSE_PS2_LOGIPS2PP
 int ps2pp_detect(struct psmouse *psmouse, bool set_properties);
-#else
-static inline int ps2pp_detect(struct psmouse *psmouse, bool set_properties)
-{
-	return -ENOSYS;
-}
 #endif /* CONFIG_MOUSE_PS2_LOGIPS2PP */
 
 #endif
diff --git a/drivers/input/mouse/sentelic.h b/drivers/input/mouse/sentelic.h
index dc88a93adf85..ac2fc0967bbe 100644
--- a/drivers/input/mouse/sentelic.h
+++ b/drivers/input/mouse/sentelic.h
@@ -109,15 +109,6 @@ struct fsp_data {
 #ifdef CONFIG_MOUSE_PS2_SENTELIC
 extern int fsp_detect(struct psmouse *psmouse, bool set_properties);
 extern int fsp_init(struct psmouse *psmouse);
-#else
-static inline int fsp_detect(struct psmouse *psmouse, bool set_properties)
-{
-	return -ENOSYS;
-}
-static inline int fsp_init(struct psmouse *psmouse)
-{
-	return -ENOSYS;
-}
 #endif
 
 #endif	/* __KERNEL__ */
diff --git a/drivers/input/mouse/touchkit_ps2.h b/drivers/input/mouse/touchkit_ps2.h
index 5acb76464a5b..b072b30ffa44 100644
--- a/drivers/input/mouse/touchkit_ps2.h
+++ b/drivers/input/mouse/touchkit_ps2.h
@@ -11,12 +11,6 @@
 
 #ifdef CONFIG_MOUSE_PS2_TOUCHKIT
 int touchkit_ps2_detect(struct psmouse *psmouse, bool set_properties);
-#else
-static inline int touchkit_ps2_detect(struct psmouse *psmouse,
-				      bool set_properties)
-{
-	return -ENOSYS;
-}
 #endif /* CONFIG_MOUSE_PS2_TOUCHKIT */
 
 #endif
diff --git a/drivers/input/mouse/trackpoint.h b/drivers/input/mouse/trackpoint.h
index 77110f3ec21d..d603bd8bdc5c 100644
--- a/drivers/input/mouse/trackpoint.h
+++ b/drivers/input/mouse/trackpoint.h
@@ -157,12 +157,6 @@ struct trackpoint_data {
 
 #ifdef CONFIG_MOUSE_PS2_TRACKPOINT
 int trackpoint_detect(struct psmouse *psmouse, bool set_properties);
-#else
-static inline int trackpoint_detect(struct psmouse *psmouse,
-				    bool set_properties)
-{
-	return -ENOSYS;
-}
 #endif /* CONFIG_MOUSE_PS2_TRACKPOINT */
 
 #endif /* _TRACKPOINT_H */
diff --git a/drivers/input/mouse/vmmouse.h b/drivers/input/mouse/vmmouse.h
index 774549a12930..dcdeb4f95ceb 100644
--- a/drivers/input/mouse/vmmouse.h
+++ b/drivers/input/mouse/vmmouse.h
@@ -13,15 +13,6 @@
 
 int vmmouse_detect(struct psmouse *psmouse, bool set_properties);
 int vmmouse_init(struct psmouse *psmouse);
-#else
-static inline int vmmouse_detect(struct psmouse *psmouse, bool set_properties)
-{
-	return -ENOSYS;
-}
-static inline int vmmouse_init(struct psmouse *psmouse)
-{
-	return -ENOSYS;
-}
 #endif
 
 #endif
-- 
2.17.1

