Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEA282F6F96
	for <lists+linux-input@lfdr.de>; Fri, 15 Jan 2021 01:36:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731290AbhAOAgC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Jan 2021 19:36:02 -0500
Received: from mx1.opensynergy.com ([217.66.60.4]:62738 "EHLO
        mx1.opensynergy.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729048AbhAOAgB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Jan 2021 19:36:01 -0500
X-Greylist: delayed 520 seconds by postgrey-1.27 at vger.kernel.org; Thu, 14 Jan 2021 19:36:01 EST
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain [127.0.0.1])
        by mx1.opensynergy.com (Proxmox) with ESMTP id 09218A1372;
        Fri, 15 Jan 2021 01:26:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
         h=cc:cc:content-transfer-encoding:content-type:content-type
        :date:from:from:message-id:mime-version:reply-to:subject:subject
        :to:to; s=srmailgate02; bh=vjQz/FTdcUA4ikts1emzODkjkcrbE4dUUeRlg
        xezK8s=; b=qW2W7tpA30Q0V4IIuz28HwNuJ/Ixfi/osS5uVNjrsQX3QtIenqFor
        o5ZPjJVKypOQFbZEU8O+C2sne911M4vQ5odKwrH3YxV6r8XF3m3Ht2IJfJ8wegqS
        0lmKcrTApoySlxWOu1KRWuFdaJ/nk1rJEPQGdXx+EKqMF9tv4d3Ri7Y0mqgv8PQs
        aGyrQGx9zXMfwREtBUdzElhoxQiPLrg8YXYESz8J8EqO8OdSo8mki9J+XMnPcdt7
        KAUvZ80eZ+6Dd/rkdIRlkiajLBXj90AowVuHCP/f9KjDva9aGEycaoBSu+4GmqgB
        +F774G3+DvXRU+UDSorxhle2JqZhMmyQQ==
From:   Vasyl Vavrychuk <vasyl.vavrychuk@opensynergy.com>
To:     <virtualization@lists.linux-foundation.org>,
        <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>
CC:     "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Mathias Crombez <mathias.crombez@faurecia.com>,
        Vasyl Vavrychuk <vasyl.vavrychuk@opensynergy.com>
Subject: [PATCH RESEND v3] virtio-input: add multi-touch support
Date:   Fri, 15 Jan 2021 02:26:23 +0200
Message-ID: <20210115002623.8576-1-vasyl.vavrychuk@opensynergy.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SR-MAIL-01.open-synergy.com (10.26.10.21) To
 SR-MAIL-01.open-synergy.com (10.26.10.21)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Mathias Crombez <mathias.crombez@faurecia.com>

Without multi-touch slots allocated, ABS_MT_SLOT events will be lost by
input_handle_abs_event.

Implementation is based on uinput_create_device.

Signed-off-by: Mathias Crombez <mathias.crombez@faurecia.com>
Co-developed-by: Vasyl Vavrychuk <vasyl.vavrychuk@opensynergy.com>
Signed-off-by: Vasyl Vavrychuk <vasyl.vavrychuk@opensynergy.com>
---
v2: fix patch corrupted by corporate email server
v3: use number of slots from the host

Resend since to feedback.

 drivers/virtio/virtio_input.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_input.c b/drivers/virtio/virtio_input.c
index f1f6208edcf5..f643536807dd 100644
--- a/drivers/virtio/virtio_input.c
+++ b/drivers/virtio/virtio_input.c
@@ -7,6 +7,7 @@
 
 #include <uapi/linux/virtio_ids.h>
 #include <uapi/linux/virtio_input.h>
+#include <linux/input/mt.h>
 
 struct virtio_input {
 	struct virtio_device       *vdev;
@@ -204,7 +205,7 @@ static int virtinput_probe(struct virtio_device *vdev)
 	struct virtio_input *vi;
 	unsigned long flags;
 	size_t size;
-	int abs, err;
+	int abs, err, nslots;
 
 	if (!virtio_has_feature(vdev, VIRTIO_F_VERSION_1))
 		return -ENODEV;
@@ -289,6 +290,13 @@ static int virtinput_probe(struct virtio_device *vdev)
 				continue;
 			virtinput_cfg_abs(vi, abs);
 		}
+
+		if (test_bit(ABS_MT_SLOT, vi->idev->absbit)) {
+			nslots = input_abs_get_max(vi->idev, ABS_MT_SLOT) + 1;
+			err = input_mt_init_slots(vi->idev, nslots, 0);
+			if (err)
+				goto err_mt_init_slots;
+		}
 	}
 
 	virtio_device_ready(vdev);
@@ -304,6 +312,7 @@ static int virtinput_probe(struct virtio_device *vdev)
 	spin_lock_irqsave(&vi->lock, flags);
 	vi->ready = false;
 	spin_unlock_irqrestore(&vi->lock, flags);
+err_mt_init_slots:
 	input_free_device(vi->idev);
 err_input_alloc:
 	vdev->config->del_vqs(vdev);
-- 
2.20.1


