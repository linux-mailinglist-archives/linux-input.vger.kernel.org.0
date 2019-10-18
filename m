Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A98A5DC933
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2019 17:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727991AbfJRPo0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Oct 2019 11:44:26 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:35545 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408928AbfJRPml (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Oct 2019 11:42:41 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1M7ayR-1iOU0W0GFx-00819k; Fri, 18 Oct 2019 17:42:29 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 27/46] input: touchscreen: mainstone: fix pxa2xx+pxa3xx configuration
Date:   Fri, 18 Oct 2019 17:41:42 +0200
Message-Id: <20191018154201.1276638-27-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191018154052.1276506-1-arnd@arndb.de>
References: <20191018154052.1276506-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Ng/eyI4thlC2GCBRgdpQcO3nmYU5CsaSTwm+I+PB6/L+XERvTt3
 mM+f2NcUCRVt671B1y+gsqqvmpOFOcfe2W3Fv7ZMf6s270ujaqjmTpnZW86HvY4KspXdIL2
 7G4rcVEFd985Q2LZzPjf6lQRJx81j9teHbdRhLAh6nUIfYMLSEHldIIZx0GGCx5wdGX6Nkb
 VF3cjt30YDf01jbjdVmTQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BwtJjcZ6s0M=:VJNJb6LSwdn18+QEAXftWz
 Yc6hA5MFJhCeUC92lhyYkd0l2evj94gw1WsMZXrEak4+MVGInJHGH/sqSH/C61E0r52sAJyJs
 vZnF5oHEkMjf/1t5qtQ55+EMku67tiU8F9Wb30edaMzg3B4SzS/re2gszOcf2AMOchXs87Vss
 KFIEIh248dVRSDa8cGA522jU8mdhOip0vKeImFDtYJ7KZkrAfQUH1g/XdlbYwtuyKhrLAd0d7
 vfIqOnGsvlf/YFxhZMhoufGydFwzrgiTL3twAuH0agB0zsnTvk+N+x2VXYPbpUDgKp8sh8pNs
 yolVUafZdH5uViVeKrT/VqzG8j6cssqk5s41GNgxhsVOIq5nx8DFtL175fENk3Rne1WtVHru7
 iFan/GJQ5E2rmeHbpcQMmlc3+4Yskz6WdqAVe6SqDOL1pYuCCQDcc8OhkgXe5WfBeQXQdEfy8
 16wwvFkIudwbnQVtR5A0o8zkRIlyQHUhRkX4ObQe2ImkUMBokBazMuRhrnLU/062g23+5IX92
 9+KoucPEL1AZA5nEddpsl2YuE7sxIyCMT23TEcJPfw9k2JIWvQkaaZ0vu/0gPNyIHBDztkkK/
 xkP731J42Vex6oKsgi0ufGg0xPDECcwyN0OYOYAPD36VLwOIqpNZFL2JhCm+L+0GPae9SDpKN
 AeTu9qN2Bs1izyk7/OUCYApw6clVtexNA/L9lO0YovOgKMMYxfvxWDX/awGlh9bYtaQ52z3yJ
 0I9oFv+ITx9f83TC6QZ3dIHsjFsq9SNSECoc5u7gS/4lUX/tUiPs0TAWIweAt9wwtykuu7ARC
 8wjaly5zkukSgfPFUT2y0P6+i+lyT/cXG7+eJxS5E9I2G+EqH7G9md3PHeliD57FE0viv6nTV
 XPJYVreGmjEVQN80iRBQ==
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There are two different ways of flushing the ac97 queue
in this driver, selected by a compile time option.

Change this to a runtime selection to make it work when both
are enabled.

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/input/touchscreen/mainstone-wm97xx.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/input/touchscreen/mainstone-wm97xx.c b/drivers/input/touchscreen/mainstone-wm97xx.c
index 87655105ef3a..618c80847d9f 100644
--- a/drivers/input/touchscreen/mainstone-wm97xx.c
+++ b/drivers/input/touchscreen/mainstone-wm97xx.c
@@ -98,25 +98,20 @@ MODULE_PARM_DESC(ac97_touch_slot, "Touch screen data slot AC97 number");
 
 
 /* flush AC97 slot 5 FIFO on pxa machines */
-#ifdef CONFIG_PXA27x
-static void wm97xx_acc_pen_up(struct wm97xx *wm)
-{
-	schedule_timeout_uninterruptible(1);
-
-	while (MISR & (1 << 2))
-		MODR;
-}
-#else
 static void wm97xx_acc_pen_up(struct wm97xx *wm)
 {
 	unsigned int count;
 
 	schedule_timeout_uninterruptible(1);
 
-	for (count = 0; count < 16; count++)
-		MODR;
+	if (cpu_is_pxa27x()) {
+		while (MISR & (1 << 2))
+			MODR;
+	} else if (cpu_is_pxa3xx()) {
+		for (count = 0; count < 16; count++)
+			MODR;
+	}
 }
-#endif
 
 static int wm97xx_acc_pen_down(struct wm97xx *wm)
 {
-- 
2.20.0

