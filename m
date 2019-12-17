Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41A86122C7F
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2019 14:06:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbfLQNGx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Dec 2019 08:06:53 -0500
Received: from imap2.colo.codethink.co.uk ([78.40.148.184]:41864 "EHLO
        imap2.colo.codethink.co.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726191AbfLQNGx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Dec 2019 08:06:53 -0500
X-Greylist: delayed 2501 seconds by postgrey-1.27 at vger.kernel.org; Tue, 17 Dec 2019 08:06:52 EST
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
        id 1ihBuW-0006bh-NL; Tue, 17 Dec 2019 12:25:08 +0000
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.3)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1ihBuW-0093GP-7z; Tue, 17 Dec 2019 12:25:08 +0000
From:   "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
To:     ben.dooks@codethink.co.uk
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-input@vger.kernel.org
Subject: [PATCH] Input: apbps2 - add __iomem to register struct
Date:   Tue, 17 Dec 2019 12:25:07 +0000
Message-Id: <20191217122507.2157454-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add __iomem to the apbps2_priv.regs field to make the numerous
warnings about differing address spaces go away. Fixes warnings
such as:

drivers/input/serio/apbps2.c:65:26: warning: incorrect type in argument 1 (different address spaces)
drivers/input/serio/apbps2.c:65:26:    expected void const volatile [noderef] <asn:2> *addr
drivers/input/serio/apbps2.c:65:26:    got unsigned int [noderef] *
drivers/input/serio/apbps2.c:65:26: warning: incorrect type in argument 1 (different address spaces)
drivers/input/serio/apbps2.c:65:26:    expected void const volatile [noderef] <asn:2> *addr
drivers/input/serio/apbps2.c:65:26:    got unsigned int [noderef] *
drivers/input/serio/apbps2.c:65:26: warning: incorrect type in argument 1 (different address spaces)
drivers/input/serio/apbps2.c:65:26:    expected void const volatile [noderef] <asn:2> *addr
drivers/input/serio/apbps2.c:65:26:    got unsigned int [noderef] *
drivers/input/serio/apbps2.c:65:26: warning: incorrect type in argument 1 (different address spaces)
drivers/input/serio/apbps2.c:65:26:    expected void const volatile [noderef] <asn:2> *addr
[rest snipped]

Signed-off-by: Ben Dooks (Codethink) <ben.dooks@codethink.co.uk>
---
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Allison Randal <allison@lohutok.net>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-input@vger.kernel.org
---
 drivers/input/serio/apbps2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/serio/apbps2.c b/drivers/input/serio/apbps2.c
index f290d5d146c3..594ac4e6f8ea 100644
--- a/drivers/input/serio/apbps2.c
+++ b/drivers/input/serio/apbps2.c
@@ -51,7 +51,7 @@ struct apbps2_regs {
 
 struct apbps2_priv {
 	struct serio		*io;
-	struct apbps2_regs	*regs;
+	struct apbps2_regs	__iomem *regs;
 };
 
 static int apbps2_idx;
-- 
2.24.0

