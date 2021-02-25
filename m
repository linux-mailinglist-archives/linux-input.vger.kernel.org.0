Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8418D3251C1
	for <lists+linux-input@lfdr.de>; Thu, 25 Feb 2021 15:53:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232429AbhBYOxE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Feb 2021 09:53:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbhBYOxC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Feb 2021 09:53:02 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B183C061574;
        Thu, 25 Feb 2021 06:52:21 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id f1so8978770lfu.3;
        Thu, 25 Feb 2021 06:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b0Yk5ew37ynltShNJp4k5V36iPk1KvT5BVOHRHFaH5s=;
        b=leTObcTkk9Ve7VFdaV/zIX8dqgSqu7CAzf5FNcAUl19xRnOm5za1DBzelVKwSnZiYC
         qEG4FlPGGbTQJQ/8xCt+0awAsS59bSzZPhWg0X4zzN+vLQTVLLb7FD7OKLOV+VY8mtxn
         6jRB9AU53GJc63xn86LhgphVD0q3OO4OOflMBGkCLP4RCSjwVCGp0+IqDdEBJbrXmB5U
         kD/AQFC6T+U0PdI7gWj+CY4OL/mEqFQrBA/7LW7cK5EhaYIn6zmI5+od1hUFbFeIRXv6
         6FTqNlkUvRAfpr+Fz98nNPBTHm7zpSlKWcANWLZ5Rab0trJdH5IXL5Jhv1TraEaa9fDN
         zE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b0Yk5ew37ynltShNJp4k5V36iPk1KvT5BVOHRHFaH5s=;
        b=AVH2fT09fpJQKaug8/os/NkUZqxib+TGQPk+CjuGRnb8BDzR1H7TOUZlMDYTLM1AsH
         n5Y7IcUomEDYw0SEyYu5ofE2ERA9M6D/P0LAkYu94pgiy1tFjdsY4YTBdCYL7JyLuxh4
         N48uTScePSWqEfb+GfQCafj/9DvUmuYwurQzcrrDjJ/+T6+Mx8/mzQNstr9JqPN8NVPj
         tgYfVkPGH2SJnkXdaf7yXkqY+xuHuERy7TOv0FntsMXv2Jevk091Rb5CXjIAdXV1jxVp
         /Zx9hz30O5BWH/2MU7ZiBowl4gYNFqmjgJ6H2jruzX57sL12V9CQQ3m9xQktYSR1im6d
         mWLw==
X-Gm-Message-State: AOAM531dEyx3o5nrKNN3XXCFX8qf7fhtBk0uKyXIx2lEYe5V6Oi2r49z
        WiOt8JtOWJFdNhA9mcOSSN79jotaccnko/xM
X-Google-Smtp-Source: ABdhPJw/miGXH2CYM18vtvSrYyG6DV61kC26JwSH7Z4wz78Qz8gxAJlaYZL6kT12HczTp2bmlr7KiQ==
X-Received: by 2002:a05:6512:224f:: with SMTP id i15mr2199244lfu.545.1614264740055;
        Thu, 25 Feb 2021 06:52:20 -0800 (PST)
Received: from localhost.localdomain ([37.150.90.70])
        by smtp.googlemail.com with ESMTPSA id r7sm1146506lfr.230.2021.02.25.06.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 06:52:19 -0800 (PST)
From:   Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        syzbot+ab02336a647181a886a6@syzkaller.appspotmail.com
Subject: [PATCH] drivers/hid: fix for the big hid report length
Date:   Thu, 25 Feb 2021 20:52:15 +0600
Message-Id: <20210225145215.3438202-1-snovitoll@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

syzbot found WARNING in hid_alloc_report_buf[1] when the raw buffer for
report is kmalloc() allocated with length > KMALLOC_MAX_SIZE, causing
order >= MAX_ORDER condition:

u8 *hid_alloc_report_buf(struct hid_report *report, gfp_t flags)
{
	/*
	 * 7 extra bytes are necessary to achieve proper functionality
	 * of implement() working on 8 byte chunks
	 */

	u32 len = hid_report_len(report) + 7;

	return kmalloc(len, flags);

The restriction with HID_MAX_BUFFER_SIZE (16kb) is, seems, a valid max
limit. I've come up with this in all hid_report_len() xrefs.

The fix inside hid_report_len(), not in *hid_alloc_report_buf() is also
fixing out-of-bounds here in memcpy():

statc int hid_submit_ctrl(..)
{
..
	len = hid_report_len(report);
	if (dir == USB_DIR_OUT) {
		..
		if (raw_report) {
			memcpy(usbhid->ctrlbuf, raw_report, len);
..

So I've decided to return HID_MAX_BUFFER_SIZE if it the report length is
bigger than limit, otherwise the return the report length.

[1]
Call Trace:
 alloc_pages include/linux/gfp.h:547 [inline]
 kmalloc_order+0x40/0x130 mm/slab_common.c:837
 kmalloc_order_trace+0x15/0x70 mm/slab_common.c:853
 kmalloc_large include/linux/slab.h:481 [inline]
 __kmalloc+0x257/0x330 mm/slub.c:3974
 kmalloc include/linux/slab.h:557 [inline]
 hid_alloc_report_buf+0x70/0xa0 drivers/hid/hid-core.c:1648
 __usbhid_submit_report drivers/hid/usbhid/hid-core.c:590 [inline]

Reported-by: syzbot+ab02336a647181a886a6@syzkaller.appspotmail.com
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 drivers/hid/usbhid/hid-core.c | 2 +-
 include/linux/hid.h           | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

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
index c39d71eb1fd0..509a6ffdca00 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1156,7 +1156,9 @@ static inline void hid_hw_wait(struct hid_device *hdev)
 static inline u32 hid_report_len(struct hid_report *report)
 {
 	/* equivalent to DIV_ROUND_UP(report->size, 8) + !!(report->id > 0) */
-	return ((report->size - 1) >> 3) + 1 + (report->id > 0);
+	u32 len = ((report->size - 1) >> 3) + 1 + (report->id > 0);
+
+	return len > HID_MAX_BUFFER_SIZE ? HID_MAX_BUFFER_SIZE : len;
 }
 
 int hid_report_raw_event(struct hid_device *hid, int type, u8 *data, u32 size,
-- 
2.25.1

