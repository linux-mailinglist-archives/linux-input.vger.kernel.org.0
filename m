Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C20111DC00
	for <lists+linux-input@lfdr.de>; Fri, 13 Dec 2019 03:11:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731819AbfLMCLJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Dec 2019 21:11:09 -0500
Received: from inva020.nxp.com ([92.121.34.13]:54430 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727778AbfLMCLJ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Dec 2019 21:11:09 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C9ED61A0149;
        Fri, 13 Dec 2019 03:11:07 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4E73F1A031E;
        Fri, 13 Dec 2019 03:11:03 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 7474640296;
        Fri, 13 Dec 2019 10:10:57 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     dmitry.torokhov@gmail.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        robh@kernel.org, linux-input@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH] input: keyboard: imx_sc_key: Only take the valid data from SCU firmware as key state
Date:   Fri, 13 Dec 2019 10:08:29 +0800
Message-Id: <1576202909-1661-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When reading key state from SCU, the response data from SCU firmware
is 4 bytes due to MU message protocol, but ONLY the first byte is the
key state, other 3 bytes could be some dirty data, so we should ONLY
take the first byte as key state to avoid reporting incorrect state.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/input/keyboard/imx_sc_key.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/imx_sc_key.c b/drivers/input/keyboard/imx_sc_key.c
index 5379952..9f809ae 100644
--- a/drivers/input/keyboard/imx_sc_key.c
+++ b/drivers/input/keyboard/imx_sc_key.c
@@ -78,7 +78,13 @@ static void imx_sc_check_for_events(struct work_struct *work)
 		return;
 	}
 
-	state = (bool)msg.state;
+	/*
+	 * The response data from SCU firmware is 4 bytes,
+	 * but ONLY the first byte is the key state, other
+	 * 3 bytes could be some dirty data, so we should
+	 * ONLY take the first byte as key state.
+	 */
+	state = (bool)(msg.state & 0xff);
 
 	if (state ^ priv->keystate) {
 		priv->keystate = state;
-- 
2.7.4

