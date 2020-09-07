Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF53425F6EF
	for <lists+linux-input@lfdr.de>; Mon,  7 Sep 2020 11:57:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728331AbgIGJ5E (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Sep 2020 05:57:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33749 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728233AbgIGJ5D (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 7 Sep 2020 05:57:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599472621;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=7VKI/dNTQnSRkTSLyHu8zqh4c7pDnjdk9VxUVzqLgFQ=;
        b=J7cHpwxqFg1UMcVqwJ4ukqATxpe8gW7yiecaQkYWOKzF1/vT4Zd/hEQZhnkUb+yDWY11xF
        dkkne+TXfySVds1TBFdn1DoJNKX8lIZyUH9hb8oudrInuZ/egba0+HC+AE2d6OpP0DHiYB
        hmW19mg6GsLeBDixG2zAHZ6f4B0OZpk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-VyeMWvWtOJCriOYZsBOqQQ-1; Mon, 07 Sep 2020 05:56:59 -0400
X-MC-Unique: VyeMWvWtOJCriOYZsBOqQQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D01D418B6491;
        Mon,  7 Sep 2020 09:56:58 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-115-65.ams2.redhat.com [10.36.115.65])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C58F4805F0;
        Mon,  7 Sep 2020 09:56:57 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH] Input: i8042 - add Entroware Proteus EL07R4 to nomux and reset lists
Date:   Mon,  7 Sep 2020 11:56:56 +0200
Message-Id: <20200907095656.13155-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The keyboard drops keypresses early during boot unless both the nomux
and reset quirks are set. Add DMI table entries for this.

BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1806085
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/serio/i8042-x86ia64io.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/input/serio/i8042-x86ia64io.h b/drivers/input/serio/i8042-x86ia64io.h
index 7d7f73702726..37fb9aa88f9c 100644
--- a/drivers/input/serio/i8042-x86ia64io.h
+++ b/drivers/input/serio/i8042-x86ia64io.h
@@ -548,6 +548,14 @@ static const struct dmi_system_id __initconst i8042_dmi_nomux_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5738"),
 		},
 	},
+	{
+		/* Entroware Proteus */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Entroware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Proteus"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "EL07R4"),
+		},
+	},
 	{ }
 };
 
@@ -676,6 +684,14 @@ static const struct dmi_system_id __initconst i8042_dmi_reset_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "33474HU"),
 		},
 	},
+	{
+		/* Entroware Proteus */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Entroware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Proteus"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "EL07R4"),
+		},
+	},
 	{ }
 };
 
-- 
2.28.0

