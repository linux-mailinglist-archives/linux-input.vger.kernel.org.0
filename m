Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21EAA6B5B4E
	for <lists+linux-input@lfdr.de>; Sat, 11 Mar 2023 12:48:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbjCKLsU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 11 Mar 2023 06:48:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjCKLsT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 11 Mar 2023 06:48:19 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD5EA10A2B2
        for <linux-input@vger.kernel.org>; Sat, 11 Mar 2023 03:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678535252;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kwqB6m2/TAcWh7DPhZPXZXOqSSU07ty4mz1FP+N5T/c=;
        b=W+i0aFwO5nKjyelpYpq8d2A8+DZVklHnQPmLBTRlhHBLod0E83Joc8v7nitaA/XcewDzTj
        CoQII/C74/QGY9z1NkcsSAb561GEjoIxkCrC0Y3o9FRQqpg39O1UKqDCbKHMT1LW58Fxvo
        /ueSRFSBBZ6VYDCPGMyJt/P129GkGNM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-Aiy3sOtHMzSKRttXqPOF2Q-1; Sat, 11 Mar 2023 06:47:28 -0500
X-MC-Unique: Aiy3sOtHMzSKRttXqPOF2Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E120811726;
        Sat, 11 Mar 2023 11:47:28 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.56])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C3806C16028;
        Sat, 11 Mar 2023 11:47:27 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-input@vger.kernel.org
Subject: [PATCH v5 1/2] Input: hideep - Silence error in SW_RESET()
Date:   Sat, 11 Mar 2023 12:47:25 +0100
Message-Id: <20230311114726.182789-2-hdegoede@redhat.com>
In-Reply-To: <20230311114726.182789-1-hdegoede@redhat.com>
References: <20230311114726.182789-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

