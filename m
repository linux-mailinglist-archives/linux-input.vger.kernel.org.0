Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0FE7BAB55
	for <lists+linux-input@lfdr.de>; Thu,  5 Oct 2023 22:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbjJEUQq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Oct 2023 16:16:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbjJEUQp (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Oct 2023 16:16:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A5A3A6
        for <linux-input@vger.kernel.org>; Thu,  5 Oct 2023 13:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696536958;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=X7cOC+rXfxUcapDgaWZKTw3QJQ1ZoRyf1LqS/y+vIWc=;
        b=LxlP5Dyt0LlQSf8GzkE9d6RF3bLKqTOAHIDVtbbwkEu+JsHZlYs6WAlr5tJISyanR9uYm6
        JqP5QdPwb9M4Hqx8BPY18GxgYg9tngfu4lr4srgYvgAHbJFmqaEZeGC4V3AYCmh5A5X++i
        twZjbseACu2W/9E9QsrBYcfQgpdLcIM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501--b32fWjtMN6TSGXnUcLCLw-1; Thu, 05 Oct 2023 16:15:55 -0400
X-MC-Unique: -b32fWjtMN6TSGXnUcLCLw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58BE63801BCC;
        Thu,  5 Oct 2023 20:15:55 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.10])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C5C3D111CD23;
        Thu,  5 Oct 2023 20:15:54 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 2/3] Input: atkbd - drop atkbd_skip_deactivate flag
Date:   Thu,  5 Oct 2023 22:15:43 +0200
Message-ID: <20231005201544.26983-3-hdegoede@redhat.com>
In-Reply-To: <20231005201544.26983-1-hdegoede@redhat.com>
References: <20231005201544.26983-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Drop the atkbd_skip_deactivate flag and make the DMI quirk for LG laptops
set atkbd_skip_commands = ATKBD_SKIP_DEACTIVATE instead.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/keyboard/atkbd.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index 7c16f9cc1e40..19a01e763871 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -257,12 +257,6 @@ static void (*atkbd_platform_fixup)(struct atkbd *, const void *data);
 static void *atkbd_platform_fixup_data;
 static unsigned int (*atkbd_platform_scancode_fixup)(struct atkbd *, unsigned int);
 
-/*
- * Certain keyboards to not like ATKBD_CMD_RESET_DIS and stop responding
- * to many commands until full reset (ATKBD_CMD_RESET_BAT) is performed.
- */
-static bool atkbd_skip_deactivate;
-
 static ssize_t atkbd_attr_show_helper(struct device *dev, char *buf,
 				ssize_t (*handler)(struct atkbd *, char *));
 static ssize_t atkbd_attr_set_helper(struct device *dev, const char *buf, size_t count,
@@ -855,8 +849,7 @@ static int atkbd_probe(struct atkbd *atkbd)
  * Make sure nothing is coming from the keyboard and disturbs our
  * internal state.
  */
-	if (!atkbd_skip_deactivate)
-		atkbd_deactivate(atkbd);
+	atkbd_deactivate(atkbd);
 
 	return 0;
 }
@@ -1781,9 +1774,12 @@ static int __init atkbd_setup_scancode_fixup(const struct dmi_system_id *id)
 	return 1;
 }
 
-static int __init atkbd_deactivate_fixup(const struct dmi_system_id *id)
+static int __init atkbd_skip_commands_fixup(const struct dmi_system_id *id)
 {
-	atkbd_skip_deactivate = true;
+	/* Module parameter overrules quirks */
+	if (!atkbd_skip_commands)
+		atkbd_skip_commands = (long)id->driver_data;
+
 	return 1;
 }
 
@@ -1931,10 +1927,15 @@ static const struct dmi_system_id atkbd_dmi_quirk_table[] __initconst = {
 		.driver_data = atkbd_oqo_01plus_scancode_fixup,
 	},
 	{
+		/*
+		 * LG keyboards seem to not like ATKBD_CMD_RESET_DIS and stop responding
+		 * to many commands until full reset (ATKBD_CMD_RESET_BAT) is performed.
+		 */
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
 		},
-		.callback = atkbd_deactivate_fixup,
+		.callback = atkbd_skip_commands_fixup,
+		.driver_data = (void *)ATKBD_SKIP_DEACTIVATE,
 	},
 	{ }
 };
-- 
2.41.0

