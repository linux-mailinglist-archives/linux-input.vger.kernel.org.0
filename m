Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 566037179A
	for <lists+linux-input@lfdr.de>; Tue, 23 Jul 2019 13:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730916AbfGWL7O (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Jul 2019 07:59:14 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:55491 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728418AbfGWL7O (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Jul 2019 07:59:14 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MysFQ-1ibVxR2CRe-00vu8B; Tue, 23 Jul 2019 13:59:07 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        =?UTF-8?q?Ronald=20Tschal=C3=A4r?= <ronald@innovation.ch>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: Apple SPI keyboard needs CRC16
Date:   Tue, 23 Jul 2019 13:58:45 +0200
Message-Id: <20190723115905.2092687-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+Nui/Ytz0/lbzMzTjMp1follH/EKwjx+N8WDwVIojNAmiBVHBXW
 RznNb5GAt/4FJVrGqTWuyYGx3UCR/kZvUiMFEKgWwf9iPaibgZTRYiY/tYNwNpWYREws6qR
 ooyrwsAe5bEhIQVvLakNmSi3v7ZXZJVx35RFAphSIgzti/32rx8mUlFw1jTI8YSk+IcV3f4
 DDuQdX2QuZJx3OEBWX1WQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jMoeTrnzAhw=:0qAxY3Vr4xYuJbQ+x04cP7
 NB7w3P5aCu+GMpqBzFcmWk1obrOGTF9LcloZ2GGlduTj1oGeg3+474g6Avy2+P0anLIbgBl//
 LDK4ednaOfbWc6obkRo97LxL2g05UsU752L9H3eGNOg5U0LBguPil3OE45U+ppasiPCVEpm4H
 yznY4wN9gobd7oWyobbPf9jvuU+tBBLV7l5yuyHnavkIKmzFjBy4kp8BROkQlURDyq97nbBeP
 wZgD3pURlRoU1gEExTLKsmpyB1NLSnk9Gnr+kizbJ7jd4GNfGDAo4pyWw9CE8jWCfRslffPPP
 4Jygux9l3H6ZCfLDEimxLXv/nXq3dHFxQGf4rLGd0PgZHvFr/rnpzdmseqdvv647TnUsw0vzX
 zU//AcoyrM4F/yuAbVGPnj7jpzOq7PodsgZLZSpeh/y8ReK+fAS72Kl2YsPQ4gqxMYDK9lDLK
 InIJajRchPKDNxL8KiSlUZsevAomAcsO+OwuJcTALRxYQBfpB9rlbthOZ+JoT5BAqVL3NPhGm
 XvLKqod8Fcq5OY1vk6KJlx02x3UgIGKDD5Ha0SLCLujIzMPSX9BNOYnfSPDDiKC9FT6XzcsXv
 x31WHUjsT4Bgz6PiFqZT+HZM47SFdou7j/Np1Q0Ie+BUXVZk9XmSc4lbl3IHRpcMHgyhh5FQc
 abBFZivc7gdXO/8JBww4m3l40ipqE37NN/iAZfoZYoNhYbENhj3j9RmxAsQyEZ+Z2eJkj/+88
 vTwPsjXdXK5JwyonLf4Syc7vHzwWiz+08voKcQ==
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In some rare randconfig builds, CRC16 is disabled, which leads
to a link error:

drivers/input/keyboard/applespi.o: In function `applespi_send_cmd_msg':
applespi.c:(.text+0x449f): undefined reference to `crc16'
drivers/input/keyboard/applespi.o: In function `applespi_verify_crc':
applespi.c:(.text+0x7538): undefined reference to `crc16'

This symbol is meant to be selected for each user in Kconfig,
so do that here as well.

Fixes: 038b1a05eae6 ("Input: add Apple SPI keyboard and trackpad driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/input/keyboard/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 8e9c3ea9d5e7..ebb19e21473e 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -76,6 +76,7 @@ config KEYBOARD_APPLESPI
 	depends on ACPI && EFI
 	depends on SPI
 	depends on X86 || COMPILE_TEST
+	select CRC16
 	help
 	  Say Y here if you are running Linux on any Apple MacBook8,1 or later,
 	  or any MacBookPro13,* or MacBookPro14,*.
-- 
2.20.0

