Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0214432DA4A
	for <lists+linux-input@lfdr.de>; Thu,  4 Mar 2021 20:24:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234259AbhCDTXb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Mar 2021 14:23:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50374 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234242AbhCDTXO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Mar 2021 14:23:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614885709;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=p38eAJH9GWfWbk+QeHT3qFm1wDX3Dc9F7CzTGARVMfw=;
        b=EwdJejKqv6Wh74AW8ZQ1+nmiaSxpH9YYNLk0gmz5YiT5EPa0jGptyQFE5lz0YP4yzwiFy2
        H1whMMh2nfKIUiy3TXZE9tcn7BGg2VQ1cCN9Vm0cuWxgBIVwer9vqzT0ZcNSNd1s63yjRa
        WWDtmdJCfQjTdRlt8rS4sn5QnDl94AU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-HYsp7bdrO5-IwhbYvzHuJw-1; Thu, 04 Mar 2021 14:21:46 -0500
X-MC-Unique: HYsp7bdrO5-IwhbYvzHuJw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5F241966324;
        Thu,  4 Mar 2021 19:21:45 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-177.ams2.redhat.com [10.36.114.177])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7DA962BFEB;
        Thu,  4 Mar 2021 19:21:44 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Alexander Kobel <a-kobel@a-kobel.de>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v4 3/9] HID: lenovo: Check hid_get_drvdata() returns non NULL in lenovo_event()
Date:   Thu,  4 Mar 2021 20:21:28 +0100
Message-Id: <20210304192134.520919-4-hdegoede@redhat.com>
In-Reply-To: <20210304192134.520919-1-hdegoede@redhat.com>
References: <20210304192134.520919-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Reviewed-by: Marek Behún <kabel@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-lenovo.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index ee175ab54281..b2596ed37880 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -508,6 +508,9 @@ static int lenovo_event_cptkbd(struct hid_device *hdev,
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

