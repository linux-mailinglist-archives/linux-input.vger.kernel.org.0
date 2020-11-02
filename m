Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B3982A2BA4
	for <lists+linux-input@lfdr.de>; Mon,  2 Nov 2020 14:37:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725796AbgKBNhJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Nov 2020 08:37:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43281 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725616AbgKBNhI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 2 Nov 2020 08:37:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604324227;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aJywWfQRwRXHAfrPQiwS5f9HbKGF6GHh+CZu/ker3Ew=;
        b=BcB5XwSH66wOurCwzX5DjVwCelcNHMrxIm9AQXvr8eH5yKVK53Jg/ropbeJQb1ytZqyWnr
        CFPyXRuSDrUHpz9kEULlWH9LQwckMFgB5I8qwm7qgyksuL79vkJkKEpS5SchwfFdODWDLE
        zsARMhkYao5LdRcUSDLBp7X3uY9E+44=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-PF9GlMloOqit4NHNTDHKVg-1; Mon, 02 Nov 2020 08:37:06 -0500
X-MC-Unique: PF9GlMloOqit4NHNTDHKVg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 394521842143;
        Mon,  2 Nov 2020 13:37:05 +0000 (UTC)
Received: from x1.localdomain (ovpn-113-9.ams2.redhat.com [10.36.113.9])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 35DC65DA6B;
        Mon,  2 Nov 2020 13:37:04 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 2/3] HID: logitech-hidpp: Add HIDPP_CONSUMER_VENDOR_KEYS quirk for the Dinovo Edge
Date:   Mon,  2 Nov 2020 14:36:57 +0100
Message-Id: <20201102133658.4410-2-hdegoede@redhat.com>
In-Reply-To: <20201102133658.4410-1-hdegoede@redhat.com>
References: <20201102133658.4410-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Like the MX5000 and MX5500 quad/bluetooth keyboards the Dinovo Edge also
needs the HIDPP_CONSUMER_VENDOR_KEYS quirk for some special keys to work.
Specifically without this the "Phone" and the 'A' - 'D' Smart Keys do not
send any events.

In addition to fixing these keys not sending any events, adding the
Bluetooth match, so that hid-logitech-hidpp is used instead of the
generic HID driver, also adds battery monitoring support when the
keyboard is connected over Bluetooth.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-logitech-hidpp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 792f52f7cb57..9fcd7f6c5a71 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -3981,6 +3981,9 @@ static const struct hid_device_id hidpp_devices[] = {
 	{ /* Keyboard MX5000 (Bluetooth-receiver in HID proxy mode) */
 	  LDJ_DEVICE(0xb305),
 	  .driver_data = HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS },
+	{ /* Dinovo Edge (Bluetooth-receiver in HID proxy mode) */
+	  LDJ_DEVICE(0xb309),
+	  .driver_data = HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS },
 	{ /* Keyboard MX5500 (Bluetooth-receiver in HID proxy mode) */
 	  LDJ_DEVICE(0xb30b),
 	  .driver_data = HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS },
@@ -4023,6 +4026,9 @@ static const struct hid_device_id hidpp_devices[] = {
 	{ /* MX5000 keyboard over Bluetooth */
 	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb305),
 	  .driver_data = HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS },
+	{ /* Dinovo Edge keyboard over Bluetooth */
+	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb309),
+	  .driver_data = HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS },
 	{ /* MX5500 keyboard over Bluetooth */
 	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb30b),
 	  .driver_data = HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS },
-- 
2.28.0

