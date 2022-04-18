Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DDB7505ED6
	for <lists+linux-input@lfdr.de>; Mon, 18 Apr 2022 22:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238154AbiDRUMh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Apr 2022 16:12:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237141AbiDRUMh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Apr 2022 16:12:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ED14612A82
        for <linux-input@vger.kernel.org>; Mon, 18 Apr 2022 13:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650312595;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=IsuZq2ksJ+dNPfBPBue/2gWGlxvBihu2s5r71QWhlsc=;
        b=AJD6YR3SHlbDPAO3Lx4/m2cOZBxFM3EmLytA2DlHfwgkpGkfEzC55CIxAwSLpTT1gzKhlo
        N5BA/1HN+zXHnDHATaLmcAX50Tro2SXCBxzMrnil7IJLuat5dhVzAT+gVtoW2vbU9Z5PtX
        gbWbVjyJlbvL+qwczt5YUWZXJpv4tEQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-e0SryiMyP26XQeaDO1IwXg-1; Mon, 18 Apr 2022 16:09:51 -0400
X-MC-Unique: e0SryiMyP26XQeaDO1IwXg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B916A299E760;
        Mon, 18 Apr 2022 20:09:50 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.76])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E8E597AE2;
        Mon, 18 Apr 2022 20:09:49 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH] input/i8042: Add dritek quirk for Acer Aspire One AO532
Date:   Mon, 18 Apr 2022 22:09:49 +0200
Message-Id: <20220418200949.6009-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Like on other Acer devices, the wifi, bluetooth and touchpad on/off toggle
hotkeys on the Acer AO532 do not send any events when the dritek extensions
are not enabled.

Add a quirk to enable the dritek extensions on this netbook model.

Cc: Werner Sembach <wse@tuxedocomputers.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Note this patch applies on top of the:
"[PATCH v5] input/i8042: Rework quirk tables" series
https://lore.kernel.org/linux-input/20220329143622.31394-1-wse@tuxedocomputers.com/
---
 drivers/input/serio/i8042-x86ia64io.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/input/serio/i8042-x86ia64io.h b/drivers/input/serio/i8042-x86ia64io.h
index a59c6aba7c75..8684d495c275 100644
--- a/drivers/input/serio/i8042-x86ia64io.h
+++ b/drivers/input/serio/i8042-x86ia64io.h
@@ -216,6 +216,14 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 		},
 		.driver_data = (void *)(SERIO_QUIRK_RESET_ALWAYS)
 	},
+	{
+		/* Acer Aspire One 532h */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "AO532h"),
+		},
+		.driver_data = (void *)(SERIO_QUIRK_DRITEK)
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-- 
2.35.1

