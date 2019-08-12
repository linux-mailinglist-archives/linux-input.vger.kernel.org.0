Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E489D8A2F7
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2019 18:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbfHLQIN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Aug 2019 12:08:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43844 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725843AbfHLQIN (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Aug 2019 12:08:13 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id EB7D2309DEE3;
        Mon, 12 Aug 2019 16:08:12 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-117-165.ams2.redhat.com [10.36.117.165])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D8DB3579A1;
        Mon, 12 Aug 2019 16:08:08 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>, Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH] HID: logitech-dj: add support of the G700(s) receiver
Date:   Mon, 12 Aug 2019 18:08:04 +0200
Message-Id: <20190812160804.11803-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Mon, 12 Aug 2019 16:08:12 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Both the G700 and the G700s are sharing the same receiver.
Include support for this receiver in hid-logitech-dj so that userspace
can differentiate both.

Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---
 drivers/hid/hid-logitech-dj.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index c547cba05fbb..d6250b0cb9f8 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -959,6 +959,7 @@ static void logi_hidpp_recv_queue_notif(struct hid_device *hdev,
 		break;
 	case 0x07:
 		device_type = "eQUAD step 4 Gaming";
+		logi_hidpp_dev_conn_notif_equad(hdev, hidpp_report, &workitem);
 		break;
 	case 0x08:
 		device_type = "eQUAD step 4 for gamepads";
@@ -1832,6 +1833,10 @@ static const struct hid_device_id logi_dj_receivers[] = {
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
 			 USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_2),
 	 .driver_data = recvr_type_hidpp},
+	{ /* Logitech G700(s) receiver (0xc531) */
+	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
+		0xc531),
+	 .driver_data = recvr_type_gaming_hidpp},
 	{ /* Logitech lightspeed receiver (0xc539) */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
 		USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED),
-- 
2.19.2

