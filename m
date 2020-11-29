Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E26882C7874
	for <lists+linux-input@lfdr.de>; Sun, 29 Nov 2020 09:47:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbgK2IrB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Nov 2020 03:47:01 -0500
Received: from smtp07.smtpout.orange.fr ([80.12.242.129]:33369 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbgK2IrB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Nov 2020 03:47:01 -0500
Received: from localhost.localdomain ([81.185.163.10])
        by mwinf5d13 with ME
        id y8lG230020DmPsp038lGNG; Sun, 29 Nov 2020 09:45:17 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 29 Nov 2020 09:45:17 +0100
X-ME-IP: 81.185.163.10
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     dmitry.torokhov@gmail.com, rydberg@euromail.se, tj@kernel.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] Input: Fix a ref counting issue
Date:   Sun, 29 Nov 2020 09:45:16 +0100
Message-Id: <20201129084516.1456099-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In case of a managed resource, 'devm_input_device_release()' already has a
'input_put_device(dev)' call.

Avoid a double reference decrement by explicitly calling
'input_put_device()' only on non-managed input device.

Fixes: 2be975c6d920 ("Input: introduce managed input devices (add devres support)")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is completely speculative and compile tested only.
---
 drivers/input/input.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index 3cfd2c18eebd..c09c9f020667 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -1920,7 +1920,8 @@ void input_free_device(struct input_dev *dev)
 						devm_input_device_release,
 						devm_input_device_match,
 						dev));
-		input_put_device(dev);
+		else
+			input_put_device(dev);
 	}
 }
 EXPORT_SYMBOL(input_free_device);
-- 
2.27.0

