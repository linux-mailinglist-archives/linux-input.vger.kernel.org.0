Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7CB37301B
	for <lists+linux-input@lfdr.de>; Tue,  4 May 2021 20:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231768AbhEDS7B (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 May 2021 14:59:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47421 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231274AbhEDS7A (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 4 May 2021 14:59:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620154685;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NIlFSfhJ93BW0bK1uNhMHnYMqGMLkQqnuFWUisnQYpI=;
        b=KQcNyzzteMl0wKhU91krBkIhPBtuAnTPtUquLoBQOmJLMRr4d1rL6zL2/4IQ9dHjvBlN0F
        n+rSkWkc2vcX8UGx7ZlLfwQrUosF+sp9nDVu1gXI98YgqEs3ukiApHtDcO1uIrxh8evczp
        Nr/hlDwiG5njS1dfpjIPJCvt4nLYTqc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-E_8d_ueiNsCSuQpHdguZRA-1; Tue, 04 May 2021 14:58:02 -0400
X-MC-Unique: E_8d_ueiNsCSuQpHdguZRA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C9A610066EA;
        Tue,  4 May 2021 18:58:00 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-90.ams2.redhat.com [10.36.112.90])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B5F2F5D6CF;
        Tue,  4 May 2021 18:57:58 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Arkadiy <arkan49@yandex.ru>,
        "Sergei A . Trusov" <sergei.a.trusov@ya.ru>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Teava Radu <rateava@gmail.com>
Subject: [RFC v2 5/5] platform/x86: touchscreen_dmi: Add info for the Mediacom Winpad 7.0 W700 tablet
Date:   Tue,  4 May 2021 20:57:46 +0200
Message-Id: <20210504185746.175461-6-hdegoede@redhat.com>
In-Reply-To: <20210504185746.175461-1-hdegoede@redhat.com>
References: <20210504185746.175461-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Teava Radu <rateava@gmail.com>

Add touchscreen info for the Mediacom Winpad 7.0 W700 tablet.
Tested on 5.11 hirsute.
Note: it's hw clone to Wintron surftab 7.

Signed-off-by: Teava Radu <rateava@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index f63d2110e224..40c970908a99 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -1153,6 +1153,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_BIOS_VERSION, "jumperx.T87.KFBNEEA"),
 		},
 	},
+	{
+		/* Mediacom WinPad 7.0 W700 (same hw as Wintron surftab 7") */
+		.driver_data = (void *)&trekstor_surftab_wintron70_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "MEDIACOM"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "WinPad 7 W10 - WPW700"),
+		},
+	},
 	{
 		/* Mediacom Flexbook Edge 11 (same hw as TS Primebook C11) */
 		.driver_data = (void *)&trekstor_primebook_c11_data,
-- 
2.31.1

