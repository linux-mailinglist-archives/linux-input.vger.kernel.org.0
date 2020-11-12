Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E45152AFC48
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 02:34:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728131AbgKLBeP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Nov 2020 20:34:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728251AbgKLB1s (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Nov 2020 20:27:48 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B08E0C0613D6;
        Wed, 11 Nov 2020 17:27:46 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id m13so2750053pgl.7;
        Wed, 11 Nov 2020 17:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=lAFsArA7fE4is9x6CJ3p1673X0PbVTAs5Dj2zRg5Pm4=;
        b=eto9zKDwyga3/h2Txgxeooyil+/9etbAU6Ynpn74oWO8s2SqlkQ+pAVnlZ1k3yTPOv
         X3JxIVsS7XMWUHJOatBVJc70J71YTplofTMP6HLAqAZ2s55f3d5JilQK7/EVWrwd2BgM
         MBcPYQYO0gCS7Hc/ZFUDE1hKuPnSevZ2szz74CHxnXgXsLw40k2zTf2iO90Eq1j69sQD
         CXHGGA/V9i4lZabVwchE8U0AalmqI3+hFpIegg+AaTjEnkrwTOnPw1xjGv7cpMMY85rS
         8fHb6GsqCy7KIiD2nbIyuOSGVgWn/TLNvD+dmQj+XbyK4urC4pHCNfmgWKf/bQt0IjAd
         XBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=lAFsArA7fE4is9x6CJ3p1673X0PbVTAs5Dj2zRg5Pm4=;
        b=dnVAVmK6D1Uyb/jIbDCTx+sM5FuI3WtxsS/BgS2/hNKAASBrfUMwJ4gkzFgvNfv/an
         h3BVrieyC+W/Lqzx2J6q4r4aL9xpy5reKKTrZ7a7pil1BqgS1nlYfxTei0CI5IpwQ/61
         Bh2dDeust+wVBP3dp0PUDj8nE7vcEq/oIe0XbVwLeQl5L2wUjO1VMJ7RcFTm0IMQdK+F
         VB4B8/aTUWbkCa0ZzfTk+xcmLsPccRF1raVtj0F1fdvaOwdA/Buj/oDpyIQJmF2G+n1z
         MhMBEJQcjMIo/aqVhdKNQoqWa55nTpZIq3krIJVjYFwz7y3iKe5V4ECgp2pG1JlqaZ6o
         SQkw==
X-Gm-Message-State: AOAM531FqaxJrYGXM04+aK1ghhyn9c7syldKaBNcJY4eMGFja6ulCrrl
        qKCOpzoGxb7p4Z8P3wjnhlvmjtwXAKc=
X-Google-Smtp-Source: ABdhPJz7aTCOGTeqSG5vlpQfA+LDp6YM615OAMbuqOLp1J8N4w03FFJCRdPj/JGkqmJGZG+0JX/uUw==
X-Received: by 2002:aa7:824d:0:b029:18b:ad77:1a2b with SMTP id e13-20020aa7824d0000b029018bad771a2bmr25914111pfn.25.1605144465981;
        Wed, 11 Nov 2020 17:27:45 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id h16sm3697694pjz.10.2020.11.11.17.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 17:27:45 -0800 (PST)
Date:   Wed, 11 Nov 2020 17:27:42 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Oleksij Rempel <linux@rempel-privat.de>,
        Anatolij Gustschin <agust@denx.de>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: ads7846 - fix unaligned access on 7845
Message-ID: <20201112012742.GA3608551@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

req->sample[1] is not naturally aligned at word boundary, and therefore
we should use get_unaligned_be16() when accessing it.

Fixes: 3eac5c7e44f3 ("Input: ads7846 - extend the driver for ads7845 controller support")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

Not tested on hardware, so if somebody has the controller and can verify
that would be great.


 drivers/input/touchscreen/ads7846.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index 95e89f675ad5..35d14bc44aff 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -33,6 +33,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/module.h>
 #include <asm/irq.h>
+#include <asm/unaligned.h>
 
 /*
  * This code has been heavily tested on a Nokia 770, and lightly
@@ -443,7 +444,7 @@ static int ads7845_read12_ser(struct device *dev, unsigned command)
 
 	if (status == 0) {
 		/* BE12 value, then padding */
-		status = be16_to_cpu(*((u16 *)&req->sample[1]));
+		status = get_unaligned_be16(&req->sample[1]);
 		status = status >> 3;
 		status &= 0x0fff;
 	}
-- 
2.29.2.222.g5d2a92d10f8-goog


-- 
Dmitry
