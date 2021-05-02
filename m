Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A894B370B0C
	for <lists+linux-input@lfdr.de>; Sun,  2 May 2021 12:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231130AbhEBKK5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 2 May 2021 06:10:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21891 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230455AbhEBKK4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 2 May 2021 06:10:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619950205;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xDF4o2RyVMfPC13rUjeJC46e1wRU25fQ52hPfhOoKmU=;
        b=RJ+8wviiEeAE5J8TqcP4y3dyu6PBG0qY2KvFI3/oDWNNrFeM8nuHPS+MoLZwYfEI4WBCe6
        PKmbXrT5TBVv5Pksf/5j6QdcrQh6ngz0wMI7hDhdyj1t83EhoaYpmAOGAkbqGKNMARUhUB
        dGPsm+AII6VHrnwrvhX/TX+6HDLNGqo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-4Lz-bmzGMDSKduODVnekKQ-1; Sun, 02 May 2021 06:10:01 -0400
X-MC-Unique: 4Lz-bmzGMDSKduODVnekKQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A752801106;
        Sun,  2 May 2021 10:10:00 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-34.ams2.redhat.com [10.36.112.34])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8133B19D7C;
        Sun,  2 May 2021 10:09:58 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Arkadiy <arkan49@yandex.ru>,
        "Sergei A . Trusov" <sergei.a.trusov@ya.ru>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: [RFC 4/4] platform/x86: touchscreen_dmi: Add an extra entry for the upside down Goodix touchscreen on Teclast X89 tablets
Date:   Sun,  2 May 2021 12:09:49 +0200
Message-Id: <20210502100949.5371-5-hdegoede@redhat.com>
In-Reply-To: <20210502100949.5371-1-hdegoede@redhat.com>
References: <20210502100949.5371-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Teclast X89 tablets come in 2 versions, with Windows pre-installed and with
Android pre-installed. These 2 versions have different DMI strings.

Add a match for the DMI strings used by the Android version BIOS.

Note the Android version BIOS has a bug in the DSDT where no IRQ is
provided, so for the touchscreen to work a DSDT override fixing this
is necessary as well.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 60876d8962b6..a1e4af5a8ce8 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -1339,6 +1339,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "X3 Plus"),
 		},
 	},
+	{
+		/* Teclast X89 (Android version / BIOS) */
+		.driver_data = (void *)&gdix1001_upside_down_data,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "WISKY"),
+			DMI_MATCH(DMI_BOARD_NAME, "3G062i"),
+		},
+	},
 	{
 		/* Teclast X89 (Windows version / BIOS) */
 		.driver_data = (void *)&gdix1001_upside_down_data,
-- 
2.31.1

