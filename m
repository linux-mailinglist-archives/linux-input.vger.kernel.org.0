Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E10F31C317
	for <lists+linux-input@lfdr.de>; Mon, 15 Feb 2021 21:40:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbhBOUjv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Feb 2021 15:39:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27749 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229615AbhBOUju (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Feb 2021 15:39:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613421504;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7YUhd3rnFGxWAHiwpUAU4waTHxmBpvk8O53lSKRm2jE=;
        b=WLeDVausKGsWH4PukAguzCjsTIvHvxj2SDtlB23cEZv+mS3r47IFfRVw7KeRmfC9q2GOB9
        FUd6/QAiDoWdgi/s+JQd593omwNUWsZgbZwlaGow5DblMsWQqDkl3HB69FFvHN6BbeYJ97
        CLTvVvqrGo4GgpYMDmMjh0xZo9TPP/M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-HJbFkcSkOG2F4sHqwqthCw-1; Mon, 15 Feb 2021 15:38:22 -0500
X-MC-Unique: HJbFkcSkOG2F4sHqwqthCw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4F8B80196C;
        Mon, 15 Feb 2021 20:38:21 +0000 (UTC)
Received: from x1.localdomain (ovpn-115-74.ams2.redhat.com [10.36.115.74])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E24A75D9C0;
        Mon, 15 Feb 2021 20:38:20 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 3/5] HID: lenovo: Check hid_get_drvdata() returns non NULL in lenovo_event()
Date:   Mon, 15 Feb 2021 21:38:12 +0100
Message-Id: <20210215203814.699633-3-hdegoede@redhat.com>
In-Reply-To: <20210215203814.699633-1-hdegoede@redhat.com>
References: <20210215203814.699633-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The HID lenovo probe function only attaches drvdata to one of the
USB interfaces, but lenovo_event() will get called for all USB interfaces
to which hid-lenovo is bound.

This allows a malicious device to fake being a device handled by
hid-lenovo, which generates events for which lenovo_event() has
special handling (and thus dereferences hid_get_drvdata()) on another
interface triggering a NULL pointer exception.

Add a check for hid_get_drvdata() returning NULL, avoiding this
possible NULL pointer exception.

Fixes: bc04b37ea0ec ("HID: lenovo: Add ThinkPad 10 Ultrabook Keyboard support")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-lenovo.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index 9b80b1685b53..50ae770a4fb1 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -498,6 +498,9 @@ static int lenovo_event_cptkbd(struct hid_device *hdev,
 static int lenovo_event(struct hid_device *hdev, struct hid_field *field,
 		struct hid_usage *usage, __s32 value)
 {
+	if (!hid_get_drvdata(hdev))
+		return 0;
+
 	switch (hdev->product) {
 	case USB_DEVICE_ID_LENOVO_CUSBKBD:
 	case USB_DEVICE_ID_LENOVO_CBTKBD:
-- 
2.30.1

