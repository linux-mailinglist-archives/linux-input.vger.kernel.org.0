Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E64E61E6B9
	for <lists+linux-input@lfdr.de>; Sun,  6 Nov 2022 22:54:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbiKFVyT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 6 Nov 2022 16:54:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbiKFVyS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 6 Nov 2022 16:54:18 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4F7B2632
        for <linux-input@vger.kernel.org>; Sun,  6 Nov 2022 13:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667771606;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=83mvUNl50q+NeptRa8kjA7Pe5H6FNZ9z4757fsf2Z+8=;
        b=C0TPwqCcVgbO+3/1p5FVe1yD/jeuICejrx3Veq0BCxetGf2N0jCEAsxXDis6cTURv6dMdr
        6oa2ZARycDpaC94jYbiJQypi1+K1gE2a1O0GNRbF+4ot9ikX/wmXqw066WlzclfL56Nnrf
        MLFuTMJzUrKk6/qT4K9rsT0I8EVNKss=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-PQrd1JcbMZq9kQR2E6R8tg-1; Sun, 06 Nov 2022 16:53:23 -0500
X-MC-Unique: PQrd1JcbMZq9kQR2E6R8tg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF822185A78F;
        Sun,  6 Nov 2022 21:53:22 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.85])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3FED02166B29;
        Sun,  6 Nov 2022 21:53:22 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Rudolf Polzer <rpolzer@google.com>
Subject: [PATCH 2/2] Input: soc_button_array - Add Acer Switch V 10 to dmi_use_low_level_irq[]
Date:   Sun,  6 Nov 2022 22:53:20 +0100
Message-Id: <20221106215320.67109-2-hdegoede@redhat.com>
In-Reply-To: <20221106215320.67109-1-hdegoede@redhat.com>
References: <20221106215320.67109-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Like on the Acer Switch 10 SW5-012, the Acer Switch V 10 SW5-017's _LID
method messes with home- and power-button GPIO IRQ settings, causing an
IRQ storm.

Add a quirk entry for the Acer Switch V 10 to the dmi_use_low_level_irq[]
DMI quirk list, to use low-level IRQs on this model, fixing the IRQ storm.

Cc: Rudolf Polzer <rpolzer@google.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/misc/soc_button_array.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
index 50497dd05027..09489380afda 100644
--- a/drivers/input/misc/soc_button_array.c
+++ b/drivers/input/misc/soc_button_array.c
@@ -77,6 +77,13 @@ static const struct dmi_system_id dmi_use_low_level_irq[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire SW5-012"),
 		},
 	},
+	{
+		/* Acer Switch V 10 SW5-017, same issue as Acer Switch 10 SW5-012. */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "SW5-017"),
+		},
+	},
 	{
 		/*
 		 * Acer One S1003. _LID method messes with power-button GPIO
-- 
2.37.3

