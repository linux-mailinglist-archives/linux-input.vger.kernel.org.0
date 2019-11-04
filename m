Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 219EFEDDD7
	for <lists+linux-input@lfdr.de>; Mon,  4 Nov 2019 12:44:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728502AbfKDLo4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Nov 2019 06:44:56 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:45787 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfKDLo4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Nov 2019 06:44:56 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1iRan0-0006tb-6Q; Mon, 04 Nov 2019 12:44:54 +0100
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, patchwork-lst@pengutronix.de,
        kernel@pengutronix.de
Subject: [PATCH resend 2/3] Input: synaptics-rmi4 - add dummy F54 attention handler
Date:   Mon,  4 Nov 2019 12:44:53 +0100
Message-Id: <20191104114454.10500-2-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191104114454.10500-1-l.stach@pengutronix.de>
References: <20191104114454.10500-1-l.stach@pengutronix.de>
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

F54 is IRQ capable, even if it is not used in the current driver
implementation. The common driver code in rmi_create_function_irq always
installs a irq handler for functions that are IRQ capable. Without a
assigned attention handler, this means a NULL pointer being passed as
the nested IRQ handler. This seems to work with some architecture
implementations, but crashes on others like ARM64.

Don't rely on implementation defined behavior and actually install
a proper attention handler.

Fixes: 24d28e4f1271 ("Input: synaptics-rmi4 - convert irq distribution
                      to irq_domain")
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/input/rmi4/rmi_f54.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/input/rmi4/rmi_f54.c b/drivers/input/rmi4/rmi_f54.c
index 4841354af0d7..22390e89c680 100644
--- a/drivers/input/rmi4/rmi_f54.c
+++ b/drivers/input/rmi4/rmi_f54.c
@@ -732,6 +732,11 @@ static void rmi_f54_remove(struct rmi_function *fn)
 	v4l2_device_unregister(&f54->v4l2);
 }
 
+static irqreturn_t rmi_f54_attention(int irq, void *ctx)
+{
+	return IRQ_HANDLED;
+}
+
 struct rmi_function_handler rmi_f54_handler = {
 	.driver = {
 		.name = F54_NAME,
@@ -740,4 +745,5 @@ struct rmi_function_handler rmi_f54_handler = {
 	.probe = rmi_f54_probe,
 	.config = rmi_f54_config,
 	.remove = rmi_f54_remove,
+	.attention = rmi_f54_attention,
 };
-- 
2.20.1

