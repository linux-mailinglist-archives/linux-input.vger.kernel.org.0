Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FD0F1BE66A
	for <lists+linux-input@lfdr.de>; Wed, 29 Apr 2020 20:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726580AbgD2Slk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Apr 2020 14:41:40 -0400
Received: from out1.migadu.com ([91.121.223.63]:53860 "EHLO out1.migadu.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726481AbgD2Slj (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Apr 2020 14:41:39 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kl.wtf; s=default;
        t=1588185695;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=0UPZBwn4U3oHUhbxw2H293dCX96+PteV6QKDoHbFu6k=;
        b=BWhKfvaW3/y9YENimasWwHebk0abuEth3F3XBlie2wwIJKi5dZuGJX/jpPOuv3YY7RQib9
        rpUK7PYAC/IGuln86Xx1a6DECScckm/dSqUqLb+cU0Q+hqiKhghIQwmczrdfaRd0r9oiMl
        SSzPz8NmJ2GrcBmn1AXlj5tWtogXr+Q=
From:   Kenny Levinsen <kl@kl.wtf>
To:     linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, linux-kernel@vger.kernel.org,
        Kenny Levinsen <kl@kl.wtf>
Subject: [PATCH] Input: evdev - per-client waitgroups
Date:   Wed, 29 Apr 2020 20:41:26 +0200
Message-Id: <20200429184126.2155-1-kl@kl.wtf>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 4.90
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

All evdev clients share a common waitgroup. On new input events, this
waitgroup is woken once for every client that did not filter the events,
leading to duplicated and unwanted wakeups.

Split the shared waitgroup into per-client waitgroups for more
fine-grained wakeups.

Signed-off-by: Kenny Levinsen <kl@kl.wtf>
---
 drivers/input/evdev.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
index f54d3d31f61d..e9a8ba36e53e 100644
--- a/drivers/input/evdev.c
+++ b/drivers/input/evdev.c
@@ -28,7 +28,6 @@
 struct evdev {
 	int open;
 	struct input_handle handle;
-	wait_queue_head_t wait;
 	struct evdev_client __rcu *grab;
 	struct list_head client_list;
 	spinlock_t client_lock; /* protects client_list */
@@ -43,6 +42,7 @@ struct evdev_client {
 	unsigned int tail;
 	unsigned int packet_head; /* [future] position of the first element of next packet */
 	spinlock_t buffer_lock; /* protects access to buffer, head and tail */
+	wait_queue_head_t wait;
 	struct fasync_struct *fasync;
 	struct evdev *evdev;
 	struct list_head node;
@@ -245,7 +245,6 @@ static void evdev_pass_values(struct evdev_client *client,
 			const struct input_value *vals, unsigned int count,
 			ktime_t *ev_time)
 {
-	struct evdev *evdev = client->evdev;
 	const struct input_value *v;
 	struct input_event event;
 	struct timespec64 ts;
@@ -282,7 +281,7 @@ static void evdev_pass_values(struct evdev_client *client,
 	spin_unlock(&client->buffer_lock);
 
 	if (wakeup)
-		wake_up_interruptible_poll(&evdev->wait,
+		wake_up_interruptible_poll(&client->wait,
 			EPOLLIN | EPOLLOUT | EPOLLRDNORM | EPOLLWRNORM);
 }
 
@@ -440,11 +439,11 @@ static void evdev_hangup(struct evdev *evdev)
 	struct evdev_client *client;
 
 	spin_lock(&evdev->client_lock);
-	list_for_each_entry(client, &evdev->client_list, node)
+	list_for_each_entry(client, &evdev->client_list, node) {
 		kill_fasync(&client->fasync, SIGIO, POLL_HUP);
+		wake_up_interruptible_poll(&client->wait, EPOLLHUP | EPOLLERR);
+	}
 	spin_unlock(&evdev->client_lock);
-
-	wake_up_interruptible_poll(&evdev->wait, EPOLLHUP | EPOLLERR);
 }
 
 static int evdev_release(struct inode *inode, struct file *file)
@@ -492,6 +491,7 @@ static int evdev_open(struct inode *inode, struct file *file)
 	if (!client)
 		return -ENOMEM;
 
+	init_waitqueue_head(&client->wait);
 	client->bufsize = bufsize;
 	spin_lock_init(&client->buffer_lock);
 	client->evdev = evdev;
@@ -608,7 +608,7 @@ static ssize_t evdev_read(struct file *file, char __user *buffer,
 			break;
 
 		if (!(file->f_flags & O_NONBLOCK)) {
-			error = wait_event_interruptible(evdev->wait,
+			error = wait_event_interruptible(client->wait,
 					client->packet_head != client->tail ||
 					!evdev->exist || client->revoked);
 			if (error)
@@ -626,7 +626,7 @@ static __poll_t evdev_poll(struct file *file, poll_table *wait)
 	struct evdev *evdev = client->evdev;
 	__poll_t mask;
 
-	poll_wait(file, &evdev->wait, wait);
+	poll_wait(file, &client->wait, wait);
 
 	if (evdev->exist && !client->revoked)
 		mask = EPOLLOUT | EPOLLWRNORM;
@@ -959,7 +959,7 @@ static int evdev_revoke(struct evdev *evdev, struct evdev_client *client,
 	client->revoked = true;
 	evdev_ungrab(evdev, client);
 	input_flush_device(&evdev->handle, file);
-	wake_up_interruptible_poll(&evdev->wait, EPOLLHUP | EPOLLERR);
+	wake_up_interruptible_poll(&client->wait, EPOLLHUP | EPOLLERR);
 
 	return 0;
 }
@@ -1372,7 +1372,6 @@ static int evdev_connect(struct input_handler *handler, struct input_dev *dev,
 	INIT_LIST_HEAD(&evdev->client_list);
 	spin_lock_init(&evdev->client_lock);
 	mutex_init(&evdev->mutex);
-	init_waitqueue_head(&evdev->wait);
 	evdev->exist = true;
 
 	dev_no = minor;
-- 
2.26.2

