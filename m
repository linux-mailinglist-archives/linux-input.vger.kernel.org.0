Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC0FB31C313
	for <lists+linux-input@lfdr.de>; Mon, 15 Feb 2021 21:40:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbhBOUjt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Feb 2021 15:39:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39186 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229615AbhBOUjt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Feb 2021 15:39:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613421502;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=NItAS8wI+TBQvsBsmps5OnlgxM07ewSSuEP1uPWhu8s=;
        b=B4g+xPLHykIhVibeWCQI+bysuumoH9ITzzv/VirX0GeovEBx/fdmuK1CpyXrbLRHS9beNG
        3DZAR/810QeqUpB0TazZGDap9gUx8sSWajCN+V9Vknq+IW1fyavxnulXjdFE1MOfbpXvlP
        dgAljADWChYSWVKo8R25/qHsZfRaCBo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-DWKYamU8O-iyxDb4-6BOAA-1; Mon, 15 Feb 2021 15:38:21 -0500
X-MC-Unique: DWKYamU8O-iyxDb4-6BOAA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 748D6BBEE2;
        Mon, 15 Feb 2021 20:38:19 +0000 (UTC)
Received: from x1.localdomain (ovpn-115-74.ams2.redhat.com [10.36.115.74])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 617D95D9C0;
        Mon, 15 Feb 2021 20:38:15 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 1/5] HID: lenovo: Fix false positive errors on setting tp10ubkbd LEDs
Date:   Mon, 15 Feb 2021 21:38:10 +0100
Message-Id: <20210215203814.699633-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix the error check in lenovo_led_set_tp10ubkbd(), on success
hid_hw_raw_request() returns the number of bytes send. So we should
check for (ret != 3) rather then for (ret != 0).

Fixes: bc04b37ea0ec ("HID: lenovo: Add ThinkPad 10 Ultrabook Keyboard support")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-lenovo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index c6c8e20f3e8d..69d709439676 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -75,7 +75,7 @@ static void lenovo_led_set_tp10ubkbd(struct hid_device *hdev, u8 led_code,
 	data->led_report[2] = value ? TP10UBKBD_LED_ON : TP10UBKBD_LED_OFF;
 	ret = hid_hw_raw_request(hdev, data->led_report[0], data->led_report, 3,
 				 HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
-	if (ret)
+	if (ret != 3)
 		hid_err(hdev, "Set LED output report error: %d\n", ret);
 
 	mutex_unlock(&data->led_report_mutex);
-- 
2.30.1

