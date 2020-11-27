Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FA0E2C6B8C
	for <lists+linux-input@lfdr.de>; Fri, 27 Nov 2020 19:27:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730675AbgK0SZo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 Nov 2020 13:25:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726250AbgK0SZn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 Nov 2020 13:25:43 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73A34C0613D1
        for <linux-input@vger.kernel.org>; Fri, 27 Nov 2020 10:25:43 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id k14so6540020wrn.1
        for <linux-input@vger.kernel.org>; Fri, 27 Nov 2020 10:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zvREU9gheVXcatn+iRSJximCTgwJ0WTNqgHIZ1vio58=;
        b=LD3caOeV74sw0O/siBo9V6qijPNI/o5x/7dz/gdjgtUI24Wrl1NPGREEMnBBRweuVC
         Yyc3/t9DYRPbBwOC6+iYjIyS7Nv08EwvLabyc2EfvMjJDdetMJK3plP5/owPX1/UsXAp
         So2VAGQeGGJnS2YyVXhEQxXHApLSBfkXH/ZxCQISRCp0IOe2yCwKBkFR2pxmyFndaOci
         lXYQpOMTZIgk97LFwrRi4WHfpO4WTEJkZqYxu7htJcdzR5/f4qg4OrnYOPs5COVRlp7k
         eJP1843rDNpoMgrAC40+FuwBto064vtiaNZsZfG8iSGvl+nOV0mhKBAINzEKiD5i7SKn
         fajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zvREU9gheVXcatn+iRSJximCTgwJ0WTNqgHIZ1vio58=;
        b=g8Igx8OnNKKL/P4bJECZ8L5QrKDp6ULwuJfm4IjCC4aybwQRJuKR9a0ZsYkG2FkUF4
         nDzpWu/WAXDDAJvC34QkCilVjLGuXKmGXAq447GtmuyUVA8SXl32OUZtTm3kpZ3E8svW
         dQT5rPYslhNHncC20IOa4B3Z1+02wA4hsSG2gAp5vbczuNxSwUGrWVj/RemxMhEWqUYF
         vGOuS5F/5QAcraP09Qflp8XGhAlJk41bLSya8hfooFzTRa7mtn+7fhqzPBviZjq9oxZU
         VmOdqld89XCMxvlZWb2wVnwQMJqaL4LpSWilAwT7RR8CG9Tqt9SsPi1CVxVVpKMudFne
         svEw==
X-Gm-Message-State: AOAM531Lpg1uYos4TA7gwjfV54eM4J8Fm+yhzPz81ILksFujEjSLclnn
        r+LAs9WKNCP+Qw5NgfElqRq3x27hYbw=
X-Google-Smtp-Source: ABdhPJxs52tNfI1GwmVtTlI7iNtfKlGPkXDNtuyp3hcxvQKFtLvPJu94u8lQx5kTOsM+fxAXJpmnMQ==
X-Received: by 2002:a5d:4604:: with SMTP id t4mr12116286wrq.411.1606501542185;
        Fri, 27 Nov 2020 10:25:42 -0800 (PST)
Received: from morpheus.home.roving-it.com (f.c.9.1.f.e.c.d.1.e.0.0.2.b.5.5.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:55b2:e1:dcef:19cf])
        by smtp.googlemail.com with ESMTPSA id l24sm16312405wrb.28.2020.11.27.10.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 10:25:41 -0800 (PST)
From:   Peter Robinson <pbrobinson@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] Input: touchscreen: Move serio based touchscreens from select to depend on
Date:   Fri, 27 Nov 2020 18:25:39 +0000
Message-Id: <20201127182539.212763-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Most of the touchscreens use the 'depend on' option for bus dependencies
rather than explicitly selecting them so use this option for the serio
devices too to make it easier to generally disable SERIO as a whole.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/input/touchscreen/Kconfig | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index cc18f54ea887..0f019c5d4d16 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -315,7 +315,7 @@ config TOUCHSCREEN_DA9052
 
 config TOUCHSCREEN_DYNAPRO
 	tristate "Dynapro serial touchscreen"
-	select SERIO
+	depends on SERIO
 	help
 	  Say Y here if you have a Dynapro serial touchscreen connected to
 	  your system.
@@ -327,7 +327,7 @@ config TOUCHSCREEN_DYNAPRO
 
 config TOUCHSCREEN_HAMPSHIRE
 	tristate "Hampshire serial touchscreen"
