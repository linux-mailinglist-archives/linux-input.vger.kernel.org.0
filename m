Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 657112589DC
	for <lists+linux-input@lfdr.de>; Tue,  1 Sep 2020 09:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728092AbgIAH4x (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Sep 2020 03:56:53 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:24239 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726044AbgIAH4v (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Sep 2020 03:56:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1598947010;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=bLnuRbbYsf4fHQLytzm5gCMW5oqEUC+3d/3gRJCAdOg=;
        b=Wjk63R6AC221zYdSO8ZmbToGsPQksg9jJwbWjuVobhX2gebd+ls5AcE30W0sm4GOI+fDmh
        W58wu2gO/5qDwGtKgSBcd54TLCLGndQfEYbCWTSstOXzwnTE4DRIp+fiwlwLwwIONH36Hu
        ZBR5SDEDkqmg3J13z0CJ1uo5p7f7fvo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-xJDD3KEIOqai0shdKO3seQ-1; Tue, 01 Sep 2020 03:56:48 -0400
X-MC-Unique: xJDD3KEIOqai0shdKO3seQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C0961888A29;
        Tue,  1 Sep 2020 07:56:47 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-149.ams2.redhat.com [10.36.114.149])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1741161177;
        Tue,  1 Sep 2020 07:56:42 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH] HID: ite: Add USB id match for Acer One S1003 keyboard dock
Date:   Tue,  1 Sep 2020 09:56:42 +0200
Message-Id: <20200901075642.4648-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Acer One S1003 2-in-1 keyboard dock uses a Synaptics S910xx touchpad
which is connected to an ITE 8910 USB keyboard controller chip.

This keyboard has the same quirk for its rfkill / airplane mode hotkey as
other keyboards with ITE keyboard chips, it only sends a single release
event when pressed and released, it never sends a press event.

This commit adds this keyboards USB id to the hid-ite id-table, fixing
the rfkill key not working on this keyboard. Note that like for the
Acer Aspire Switch 10 (SW5-012) the id-table entry matches on the
HID_GROUP_GENERIC generic group so that hid-ite only binds to the
keyboard interface and the mouse/touchpad interface is left untouched
so that hid-multitouch can bind to it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-ids.h | 1 +
 drivers/hid/hid-ite.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index a8e3b2796be8..798d173d2f35 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1120,6 +1120,7 @@
 #define USB_DEVICE_ID_SYNAPTICS_DELL_K12A	0x2819
 #define USB_DEVICE_ID_SYNAPTICS_ACER_SWITCH5_012	0x2968
 #define USB_DEVICE_ID_SYNAPTICS_TP_V103	0x5710
+#define USB_DEVICE_ID_SYNAPTICS_ACER_ONE_S1003	0x73f5
 #define USB_DEVICE_ID_SYNAPTICS_ACER_SWITCH5	0x81a7
 
 #define USB_VENDOR_ID_TEXAS_INSTRUMENTS	0x2047
diff --git a/drivers/hid/hid-ite.c b/drivers/hid/hid-ite.c
index 6c55682c5974..044a93f3c117 100644
--- a/drivers/hid/hid-ite.c
+++ b/drivers/hid/hid-ite.c
@@ -44,6 +44,10 @@ static const struct hid_device_id ite_devices[] = {
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_SYNAPTICS,
 		     USB_DEVICE_ID_SYNAPTICS_ACER_SWITCH5_012) },
+	/* ITE8910 USB kbd ctlr, with Synaptics touchpad connected to it. */
+	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
+		     USB_VENDOR_ID_SYNAPTICS,
+		     USB_DEVICE_ID_SYNAPTICS_ACER_ONE_S1003) },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, ite_devices);
-- 
2.28.0

