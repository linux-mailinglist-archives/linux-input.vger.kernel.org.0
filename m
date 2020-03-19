Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DFE318C2BC
	for <lists+linux-input@lfdr.de>; Thu, 19 Mar 2020 23:07:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727331AbgCSWHf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Mar 2020 18:07:35 -0400
Received: from gateway32.websitewelcome.com ([192.185.145.123]:20626 "EHLO
        gateway32.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727324AbgCSWHf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Mar 2020 18:07:35 -0400
X-Greylist: delayed 1468 seconds by postgrey-1.27 at vger.kernel.org; Thu, 19 Mar 2020 18:07:34 EDT
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
        by gateway32.websitewelcome.com (Postfix) with ESMTP id 37405D119D
        for <linux-input@vger.kernel.org>; Thu, 19 Mar 2020 16:43:06 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id F2wUjjqQ8AGTXF2wUj9msK; Thu, 19 Mar 2020 16:43:06 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=FvguBj7rVJCiKrPfcdD/dDqw8uFuJmmKDVRcEBgRUyQ=; b=f6XQ7p3EhpbYzqwn7v3WGBqjBS
        WPEkJQXYP0/V26HS5TeRAt3Ht0fR9dGJNjP7DwBsRtunv1DpzGc8PlkfSrqZw74U6TEyeUyBv9nku
        Ji3gwdAM7t6sFV7EvB5IcrsLtnJErsUs3N3JmAZn4jjs11aT3bv2MKDuX3xodoXhGTSuEc5LOsEPu
        u4C4mvm7SVbiP/27SLETZzups77Q2Qd4nAuTGxosgeNWHdo4vyzXrdUCf1Lv1DAv4FViqzyWyInml
        QOWtQO4ACTqA96NEasMctOlc3R22IModA653LsuvUg5LPXQ5Evu7mfNpfcJ6QiyETzdbhrWXPYZbM
        O/JZez4g==;
Received: from cablelink-189-218-116-241.hosts.intercable.net ([189.218.116.241]:53376 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1jF2wS-001jjo-Ms; Thu, 19 Mar 2020 16:43:04 -0500
Date:   Thu, 19 Mar 2020 16:43:04 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH][next] input: keyboard: applespi: Replace zero-length array
 with flexible-array member
Message-ID: <20200319214304.GA19987@embeddedor.com>
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
X-Source-IP: 189.218.116.241
X-Source-L: No
X-Exim-ID: 1jF2wS-001jjo-Ms
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: cablelink-189-218-116-241.hosts.intercable.net (embeddedor) [189.218.116.241]:53376
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 49
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
 drivers/input/keyboard/applespi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/applespi.c b/drivers/input/keyboard/applespi.c
index d38398526965..14362ebab9a9 100644
--- a/drivers/input/keyboard/applespi.c
+++ b/drivers/input/keyboard/applespi.c
@@ -186,7 +186,7 @@ struct touchpad_protocol {
 	u8			number_of_fingers;
 	u8			clicked2;
 	u8			unknown3[16];
-	struct tp_finger	fingers[0];
+	struct tp_finger	fingers[];
 };
 
 /**
-- 
2.23.0

