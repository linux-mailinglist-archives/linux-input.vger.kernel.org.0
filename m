Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7781B32E7
	for <lists+linux-input@lfdr.de>; Wed, 22 Apr 2020 01:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725850AbgDUXKh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Apr 2020 19:10:37 -0400
Received: from mail.codeweavers.com ([50.203.203.244]:50402 "EHLO
        mail.codeweavers.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725822AbgDUXKh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Apr 2020 19:10:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=codeweavers.com; s=6377696661; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=7DudBciPB1e5s8G2L11l6q3llWsVDr0JKDijVFOLFZY=; b=KK0Tp5Mb1x7KZhiylvqTS2uNMR
        ccELMJiZoexc14N+Vgv1D5CU5T49DvVCo0439h23JrLNs+1q6xcPCFY9s+XE1llMGyR1yBTd5WnKO
        PdE5Uzz2nQ4ItZpC93lXfiKMg98UUutM/dWJ9alf5MbUvB76dETr9zClgIVnVPQgggKM=;
Received: from cpe-107-184-2-226.socal.res.rr.com ([107.184.2.226] helo=zen.bslabs.net)
        by mail.codeweavers.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <bshanks@codeweavers.com>)
        id 1jR22E-0007TX-FB; Tue, 21 Apr 2020 18:10:35 -0500
From:   Brendan Shanks <bshanks@codeweavers.com>
To:     linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, mathieu.maret@gmail.com,
        Brendan Shanks <bshanks@codeweavers.com>
Subject: [PATCH] Input: evdev - Call input_flush_device() on release(), not flush()
Date:   Tue, 21 Apr 2020 16:10:03 -0700
Message-Id: <20200421231003.7935-1-bshanks@codeweavers.com>
X-Mailer: git-send-email 2.25.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -25.7
X-Spam-Report: Spam detection software, running on the system "mail.codeweavers.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  input_flush_device() should only be called once the struct
    file is being released and no open descriptors remain, but evdev_flush()
   was calling it whenever a file descriptor was closed. This caused uploaded
    force-feedback effects to be erased when a process did a dup()/close() on
    the event FD, called system(), etc. 
 Content analysis details:   (-25.7 points, 5.0 required)
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  -20 USER_IN_WHITELIST      From: address is in the user's white-list
 -6.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
 -0.5 BAYES_00               BODY: Bayes spam probability is 0 to 1%
                             [score: 0.0000]
  0.8 AWL                    AWL: Adjusted score from AWL reputation of From: address
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

input_flush_device() should only be called once the struct file is being
released and no open descriptors remain, but evdev_flush() was calling
it whenever a file descriptor was closed.

This caused uploaded force-feedback effects to be erased when a process
did a dup()/close() on the event FD, called system(), etc.

Call input_flush_device() from evdev_release() instead.

Reported-by: Mathieu Maret <mathieu.maret@gmail.com>
Signed-off-by: Brendan Shanks <bshanks@codeweavers.com>
---
 drivers/input/evdev.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
index cb6e3a5f509c..3c006b265729 100644
--- a/drivers/input/evdev.c
+++ b/drivers/input/evdev.c
@@ -326,20 +326,6 @@ static int evdev_fasync(int fd, struct file *file, int on)
 	return fasync_helper(fd, file, on, &client->fasync);
 }
 
-static int evdev_flush(struct file *file, fl_owner_t id)
-{
-	struct evdev_client *client = file->private_data;
-	struct evdev *evdev = client->evdev;
-
-	mutex_lock(&evdev->mutex);
-
-	if (evdev->exist && !client->revoked)
-		input_flush_device(&evdev->handle, file);
-
-	mutex_unlock(&evdev->mutex);
-	return 0;
-}
-
 static void evdev_free(struct device *dev)
 {
 	struct evdev *evdev = container_of(dev, struct evdev, dev);
@@ -453,6 +439,9 @@ static int evdev_release(struct inode *inode, struct file *file)
 	unsigned int i;
 
 	mutex_lock(&evdev->mutex);
+	if (evdev->exist && !client->revoked)
+		input_flush_device(&evdev->handle, file);
+
 	evdev_ungrab(evdev, client);
 	mutex_unlock(&evdev->mutex);
 
@@ -1310,7 +1299,6 @@ static const struct file_operations evdev_fops = {
 	.compat_ioctl	= evdev_ioctl_compat,
 #endif
 	.fasync		= evdev_fasync,
-	.flush		= evdev_flush,
 	.llseek		= no_llseek,
 };
 
-- 
2.25.3

