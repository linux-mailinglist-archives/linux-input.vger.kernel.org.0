Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22C1D36A8AE
	for <lists+linux-input@lfdr.de>; Sun, 25 Apr 2021 19:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230359AbhDYRxe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 25 Apr 2021 13:53:34 -0400
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21348 "EHLO
        sender4-of-o53.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbhDYRxe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 25 Apr 2021 13:53:34 -0400
X-Greylist: delayed 904 seconds by postgrey-1.27 at vger.kernel.org; Sun, 25 Apr 2021 13:53:34 EDT
ARC-Seal: i=1; a=rsa-sha256; t=1619372265; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=fywXrVS5FDz6iU2UMI38X0Fikxn98aH2GUygN9jtSMHGaQcRFey+e8nCvWZRYNSfrcC0DgH3afaGzw/PdOTJXUCjWDPj9+UhJOnq2OMBgSpU7fpz8j2kdn6DAMoVFAaJsiVBaXKEWKMmv1XVJWiX8vci4rSqCQI5+OAZZdOAud0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1619372265; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=k/EGKXFAZVuJOd2JkD/RJjW4fi/tHKJRxr2RkqQG2Do=; 
        b=UXRWi7MJ3YF0d33lLIIRegelrktSJhhi6qRGWm7+xK1UPeAQaKZS7mIgkiLBaW/PKi5gTFauYgeBHbSK7xaMX2Km7RFZpxBm3eiHsxame0qkyN87MyoLxGh9pQU2Dh6YaibJsUzM7VOikhFO8FT7cHW3uoKiPnejzYG+k7inKRo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=anirudhrb.com;
        spf=pass  smtp.mailfrom=mail@anirudhrb.com;
        dmarc=pass header.from=<mail@anirudhrb.com> header.from=<mail@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1619372265;
        s=zoho; d=anirudhrb.com; i=mail@anirudhrb.com;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
        bh=k/EGKXFAZVuJOd2JkD/RJjW4fi/tHKJRxr2RkqQG2Do=;
        b=MQeLg+DkcwiBucf3gKN4zHpugUU+ZfFm44TS+mQL0Ckm9C+2cPNv025i49WXlwxK
        3L26ZXqb5K88mqgNN50g0ViwD+JvHD/ag1O3xll0MiVaVg7VqdpcPAURcz3ajZD2aqI
        VovkqqKulT0PClkW/qRPhWaVTULat/J7gvlMG3Jw=
Received: from localhost.localdomain (49.207.208.26 [49.207.208.26]) by mx.zohomail.com
        with SMTPS id 1619372262325930.7778518171191; Sun, 25 Apr 2021 10:37:42 -0700 (PDT)
From:   Anirudh Rayabharam <mail@anirudhrb.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Anirudh Rayabharam <mail@anirudhrb.com>,
        syzbot+7c2bb71996f95a82524c@syzkaller.appspotmail.com,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] usbhid: fix info leak in hid_submit_ctrl
Date:   Sun, 25 Apr 2021 23:03:53 +0530
Message-Id: <20210425173353.10231-1-mail@anirudhrb.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In hid_submit_ctrl(), the way of calculating the report length doesn't
take into account that report->size can be zero. When running the
syzkaller reproducer, a report of size 0 causes hid_submit_ctrl) to
calculate transfer_buffer_length as 16384. When this urb is passed to
the usb core layer, KMSAN reports an info leak of 16384 bytes.

To fix this, first modify hid_report_len() to account for the zero
report size case by using DIV_ROUND_UP for the division. Then, call it
from hid_submit_ctrl().

Reported-by: syzbot+7c2bb71996f95a82524c@syzkaller.appspotmail.com
Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
---
 drivers/hid/usbhid/hid-core.c | 2 +-
 include/linux/hid.h           | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index 86257ce6d619..4e9077363c96 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -374,7 +374,7 @@ static int hid_submit_ctrl(struct hid_device *hid)
 	raw_report = usbhid->ctrl[usbhid->ctrltail].raw_report;
 	dir = usbhid->ctrl[usbhid->ctrltail].dir;
 
-	len = ((report->size - 1) >> 3) + 1 + (report->id > 0);
+	len = hid_report_len(report);
 	if (dir == USB_DIR_OUT) {
 		usbhid->urbctrl->pipe = usb_sndctrlpipe(hid_to_usb_dev(hid), 0);
 		usbhid->urbctrl->transfer_buffer_length = len;
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 271021e20a3f..10e922cee4eb 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1167,8 +1167,7 @@ static inline void hid_hw_wait(struct hid_device *hdev)
  */
 static inline u32 hid_report_len(struct hid_report *report)
 {
-	/* equivalent to DIV_ROUND_UP(report->size, 8) + !!(report->id > 0) */
-	return ((report->size - 1) >> 3) + 1 + (report->id > 0);
+	return DIV_ROUND_UP(report->size, 8) + (report->id > 0);
 }
 
 int hid_report_raw_event(struct hid_device *hid, int type, u8 *data, u32 size,
-- 
2.26.2

