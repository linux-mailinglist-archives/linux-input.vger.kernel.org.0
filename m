Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5B53613C5
	for <lists+linux-input@lfdr.de>; Thu, 15 Apr 2021 22:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235490AbhDOU6x (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Apr 2021 16:58:53 -0400
Received: from smtp11.smtpout.orange.fr ([80.12.242.133]:59076 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235332AbhDOU6w (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Apr 2021 16:58:52 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d21 with ME
        id t8yU2400121Fzsu038yUmX; Thu, 15 Apr 2021 22:58:28 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 15 Apr 2021 22:58:28 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/2] Input: evbug - Use 'pr_debug()' instead of hand-writing it
Date:   Thu, 15 Apr 2021 22:58:27 +0200
Message-Id: <5bc599f199df4e43c4a7f02f167af3e897f823dd.1618520227.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <fda981546203427a0ac86ef47f231239ad18ecfe.1618520227.git.christophe.jaillet@wanadoo.fr>
References: <fda981546203427a0ac86ef47f231239ad18ecfe.1618520227.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

'printk(KERN_DEBUG pr_fmt(...))' can be replaced by a much less verbose
'pr_debug()'.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/input/evbug.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/input/evbug.c b/drivers/input/evbug.c
index e47bdf92088a..88ad88300181 100644
--- a/drivers/input/evbug.c
+++ b/drivers/input/evbug.c
@@ -21,8 +21,8 @@ MODULE_LICENSE("GPL");
 
 static void evbug_event(struct input_handle *handle, unsigned int type, unsigned int code, int value)
 {
-	printk(KERN_DEBUG pr_fmt("Event. Dev: %s, Type: %d, Code: %d, Value: %d\n"),
-	       dev_name(&handle->dev->dev), type, code, value);
+	pr_debug("Event. Dev: %s, Type: %d, Code: %d, Value: %d\n",
+		 dev_name(&handle->dev->dev), type, code, value);
 }
 
 static int evbug_connect(struct input_handler *handler, struct input_dev *dev,
@@ -47,10 +47,10 @@ static int evbug_connect(struct input_handler *handler, struct input_dev *dev,
 	if (error)
 		goto err_unregister_handle;
 
-	printk(KERN_DEBUG pr_fmt("Connected device: %s (%s at %s)\n"),
-	       dev_name(&dev->dev),
-	       dev->name ?: "unknown",
-	       dev->phys ?: "unknown");
+	pr_debug("Connected device: %s (%s at %s)\n",
+		 dev_name(&dev->dev),
+		 dev->name ?: "unknown",
+		 dev->phys ?: "unknown");
 
 	return 0;
 
@@ -63,8 +63,8 @@ static int evbug_connect(struct input_handler *handler, struct input_dev *dev,
 
 static void evbug_disconnect(struct input_handle *handle)
 {
-	printk(KERN_DEBUG pr_fmt("Disconnected device: %s\n"),
-	       dev_name(&handle->dev->dev));
+	pr_debug("Disconnected device: %s\n",
+		 dev_name(&handle->dev->dev));
 
 	input_close_device(handle);
 	input_unregister_handle(handle);
-- 
2.27.0

