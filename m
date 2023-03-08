Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7CB6B0B2F
	for <lists+linux-input@lfdr.de>; Wed,  8 Mar 2023 15:30:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232017AbjCHOaf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Mar 2023 09:30:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231646AbjCHOaS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Mar 2023 09:30:18 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51190C9C0F
        for <linux-input@vger.kernel.org>; Wed,  8 Mar 2023 06:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678285682;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kwqB6m2/TAcWh7DPhZPXZXOqSSU07ty4mz1FP+N5T/c=;
        b=aWV4b/3gVmvPpVp1cxhtzbY0UABc1gHEYNut0zJDnPMjai7SMzanej6r2azr9mKSW9RigE
        SLQhnxFFiUweg2E4QgDKOK5d0o4APiTYgzDKv/HIvG8wVYmn9M++DCm1wzSB5yccKFRXrN
        xosFgC/ojzKry7V8cHixk5E7qyeYHuI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-v4AMZh4UNCKZQiYRi694iQ-1; Wed, 08 Mar 2023 09:28:00 -0500
X-MC-Unique: v4AMZh4UNCKZQiYRi694iQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CB3F1C294E3;
        Wed,  8 Mar 2023 14:28:00 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.179])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7FB70492B04;
        Wed,  8 Mar 2023 14:27:59 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v4 1/2] Input: hideep - Silence error in SW_RESET()
Date:   Wed,  8 Mar 2023 15:27:49 +0100
Message-Id: <20230308142750.52870-2-hdegoede@redhat.com>
In-Reply-To: <20230308142750.52870-1-hdegoede@redhat.com>
References: <20230308142750.52870-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On some models the first HIDEEP_SYSCON_WDT_CON write alone is enough to
cause the controller to reset, causing the second write to fail:

i2c-hideep_ts: write to register 0x52000014 (0x000001) failed: -121

Switch this write to a raw hideep_pgm_w_mem() to avoid an error getting
logged in this case.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/hideep.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/hideep.c b/drivers/input/touchscreen/hideep.c
index bd454d93f1f7..5e6e43d56448 100644
--- a/drivers/input/touchscreen/hideep.c
+++ b/drivers/input/touchscreen/hideep.c
@@ -271,9 +271,14 @@ static int hideep_pgm_w_reg(struct hideep_ts *ts, u32 addr, u32 val)
 
 #define SW_RESET_IN_PGM(clk)					\
 {								\
+	__be32 data = cpu_to_be32(0x01);			\
 	hideep_pgm_w_reg(ts, HIDEEP_SYSCON_WDT_CNT, (clk));	\
 	hideep_pgm_w_reg(ts, HIDEEP_SYSCON_WDT_CON, 0x03);	\
-	hideep_pgm_w_reg(ts, HIDEEP_SYSCON_WDT_CON, 0x01);	\
+	/*							\
+	 * The first write may already cause a reset, use a raw	\
+	 * write for the second write to avoid error logging.	\
+	 */							\
+	hideep_pgm_w_mem(ts, HIDEEP_SYSCON_WDT_CON, &data, 1);	\
 }
 
 #define SET_FLASH_PIO(ce)					\
-- 
2.39.1

