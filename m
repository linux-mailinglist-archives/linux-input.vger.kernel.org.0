Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABC377BAB54
	for <lists+linux-input@lfdr.de>; Thu,  5 Oct 2023 22:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229852AbjJEUQi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Oct 2023 16:16:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbjJEUQi (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Oct 2023 16:16:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C942C95
        for <linux-input@vger.kernel.org>; Thu,  5 Oct 2023 13:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696536957;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rl5HGLuRqALTxXn3fnDLRPemVipZYuRYo/0M6pyNtak=;
        b=Iw5YBCviHjGBJPCPnlRj4vl/QJwyaMMhX2FINXu4fEcCJ2+NMpYZ6pcjQGJmxUxh+lxizH
        ctU2Yr/+Pho6tbZVrFaQJ7AO+bkFaVc0pYNP5mbKADvMTxvZ8LNJ1AWoL5h11lDCBsiNAG
        F90oMTD1yF4Voeb3weoRd7z0hYj/oME=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-FE1GlsBEML2ipPLSUTPhLQ-1; Thu, 05 Oct 2023 16:15:56 -0400
X-MC-Unique: FE1GlsBEML2ipPLSUTPhLQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D5AB1C07586;
        Thu,  5 Oct 2023 20:15:56 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.10])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8A24A10F1BE7;
        Thu,  5 Oct 2023 20:15:55 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 3/3] Input: atkbd - set skip_commands = ATKBD_SKIP_GETID for HP laptop 15s-fq* laptops
Date:   Thu,  5 Oct 2023 22:15:44 +0200
Message-ID: <20231005201544.26983-4-hdegoede@redhat.com>
In-Reply-To: <20231005201544.26983-1-hdegoede@redhat.com>
References: <20231005201544.26983-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On "HP Laptop 15s-fq2xxx" and "HP laptop 15s-fq4xxx" laptops
the keyboard gets confused by Linux probing it and won't work
for the first 2 - 5 minutes or so (waiting for EC watchdog reset?).

Testing has shown that Linux sending ATKBD_CMD_GETID causes
the keyboard to not work for the first 2 - 5 minutes.

Add a quirk setting skip_commands = ATKBD_SKIP_GETID to fix this.

Closes: https://bugzilla.redhat.com/show_bug.cgi?id=2086156
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/keyboard/atkbd.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index 19a01e763871..7ebd686b61b3 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -1937,6 +1937,19 @@ static const struct dmi_system_id atkbd_dmi_quirk_table[] __initconst = {
 		.callback = atkbd_skip_commands_fixup,
 		.driver_data = (void *)ATKBD_SKIP_DEACTIVATE,
 	},
+	{
+		/*
+		 * "HP Laptop 15s-fq2xxx" and "HP laptop 15s-fq4xxx" both get
+		 * confused by ATKBD_CMD_GETID.
+		 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+			/* Partial match to match both systems */
+			DMI_MATCH(DMI_PRODUCT_NAME, "HP Laptop 15s-fq"),
+		},
+		.callback = atkbd_skip_commands_fixup,
+		.driver_data = (void *)ATKBD_SKIP_GETID,
+	},
 	{ }
 };
 
-- 
2.41.0

