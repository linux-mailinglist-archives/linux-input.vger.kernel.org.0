Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B81A61903F
	for <lists+linux-input@lfdr.de>; Fri,  4 Nov 2022 06:49:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231406AbiKDFs5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Nov 2022 01:48:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231304AbiKDFsx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 4 Nov 2022 01:48:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF66D28724;
        Thu,  3 Nov 2022 22:48:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 326AE620C6;
        Fri,  4 Nov 2022 05:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BC21C43145;
        Fri,  4 Nov 2022 05:48:48 +0000 (UTC)
Received: from rostedt by gandalf.local.home with local (Exim 4.96)
        (envelope-from <rostedt@goodmis.org>)
        id 1oqpZq-00715d-21;
        Fri, 04 Nov 2022 01:49:14 -0400
Message-ID: <20221104054914.458495869@goodmis.org>
User-Agent: quilt/0.66
Date:   Fri, 04 Nov 2022 01:41:07 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     linux-kernel@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Anna-Maria Gleixner <anna-maria@linutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Rheinsberg <david.rheinsberg@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: [RFC][PATCH v3 14/33] timers: HID: Use timer_shutdown_sync() before freeing timer
References: <20221104054053.431922658@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: "Steven Rostedt (Google)" <rostedt@goodmis.org>

Before a timer is freed, timer_shutdown_sync() must be called.

Link: https://lore.kernel.org/all/20220407161745.7d6754b3@gandalf.local.home/

Cc: David Rheinsberg <david.rheinsberg@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 drivers/hid/hid-wiimote-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-wiimote-core.c b/drivers/hid/hid-wiimote-core.c
index 4399d6c6afef..2c94308dda3c 100644
--- a/drivers/hid/hid-wiimote-core.c
+++ b/drivers/hid/hid-wiimote-core.c
@@ -1764,7 +1764,7 @@ static void wiimote_destroy(struct wiimote_data *wdata)
 	spin_unlock_irqrestore(&wdata->state.lock, flags);
 
 	cancel_work_sync(&wdata->init_worker);
-	del_timer_sync(&wdata->timer);
+	timer_shutdown_sync(&wdata->timer);
 
 	device_remove_file(&wdata->hdev->dev, &dev_attr_devtype);
 	device_remove_file(&wdata->hdev->dev, &dev_attr_extension);
-- 
2.35.1
