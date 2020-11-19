Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A02E2B93A6
	for <lists+linux-input@lfdr.de>; Thu, 19 Nov 2020 14:28:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbgKSN1h (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 08:27:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46444 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726719AbgKSN1h (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 08:27:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605792456;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=qbjekbf1q2T7pqIQKL2cYfzI7qwKgB3NTigEY/Sr9sA=;
        b=DpU8DbH5kWxk56WIWNgdoo14i79NL/e0d4VpjSVnl9pbjgBTILO75XlmWuSabqKH2Zrzss
        +IXdADQkx5nm5Baxz+Okcb9TjJeCRWgGMYQMZG7Jiua729FeQB4M3n5xVwjG3VDKwCjllI
        jFStcGpclOrCM/p2fD79X6WcYLM+Gzk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-zBSejgEqNP-HuSR9WWAhwg-1; Thu, 19 Nov 2020 08:27:34 -0500
X-MC-Unique: zBSejgEqNP-HuSR9WWAhwg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CA7018C43C1;
        Thu, 19 Nov 2020 13:27:33 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-115-169.ams2.redhat.com [10.36.115.169])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 93D205D6AB;
        Thu, 19 Nov 2020 13:27:28 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH] HID: logitech-hidpp: Add hid_device_id for V470 bluetooth mouse
Date:   Thu, 19 Nov 2020 14:27:27 +0100
Message-Id: <20201119132727.32036-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Logitech V470 bluetooth mouse supports HID++-1.0 over bluetooth,
add its id to the hidpp driver so that it handles it.

This enables battery monitoring support.

Note this mouse does not support hi-resolution scroll-wheel events.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-logitech-hidpp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index d062fffc6ebb..9cf8e7b440bc 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4057,6 +4057,8 @@ static const struct hid_device_id hidpp_devices[] = {
 	{ /* MX5500 keyboard over Bluetooth */
 	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb30b),
 	  .driver_data = HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS },
+	{ /* M-RCQ142 V470 Cordless Laser Mouse over Bluetooth */
+	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb008) },
 	{ /* MX Master mouse over Bluetooth */
 	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb012),
 	  .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
-- 
2.28.0

