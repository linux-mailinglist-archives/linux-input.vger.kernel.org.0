Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2888E3D3C9F
	for <lists+linux-input@lfdr.de>; Fri, 23 Jul 2021 17:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235554AbhGWPBX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Jul 2021 11:01:23 -0400
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:43516 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235470AbhGWPBW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Jul 2021 11:01:22 -0400
Received: from localhost.localdomain ([80.15.159.30])
        by mwinf5d09 with ME
        id Yfhu2500B0feRjk03fhu3D; Fri, 23 Jul 2021 17:41:55 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 23 Jul 2021 17:41:55 +0200
X-ME-IP: 80.15.159.30
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] HID: logitech-hidpp: Use 'atomic_inc_return' instead of hand-writing it
Date:   Fri, 23 Jul 2021 17:41:52 +0200
Message-Id: <1091bc38881086be28d561adca042caba234f3f2.1627054657.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This function logs a warning if the workqueue gets too big.
In order to save a few cycles, use 'atomic_inc_return()' instead of an
'atomic_inc()/atomic_read()' sequence.

This axes a line of code and saves a 'atomic_read()' call.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/hid/hid-logitech-hidpp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 61635e629469..a7fa35245c2e 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2240,11 +2240,10 @@ static int hidpp_ff_queue_work(struct hidpp_ff_private_data *data, int effect_id
 	wd->size = size;
 	memcpy(wd->params, params, size);
 
-	atomic_inc(&data->workqueue_size);
+	s = atomic_inc_return(&data->workqueue_size);
 	queue_work(data->wq, &wd->work);
 
 	/* warn about excessive queue size */
-	s = atomic_read(&data->workqueue_size);
 	if (s >= 20 && s % 20 == 0)
 		hid_warn(data->hidpp->hid_dev, "Force feedback command queue contains %d commands, causing substantial delays!", s);
 
-- 
2.30.2

