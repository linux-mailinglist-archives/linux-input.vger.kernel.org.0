Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B188458530
	for <lists+linux-input@lfdr.de>; Thu, 27 Jun 2019 17:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbfF0PHO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Jun 2019 11:07:14 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:35371 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbfF0PHO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Jun 2019 11:07:14 -0400
Received: from orion.localdomain ([77.7.61.149]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mzhzd-1iSxiT2tbF-00vhdN; Thu, 27 Jun 2019 17:07:12 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
Subject: [PATCH 1/2] input: keyboard: gpio-keys-polled: use input name from pdata if available
Date:   Thu, 27 Jun 2019 17:07:10 +0200
Message-Id: <1561648031-15887-1-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
X-Provags-ID: V03:K1:BYBWqM+ioS28p4rIFekkUstFW2WKc0zl8Qn6kIt6SMU61+PJ1ng
 uwTq/VA+I/W32fmtEUDB9Ufa50LBjlIBEZ1pOAUm2+SOGbjp1CcPrw4cfuY8DEGFqJoL2dZ
 woVHP6Vxzmh2sSEIjrXxUDHz9PggBYj0SbFe9yfkEw7YP5L5aL9Lw4sXME04z+oTTJTgR5S
 7vEBRNlSesbAilrbYpItA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gG1J2EShzcc=:eCFGQnDssncYZ5yR9nKvhr
 JUWWXs2zugxzIzExvqvYp5TG3lSMOEAu7V1dG8oHd8BJ0r6KdCl/xvzs8IbrA/aUxRoQJk8Lt
 NlURMRNWQNtOWm+SgBnzzomTynyReaY3PVQFodkRRpLxT046o7+pRSIyIzmv/bhDS8hnmJujS
 vXjlAH40gKLHvNV1QL1eKcymEWa6sYB9V0gno61VsJ3+HcxWr+tZlhJVHbdJpVgPb7/9lNl9+
 itD/1QehvYlBGbVB+0oC+BKQc8xcEnFg9JPSIdCq39tEnXrDPOdMKwtzi6NhfsTbNruF7lhhH
 RZkQQbviHYWXGjF/8cG1iBySbu42m1YKQq2rqnQMgpLR8+2dbaUR92U10lqedoixnAtyNlpky
 sXJ+QKj761oVQG32mxQOVNB1C2z/RSr/YOQ9R+mK28hzjsAFnm16zYWWpqtxkwmXB+w16ZVLU
 FdOEFxgtWz9jOPCTtJCaf3SpepzDqvJ9FIKFsszNsxKXJihpvznT4y8R7ktOKXd1WXVRzmC5d
 cy90PAaPf7gdShvXA+QVdiZicVWcRma4tAujsvu19uffqEpWBcoLwtsESoYyyutypkD1wyP2x
 h+YGaz0wiZ9R/eULtP+fb+SzqdtpfuQm79ew3QU/iVk8RwTGJWlt5a0pRS7/hLsou5g9PtVeg
 9uacBMhzeGlo9cs6unOSbsntOOeAW/xSkYSDij0PDRg8Shiu7kF9dhgQbtHv7XNWoIw2I8Spl
 TaEkQEJzPB6QxjLKGDIk0DvF0vWtRYMgPodLWw==
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Instead of hardcoding the input name to the driver name
('gpio-keys-polled'), allow the passing a name via platform data
('name' field was already present), but default to old behaviour
in case of NULL.

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/input/keyboard/gpio_keys_polled.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
index 1eafe6b..c168493 100644
--- a/drivers/input/keyboard/gpio_keys_polled.c
+++ b/drivers/input/keyboard/gpio_keys_polled.c
@@ -269,7 +269,7 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
 
 	input = poll_dev->input;
 
-	input->name = pdev->name;
+	input->name = (pdata->name ? pdata->name : pdev->name);
 	input->phys = DRV_NAME"/input0";
 
 	input->id.bustype = BUS_HOST;
-- 
1.9.1

