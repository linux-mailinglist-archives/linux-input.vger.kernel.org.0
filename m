Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E501F4575E
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2019 10:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbfFNIUh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jun 2019 04:20:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50058 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726647AbfFNIUg (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jun 2019 04:20:36 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 18A4C3082E63;
        Fri, 14 Jun 2019 08:20:36 +0000 (UTC)
Received: from shalem.localdomain.com (unknown [10.36.118.15])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2BAF760BE2;
        Fri, 14 Jun 2019 08:20:35 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH] HID: logitech-dj: Fix forwarding of very long HID++ reports
Date:   Fri, 14 Jun 2019 10:20:27 +0200
Message-Id: <20190614082027.4270-2-hdegoede@redhat.com>
In-Reply-To: <20190614082027.4270-1-hdegoede@redhat.com>
References: <20190614082027.4270-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Fri, 14 Jun 2019 08:20:36 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The HID++ spec also defines very long HID++ reports, with a reportid of
0x12. The MX5000 and MX5500 keyboards use 0x12 output reports for sending
messages to display on their buildin LCD.

Userspace (libmx5000) supports this, in order for this to work when talking
to the HID devices instantiated for the keyboard by hid-logitech-dj,
we need to properly forward these reports to the device.

This commit fixes logi_dj_ll_raw_request not forwarding these reports.

Fixes: f2113c3020ef ("HID: logitech-dj: add support for Logitech Bluetooth Mini-Receiver")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-logitech-dj.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 865b179d0a62..aedbe18182db 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -30,6 +30,7 @@
 
 #define REPORT_ID_HIDPP_SHORT			0x10
 #define REPORT_ID_HIDPP_LONG			0x11
+#define REPORT_ID_HIDPP_VERY_LONG		0x12
 
 #define HIDPP_REPORT_SHORT_LENGTH		7
 #define HIDPP_REPORT_LONG_LENGTH		20
@@ -1242,7 +1243,8 @@ static int logi_dj_ll_raw_request(struct hid_device *hid,
 	int ret;
 
 	if ((buf[0] == REPORT_ID_HIDPP_SHORT) ||
-	    (buf[0] == REPORT_ID_HIDPP_LONG)) {
+	    (buf[0] == REPORT_ID_HIDPP_LONG) ||
+	    (buf[0] == REPORT_ID_HIDPP_VERY_LONG)) {
 		if (count < 2)
 			return -EINVAL;
 
-- 
2.21.0

