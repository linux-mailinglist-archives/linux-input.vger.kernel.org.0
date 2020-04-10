Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EBE31A4CAF
	for <lists+linux-input@lfdr.de>; Sat, 11 Apr 2020 01:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbgDJXmH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Apr 2020 19:42:07 -0400
Received: from out1.migadu.com ([91.121.223.63]:18132 "EHLO out1.migadu.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726594AbgDJXmH (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Apr 2020 19:42:07 -0400
X-Greylist: delayed 325 seconds by postgrey-1.27 at vger.kernel.org; Fri, 10 Apr 2020 19:42:06 EDT
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kl.wtf; s=default;
        t=1586561798;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=KN7FbQEXrR36R7EQwsJcXUEyI5RWX6urdxXAfkfVhkM=;
        b=EdTYTTmKiIOTASWBoNZ2FKoaRjphwlPvrLnrv+Lg4TZ19ykaaaGMp6LTEg+fQ8BonNxwXm
        OFBt2fhOAkZHm+xximAbyWo1Gd1K6RrnTvifoSZ3yDePUBVdB1HwWOIr5F0hcAVc6nplD/
        nKBZpEUl2f9nmtp8MEAqmTCbUryffxs=
From:   Kenny Levinsen <kl@kl.wtf>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Kenny Levinsen <kl@kl.wtf>
Subject: [PATCH] input/evdev: make evdev use keyed wakeups
Date:   Sat, 11 Apr 2020 01:35:57 +0200
Message-Id: <20200410233557.3892-1-kl@kl.wtf>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 4.90
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some processes, such as systemd, are only polling for EPOLLERR|EPOLLHUP.
As evdev uses unkeyed wakeups, such a poll receives many spurious
wakeups from uninteresting events.

Use keyed wakeups to allow the wakeup target to more efficiently discard
these uninteresting events.

Signed-off-by: Kenny Levinsen <kl@kl.wtf>
---
 drivers/input/evdev.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
index d7dd6fcf2db0..f54d3d31f61d 100644
--- a/drivers/input/evdev.c
+++ b/drivers/input/evdev.c
@@ -282,7 +282,8 @@ static void evdev_pass_values(struct evdev_client *client,
 	spin_unlock(&client->buffer_lock);
 
 	if (wakeup)
-		wake_up_interruptible(&evdev->wait);
+		wake_up_interruptible_poll(&evdev->wait,
+			EPOLLIN | EPOLLOUT | EPOLLRDNORM | EPOLLWRNORM);
 }
 
 /*
@@ -443,7 +444,7 @@ static void evdev_hangup(struct evdev *evdev)
 		kill_fasync(&client->fasync, SIGIO, POLL_HUP);
 	spin_unlock(&evdev->client_lock);
 
-	wake_up_interruptible(&evdev->wait);
+	wake_up_interruptible_poll(&evdev->wait, EPOLLHUP | EPOLLERR);
 }
 
 static int evdev_release(struct inode *inode, struct file *file)
@@ -958,7 +959,7 @@ static int evdev_revoke(struct evdev *evdev, struct evdev_client *client,
 	client->revoked = true;
 	evdev_ungrab(evdev, client);
 	input_flush_device(&evdev->handle, file);
-	wake_up_interruptible(&evdev->wait);
+	wake_up_interruptible_poll(&evdev->wait, EPOLLHUP | EPOLLERR);
 
 	return 0;
 }
-- 
2.26.0

