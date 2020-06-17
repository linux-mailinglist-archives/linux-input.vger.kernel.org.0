Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DCBC1FC679
	for <lists+linux-input@lfdr.de>; Wed, 17 Jun 2020 08:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726662AbgFQGzv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Jun 2020 02:55:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbgFQGzu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Jun 2020 02:55:50 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 548D0C061573
        for <linux-input@vger.kernel.org>; Tue, 16 Jun 2020 23:55:50 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed20:b57b:2191:a081:571d])
        by michel.telenet-ops.be with bizsmtp
        id s6vm2200L1Jlgh2066vmnJ; Wed, 17 Jun 2020 08:55:47 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jlRz8-0007Mk-EN; Wed, 17 Jun 2020 08:55:46 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jlRz8-0006j6-DG; Wed, 17 Jun 2020 08:55:46 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     linux-sh@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] input: i8042 - Remove special Cayman handling
Date:   Wed, 17 Jun 2020 08:55:39 +0200
Message-Id: <20200617065539.25805-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200617065539.25805-1-geert+renesas@glider.be>
References: <20200617065539.25805-1-geert+renesas@glider.be>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

As of commit 37744feebc086908 ("sh: remove sh5 support"), support for
the SH5-based Cayman platform can no longer be selected.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/input/serio/i8042-io.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/input/serio/i8042-io.h b/drivers/input/serio/i8042-io.h
index da0bf85321de3a77..64590b86eb37ff30 100644
--- a/drivers/input/serio/i8042-io.h
+++ b/drivers/input/serio/i8042-io.h
@@ -21,8 +21,6 @@
 #elif defined(__arm__)
 /* defined in include/asm-arm/arch-xxx/irqs.h */
 #include <asm/irq.h>
-#elif defined(CONFIG_SH_CAYMAN)
-#include <asm/irq.h>
 #elif defined(CONFIG_PPC)
 extern int of_i8042_kbd_irq;
 extern int of_i8042_aux_irq;
-- 
2.17.1

