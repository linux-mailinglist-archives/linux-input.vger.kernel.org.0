Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 318476D77D9
	for <lists+linux-input@lfdr.de>; Wed,  5 Apr 2023 11:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237040AbjDEJMG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 Apr 2023 05:12:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237014AbjDEJMG (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 5 Apr 2023 05:12:06 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9641C10F9;
        Wed,  5 Apr 2023 02:12:03 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 26160C0004;
        Wed,  5 Apr 2023 09:11:57 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] USB: core: Fix docs warning caused by wireless_status feature
Date:   Wed,  5 Apr 2023 11:11:57 +0200
Message-Id: <20230405091157.35056-1-hadess@hadess.net>
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
Fixes: 0a4db185f078 ("USB: core: Add API to change the wireless_status")
---
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

