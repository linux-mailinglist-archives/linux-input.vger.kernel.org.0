Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3B1974A64
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2019 11:52:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726282AbfGYJwB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Jul 2019 05:52:01 -0400
Received: from mx2.suse.de ([195.135.220.15]:57058 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725808AbfGYJwB (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Jul 2019 05:52:01 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 9EA22AD8A;
        Thu, 25 Jul 2019 09:52:00 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     josh@joshisanerd.com, linux-input@vger.kernel.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] kbtab: sanity check for endpoint type
Date:   Thu, 25 Jul 2019 11:51:58 +0200
Message-Id: <20190725095158.7420-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The driver should check whether the endpoint it uses has the correct
type.

Reported-by: syzbot+c7df50363aaff50aa363@syzkaller.appspotmail.com
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/input/tablet/kbtab.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/input/tablet/kbtab.c b/drivers/input/tablet/kbtab.c
index 04b85571f41e..6f3b59ea2cd4 100644
--- a/drivers/input/tablet/kbtab.c
+++ b/drivers/input/tablet/kbtab.c
@@ -116,6 +116,9 @@ static int kbtab_probe(struct usb_interface *intf, const struct usb_device_id *i
 
 	if (intf->cur_altsetting->desc.bNumEndpoints < 1)
 		return -ENODEV;
+	endpoint = &intf->cur_altsetting->endpoint[0].desc;
+	if (!usb_endpoint_is_int_in(endpoint))
+		return -ENODEV;
 
 	kbtab = kzalloc(sizeof(struct kbtab), GFP_KERNEL);
 	input_dev = input_allocate_device();
@@ -155,8 +158,6 @@ static int kbtab_probe(struct usb_interface *intf, const struct usb_device_id *i
 	input_set_abs_params(input_dev, ABS_Y, 0, 0x1750, 4, 0);
 	input_set_abs_params(input_dev, ABS_PRESSURE, 0, 0xff, 0, 0);
 
-	endpoint = &intf->cur_altsetting->endpoint[0].desc;
-
 	usb_fill_int_urb(kbtab->irq, dev,
 			 usb_rcvintpipe(dev, endpoint->bEndpointAddress),
 			 kbtab->data, 8,
-- 
2.16.4

