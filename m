Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A54E374EE2
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2019 15:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729951AbfGYNNh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Jul 2019 09:13:37 -0400
Received: from mx2.suse.de ([195.135.220.15]:54958 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725808AbfGYNNh (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Jul 2019 09:13:37 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 181A1AFC4;
        Thu, 25 Jul 2019 13:13:36 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] holtek: test for sanity of intfdata
Date:   Thu, 25 Jul 2019 15:13:33 +0200
Message-Id: <20190725131333.26192-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The ioctl handler uses the intfdata of a second interface,
which may not be present in a broken or malicious device, hence
the intfdata needs to be checked for NULL.

Reported-by: syzbot+965152643a75a56737be@syzkaller.appspotmail.com
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/hid/hid-holtek-kbd.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-holtek-kbd.c b/drivers/hid/hid-holtek-kbd.c
index b3d502421b79..67ce75dfa9a4 100644
--- a/drivers/hid/hid-holtek-kbd.c
+++ b/drivers/hid/hid-holtek-kbd.c
@@ -123,9 +123,14 @@ static int holtek_kbd_input_event(struct input_dev *dev, unsigned int type,
 
 	/* Locate the boot interface, to receive the LED change events */
 	struct usb_interface *boot_interface = usb_ifnum_to_if(usb_dev, 0);
-
-	struct hid_device *boot_hid = usb_get_intfdata(boot_interface);
-	struct hid_input *boot_hid_input = list_first_entry(&boot_hid->inputs,
+	struct hid_device *boot_hid;
+	struct hid_input *boot_hid_input;
+
+	if (unlikely(boot_interface == NULL))
+		return -ENODEV;
+       
+	boot_hid = usb_get_intfdata(boot_interface);
+	boot_hid_input = list_first_entry(&boot_hid->inputs,
 		struct hid_input, list);
 
 	return boot_hid_input->input->event(boot_hid_input->input, type, code,
-- 
2.16.4

