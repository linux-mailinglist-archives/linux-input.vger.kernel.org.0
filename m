Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 057C2320540
	for <lists+linux-input@lfdr.de>; Sat, 20 Feb 2021 13:26:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbhBTM0U (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Feb 2021 07:26:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27472 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229678AbhBTM0S (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Feb 2021 07:26:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613823892;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xABmbysZEbKQ7tqZDCIsmVUSOCJTc6/N9SEah+SR7no=;
        b=CPwyRDxSNRZ7AQO3wN8f2+Ij/9zJ1Vegy+WENQcffSlzmLyWKjFSqp5k7YxDBHpBZGYIZB
        76Ta+68IlnwOxcQAEHTGk/p6ZfFTWmNlH3i48c743ol3aYaB9PfAdLqDvKvXDGEl2EhJif
        E9d5a7M98pHV0nLTLJr6E/KdEzikadc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-qwCdnOxIPqa2_lxHZ3tv5Q-1; Sat, 20 Feb 2021 07:24:48 -0500
X-MC-Unique: qwCdnOxIPqa2_lxHZ3tv5Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A880B1009619;
        Sat, 20 Feb 2021 12:24:47 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-29.ams2.redhat.com [10.36.112.29])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8585410016FF;
        Sat, 20 Feb 2021 12:24:46 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH v2 3/7] HID: lenovo: Check hid_get_drvdata() returns non NULL in lenovo_event()
Date:   Sat, 20 Feb 2021 13:24:34 +0100
Message-Id: <20210220122438.21857-4-hdegoede@redhat.com>
In-Reply-To: <20210220122438.21857-1-hdegoede@redhat.com>
References: <20210220122438.21857-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
index 49b8767a8d30..f1868b5d9b58 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -502,6 +502,9 @@ static int lenovo_event_cptkbd(struct hid_device *hdev,
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

