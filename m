Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA1997A635
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2019 12:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728102AbfG3Krd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Jul 2019 06:47:33 -0400
Received: from mx2.suse.de ([195.135.220.15]:54398 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727527AbfG3Krd (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Jul 2019 06:47:33 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 287D7AE34;
        Tue, 30 Jul 2019 10:47:32 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] usbtouchscreen: add proper initialization
Date:   Tue, 30 Jul 2019 12:47:17 +0200
Message-Id: <20190730104717.31831-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Mutexes shall be initialized before they are used.

Fixes: 12e510dbc57b2 ("Input: usbtouchscreen - fix deadlock in autosuspend")
Reported-by: syzbot+199ea16c7f26418b4365@syzkaller.appspotmail.com
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/input/touchscreen/usbtouchscreen.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/touchscreen/usbtouchscreen.c b/drivers/input/touchscreen/usbtouchscreen.c
index a2cec6cacf57..caacf211f51b 100644
--- a/drivers/input/touchscreen/usbtouchscreen.c
+++ b/drivers/input/touchscreen/usbtouchscreen.c
@@ -1658,6 +1658,7 @@ static int usbtouch_probe(struct usb_interface *intf,
 	input_dev = input_allocate_device();
 	if (!usbtouch || !input_dev)
 		goto out_free;
+	mutex_init(&usbtouch->pm_mutex);
 
 	type = &usbtouch_dev_info[id->driver_info];
 	usbtouch->type = type;
-- 
2.16.4

