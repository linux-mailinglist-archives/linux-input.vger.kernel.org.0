Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96A3B447F0E
	for <lists+linux-input@lfdr.de>; Mon,  8 Nov 2021 12:42:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239301AbhKHLop (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Nov 2021 06:44:45 -0500
Received: from phobos.denx.de ([85.214.62.61]:36822 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231992AbhKHLop (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 8 Nov 2021 06:44:45 -0500
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id DF32A8360F;
        Mon,  8 Nov 2021 12:41:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1636371720;
        bh=sOpVm2xw6g/LWUP73tszzCFDYG777TQJOVo9AOCOti0=;
        h=From:To:Cc:Subject:Date:From;
        b=lVfYQbczGRI1jws/slxuXK1Ji3KYfy5sYVh7Iiy205u1LKLtenKfv+D6ybYA6A7w7
         hi4ddrkFnnLUogBjrUrvu3MdurrpZiTikF63DNGiBkwBdyKGeECD6Upax/XrzVof+j
         VCE9vHo+EOtnGgXZc2Xoy83kAsfn1+goA2Gzq7myRqP/cmWwRe0dGCNbC/Ok1WbSET
         mwwADP5BrbxcTIq0AHtPkAVzogClJ1XG/B1R+iisdtXJoLZx2EeGsMmROdk1H7L78g
         0lwwAkaOrQfvL5u92Pd5H9+871YRMa1IyPADBeSt3XGu5qCUGXNRzceS48F/MFuYrr
         5eG2pxbx49qrA==
From:   Marek Vasut <marex@denx.de>
To:     linux-input@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Joe Hung <joe_hung@ilitek.com>, Luca Hsu <luca_hsu@ilitek.com>
Subject: [PATCH] Input: ili210x - Reduce sample period to 15ms
Date:   Mon,  8 Nov 2021 12:41:45 +0100
Message-Id: <20211108114145.84118-1-marex@denx.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Modern devices may redraw display at 60 Hz, make sure we have one input
sample per one frame. Reduce sample period to 15ms, so we would get up
to 66.6 samples per second, although realistically with all the jitter
and extra scheduling wiggle room, we would end up just above 60 samples
per second. This should be a good compromise between sampling too often
and sampling too seldom.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Joe Hung <joe_hung@ilitek.com>
Cc: Luca Hsu <luca_hsu@ilitek.com>
---
 drivers/input/touchscreen/ili210x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index 6dd5095be567f..ba0e2ae3928a7 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -14,7 +14,7 @@
 #include <linux/slab.h>
 #include <asm/unaligned.h>
 
-#define ILI2XXX_POLL_PERIOD	20
+#define ILI2XXX_POLL_PERIOD	15
 
 #define ILI210X_DATA_SIZE	64
 #define ILI211X_DATA_SIZE	43
-- 
2.33.0

