Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F10DD7E0EFA
	for <lists+linux-input@lfdr.de>; Sat,  4 Nov 2023 12:19:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232101AbjKDLTX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 4 Nov 2023 07:19:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232114AbjKDLTW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 4 Nov 2023 07:19:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70354D52
        for <linux-input@vger.kernel.org>; Sat,  4 Nov 2023 04:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699096683;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xutdSylU14dYQkrYI04HpEA/Wb/bCCMUsz+frHiNOjM=;
        b=C63XP5RDH4t9+7Gsyt4aR4UJlKYiFn9TMWRO3UvqqDI2+7HVfBrHwVy8rzEpRwoKxaHso3
        vaaqPOH/mqauJlRC9HfuQhP0VO7Tt1qY58KnFmgd8DTAtSV7RHXzCWFzqsjCnEO+0s+9Wp
        rPBAYIxD2vV0apmAN+f2GTsWKfwYwIE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-lWV4v2ujPV-xYZuq5RiBFQ-1; Sat, 04 Nov 2023 07:17:59 -0400
X-MC-Unique: lWV4v2ujPV-xYZuq5RiBFQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B0EE80C344;
        Sat,  4 Nov 2023 11:17:59 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.2])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9F00E502E;
        Sat,  4 Nov 2023 11:17:57 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Douglas Anderson <dianders@chromium.org>,
        Julian Sax <jsbc@gmx.de>, ahormann@gmx.net,
        Bruno Jesus <bruno.fl.jesus@gmail.com>,
        Dietrich <enaut.w@googlemail.com>, kloxdami@yahoo.com,
        Tim Aldridge <taldridge@mac.com>,
        Rene Wagner <redhatbugzilla@callerid.de>,
        Federico Ricchiuto <fed.ricchiuto@gmail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 7/7] HID: i2c-hid: Renumber I2C_HID_QUIRK_ defines
Date:   Sat,  4 Nov 2023 12:17:43 +0100
Message-ID: <20231104111743.14668-8-hdegoede@redhat.com>
In-Reply-To: <20231104111743.14668-1-hdegoede@redhat.com>
References: <20231104111743.14668-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The quirks variable and the I2C_HID_QUIRK_ defines are never used /
exported outside of the i2c-hid code renumber them to start at
BIT(0) again.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index ff2659bf5e57..2a4c8657cc7e 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -44,10 +44,10 @@
 #include "i2c-hid.h"
 
 /* quirks to control the device */
-#define I2C_HID_QUIRK_BOGUS_IRQ			BIT(4)
-#define I2C_HID_QUIRK_RESET_ON_RESUME		BIT(5)
-#define I2C_HID_QUIRK_BAD_INPUT_SIZE		BIT(6)
-#define I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET	BIT(7)
+#define I2C_HID_QUIRK_BOGUS_IRQ			BIT(0)
+#define I2C_HID_QUIRK_RESET_ON_RESUME		BIT(1)
+#define I2C_HID_QUIRK_BAD_INPUT_SIZE		BIT(2)
+#define I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET	BIT(3)
 
 /* Command opcodes */
 #define I2C_HID_OPCODE_RESET			0x01
-- 
2.41.0

