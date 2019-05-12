Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CDB61ABD1
	for <lists+linux-input@lfdr.de>; Sun, 12 May 2019 12:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726274AbfELKgI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 May 2019 06:36:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41914 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726027AbfELKgI (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 May 2019 06:36:08 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id D559A308A946;
        Sun, 12 May 2019 10:36:07 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-91.ams2.redhat.com [10.36.116.91])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1D08368369;
        Sun, 12 May 2019 10:36:03 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH] HID: logitech-hidpp: Add support for the S510 remote control
Date:   Sun, 12 May 2019 12:36:02 +0200
Message-Id: <20190512103602.4754-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Sun, 12 May 2019 10:36:07 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The S510 remote-control shows up as a second keyboard (keypad) on the
receiver. It has a scroll-wheel, which normally sends wheel event
originating from the mouse's evdev node.

Add a HIDPP_QUIRK_KBD_SCROLL_WHEEL quirk for it, so that the wheel events
properly originate from the evdev node of the remote control itself.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-logitech-hidpp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index b99619d64080..14c84e1189a4 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -3747,6 +3747,9 @@ static const struct hid_device_id hidpp_devices[] = {
 	{ /* Keyboard MX3200 (Y-RAV80) */
 	  L27MHZ_DEVICE(0x005c),
 	  .driver_data = HIDPP_QUIRK_KBD_ZOOM_WHEEL },
+	{ /* S510 Media Remote */
+	  L27MHZ_DEVICE(0x00fe),
+	  .driver_data = HIDPP_QUIRK_KBD_SCROLL_WHEEL },
 
 	{ L27MHZ_DEVICE(HID_ANY_ID) },
 
-- 
2.21.0

