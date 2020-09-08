Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2E00261C16
	for <lists+linux-input@lfdr.de>; Tue,  8 Sep 2020 21:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731277AbgIHTOj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Sep 2020 15:14:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60482 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731190AbgIHQEv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 8 Sep 2020 12:04:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599581086;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DQErEVpu4UJOznG1YWtaIGHIF5xOzLeZwIotf5rYavI=;
        b=c7atnnJ14SIenlYUklZUvpRc8VWHmvRRmSuEaZuV92HrQdPFqxrMuxLhpu2Z2AtOPE1/99
        jqI+sSX4lSXO6U4+NIRoAmF0Xdqe8SByTQjEyxUi9unsSfq0gydGI8pwVTQ2bEg42TmNrg
        zzOmnnsTQm/uhBcZ4cOz9crX681xskU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-Bra26V38P2On8YcFvIc7Ig-1; Tue, 08 Sep 2020 09:52:02 -0400
X-MC-Unique: Bra26V38P2On8YcFvIc7Ig-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55265425CD;
        Tue,  8 Sep 2020 13:51:59 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-188.ams2.redhat.com [10.36.114.188])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 73FAE28564;
        Tue,  8 Sep 2020 13:51:57 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Mark Pearson <mpearson@lenovo.com>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: [PATCH v2 3/4] platform/x86: thinkpad_acpi: Add support for new hotkeys found on X1C8 / T14
Date:   Tue,  8 Sep 2020 15:51:46 +0200
Message-Id: <20200908135147.4044-4-hdegoede@redhat.com>
In-Reply-To: <20200908135147.4044-1-hdegoede@redhat.com>
References: <20200908135147.4044-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

New Lenovo Thinkpad models, e.g. the X1 Carbon 8th gen and the new T14 gen1
models have 3 new symbols / shortcuts on their F9-F11 keys (and the
thinkpad_acpi driver receives 3 new hkey events for these):

F9:  Has a symbol resembling a rectangular speech balloon, the manual says
     the hotkey functions shows or hides the notification center
F10: Has a symbol of a telephone horn which has been picked up from the
     receiver, the manual says: "Answer incoming calls"
F11: Has a symbol of a telephone horn which is resting on the receiver,
     the manual says: "Decline incoming calls"

And these Thinkpad models also send a new 0x1316 hkey events when the
Fn + right Shift key-combo is pressed.

This commit adds support for these 4 new hkey events.

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Map 0x1316 to KEY_FN_RIGHT_SHIFT instead of to KEY_UNKNOWN (now that we
  know what it does)
---
 drivers/platform/x86/thinkpad_acpi.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 9c4df41687a3..4b701e9a0392 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -1913,6 +1913,10 @@ enum {	/* hot key scan codes (derived from ACPI DSDT) */
 	TP_ACPI_HOTKEYSCAN_CALCULATOR,
 	TP_ACPI_HOTKEYSCAN_BLUETOOTH,
 	TP_ACPI_HOTKEYSCAN_KEYBOARD,
+	TP_ACPI_HOTKEYSCAN_FN_RIGHT_SHIFT, /* Used by "Lenovo Quick Clean" */
+	TP_ACPI_HOTKEYSCAN_NOTIFICATION_CENTER,
+	TP_ACPI_HOTKEYSCAN_PICKUP_PHONE,
+	TP_ACPI_HOTKEYSCAN_HANGUP_PHONE,
 
 	/* Hotkey keymap size */
 	TPACPI_HOTKEY_MAP_LEN
@@ -3429,11 +3433,15 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
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
+		KEY_FN_RIGHT_SHIFT,		/* Fn + right Shift */
+		KEY_NOTIFICATION_CENTER,	/* Notification Center */
+		KEY_PICKUP_PHONE,		/* Answer incoming call */
+		KEY_HANGUP_PHONE,		/* Decline incoming call */
 		},
 	};
 
-- 
2.28.0

