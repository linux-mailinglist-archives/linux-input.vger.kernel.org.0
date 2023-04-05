Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6844A6D7835
	for <lists+linux-input@lfdr.de>; Wed,  5 Apr 2023 11:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237521AbjDEJ2y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 Apr 2023 05:28:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237518AbjDEJ2c (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 5 Apr 2023 05:28:32 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53DE2E64;
        Wed,  5 Apr 2023 02:28:04 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 5F040100015;
        Wed,  5 Apr 2023 09:27:55 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH v2] USB: core: Fix docs warning caused by wireless_status feature
Date:   Wed,  5 Apr 2023 11:27:54 +0200
Message-Id: <20230405092754.36579-1-hadess@hadess.net>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix wrongly named 'dev' parameter in doc block, should have been iface:
drivers/usb/core/message.c:1939: warning: Function parameter or member 'iface' not described in 'usb_set_wireless_status'
drivers/usb/core/message.c:1939: warning: Excess function parameter 'dev' description in 'usb_set_wireless_status'

And fix missing struct member doc in kernel API, and reorder to
match struct:
include/linux/usb.h:270: warning: Function parameter or member 'wireless_status_work' not described in 'usb_interface'

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Link: https://lore.kernel.org/linux-next/20230405114807.5a57bf46@canb.auug.org.au/T/#t
Fixes: 0a4db185f078 ("USB: core: Add API to change the wireless_status")
Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
Added missing link and sob, thanks to bentiss for the quick review

 drivers/usb/core/message.c | 2 +-
 include/linux/usb.h        | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index 7930dca84616..7c7f88ca4f62 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -1926,7 +1926,7 @@ static void __usb_wireless_status_intf(struct work_struct *ws)
 
 /**
  * usb_set_wireless_status - sets the wireless_status struct member
- * @dev: the device to modify
+ * @iface: the interface to modify
  * @status: the new wireless status
  *
  * Set the wireless_status struct member to the new value, and emit
diff --git a/include/linux/usb.h b/include/linux/usb.h
index a48eeec62a66..56f4758f3c31 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -203,14 +203,16 @@ enum usb_wireless_status {
  *	following a reset or suspend operation it doesn't support.
  * @authorized: This allows to (de)authorize individual interfaces instead
  *	a whole device in contrast to the device authorization.
+ * @wireless_status: if the USB device uses a receiver/emitter combo, whether
+ *	the emitter is connected.
+ * @wireless_status_work: Used for scheduling wireless status changes
+ * 	from atomic context.
  * @dev: driver model's view of this device
  * @usb_dev: if an interface is bound to the USB major, this will point
  *	to the sysfs representation for that device.
  * @reset_ws: Used for scheduling resets from atomic context.
  * @resetting_device: USB core reset the device, so use alt setting 0 as
  *	current; needs bandwidth alloc after reset.
- * @wireless_status: if the USB device uses a receiver/emitter combo, whether
- *	the emitter is connected.
  *
  * USB device drivers attach to interfaces on a physical device.  Each
  * interface encapsulates a single high level function, such as feeding
-- 
2.40.0

