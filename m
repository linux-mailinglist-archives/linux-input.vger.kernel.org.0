Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E737556D4D9
	for <lists+linux-input@lfdr.de>; Mon, 11 Jul 2022 08:43:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbiGKGnH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 Jul 2022 02:43:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiGKGnH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 Jul 2022 02:43:07 -0400
Received: from m15114.mail.126.com (m15114.mail.126.com [220.181.15.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 48DDC1A053
        for <linux-input@vger.kernel.org>; Sun, 10 Jul 2022 23:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=so5Ic
        bU3ac0ygCm2Qd/X6QTWxsq0urSOitzBaBvSCjg=; b=qZRPbTyqqjw5WM0jtNUsu
        yFNOTq6oqi2JK5rtwvvnIMXXiRodyeYPFmdzSMNRx1BJHLV6PZ7HIznkxfrPpgzM
        89QUGcZ128l42mY3NE/piYnXo34HEm1mwL3UzziztoJbI3G7FjfAPQwxduL9ptR0
        nUZYk04JHT32Jgsq50rVUU=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp7 (Coremail) with SMTP id DsmowAB3h_N0xstioD7sEg--.22701S2;
        Mon, 11 Jul 2022 14:43:02 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     dmitry.torokhov@gmail.com, windhl@126.com,
        linux-input@vger.kernel.org
Subject: [PATCH v2] input: serio: i8042-sparcio.h: Fix refcount leak bug
Date:   Mon, 11 Jul 2022 14:43:00 +0800
Message-Id: <20220711064300.358757-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsmowAB3h_N0xstioD7sEg--.22701S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFyrurWUXrWftF43JF1rCrg_yoW8tFy7pF
        WrJFWayr15KFs3KasFkw1UZ3sYqw4kKwnruryfGw1rZws8Zr1Yvr1FgFyYvF18ArW5ua45
        Ja10vrs5KF4UXFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zE1xR9UUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi7RY7F1pEAYID5QAAss
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In i8042_platform_init() and i8042_platform_exit(), we should call
of_node_put() for the reference 'root' returned by
of_find_node_by_path() which has increased the refcount.

Fixes: f57caaefacc2 ("[SERIO] i8042-sparcio.h: Convert to of_driver framework.")
Signed-off-by: Liang He <windhl@126.com>
---
 changelog:

 v2: use a helper advised by Dmitry
 v1: directly add of_node_put() by:
 https://lore.kernel.org/all/20220619073036.4067872-1-windhl@126.com/

 Patched file has been compiled test with:
 *make CROSS_COMPILE=sparc64-linux-gnu- ARCH=sparc sparc32_defconfig*

 NOTE: this bug has been patched by Yangtao Li but might be with compiled error
 https://lore.kernel.org/all/20181215090846.28009-1-tiny.windzz@gmail.com/

 drivers/input/serio/i8042-sparcio.h | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/input/serio/i8042-sparcio.h b/drivers/input/serio/i8042-sparcio.h
index fce76812843b..c63186decab6 100644
--- a/drivers/input/serio/i8042-sparcio.h
+++ b/drivers/input/serio/i8042-sparcio.h
@@ -103,12 +103,23 @@ static struct platform_driver sparc_i8042_driver = {
 	.remove		= sparc_i8042_remove,
 };
 
-static int __init i8042_platform_init(void)
+static inline bool i8042_is_mr_coffee(void)
 {
 	struct device_node *root = of_find_node_by_path("/");
 	const char *name = of_get_property(root, "name", NULL);
+	bool ret = false;
+
+	if (name && !strcmp(name, "SUNW,JavaStation-1"))
+		ret = true;
+
+	of_node_put(root);
+
+	return ret;
+}
 
-	if (name && !strcmp(name, "SUNW,JavaStation-1")) {
+static int __init i8042_platform_init(void)
+{
+	if (i8042_is_mr_coffee()) {
 		/* Hardcoded values for MrCoffee.  */
 		i8042_kbd_irq = i8042_aux_irq = 13 | 0x20;
 		kbd_iobase = ioremap(0x71300060, 8);
@@ -136,10 +147,7 @@ static int __init i8042_platform_init(void)
 
 static inline void i8042_platform_exit(void)
 {
-	struct device_node *root = of_find_node_by_path("/");
-	const char *name = of_get_property(root, "name", NULL);
-
-	if (!name || strcmp(name, "SUNW,JavaStation-1"))
+	if (!i8042_is_mr_coffee())
 		platform_driver_unregister(&sparc_i8042_driver);
 }
 
-- 
2.25.1

