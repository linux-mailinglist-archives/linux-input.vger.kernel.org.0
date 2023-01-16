Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 743B566D14C
	for <lists+linux-input@lfdr.de>; Mon, 16 Jan 2023 23:06:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234102AbjAPWGI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Jan 2023 17:06:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233938AbjAPWGH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Jan 2023 17:06:07 -0500
X-Greylist: delayed 302 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 16 Jan 2023 14:06:06 PST
Received: from irl.hu (irl.hu [95.85.9.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 893D6233DD
        for <linux-input@vger.kernel.org>; Mon, 16 Jan 2023 14:06:06 -0800 (PST)
Received: from fedori.lan (c3e47541.dsl.pool.telekom.hu [::ffff:195.228.117.65])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 000000000006EDCF.0000000063C5C91E.0028A1A8; Mon, 16 Jan 2023 23:01:02 +0100
From:   Gergo Koteles <soyer@irl.hu>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Gergo Koteles <soyer@irl.hu>
Subject: [PATCH] Input: gpio-keys - add support for linux,input-value dts property
Date:   Mon, 16 Jan 2023 22:59:47 +0100
Message-Id: <20230116215947.354660-1-soyer@irl.hu>
X-Mailer: git-send-email 2.39.0
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Allows setting the value of EV_ABS events from dts.

Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 drivers/input/keyboard/gpio_keys.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index 5496482a38c1..c42f86ad0766 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -770,6 +770,9 @@ gpio_keys_get_devtree_pdata(struct device *dev)
 					     &button->type))
 			button->type = EV_KEY;
 
+		fwnode_property_read_u32(child, "linux,input-value",
+					 (u32 *)&button->value);
+
 		button->wakeup =
 			fwnode_property_read_bool(child, "wakeup-source") ||
 			/* legacy name */
-- 
2.39.0

