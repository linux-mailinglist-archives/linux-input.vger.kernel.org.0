Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD00A353759
	for <lists+linux-input@lfdr.de>; Sun,  4 Apr 2021 10:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbhDDIFA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Apr 2021 04:05:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60872 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230210AbhDDIFA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 4 Apr 2021 04:05:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617523496;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LZjgIxstBnqsDrasc5dTocmBOdU7YscxMH6lQXTtRvk=;
        b=QbdK1sv4O8tDCB2Vexua0fSKIfsZaZg/1S2tPQZSQB9NCbFxvVM1SfNfOfLpF5qe8RcrI/
        MI0KPpb/1GKeHHr0YI6BBOCtUPRkhx20S9kDJ2HQ8wSl34kqr//bH6wlBo102EvhszDdMs
        Jwwr204mrkiEUUWnjQbGScf33Q05GDI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-SuSzTLswMFOXt4RYYwuKeg-1; Sun, 04 Apr 2021 04:04:54 -0400
X-MC-Unique: SuSzTLswMFOXt4RYYwuKeg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4740550206;
        Sun,  4 Apr 2021 08:04:53 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-48.ams2.redhat.com [10.36.112.48])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B9BE6100E113;
        Sun,  4 Apr 2021 08:04:51 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Alexander Kobel <a-kobel@a-kobel.de>
Cc:     Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Subject: [PATCH v2 resend 8/9] HID: lenovo: Rework how the tp10ubkbd code decides which USB interface to use
Date:   Sun,  4 Apr 2021 10:04:31 +0200
Message-Id: <20210404080432.4322-9-hdegoede@redhat.com>
In-Reply-To: <20210404080432.4322-1-hdegoede@redhat.com>
References: <20210404080432.4322-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Instead of looking for a hdev with a type of HID_TYPE_USBMOUSE find
the interface for the mute/mic-mute/fn-lock LEDs by checking for the
output-report which is used to set them.

This is a preparation patch for adding support for the LEDs on the
X1 tablet thin keyboard which uses the same output-report, but has
a separate (third) USB interface for the touchpad/mouse functionality.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-lenovo.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index 2287142116b9..a33de5022ec3 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -959,11 +959,24 @@ static const struct attribute_group lenovo_attr_group_tp10ubkbd = {
 
 static int lenovo_probe_tp10ubkbd(struct hid_device *hdev)
 {
+	struct hid_report_enum *rep_enum;
 	struct lenovo_drvdata *data;
+	struct hid_report *rep;
+	bool found;
 	int ret;
 
-	/* All the custom action happens on the USBMOUSE device for USB */
-	if (hdev->type != HID_TYPE_USBMOUSE)
+	/*
+	 * The LEDs and the Fn-lock functionality use output report 9,
+	 * with an application of 0xffa0001, add the LEDs on the interface
+	 * with this output report.
+	 */
+	found = false;
+	rep_enum = &hdev->report_enum[HID_OUTPUT_REPORT];
+	list_for_each_entry(rep, &rep_enum->report_list, list) {
+		if (rep->application == 0xffa00001)
+			found = true;
+	}
+	if (!found)
 		return 0;
 
 	data = devm_kzalloc(&hdev->dev, sizeof(*data), GFP_KERNEL);
-- 
2.30.2