-	select SERIO
+	depends on SERIO
 	help
 	  Say Y here if you have a Hampshire serial touchscreen connected to
 	  your system.
@@ -358,7 +358,7 @@ config TOUCHSCREEN_EGALAX
 
 config TOUCHSCREEN_EGALAX_SERIAL
 	tristate "EETI eGalax serial touchscreen"
-	select SERIO
+	depends on SERIO
 	help
 	  Say Y here to enable support for serial connected EETI
 	  eGalax touch panels.
@@ -378,7 +378,7 @@ config TOUCHSCREEN_EXC3000
 
 config TOUCHSCREEN_FUJITSU
 	tristate "Fujitsu serial touchscreen"
-	select SERIO
+	depends on SERIO
 	help
 	  Say Y here if you have the Fujitsu touchscreen (such as one
 	  installed in Lifebook P series laptop) connected to your
@@ -467,7 +467,7 @@ config TOUCHSCREEN_S6SY761
 
 config TOUCHSCREEN_GUNZE
 	tristate "Gunze AHL-51S touchscreen"
-	select SERIO
+	depends on SERIO
 	help
 	  Say Y here if you have the Gunze AHL-51 touchscreen connected to
 	  your system.
@@ -503,7 +503,7 @@ config TOUCHSCREEN_ELAN
 
 config TOUCHSCREEN_ELO
 	tristate "Elo serial touchscreens"
-	select SERIO
+	depends on SERIO
 	help
 	  Say Y here if you have an Elo serial touchscreen connected to
 	  your system.
@@ -515,7 +515,7 @@ config TOUCHSCREEN_ELO
 
 config TOUCHSCREEN_WACOM_W8001
 	tristate "Wacom W8001 penabled serial touchscreen"
-	select SERIO
+	depends on SERIO
 	help
 	  Say Y here if you have an Wacom W8001 penabled serial touchscreen
 	  connected to your system.
@@ -596,7 +596,7 @@ config TOUCHSCREEN_MELFAS_MIP4
 
 config TOUCHSCREEN_MTOUCH
 	tristate "MicroTouch serial touchscreens"
-	select SERIO
+	depends on SERIO
 	help
 	  Say Y here if you have a MicroTouch (3M) serial touchscreen connected to
 	  your system.
@@ -620,7 +620,7 @@ config TOUCHSCREEN_IMX6UL_TSC
 
 config TOUCHSCREEN_INEXIO
 	tristate "iNexio serial touchscreens"
-	select SERIO
+	depends on SERIO
 	help
 	  Say Y here if you have an iNexio serial touchscreen connected to
 	  your system.
@@ -687,7 +687,7 @@ config TOUCHSCREEN_HTCPEN
 
 config TOUCHSCREEN_PENMOUNT
 	tristate "Penmount serial touchscreen"
-	select SERIO
+	depends on SERIO
 	help
 	  Say Y here if you have a Penmount serial touchscreen connected to
 	  your system.
@@ -735,7 +735,7 @@ config TOUCHSCREEN_MIGOR
 
 config TOUCHSCREEN_TOUCHRIGHT
 	tristate "Touchright serial touchscreen"
-	select SERIO
+	depends on SERIO
 	help
 	  Say Y here if you have a Touchright serial touchscreen connected to
 	  your system.
@@ -747,7 +747,7 @@ config TOUCHSCREEN_TOUCHRIGHT
 
 config TOUCHSCREEN_TOUCHWIN
 	tristate "Touchwin serial touchscreen"
-	select SERIO
+	depends on SERIO
 	help
 	  Say Y here if you have a Touchwin serial touchscreen connected to
 	  your system.
@@ -1036,7 +1036,7 @@ config TOUCHSCREEN_USB_EASYTOUCH
 
 config TOUCHSCREEN_TOUCHIT213
 	tristate "Sahara TouchIT-213 touchscreen"
-	select SERIO
+	depends on SERIO
 	help
 	  Say Y here if you have a Sahara TouchIT-213 Tablet PC.
 
@@ -1063,7 +1063,7 @@ config TOUCHSCREEN_TS4800
 
 config TOUCHSCREEN_TSC_SERIO
 	tristate "TSC-10/25/40 serial touchscreen support"
-	select SERIO
+	depends on SERIO
 	help
 	  Say Y here if you have a TSC-10, 25 or 40 serial touchscreen connected
 	  to your system.
-- 
2.28.0

