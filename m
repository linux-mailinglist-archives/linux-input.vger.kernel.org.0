Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08386EFC9A
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2019 12:44:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730762AbfKELoF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 Nov 2019 06:44:05 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:52019 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730704AbfKELoF (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 Nov 2019 06:44:05 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1iRxFj-0003ZO-2D; Tue, 05 Nov 2019 12:44:03 +0100
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Subject: [PATCH] Input: synaptics-rmi4 - clear IRQ enables for F54
Date:   Tue,  5 Nov 2019 12:44:02 +0100
Message-Id: <20191105114402.6009-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The driver for F54 just polls the status and doesn't even have a IRQ
handler registered. Make sure to disable all F54 IRQs, so we don't crash
the kernel on a nonexistent handler.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/input/rmi4/rmi_f54.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/rmi4/rmi_f54.c b/drivers/input/rmi4/rmi_f54.c
index 710b02595486..7e6243ecaf32 100644
--- a/drivers/input/rmi4/rmi_f54.c
+++ b/drivers/input/rmi4/rmi_f54.c
@@ -601,7 +601,7 @@ static int rmi_f54_config(struct rmi_function *fn)
 {
 	struct rmi_driver *drv = fn->rmi_dev->driver;
 
-	drv->set_irq_bits(fn->rmi_dev, fn->irq_mask);
+	drv->clear_irq_bits(fn->rmi_dev, fn->irq_mask);
 
 	return 0;
 }
-- 
2.20.1

