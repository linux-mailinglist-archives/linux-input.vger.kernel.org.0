Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99A6A2D05DA
	for <lists+linux-input@lfdr.de>; Sun,  6 Dec 2020 17:14:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbgLFQOQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 6 Dec 2020 11:14:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55557 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726342AbgLFQOQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 6 Dec 2020 11:14:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607271170;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=dVcqgMdeodVw1fx+tzxo/FFLEwxul+sEmNTLOiI1HWI=;
        b=BM6ASdlBG+csmJfhgoZnl0OrVLeuMm/6DNMuFK1+79wz/d8Eue52HykqTp2J+Le1+BIRg8
        EszMfeIWbM0qVXTEPpdciivbc9VhoTywDsSVaPRTjX8Hjn1Gczexir2syuDy2sNukkM9uT
        YPUscIqxZT25DQtHSEHAAdu+MIIJTF8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-bh0g1PlQOFWgob__c7inDg-1; Sun, 06 Dec 2020 11:12:48 -0500
X-MC-Unique: bh0g1PlQOFWgob__c7inDg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DF29858180;
        Sun,  6 Dec 2020 16:12:47 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-98.ams2.redhat.com [10.36.112.98])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B2F8160CE0;
        Sun,  6 Dec 2020 16:12:46 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH] Input: soc_button_array - Add Lenovo Yoga Tablet2 1051L to the dmi_use_low_level_irq list
Date:   Sun,  6 Dec 2020 17:12:45 +0100
Message-Id: <20201206161245.24798-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add the Lenovo Yoga Tablet2 1051L to the list of devices where the
ACPI AML code is poking the GPIO config register directly changing
the IRQ type to a low_level_irq, which we need to work around.

This fixes the home button on the Lenovo Yoga Tablet2 1051L not
working.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/misc/soc_button_array.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
index cae1a3fae83a..c5342d7ed28e 100644
--- a/drivers/input/misc/soc_button_array.c
+++ b/drivers/input/misc/soc_button_array.c
@@ -82,6 +82,17 @@ static const struct dmi_system_id dmi_use_low_level_irq[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "One S1003"),
 		},
 	},
+	{
+		/*
+		 * Lenovo Yoga Tab2 1051L, something messes with the home-button
+		 * IRQ settings, leading to a non working home-button.
+		 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "60073"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "1051L"),
+		},
+	},
 	{} /* Terminating entry */
 };
 
-- 
2.28.0

