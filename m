Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D600035987C
	for <lists+linux-input@lfdr.de>; Fri,  9 Apr 2021 11:01:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbhDIJB0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Apr 2021 05:01:26 -0400
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44]:56205 "EHLO
        out30-44.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231127AbhDIJB0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 9 Apr 2021 05:01:26 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R591e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04420;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0UUyvAMd_1617958862;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UUyvAMd_1617958862)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 09 Apr 2021 17:01:12 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] Input: apbps2 - remove useless variable
Date:   Fri,  9 Apr 2021 17:00:59 +0800
Message-Id: <1617958859-64707-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix the following gcc warning:

drivers/input/serio/apbps2.c:106:16: warning: variable ‘tmp’ set but not
used [-Wunused-but-set-variable].

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/input/serio/apbps2.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/serio/apbps2.c b/drivers/input/serio/apbps2.c
index 594ac4e..974d7bf 100644
--- a/drivers/input/serio/apbps2.c
+++ b/drivers/input/serio/apbps2.c
@@ -103,7 +103,6 @@ static int apbps2_open(struct serio *io)
 {
 	struct apbps2_priv *priv = io->port_data;
 	int limit;
-	unsigned long tmp;
 
 	/* clear error flags */
 	iowrite32be(0, &priv->regs->status);
@@ -111,7 +110,7 @@ static int apbps2_open(struct serio *io)
 	/* Clear old data if available (unlikely) */
 	limit = 1024;
 	while ((ioread32be(&priv->regs->status) & APBPS2_STATUS_DR) && --limit)
-		tmp = ioread32be(&priv->regs->data);
+		ioread32be(&priv->regs->data);
 
 	/* Enable reciever and it's interrupt */
 	iowrite32be(APBPS2_CTRL_RE | APBPS2_CTRL_RI, &priv->regs->ctrl);
-- 
1.8.3.1

