Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B793223AB0
	for <lists+linux-input@lfdr.de>; Fri, 17 Jul 2020 13:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgGQLmO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Jul 2020 07:42:14 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:39986 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726817AbgGQLmM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Jul 2020 07:42:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594986131;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=P+tmySyYwC+RAUr3jiRtntADuMTAWZTMpRNx+zgwWY0=;
        b=WnBL+2szhZtccqTdAeuCJJ4f0o7EqqZxSQJDLKRcyyf/bwSubkXR8ZiZ/LOm218OrMDxac
        T0nlHR2OtS9O5hY0NPJkGosF7fN2x6LQ2fxEYlz9GcZJ0PPPDt9K/CGf5SBiD+jsjPWVnl
        w2tkNfK/3kOFwFQAXS8FmsTYnnIP+j4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-SGpgbV4wPlS_ZTh7C4RDIA-1; Fri, 17 Jul 2020 07:42:10 -0400
X-MC-Unique: SGpgbV4wPlS_ZTh7C4RDIA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68EA7106B242;
        Fri, 17 Jul 2020 11:42:08 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-162.ams2.redhat.com [10.36.112.162])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0955A5D9E7;
        Fri, 17 Jul 2020 11:42:05 +0000 (UTC)
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
Subject: [PATCH 3/3] platform/x86: thinkpad_acpi: Map Clipping tool hotkey to KEY_SELECTIVE_SCREENSHOT
Date:   Fri, 17 Jul 2020 13:41:55 +0200
Message-Id: <20200717114155.56222-4-hdegoede@redhat.com>
In-Reply-To: <20200717114155.56222-1-hdegoede@redhat.com>
References: <20200717114155.56222-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Commit 696c6523ec8f ("platform/x86: thinkpad_acpi: add mapping for new
hotkeys") added support for a bunch of new hotkeys, but the
clipping/snipping tool hotkey got ignored because there was no good
key-code to map it to.

Recently a new KEY_SELECTIVE_SCREENSHOT keycode was added by commit
3b059da9835c ("Input: allocate keycode for "Selective Screenshot" key")
quoting from the commit message:

"New Chrome OS keyboards have a "snip" key that is basically a selective
screenshot (allows a user to select an area of screen to be copied).
Allocate a keycode for it."

Support for this "snip" key seems like it is also a good match for the
clipping/snipping tool hotkey, so map this hotkey to the new
KEY_SELECTIVE_SCREENSHOT key-code.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 7fc44b6f8370..70d533b0c907 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3436,7 +3436,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 		KEY_UNKNOWN,
 
 		KEY_BOOKMARKS,			/* Favorite app, 0x311 */
-		KEY_RESERVED,			/* Clipping tool */
+		KEY_SELECTIVE_SCREENSHOT,	/* Clipping tool */
 		KEY_CALC,			/* Calculator (above numpad, P52) */
 		KEY_BLUETOOTH,			/* Bluetooth */
 		KEY_KEYBOARD,			/* Keyboard, 0x315 */
-- 
2.26.2

