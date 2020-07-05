Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 635B8214E57
	for <lists+linux-input@lfdr.de>; Sun,  5 Jul 2020 20:01:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbgGESBd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 5 Jul 2020 14:01:33 -0400
Received: from vps-vb.mhejs.net ([37.28.154.113]:54412 "EHLO vps-vb.mhejs.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727773AbgGESBd (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 5 Jul 2020 14:01:33 -0400
X-Greylist: delayed 1585 seconds by postgrey-1.27 at vger.kernel.org; Sun, 05 Jul 2020 14:01:32 EDT
Received: from MUA
        by vps-vb.mhejs.net with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.93.0.4)
        (envelope-from <mail@maciej.szmigiero.name>)
        id 1js8Xf-0001OF-CT; Sun, 05 Jul 2020 19:35:03 +0200
From:   "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Harry Cutts <hcutts@chromium.org>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: logitech-hidpp: avoid repeated "multiplier = " log messages
Date:   Sun,  5 Jul 2020 19:34:57 +0200
Message-Id: <7d2c980f071487cecfd1534adb7561b33d922af3.1593970340.git.mail@maciej.szmigiero.name>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

These messages appear each time the mouse wakes from sleep, in my case
(Logitech M705), every minute or so.
Let's downgrade them to the "debug" level so they don't fill the kernel log
by default.

While we are at it, let's make clear that this is a wheel multiplier (and
not, for example, XY movement multiplier).

Fixes: 4435ff2f09a2 ("HID: logitech: Enable high-resolution scrolling on Logitech mice")
Cc: stable@vger.kernel.org
Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
---
Sending again since the previous message bounced for most recipients.

 drivers/hid/hid-logitech-hidpp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 1e1cf8eae649..b8b53dc95e86 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -3146,7 +3146,7 @@ static int hi_res_scroll_enable(struct hidpp_device *hidpp)
 		multiplier = 1;
 
 	hidpp->vertical_wheel_counter.wheel_multiplier = multiplier;
-	hid_info(hidpp->hid_dev, "multiplier = %d\n", multiplier);
+	hid_dbg(hidpp->hid_dev, "wheel multiplier = %d\n", multiplier);
 	return 0;
 }
 
