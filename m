Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A110415B622
	for <lists+linux-input@lfdr.de>; Thu, 13 Feb 2020 01:49:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729190AbgBMAtW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Feb 2020 19:49:22 -0500
Received: from gateway33.websitewelcome.com ([192.185.146.21]:15387 "EHLO
        gateway33.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729185AbgBMAtW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Feb 2020 19:49:22 -0500
X-Greylist: delayed 1486 seconds by postgrey-1.27 at vger.kernel.org; Wed, 12 Feb 2020 19:49:21 EST
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
        by gateway33.websitewelcome.com (Postfix) with ESMTP id 96FB041C98B
        for <linux-input@vger.kernel.org>; Wed, 12 Feb 2020 18:24:34 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id 22J0jnCdmXVkQ22J0jBHp0; Wed, 12 Feb 2020 18:24:34 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=9EJb/euG7gkKhGffE7UiOq2aWqCT5JdXBk6xO9IA6+4=; b=V0Q3EHm+hTqpRCdnagX8jgROcl
        JcRYnpgrbpIEOflPD6b+LDxXZGrvtZTvRo4y4DgFvdhvKKwaKbJvYsFpHEWAt0qaSnoXdKA7JoE4X
        NdzDfZGC6/DV5PpRRtCTIHBJn0G47PDbFT851nZZxEyMmAEMzZrgZAgTnkCsog5qwMSX4slLOWO0T
        ayszwKy7zl8ygl0Yp7Rvr2nsLUJZB9Ee4k7V2qNbye7MT3Ec6VM0BrxmC3KbcBpupI9nI6i2KuUNb
        VLB1XNooMYaCzQoKNjRSvbb9WooDWBQDFtUO08jabYxxS9DAZULWIG0V9GRquLDU0rMgQ4iuxPMaL
        PVajky2A==;
Received: from [200.68.141.42] (port=13329 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1j22Iy-003Yme-S2; Wed, 12 Feb 2020 18:24:33 -0600
Date:   Wed, 12 Feb 2020 18:24:30 -0600
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] Input: goldfish_events - Replace zero-length array with
 flexible-array member
Message-ID: <20200213002430.GA31056@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 200.68.141.42
X-Source-L: No
X-Exim-ID: 1j22Iy-003Yme-S2
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [200.68.141.42]:13329
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 31
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/input/keyboard/goldfish_events.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/goldfish_events.c b/drivers/input/keyboard/goldfish_events.c
index bc8c85a52a10..57d435fc5c73 100644
--- a/drivers/input/keyboard/goldfish_events.c
+++ b/drivers/input/keyboard/goldfish_events.c
@@ -30,7 +30,7 @@ struct event_dev {
 	struct input_dev *input;
 	int irq;
 	void __iomem *addr;
-	char name[0];
+	char name[];
 };
 
 static irqreturn_t events_interrupt(int irq, void *dev_id)
-- 
2.23.0

