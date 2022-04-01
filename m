Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3FE94EFC8B
	for <lists+linux-input@lfdr.de>; Sat,  2 Apr 2022 00:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236790AbiDAWH3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 1 Apr 2022 18:07:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235963AbiDAWH2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 1 Apr 2022 18:07:28 -0400
X-Greylist: delayed 398 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 01 Apr 2022 15:05:37 PDT
Received: from mail.thepaulodoom.com (www.thepaulodoom.com [45.77.108.202])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 67BD01B8FDC
        for <linux-input@vger.kernel.org>; Fri,  1 Apr 2022 15:05:37 -0700 (PDT)
Received: from localhost (c-98-240-189-147.hsd1.mn.comcast.net [98.240.189.147])
        by vultr.guest (OpenSMTPD) with ESMTPSA id ff8c64a7 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
        Fri, 1 Apr 2022 21:58:56 +0000 (UTC)
From:   Paul Lemmermann <thepaulodoom@thepaulodoom.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Lemmermann <thepaulodoom@thepaulodoom.com>
Subject: [PATCH] input: evdev: fixed case statements
Date:   Fri,  1 Apr 2022 16:58:42 -0500
Message-Id: <20220401215842.58135-1-thepaulodoom@thepaulodoom.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixed case statements which have more than one operation on a single
line. Found using checkpatch.pl.

Signed-off-by: Paul Lemmermann <thepaulodoom@thepaulodoom.com>
---
 drivers/input/evdev.c | 48 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 10 deletions(-)

diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
index 95f90699d..85c92b30d 100644
--- a/drivers/input/evdev.c
+++ b/drivers/input/evdev.c
@@ -784,16 +784,44 @@ static int handle_eviocgbit(struct input_dev *dev,
 
 	switch (type) {
 
-	case      0: bits = dev->evbit;  len = EV_MAX;  break;
-	case EV_KEY: bits = dev->keybit; len = KEY_MAX; break;
-	case EV_REL: bits = dev->relbit; len = REL_MAX; break;
-	case EV_ABS: bits = dev->absbit; len = ABS_MAX; break;
-	case EV_MSC: bits = dev->mscbit; len = MSC_MAX; break;
-	case EV_LED: bits = dev->ledbit; len = LED_MAX; break;
-	case EV_SND: bits = dev->sndbit; len = SND_MAX; break;
-	case EV_FF:  bits = dev->ffbit;  len = FF_MAX;  break;
-	case EV_SW:  bits = dev->swbit;  len = SW_MAX;  break;
-	default: return -EINVAL;
+	case      0: 
+		bits = dev->evbit;  
+		len = EV_MAX;  
+		break;
+	case EV_KEY: 
+		bits = dev->keybit; 
+		len = KEY_MAX; 
+		break;
+	case EV_REL: 
+		bits = dev->relbit; 
+		len = REL_MAX; 
+		break;
+	case EV_ABS: 
+		bits = dev->absbit; 
+		len = ABS_MAX; 
+		break;
+	case EV_MSC: 
+		bits = dev->mscbit; 
+		len = MSC_MAX; 
+		break;
+	case EV_LED: 
+		bits = dev->ledbit; 
+		len = LED_MAX; 
+		break;
+	case EV_SND: 
+		bits = dev->sndbit; 
+		len = SND_MAX; 
+		break;
+	case EV_FF:  
+		bits = dev->ffbit; 
+		len = FF_MAX; 
+		break;
+	case EV_SW:  
+		bits = dev->swbit; 
+		len = SW_MAX; 
+		break;
+	default: 
+		return -EINVAL;
 	}
 
 	return bits_to_user(bits, len, size, p, compat_mode);
-- 
2.35.1

