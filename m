Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 396FE6CF940
	for <lists+linux-input@lfdr.de>; Thu, 30 Mar 2023 04:48:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbjC3CsM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Mar 2023 22:48:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjC3CsM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Mar 2023 22:48:12 -0400
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0253E4EEF
        for <linux-input@vger.kernel.org>; Wed, 29 Mar 2023 19:48:09 -0700 (PDT)
Received: from nebulosa.vulpes.eutheria.net (unknown [50.47.218.115])
        by endrift.com (Postfix) with ESMTPSA id 02410A280;
        Wed, 29 Mar 2023 19:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1680144489; bh=wXF75mBC21V+Gyo7A1yZ3wJPHDk6MzQPhcXOaRzqW2U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=N9EyX5PMzc3yAWK8IPA6Ct2ajXa27KrIsnKN6wK8Tc+D3RNaYKDYDwmGVS2ttG9C3
         UaWmvrizQSkZTkdUY5tG0ZVqhsvMD/7h4s12toRz4BMJrucnqjbfieSLRu7nixXhjY
         OuwwxfWzrHS89haLTtJFdvcDG27V4TDsUTx9a1NDQMJrDhIDEgEUHGkMfucQJTTFIk
         ffs+UoH0w973WJFH0kl019lZjgT1Cu049U7oHdCDQX9KKDGWVHJBRMJ31lriZyltBY
         hTNElYmlIApOzwRSTM8vag1BJvpDGu6sVzIY3wg+14Opk+HSxiXMtw93STQQ4cTCbB
         Z9NryBS3bF2IQ==
From:   Vicki Pfau <vi@endrift.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Cc:     Vicki Pfau <vi@endrift.com>, Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 2/2] Input: xpad - fix PowerA EnWired Controller guide button
Date:   Wed, 29 Mar 2023 19:47:52 -0700
Message-Id: <20230330024752.2405603-3-vi@endrift.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330024752.2405603-1-vi@endrift.com>
References: <20230330024752.2405603-1-vi@endrift.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This commit explicitly disables the audio interface the same way the official
driver does. This is needed for some controllers, such as the PowerA Enhanced
Wired Controller for Series X|S (0x20d6:0x200e) to report the guide button.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/input/joystick/xpad.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 698224e1948f..c31fc4e9b310 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -1396,6 +1396,14 @@ static int xpad_start_xbox_one(struct usb_xpad *xpad)
 	unsigned long flags;
 	int retval;
 
+	/* Explicitly disable the audio interface. This is needed for some
+	 * controllers, such as the PowerA Enhanced Wired Controller
+	 * for Series X|S (0x20d6:0x200e) to report the guide button */
+	retval = usb_set_interface(xpad->udev, GIP_WIRED_INTF_AUDIO, 0);
+	if (retval)
+		dev_warn(&xpad->dev->dev,
+			 "unable to disable audio interface: %d\n", retval);
+
 	spin_lock_irqsave(&xpad->odata_lock, flags);
 
 	/*
-- 
2.40.0

