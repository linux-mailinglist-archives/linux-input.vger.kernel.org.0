Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4E06C766F
	for <lists+linux-input@lfdr.de>; Fri, 24 Mar 2023 05:05:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbjCXEFb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 Mar 2023 00:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjCXEFa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 Mar 2023 00:05:30 -0400
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B12416327
        for <linux-input@vger.kernel.org>; Thu, 23 Mar 2023 21:05:29 -0700 (PDT)
Received: from nebulosa.vulpes.eutheria.net (unknown [50.47.218.115])
        by endrift.com (Postfix) with ESMTPSA id 8E9A1A269;
        Thu, 23 Mar 2023 21:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1679630729; bh=SNFCc2aY48PcomGrxZ8+3BxS92edMs4EY6GqsIDEjrc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=X7c1UzT5PwY25I6odUyIql7gFOWrUKk2YC56C7NslFKUrb9ohsiVsTd3yfubudJA2
         2//1Z6dnDlpFcg8Yz/ESTyc0FAbZQF4RyYaKoHve1ExP/TmvuwdSdOWUeEVISK2Q5M
         xQP/6kIbI4l+IaKlg5mjsANarz0PGVYfLe5e3/d+td1TdRNxPpL4Ojqxmswf17niCV
         B4AURDnVkxH7OgOot56MhYzF1JMATJOyJeQjoJoo33lZnvNbLSDZOTyHVPVatPbLwK
         PMG6wgeCSUxx0e5D2A/I3pd66w4rCQYWDgsJBaGymzXwG6oUdpUPFZhdHS01l77WdG
         BvnEwBuLDQVDg==
From:   Vicki Pfau <vi@endrift.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lyude Paul <lyude@redhat.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Cc:     "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>,
        Vicki Pfau <vi@endrift.com>
Subject: [PATCH v2 1/2] Input: xpad - Treat Qanba controllers as Xbox360 controllers
Date:   Thu, 23 Mar 2023 21:04:45 -0700
Message-Id: <20230324040446.3487725-2-vi@endrift.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230324040446.3487725-1-vi@endrift.com>
References: <20230324040446.3487725-1-vi@endrift.com>
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

From: "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>

They act that way in PC mode.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Pierre-Loup A. Griffais <pgriffais@valvesoftware.com>
Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/input/joystick/xpad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 49ae963e5f9d..c2c688156b2e 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -493,6 +493,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOXONE_VENDOR(0x24c6),		/* PowerA Controllers */
 	XPAD_XBOX360_VENDOR(0x2563),		/* OneXPlayer Gamepad */
 	XPAD_XBOX360_VENDOR(0x260d),		/* Dareu H101 */
+	XPAD_XBOX360_VENDOR(0x2c22),		/* Qanba Controllers */
 	XPAD_XBOX360_VENDOR(0x2dc8),            /* 8BitDo Pro 2 Wired Controller */
 	XPAD_XBOXONE_VENDOR(0x2dc8),		/* 8BitDo Pro 2 Wired Controller for Xbox */
 	XPAD_XBOXONE_VENDOR(0x2e24),		/* Hyperkin Duke X-Box One pad */
-- 
2.40.0

