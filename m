Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F65432DA4F
	for <lists+linux-input@lfdr.de>; Thu,  4 Mar 2021 20:24:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235089AbhCDTXe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Mar 2021 14:23:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42911 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235146AbhCDTXW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Mar 2021 14:23:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614885716;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=V62MrnoAFs7bt+pCWE2RRjxmq7tjdHYxCLb9JgJuvGw=;
        b=QUSOTqXwX7Ii+CF/Cm6SlvIqvk1dy/3eJT230e4emRsO+5m5XI08OXCqABTVVNI4hF6jXz
        AHfwt8IOyLPzFlyZ+xd7301gm+iGj5b1xGkHI4+VeIRqCRs6UObx3zjlrkzULsqNOevkbF
        zyufXPbWLKxuoAMRilxTZtOwSFJ79Jg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-h2co7ctxNWi_kUidsGJHXQ-1; Thu, 04 Mar 2021 14:21:55 -0500
X-MC-Unique: h2co7ctxNWi_kUidsGJHXQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC28180006E;
        Thu,  4 Mar 2021 19:21:53 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-177.ams2.redhat.com [10.36.114.177])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DAF092BFEB;
        Thu,  4 Mar 2021 19:21:52 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Alexander Kobel <a-kobel@a-kobel.de>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v4 8/9] HID: lenovo: Rework how the tp10ubkbd code decides which USB interface to use
Date:   Thu,  4 Mar 2021 20:21:33 +0100
Message-Id: <20210304192134.520919-9-hdegoede@redhat.com>
In-Reply-To: <20210304192134.520919-1-hdegoede@redhat.com>
References: <20210304192134.520919-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
2.30.1

