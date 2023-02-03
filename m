Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDC03688D10
	for <lists+linux-input@lfdr.de>; Fri,  3 Feb 2023 03:28:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbjBCC2p (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Feb 2023 21:28:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbjBCC2o (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 2 Feb 2023 21:28:44 -0500
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B1686EAFD
        for <linux-input@vger.kernel.org>; Thu,  2 Feb 2023 18:28:43 -0800 (PST)
Received: from nebulosa.vulpes.eutheria.net (unknown [50.47.218.115])
        by endrift.com (Postfix) with ESMTPSA id 417CBA26C;
        Thu,  2 Feb 2023 18:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1675391322; bh=/OAQPnjD+4hInMiKM1lNb4m4uuGicNrtQj9U+A7PyFc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QowG1kC/RmrDmoffyAffqarBTLkmL7uWH7SAgQFvd3qcVT5IcXMRSfhUronZACrVq
         S+Inm071hSkT2zHkO0Fiw3MsGkkaiWaomyCyidt5wOfTvEUWYq33Opb9dA0q8aLTmd
         J7XuT7fYF+2F2wPO3FavXp/LT2PTOrM+tAFdCaaCck3sdDVapca2T+EZwb+I47Fg/B
         TMhXdFfl/gjZKFh1lakYLI5RgCy1hlzFtbmr9Zb9j66Zcdlt3vx63jCCh8jaod7GLu
         2XFISCCCIv8SfJYCbkMnMvMDc0LkOMcUlVe9YIEINeeQ9THmSIKEq0mzWLu4JAFh1A
         Iio0x+wCh5Tcw==
From:   Vicki Pfau <vi@endrift.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Cc:     Vicki Pfau <vi@endrift.com>
Subject: [PATCH 2/3] Input: xpad - fix PowerA EnWired Controller guide button
Date:   Thu,  2 Feb 2023 18:27:57 -0800
Message-Id: <20230203022758.3982393-2-vi@endrift.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203022758.3982393-1-vi@endrift.com>
References: <20230203022758.3982393-1-vi@endrift.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/input/joystick/xpad.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index bb65c8268963..16bc3cd4c2b7 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -1390,6 +1390,13 @@ static int xpad_start_xbox_one(struct usb_xpad *xpad)
 	unsigned long flags;
 	int retval;
 
+	/* Explicitly disable the audio interface. This is needed for some
+	 * controllers, such as the PowerA Enhanced Wired Controller
+	 * for Series X|S (0x20d6:0x200e) to report the guide button */
+	retval = usb_set_interface(xpad->udev, 1, 0);
+	if (retval)
+		return retval;
+
 	spin_lock_irqsave(&xpad->odata_lock, flags);
 
 	/*
-- 
2.39.1

