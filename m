Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CBF015EAF7
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2020 18:17:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394651AbgBNRRr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Feb 2020 12:17:47 -0500
Received: from gateway33.websitewelcome.com ([192.185.146.80]:21083 "EHLO
        gateway33.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2394642AbgBNRRr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Feb 2020 12:17:47 -0500
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
        by gateway33.websitewelcome.com (Postfix) with ESMTP id 31F221C035
        for <linux-input@vger.kernel.org>; Fri, 14 Feb 2020 11:17:46 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id 2eb4jOxK6Sl8q2eb4j74tA; Fri, 14 Feb 2020 11:17:46 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=WdyaSABb4nKRDgvU/3FE2JdQX1c2NVD5ZKrARuHcShM=; b=qs/HLk5wau6g/8LIk47qnzlbnJ
        zGHUfSrcnyz12L9l+y0IWzynMRmB0VCGylL+HkeNO70QQ9OFfhbFu0ch4PbLkNuljJW+kQJ36TnTO
        2d6J6raQp9pd07yE6zJh3bpvWsBBmnORokFdr6rku6ttEzsIvcl8N31N7JeCpj5cCOIS2JCwmrbjb
        5CDsrFarF7OGlPOMR+5Pet9GRcVUbnUrk+16rWdrwh6g3bFONmKBvVNnWnVnahz0LnHO3tmZmjucV
        wRLei6IixqBJfOJZirvPj+3aPN84/CoXbenFEVQqvnok14+azd6D7bmblmV6b1Mbz5XWJZmpxL/jy
        V9+PMaOg==;
Received: from [200.68.140.137] (port=19663 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1j2eb2-003hYb-Lo; Fri, 14 Feb 2020 11:17:44 -0600
Date:   Fri, 14 Feb 2020 11:20:22 -0600
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] Input: tca6416-keypad - replace zero-length array with
 flexible-array member
Message-ID: <20200214172022.GA27490@embeddedor>
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
X-Source-IP: 200.68.140.137
X-Source-L: No
X-Exim-ID: 1j2eb2-003hYb-Lo
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [200.68.140.137]:19663
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 28
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
 drivers/input/keyboard/tca6416-keypad.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/tca6416-keypad.c b/drivers/input/keyboard/tca6416-keypad.c
index 2a14769de637..21758767ccf0 100644
--- a/drivers/input/keyboard/tca6416-keypad.c
+++ b/drivers/input/keyboard/tca6416-keypad.c
@@ -33,7 +33,7 @@ MODULE_DEVICE_TABLE(i2c, tca6416_id);
 
 struct tca6416_drv_data {
 	struct input_dev *input;
-	struct tca6416_button data[0];
+	struct tca6416_button data[];
 };
 
 struct tca6416_keypad_chip {
@@ -48,7 +48,7 @@ struct tca6416_keypad_chip {
 	int irqnum;
 	u16 pinmask;
 	bool use_polling;
-	struct tca6416_button buttons[0];
+	struct tca6416_button buttons[];
 };
 
 static int tca6416_write_reg(struct tca6416_keypad_chip *chip, int reg, u16 val)
-- 
2.25.0

