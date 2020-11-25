Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4EB02C40FE
	for <lists+linux-input@lfdr.de>; Wed, 25 Nov 2020 14:18:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729318AbgKYNSO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Wed, 25 Nov 2020 08:18:14 -0500
Received: from plasma4.jpberlin.de ([80.241.57.33]:38203 "EHLO
        plasma4.jpberlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbgKYNSO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Nov 2020 08:18:14 -0500
X-Greylist: delayed 524 seconds by postgrey-1.27 at vger.kernel.org; Wed, 25 Nov 2020 08:18:13 EST
Received: from spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de [80.241.56.125])
        by plasma.jpberlin.de (Postfix) with ESMTP id D2786AB8BD;
        Wed, 25 Nov 2020 14:09:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([80.241.56.68])
        by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de [80.241.56.125]) (amavisd-new, port 10030)
        with ESMTP id Do3T6i8jw2_u; Wed, 25 Nov 2020 14:09:25 +0100 (CET)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client CN "*.opensynergy.com", Issuer "Starfield Secure Certificate Authority - G2" (not verified))
        (Authenticated sender: opensynergy@jpberlin.de)
        by plasma.jpberlin.de (Postfix) with ESMTPSA id 6E4CFAAC9A;
        Wed, 25 Nov 2020 14:09:24 +0100 (CET)
From:   Vasyl Vavrychuk <vasyl.vavrychuk@opensynergy.com>
To:     <linux-input@vger.kernel.org>,
        <virtualization@lists.linux-foundation.org>
CC:     Gerd Hoffmann <kraxel@redhat.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        CROMBEZ Mathias <mathias.crombez@faurecia.com>,
        Vasyl Vavrychuk <vasyl.vavrychuk@opensynergy.com>
Subject: [PATCH] virtio-input: add multi-touch support
Date:   Wed, 25 Nov 2020 15:09:02 +0200
Message-ID: <20201125130902.10185-1-vasyl.vavrychuk@opensynergy.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain
X-ClientProxiedBy: SR-MAIL-02.open-synergy.com (10.26.10.22) To
 SR-MAIL-01.open-synergy.com (10.26.10.21)
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -4.61 / 15.00 / 15.00
X-Rspamd-Queue-Id: D2786AB8BD
X-Rspamd-UID: 7b76c8
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Mathias Crombez <mathias.crombez@faurecia.com>

Without multi-touch slots allocated, ABS_MT_SLOT events will be lost by
input_handle_abs_event.

Signed-off-by: Mathias Crombez <mathias.crombez@faurecia.com>
Signed-off-by: Vasyl Vavrychuk <vasyl.vavrychuk@opensynergy.com>
Tested-by: Vasyl Vavrychuk <vasyl.vavrychuk@opensynergy.com>
---
 drivers/virtio/Kconfig        | 11 +++++++++++
 drivers/virtio/virtio_input.c |  8 ++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
index 7b41130d3f35..2cfd5b01d96d 100644
--- a/drivers/virtio/Kconfig
+++ b/drivers/virtio/Kconfig
@@ -111,6 +111,17 @@ config VIRTIO_INPUT

         If unsure, say M.

+config VIRTIO_INPUT_MULTITOUCH_SLOTS
+       depends on VIRTIO_INPUT
+       int "Number of multitouch slots"
+       range 0 64
+       default 10
+       help
+        Define the number of multitouch slots used. Default to 10.
+        This parameter is unused if there is no multitouch capability.
+
+        0 will disable the feature.
+
 config VIRTIO_MMIO
        tristate "Platform bus driver for memory mapped virtio devices"
        depends on HAS_IOMEM && HAS_DMA
diff --git a/drivers/virtio/virtio_input.c b/drivers/virtio/virtio_input.c
index f1f6208edcf5..13f3d90e6c30 100644
--- a/drivers/virtio/virtio_input.c
+++ b/drivers/virtio/virtio_input.c
@@ -7,6 +7,7 @@

 #include <uapi/linux/virtio_ids.h>
 #include <uapi/linux/virtio_input.h>
+#include <linux/input/mt.h>

 struct virtio_input {
        struct virtio_device       *vdev;
@@ -205,6 +206,7 @@ static int virtinput_probe(struct virtio_device *vdev)
        unsigned long flags;
        size_t size;
        int abs, err;
+       bool is_mt = false;

        if (!virtio_has_feature(vdev, VIRTIO_F_VERSION_1))
                return -ENODEV;
@@ -287,9 +289,15 @@ static int virtinput_probe(struct virtio_device *vdev)
                for (abs = 0; abs < ABS_CNT; abs++) {
                        if (!test_bit(abs, vi->idev->absbit))
                                continue;
+                       if (input_is_mt_value(abs))
+                               is_mt = true;
                        virtinput_cfg_abs(vi, abs);
                }
        }
+       if (is_mt)
+               input_mt_init_slots(vi->idev,
+                                   CONFIG_VIRTIO_INPUT_MULTITOUCH_SLOTS,
+                                   INPUT_MT_DIRECT);

        virtio_device_ready(vdev);
        vi->ready = true;
--
2.23.0


Please mind our privacy notice<https://www.opensynergy.com/datenschutzerklaerung/privacy-notice-for-business-partners-pursuant-to-article-13-of-the-general-data-protection-regulation-gdpr/> pursuant to Art. 13 GDPR. // Unsere Hinweise zum Datenschutz gem. Art. 13 DSGVO finden Sie hier.<https://www.opensynergy.com/de/datenschutzerklaerung/datenschutzhinweise-fuer-geschaeftspartner-gem-art-13-dsgvo/>
