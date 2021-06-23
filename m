Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 385FF3B206E
	for <lists+linux-input@lfdr.de>; Wed, 23 Jun 2021 20:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbhFWSn7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 23 Jun 2021 14:43:59 -0400
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21315 "EHLO
        sender4-of-o53.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbhFWSn5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 23 Jun 2021 14:43:57 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1624473690; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=mkehzUmVHoCUncWZ8ZTHJtkryvxbRyxDfv7xb1SX6kBFEvjt+kcisbodGyBWGgBiXTT2p1yadTn43AbfBhRCiCe/20XW9FzHLKs46Miv9IKmmK2boGZ7u4GYWz8gvlM/3Sn+5rmSK0uMJf2Xq42F/wAgLa4Ys7oHowFyplkVams=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1624473690; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=a0aZd2nt4DPjia7/Fj05AyVF/MJKOxRj/yaO2GlO0CE=; 
        b=S+A37kz/R8FmreeiZW4aCbFmJVyiPsFwJJqsjiV/17P7IjhvVP+o7m7E7NgcCFuolpe47Ss26mg73cG6ZQfpiSnfA3yFeXaEUS8jrp/jMj7cHThFzkgO/41DEvPmYuqdXpXFPs5oHlW5mZ+h9E/gHjT9ofCyLI6Q/zzFI9kMpww=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=anirudhrb.com;
        spf=pass  smtp.mailfrom=mail@anirudhrb.com;
        dmarc=pass header.from=<mail@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1624473690;
        s=zoho; d=anirudhrb.com; i=mail@anirudhrb.com;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
        bh=a0aZd2nt4DPjia7/Fj05AyVF/MJKOxRj/yaO2GlO0CE=;
        b=SUrC6OwZq/rCbtQxyCZGU5fOXjNZ6Dpaxjr5sztKxrRr+2ScJhFVw/+SoqCapbMW
        l9J2Ub5ooDfDRGZt1bN3V2UDK9uaY24SPBvX4unNvo1j9YbaBCjzmvRvlnZQtkypcA1
        rha3UOic3yUyVKsthvds/y5QjTaNoVVaDvNjvS18=
Received: from localhost.localdomain (106.51.111.168 [106.51.111.168]) by mx.zohomail.com
        with SMTPS id 1624473685552656.6071262710982; Wed, 23 Jun 2021 11:41:25 -0700 (PDT)
From:   Anirudh Rayabharam <mail@anirudhrb.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Anirudh Rayabharam <mail@anirudhrb.com>,
        syzbot+47b26cd837ececfc666d@syzkaller.appspotmail.com,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] usbhid: free raw_report buffers in usbhid_stop
Date:   Thu, 24 Jun 2021 00:10:29 +0530
Message-Id: <20210623184030.17281-1-mail@anirudhrb.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Free the unsent raw_report buffers when the device is removed.

Fixes a memory leak reported by syzbot at:
https://syzkaller.appspot.com/bug?id=7b4fa7cb1a7c2d3342a2a8a6c53371c8c418ab47

Reported-by: syzbot+47b26cd837ececfc666d@syzkaller.appspotmail.com
Tested-by: syzbot+47b26cd837ececfc666d@syzkaller.appspotmail.com
Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
---
 drivers/hid/usbhid/hid-core.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index 4e9077363c96..9c970e63670e 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -505,7 +505,7 @@ static void hid_ctrl(struct urb *urb)
 
 	if (unplug) {
 		usbhid->ctrltail = usbhid->ctrlhead;
-	} else {
+	} else if (usbhid->ctrlhead != usbhid->ctrltail) {
 		usbhid->ctrltail = (usbhid->ctrltail + 1) & (HID_CONTROL_FIFO_SIZE - 1);
 
 		if (usbhid->ctrlhead != usbhid->ctrltail &&
@@ -1223,9 +1223,20 @@ static void usbhid_stop(struct hid_device *hid)
 	mutex_lock(&usbhid->mutex);
 
 	clear_bit(HID_STARTED, &usbhid->iofl);
+
 	spin_lock_irq(&usbhid->lock);	/* Sync with error and led handlers */
 	set_bit(HID_DISCONNECTED, &usbhid->iofl);
+	while (usbhid->ctrltail != usbhid->ctrlhead) {
+		if (usbhid->ctrl[usbhid->ctrltail].dir == USB_DIR_OUT) {
+			kfree(usbhid->ctrl[usbhid->ctrltail].raw_report);
+			usbhid->ctrl[usbhid->ctrltail].raw_report = NULL;
+		}
+
+		usbhid->ctrltail = (usbhid->ctrltail + 1) &
+			(HID_CONTROL_FIFO_SIZE - 1);
+	}
 	spin_unlock_irq(&usbhid->lock);
+
 	usb_kill_urb(usbhid->urbin);
 	usb_kill_urb(usbhid->urbout);
 	usb_kill_urb(usbhid->urbctrl);
-- 
2.26.2

