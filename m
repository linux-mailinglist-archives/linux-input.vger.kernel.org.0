Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C163015EE05
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2020 18:38:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388603AbgBNRhw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Feb 2020 12:37:52 -0500
Received: from gateway21.websitewelcome.com ([192.185.45.155]:24527 "EHLO
        gateway21.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387544AbgBNRhw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Feb 2020 12:37:52 -0500
X-Greylist: delayed 1279 seconds by postgrey-1.27 at vger.kernel.org; Fri, 14 Feb 2020 12:37:51 EST
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
        by gateway21.websitewelcome.com (Postfix) with ESMTP id 99BFF4011BDFA
        for <linux-input@vger.kernel.org>; Fri, 14 Feb 2020 11:16:30 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id 2eZqjst8vAGTX2eZqj4hVQ; Fri, 14 Feb 2020 11:16:30 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Hc+KXK55XGoMw2zvxQfSgUAWMXk86qqphrar4Mbwloc=; b=o/fbEawRgGH+SpYTbkk03vEU+n
        CgMzJmTCsdJWuzjjdxPApWm5kT9x7eqWaUHAr7mK/foulobXcF4PdipL+BC4ScgICWWbrCgZpv8IC
        H/paByw/b8GI3S6r9opFa0He6Wg9r+Z3L2g4vjS0OyAOrFE+TuN6BHKaW2OBEebyZs+FkK2hCJhUS
        TAzBR/NLsvDBCZ8hcbBcizSNauGg1WOmSylL+dsHrs5j7RXbrD6sShuXdbrEeBFjHgKcExmJXrofY
        BYc3lBu5esyvVu8DU8j4W31qpEuTGZGGgQwh1Ix4HoQzxYe9dDy2CHLmkE9Xuc38PqvutAZFGvX7t
        +CXwK18w==;
Received: from [200.68.140.137] (port=3263 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1j2eZp-003gzW-4C; Fri, 14 Feb 2020 11:16:29 -0600
Date:   Fri, 14 Feb 2020 11:19:07 -0600
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] Input: gpio_keys_polled - replace zero-length array with
 flexible-array member
Message-ID: <20200214171907.GA26588@embeddedor>
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
X-Exim-ID: 1j2eZp-003gzW-4C
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [200.68.140.137]:3263
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 25
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
 drivers/input/keyboard/gpio_keys_polled.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
index 6eb0a2f3f9de..c3937d2fc744 100644
--- a/drivers/input/keyboard/gpio_keys_polled.c
+++ b/drivers/input/keyboard/gpio_keys_polled.c
@@ -38,7 +38,7 @@ struct gpio_keys_polled_dev {
 	const struct gpio_keys_platform_data *pdata;
 	unsigned long rel_axis_seen[BITS_TO_LONGS(REL_CNT)];
 	unsigned long abs_axis_seen[BITS_TO_LONGS(ABS_CNT)];
-	struct gpio_keys_button_data data[0];
+	struct gpio_keys_button_data data[];
 };
 
 static void gpio_keys_button_event(struct input_dev *input,
-- 
2.25.0

