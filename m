Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAD8C87DBB
	for <lists+linux-input@lfdr.de>; Fri,  9 Aug 2019 17:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407143AbfHIPJO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Aug 2019 11:09:14 -0400
Received: from smtp12.smtpout.orange.fr ([80.12.242.134]:39598 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407110AbfHIPJO (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Aug 2019 11:09:14 -0400
Received: from localhost.localdomain ([92.140.207.10])
        by mwinf5d35 with ME
        id n39B2000F0Dzhgk0339BST; Fri, 09 Aug 2019 17:09:12 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 09 Aug 2019 17:09:12 +0200
X-ME-IP: 92.140.207.10
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     dmitry.torokhov@gmail.com, benjamin.tissoires@redhat.com,
        grawity@gmail.com, dev@pp3345.net, lyude@redhat.com, teika@gmx.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] Input: synaptics - Fix a typo - synpatics --> synaptics
Date:   Fri,  9 Aug 2019 17:08:14 +0200
Message-Id: <20190809150814.24793-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This should be 'synaptics', not 'synpatics'

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/input/mouse/synaptics.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index b6da0c1267e3..bbd799c7b058 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -191,7 +191,7 @@ static const char * const forcepad_pnp_ids[] = {
 };
 
 /*
- * Send a command to the synpatics touchpad by special commands
+ * Send a command to the synaptics touchpad by special commands
  */
 static int synaptics_send_cmd(struct psmouse *psmouse, u8 cmd, u8 *param)
 {
-- 
2.20.1

