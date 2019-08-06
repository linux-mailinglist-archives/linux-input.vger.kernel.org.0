Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13AB7833B4
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2019 16:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732893AbfHFOPr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Aug 2019 10:15:47 -0400
Received: from mx2.suse.de ([195.135.220.15]:54638 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732892AbfHFOPr (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 6 Aug 2019 10:15:47 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id F0C83AF32;
        Tue,  6 Aug 2019 14:15:45 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] iforce: add sanity checks
Date:   Tue,  6 Aug 2019 16:15:38 +0200
Message-Id: <20190806141538.8121-2-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190806141538.8121-1-oneukum@suse.com>
References: <20190806141538.8121-1-oneukum@suse.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The endpoint type should also be checked before a device
is accepted.

Reported-by: syzbot+5efc10c005014d061a74@syzkaller.appspotmail.com
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/input/joystick/iforce/iforce-usb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/input/joystick/iforce/iforce-usb.c b/drivers/input/joystick/iforce/iforce-usb.c
index 29abfeeef9a5..a481a226166c 100644
--- a/drivers/input/joystick/iforce/iforce-usb.c
+++ b/drivers/input/joystick/iforce/iforce-usb.c
@@ -203,6 +203,11 @@ static int iforce_usb_probe(struct usb_interface *intf,
 	epirq = &interface->endpoint[0].desc;
 	epout = &interface->endpoint[1].desc;
 
+	if (!usb_endpoint_is_int_in(epirq))
+		return -ENODEV;
+	if (!usb_endpoint_is_int_out(epout))
+		return -ENODEV;
+
 	iforce_usb = kzalloc(sizeof(*iforce_usb), GFP_KERNEL);
 	if (!iforce_usb)
 		goto fail;
-- 
2.16.4

