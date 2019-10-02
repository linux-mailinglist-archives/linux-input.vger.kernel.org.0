Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F016C4AE7
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2019 11:57:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbfJBJ5k (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Oct 2019 05:57:40 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:36659 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbfJBJ5j (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Oct 2019 05:57:39 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MGQ85-1iLKYf3qhR-00GoKh; Wed, 02 Oct 2019 11:57:37 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Enrico Weigelt <info@metux.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] input: ixp4xx-beeper: include linux/io.h
Date:   Wed,  2 Oct 2019 11:57:21 +0200
Message-Id: <20191002095736.1297224-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:24fZ4EDvS5qx6pIzugbo6RzU55jRwuVGHQsFc+PVcaIgImsatsY
 CL+nFs5G8PoVyOOWQjk2//NELf7ZyC873zG3wdpSVRIT/Mz90xfu6cGTBfpIpE5xhMb1PN7
 W2A+nt671+6ZvRxYFglfF+4E2r9S+O/FijgdWcY5rGr+KUtJqcX8ojoOjaxqT021DG26a80
 ijUJiYbMrsPuTSvZ3bgZQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JWhXE4mWqiE=:gxmht7zMm8E6LXBuogV2Ei
 HRtLKbrK3gqh4F+JmtWj3t4YCIfQjDegHX2+zWqjjvzfbaj8crze4B7lOuqkviXU6Ok2m9JNw
 H/KFvFnOLWAccQSBDU+YnYSb8G3CR8dXyFTW7JgAOUHcrBaFTqTWdxaGY2e0h60rk3BBXP4aK
 xUx4jRbIUQHAJqIkGL7z4DmW0uBQtt4ueB1Z3ffJYHKQHytZBVWAP5a644SVIHvXhqfvKAI8i
 0BqOOWBdCAWVqXXwrlBf9iRSlp9l37jl/T+qfxKR3Yuz2XXhC9Y5bsWQaEarN459lIOUuqi4Y
 B0O3ENCsuyetgw3FNxQioxqh64J+Nqacx/7DmR37/bgiDQZ0Zli9NxqGI8BOgNInJ70cLfJUM
 TNYkYZfzO8y6McxBhTjR76P/tvO46HvDR2o31h+OWj4mC426B1TwKx+YXrs0a/F7RV2EljlSg
 S8POplYjyFz0I15e3cJwKkc5RpbvjY8HLi6OenuAWqccFiHDOBNPr7bz9mblB6MpE1jrU12cE
 Agab8V+PEw/mZBOuqrQaA7fNEpkDjnl5DoefCUuEnYq59vnOR7A5PCrHHINvn05rhOdlq0yrk
 pqE+pKWe9L0Uz71WMG0Ie1JFFFvbgM3IbO+ywRsWK/ttcD/JjMJZHprTgY0RMyQAezp7m+zao
 BR9u5gubdSZUQ4ApCcbkBdS7z6Gn3/LsvJlcGmf3OeviR/5sPoxMSGBc1+pRo8PEd5nkQHYOB
 jplhjYxvK1s297X8fbAerQSuExLHFfKut2AWmsSCSmN/60QSQTM+UvXaXTUeJyloh/AGE+eix
 +fCjIYlYAYec+u66VYt5quqdqjOAsvguQQ/NOLyFK3BaMZYT/i4yZiHc0lb25H8bY6seA2e2q
 SShwUVY8pKbmDdlxh1Vw==
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

asm/io.h may not be included implicitly, causing a rare
randconfig build error:

drivers/input/misc/ixp4xx-beeper.c:48:3: error: implicit declaration of function '__raw_writel' [-Werror,-Wimplicit-function-declaration]
                __raw_writel((count & ~IXP4XX_OST_RELOAD_MASK) | IXP4XX_OST_ENABLE,

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/input/misc/ixp4xx-beeper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/misc/ixp4xx-beeper.c b/drivers/input/misc/ixp4xx-beeper.c
index 764cf21c0aaf..456325f0ea59 100644
--- a/drivers/input/misc/ixp4xx-beeper.c
+++ b/drivers/input/misc/ixp4xx-beeper.c
@@ -17,6 +17,7 @@
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
 #include <linux/gpio.h>
+#include <linux/io.h>
 
 MODULE_AUTHOR("Alessandro Zummo <a.zummo@towertech.it>");
 MODULE_DESCRIPTION("ixp4xx beeper driver");
-- 
2.20.0

