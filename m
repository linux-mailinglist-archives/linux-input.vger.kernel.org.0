Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A84452E3196
	for <lists+linux-input@lfdr.de>; Sun, 27 Dec 2020 15:44:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgL0OoF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Dec 2020 09:44:05 -0500
Received: from out0.migadu.com ([94.23.1.103]:2966 "EHLO out0.migadu.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726209AbgL0OoA (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Dec 2020 09:44:00 -0500
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kl.wtf; s=default;
        t=1609080193;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=LlgK43BtTlQ6++cCaXNMqGTvJaDHPrjIe9skQ875zsU=;
        b=aZDq9BZCFD7bl/5IBCqHSaWdcz0o/oKE/iW/wE7KvAwYEZ1RULC3uDsR3RkGpFtthTnTyN
        EfGrnhL6/cSKXY0J0iGwGsSEpo6jD+uuelqYx1a5JHd9poTzu5e6B++qVXhoQ3pUgly9+h
        F+rMEbCuUZsa8f0epZNI+MXp/Acdjww=
From:   Kenny Levinsen <kl@kl.wtf>
To:     linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, linux-kernel@vger.kernel.org,
        Kenny Levinsen <kl@kl.wtf>
Subject: [PATCH] Input: evdev - use call_rcu when detaching client
Message-Id: <20201227144302.9419-1-kl@kl.wtf>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: kl@kl.wtf
Date:   Sun, 27 Dec 2020 14:43:13 GMT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Significant time was spent on synchronize_rcu in evdev_detach_client
when applications closed evdev devices. Switching VT away from a
graphical environment commonly leads to mass input device closures,
which could lead to noticable delays on systems with many input devices.

Replace synchronize_rcu with call_rcu, deferring reclaim of the evdev
client struct till after the RCU grace period instead of blocking the
calling application.

While this does not solve all slow evdev fd closures, it takes care of a
good portion of them, including this simple test:

	#include <fcntl.h>
	#include <unistd.h>

	int main(int argc, char *argv[])
	{
		int idx, fd;
		const char *path = "/dev/input/event0";
		for (idx = 0; idx < 1000; idx++) {
			if ((fd = open(path, O_RDWR)) == -1) {
				return -1;
			}
			close(fd);
		}
		return 0;
	}

Time to completion of above test when run locally:

	Before: 0m27.111s
	After:  0m0.018s

Signed-off-by: Kenny Levinsen <kl@kl.wtf>
---
 drivers/input/evdev.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
index 95f90699d2b1..2b10fe29d2c8 100644
--- a/drivers/input/evdev.c
+++ b/drivers/input/evdev.c
@@ -46,6 +46,7 @@ struct evdev_client {
 	struct fasync_struct *fasync;
 	struct evdev *evdev;
 	struct list_head node;
+	struct rcu_head rcu;
 	enum input_clock_type clk_type;
 	bool revoked;
 	unsigned long *evmasks[EV_CNT];
@@ -377,13 +378,22 @@ static void evdev_attach_client(struct evdev *evdev,
 	spin_unlock(&evdev->client_lock);
 }
 
+static void evdev_reclaim_client(struct rcu_head *rp)
+{
+	struct evdev_client *client = container_of(rp, struct evdev_client, rcu);
+	unsigned int i;
+	for (i = 0; i < EV_CNT; ++i)
+		bitmap_free(client->evmasks[i]);
+	kvfree(client);
+}
+
 static void evdev_detach_client(struct evdev *evdev,
 				struct evdev_client *client)
 {
 	spin_lock(&evdev->client_lock);
 	list_del_rcu(&client->node);
 	spin_unlock(&evdev->client_lock);
-	synchronize_rcu();
+	call_rcu(&client->rcu, evdev_reclaim_client);
 }
 
 static int evdev_open_device(struct evdev *evdev)
@@ -436,7 +446,6 @@ static int evdev_release(struct inode *inode, struct file *file)
 {
 	struct evdev_client *client = file->private_data;
 	struct evdev *evdev = client->evdev;
-	unsigned int i;
 
 	mutex_lock(&evdev->mutex);
 
@@ -448,11 +457,6 @@ static int evdev_release(struct inode *inode, struct file *file)
 
 	evdev_detach_client(evdev, client);
 
-	for (i = 0; i < EV_CNT; ++i)
-		bitmap_free(client->evmasks[i]);
-
-	kvfree(client);
-
 	evdev_close_device(evdev);
 
 	return 0;
@@ -495,7 +499,6 @@ static int evdev_open(struct inode *inode, struct file *file)
 
  err_free_client:
 	evdev_detach_client(evdev, client);
-	kvfree(client);
 	return error;
 }
 
-- 
2.29.2

