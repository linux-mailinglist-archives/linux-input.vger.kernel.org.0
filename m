Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16E5D8C635
	for <lists+linux-input@lfdr.de>; Wed, 14 Aug 2019 04:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728453AbfHNCNu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Aug 2019 22:13:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:45826 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728430AbfHNCNs (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Aug 2019 22:13:48 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5BE0E20843;
        Wed, 14 Aug 2019 02:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565748827;
        bh=X+Ec1Epi8YKzHbbrViQD/m0/f4StJkTKOw6RGCVSHYI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HccSGUEDp01Xnr0iuZeN/fmJ9AAiqvCo8N3ScCELPhf+EoBGqs+221qYAdoY+cMJl
         7FTwJHcVQ4Ri3UJ1NgXj5rE3iZ8FhyIHgKgfEwR+V/RIgI6wqN/BjgLro/z7MQ9SAr
         371jwFqrq6EvYgDm9d7fi4MFkE318xPaeSsxxcsU=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>,
        syzbot+965152643a75a56737be@syzkaller.appspotmail.com,
        Jiri Kosina <jkosina@suse.cz>, Sasha Levin <sashal@kernel.org>,
        linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 087/123] HID: holtek: test for sanity of intfdata
Date:   Tue, 13 Aug 2019 22:10:11 -0400
Message-Id: <20190814021047.14828-87-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190814021047.14828-1-sashal@kernel.org>
References: <20190814021047.14828-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Oliver Neukum <oneukum@suse.com>

[ Upstream commit 01ec0a5f19c8c82960a07f6c7410fc9e01d7fb51 ]

The ioctl handler uses the intfdata of a second interface,
which may not be present in a broken or malicious device, hence
the intfdata needs to be checked for NULL.

[jkosina@suse.cz: fix newly added spurious space]
Reported-by: syzbot+965152643a75a56737be@syzkaller.appspotmail.com
Signed-off-by: Oliver Neukum <oneukum@suse.com>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-holtek-kbd.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-holtek-kbd.c b/drivers/hid/hid-holtek-kbd.c
index b3d502421b79d..0a38e8e9bc783 100644
--- a/drivers/hid/hid-holtek-kbd.c
+++ b/drivers/hid/hid-holtek-kbd.c
@@ -123,9 +123,14 @@ static int holtek_kbd_input_event(struct input_dev *dev, unsigned int type,
 
 	/* Locate the boot interface, to receive the LED change events */
 	struct usb_interface *boot_interface = usb_ifnum_to_if(usb_dev, 0);
+	struct hid_device *boot_hid;
+	struct hid_input *boot_hid_input;
 
-	struct hid_device *boot_hid = usb_get_intfdata(boot_interface);
-	struct hid_input *boot_hid_input = list_first_entry(&boot_hid->inputs,
+	if (unlikely(boot_interface == NULL))
+		return -ENODEV;
+
+	boot_hid = usb_get_intfdata(boot_interface);
+	boot_hid_input = list_first_entry(&boot_hid->inputs,
 		struct hid_input, list);
 
 	return boot_hid_input->input->event(boot_hid_input->input, type, code,
-- 
2.20.1

