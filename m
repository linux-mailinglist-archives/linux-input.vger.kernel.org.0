Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52EF3353970
	for <lists+linux-input@lfdr.de>; Sun,  4 Apr 2021 20:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230119AbhDDS4Y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Apr 2021 14:56:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39046 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230169AbhDDS4X (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 4 Apr 2021 14:56:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617562578;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=16bsfE5JM6Jz8CKY6ZqzepWK5CYD3jUt0rc6EGeAb7g=;
        b=dUTY/h6m8UtY7uaGK88Zuc2X62OrsBeIHEaDUGdf7xC83xaA2oYeaSY0wQw4ovBzQ2ZwI7
        Ne9q/T/Q+cwT241w1EsKqFY6Updpv+27ZikF4bf7pKrNDVXodwOhdfWuLN/6SeEqXseX/h
        fodiCFp8CbGXUqqYke/CChCYxi0BXzA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-qX-aFa95Mx-taumXi-8E2A-1; Sun, 04 Apr 2021 14:56:15 -0400
X-MC-Unique: qX-aFa95Mx-taumXi-8E2A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A439883DEA6;
        Sun,  4 Apr 2021 18:56:14 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-7.ams2.redhat.com [10.36.112.7])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9BBE060855;
        Sun,  4 Apr 2021 18:56:10 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH] HID: logitech-dj/hidpp: Add info/warn/err messages about 27 MHz keyboard encryption
Date:   Sun,  4 Apr 2021 20:56:09 +0200
Message-Id: <20210404185609.5120-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

By default 27 MHz Logitech keyboards send the keypresses to the receiver
in plain text. Logitech's Windows "Keyboard and Mouse settings" tool allows
configuring encryption for the keyboard wireless link.

Now there also is a Linux tool for setting this up:
https://gitlab.freedesktop.org/jwrdegoede/logitech-27mhz-keyboard-encryption-setup

Once a keyboard is paired in encrypted mode, it will no longer work with
any receiver other then the receiver it was paired with.
If a user accidentally tries to pair another keyboard with the receiver
with which a keyboard has been paired in encrypted mode, then the receiver
looses the encryption key and the originally paired keyboard will no longer
work with either that receiver, or another receiver until the keyboard's
encryption key is rewritten by another encrypted mode pairing using the
tool. Or until it is reset by following a special reset procedure.

This commit adds 3 new log messages related to 27 MHz keyboard link
encryption to the Logitech dj / hidpp drivers:

1. An info level message when keyboard encryption is being used
2. A warning message when keyboard encryption is not used
3. An error message when the encryption key has been lost and the
   keyboard will not work because of this

Messages 2. and 3. contain a link to the userspace tool to setup the
encryption. The linked page also contains instructions to clear the key
(without needing the tool) to help a user recover from the keyboard not
working in case 3.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-logitech-dj.c    |  8 ++++++++
 drivers/hid/hid-logitech-hidpp.c | 12 ++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index fa835d565982..18d37b3765f3 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -100,6 +100,7 @@
 #define HIDPP_DEVICE_TYPE_MASK			GENMASK(3, 0)
 #define HIDPP_LINK_STATUS_MASK			BIT(6)
 #define HIDPP_MANUFACTURER_MASK			BIT(7)
+#define HIDPP_27MHZ_SECURE_MASK			BIT(7)
 
 #define HIDPP_DEVICE_TYPE_KEYBOARD		1
 #define HIDPP_DEVICE_TYPE_MOUSE			2
@@ -984,6 +985,13 @@ static void logi_hidpp_dev_conn_notif_27mhz(struct hid_device *hdev,
 		workitem->reports_supported |= STD_MOUSE | HIDPP;
 		break;
 	case 3: /* Index 3 is always the keyboard */
+		if (hidpp_report->params[HIDPP_PARAM_DEVICE_INFO] & HIDPP_27MHZ_SECURE_MASK) {
+			hid_info(hdev, "Keyboard connection is encrypted\n");
+		} else {
+			hid_warn(hdev, "Keyboard events are send over the air in plain-text / unencrypted\n");
+			hid_warn(hdev, "See: https://gitlab.freedesktop.org/jwrdegoede/logitech-27mhz-keyboard-encryption-setup/\n");
+		}
+		fallthrough;
 	case 4: /* Index 4 is used for an optional separate numpad */
 		workitem->device_type = HIDPP_DEVICE_TYPE_KEYBOARD;
 		workitem->reports_supported |= STD_KEYBOARD | MULTIMEDIA |
diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index d459e2dbe647..9814f6c623fb 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -56,6 +56,8 @@ MODULE_PARM_DESC(disable_tap_to_click,
 #define HIDPP_SUB_ID_CONSUMER_VENDOR_KEYS	0x03
 #define HIDPP_SUB_ID_ROLLER			0x05
 #define HIDPP_SUB_ID_MOUSE_EXTRA_BTNS		0x06
+#define HIDPP_SUB_ID_USER_IFACE_EVENT		0x08
+#define HIDPP_USER_IFACE_EVENT_ENCRYPTION_KEY_LOST	BIT(5)
 
 #define HIDPP_QUIRK_CLASS_WTP			BIT(0)
 #define HIDPP_QUIRK_CLASS_M560			BIT(1)
@@ -3527,6 +3529,16 @@ static int hidpp_raw_hidpp_event(struct hidpp_device *hidpp, u8 *data,
 		return 1;
 	}
 
+	if (hidpp->hid_dev->group == HID_GROUP_LOGITECH_27MHZ_DEVICE &&
+	    data[0] == REPORT_ID_HIDPP_SHORT &&
+	    data[2] == HIDPP_SUB_ID_USER_IFACE_EVENT &&
+	    (data[3] & HIDPP_USER_IFACE_EVENT_ENCRYPTION_KEY_LOST)) {
+		dev_err_ratelimited(&hidpp->hid_dev->dev,
+			"Error the keyboard's wireless encryption key has been lost, your keyboard will not work unless you re-configure encryption.\n");
+		dev_err_ratelimited(&hidpp->hid_dev->dev,
+			"See: https://gitlab.freedesktop.org/jwrdegoede/logitech-27mhz-keyboard-encryption-setup/\n");
+	}
+
 	if (hidpp->capabilities & HIDPP_CAPABILITY_HIDPP20_BATTERY) {
 		ret = hidpp20_battery_event_1000(hidpp, data, size);
 		if (ret != 0)
-- 
2.30.2

