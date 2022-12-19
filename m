Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F29C6514FC
	for <lists+linux-input@lfdr.de>; Mon, 19 Dec 2022 22:37:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231702AbiLSVg7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Dec 2022 16:36:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbiLSVg6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Dec 2022 16:36:58 -0500
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E08B8FC6
        for <linux-input@vger.kernel.org>; Mon, 19 Dec 2022 13:36:57 -0800 (PST)
Received: from pop-os.home ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id 7Nodpo3YfP7YW7NodprsHy; Mon, 19 Dec 2022 22:36:56 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 19 Dec 2022 22:36:56 +0100
X-ME-IP: 86.243.100.34
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-input@vger.kernel.org
Subject: [PATCH] Input: fm801-gp - Fix an error handling path
Date:   Mon, 19 Dec 2022 22:36:47 +0100
Message-Id: <2d4f01f3a721b0dcd34669ab01aff9eddaad53dc.1671485791.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This looks odd to call release_resource() for something allocated with
request_region().
Use release_region() instead.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is speculative and compile tested only.
---
 drivers/input/gameport/fm801-gp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/gameport/fm801-gp.c b/drivers/input/gameport/fm801-gp.c
index e785d36b1926..90ef1935084a 100644
--- a/drivers/input/gameport/fm801-gp.c
+++ b/drivers/input/gameport/fm801-gp.c
@@ -118,7 +118,7 @@ static void fm801_gp_remove(struct pci_dev *pci)
 	struct fm801_gp *gp = pci_get_drvdata(pci);
 
 	gameport_unregister_port(gp->gameport);
-	release_resource(gp->res_port);
+	release_region(gp->gameport->io, 0x10);
 	kfree(gp);
 
 	pci_disable_device(pci);
-- 
2.34.1

