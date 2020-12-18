Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E3032DEC03
	for <lists+linux-input@lfdr.de>; Sat, 19 Dec 2020 00:27:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbgLRX1N (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Dec 2020 18:27:13 -0500
Received: from plasma4.jpberlin.de ([80.241.57.33]:45101 "EHLO
        plasma4.jpberlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgLRX1M (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Dec 2020 18:27:12 -0500
Received: from hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
        by plasma.jpberlin.de (Postfix) with ESMTP id B0DEBAAD30;
        Sat, 19 Dec 2020 00:26:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([91.198.250.140])
        by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172]) (amavisd-new, port 10030)
        with ESMTP id 8qM22asEXxr6; Sat, 19 Dec 2020 00:26:24 +0100 (CET)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client CN "*.opensynergy.com", Issuer "Starfield Secure Certificate Authority - G2" (not verified))
        (Authenticated sender: opensynergy@jpberlin.de)
        by plasma.jpberlin.de (Postfix) with ESMTPSA id 82FB5AAD16;
        Sat, 19 Dec 2020 00:26:24 +0100 (CET)
From:   Vasyl Vavrychuk <vasyl.vavrychuk@opensynergy.com>
To:     <virtualization@lists.linux-foundation.org>,
        <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>
CC:     "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mathias Crombez <mathias.crombez@faurecia.com>,
        Vasyl Vavrychuk <vasyl.vavrychuk@opensynergy.com>
Subject: [PATCH v3 RESEND] virtio-input: add multi-touch support
Date:   Sat, 19 Dec 2020 01:25:56 +0200
Message-ID: <20201218232556.28041-1-vasyl.vavrychuk@opensynergy.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SR-MAIL-02.open-synergy.com (10.26.10.22) To
 SR-MAIL-01.open-synergy.com (10.26.10.21)
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -3.06 / 15.00 / 15.00
X-Rspamd-Queue-Id: B0DEBAAD30
X-Rspamd-UID: 4cff26
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
2.23.0

