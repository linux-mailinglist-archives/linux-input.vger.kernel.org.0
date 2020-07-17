Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDEC2223AB3
	for <lists+linux-input@lfdr.de>; Fri, 17 Jul 2020 13:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbgGQLmU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Jul 2020 07:42:20 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:48911 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726686AbgGQLmK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Jul 2020 07:42:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594986129;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qiiTCNya4knXKs5AxhGGf8x1TgrdQl/qReA9nncjnNg=;
        b=IZp+RNgvDooooZfhJHpUWxMal+4XSBkk4fhpCqaHMeqRYHEWXLeu7mWJi0PeB14PHNPl1Q
        1lOTcA3YEbSxOveD53ivV28lW06GGjxUUCW+Gli/BBlPsZDW7kru0Gh8JgYVHisd3iE0dp
        K5EGn1y47+lOSz1Nk3pqWAFq5pl3OuM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-DVYQz0QJMGWeCsjNLwWN5A-1; Fri, 17 Jul 2020 07:42:07 -0400
X-MC-Unique: DVYQz0QJMGWeCsjNLwWN5A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B97D2C7465;
        Fri, 17 Jul 2020 11:42:05 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-162.ams2.redhat.com [10.36.112.162])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7B65F5D9E7;
        Fri, 17 Jul 2020 11:42:03 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Marco Trevisan <marco.trevisan@canonical.com>,
        Mark Pearson <mpearson@lenovo.com>,
        Christian Kellner <ckellner@redhat.com>,
        Benjamin Berg <bberg@redhat.com>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] platform/x86: thinkpad_acpi: Add support for new hotkeys found on X1C8 / T14
Date:   Fri, 17 Jul 2020 13:41:54 +0200
Message-Id: <20200717114155.56222-3-hdegoede@redhat.com>
In-Reply-To: <20200717114155.56222-1-hdegoede@redhat.com>
References: <20200717114155.56222-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

New Lenovo Thinkpad models, e.g. the X1 Carbon 8th gen and the new T14 gen1
models have 3 new symbols / shortcuts on their F9-F11 keys (and the
thinkpad_acpi driver receives 3 new hkey events for these):

F9:  Has a symbol resembling a rectangular speech baloon, the manual says
     the hotkey functions shows or hides the notification center
F10: Has a symbol of a telephone horn which has been picked up from the
     receiver, the manual says: "Answer incoming calls"
F11: Has a symbol of a telephone horn which is resting on the receiver,
     the manual says: "Decline incoming calls"

This commit adds support for these 3 new hotkeys.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 7dd84cb4fcef..7fc44b6f8370 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -1915,6 +1915,10 @@ enum {	/* hot key scan codes (derived from ACPI DSDT) */
 	TP_ACPI_HOTKEYSCAN_CALCULATOR,
 	TP_ACPI_HOTKEYSCAN_BLUETOOTH,
 	TP_ACPI_HOTKEYSCAN_KEYBOARD,
+	TP_ACPI_HOTKEYSCAN_1316, /* 0x1316 scancode is unknown */
+	TP_ACPI_HOTKEYSCAN_NOTIFICATION_CENTER,
+	TP_ACPI_HOTKEYSCAN_PICKUP_PHONE,
+	TP_ACPI_HOTKEYSCAN_HANGUP_PHONE,
 
 	/* Hotkey keymap size */
 	TPACPI_HOTKEY_MAP_LEN
@@ -3431,11 +3435,15 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 		KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN,
 		KEY_UNKNOWN,
 
-		KEY_BOOKMARKS,       /* Favorite app, 0x311 */
-		KEY_RESERVED,        /* Clipping tool */
-		KEY_CALC,            /* Calculator (above numpad, P52) */
-		KEY_BLUETOOTH,       /* Bluetooth */
-		KEY_KEYBOARD         /* Keyboard, 0x315 */
+		KEY_BOOKMARKS,			/* Favorite app, 0x311 */
+		KEY_RESERVED,			/* Clipping tool */
+		KEY_CALC,			/* Calculator (above numpad, P52) */
+		KEY_BLUETOOTH,			/* Bluetooth */
+		KEY_KEYBOARD,			/* Keyboard, 0x315 */
+		KEY_UNKNOWN,			/* 0x316, unknown */
+		KEY_NOTIFICATION_CENTER,	/* Notification Center */
+		KEY_PICKUP_PHONE,		/* Answer incoming call */
+		KEY_HANGUP_PHONE,		/* Decline incoming call */
 		},
 	};
 
-- 
2.26.2

