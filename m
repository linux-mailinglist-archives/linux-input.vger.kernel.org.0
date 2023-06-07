Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B764725186
	for <lists+linux-input@lfdr.de>; Wed,  7 Jun 2023 03:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240280AbjFGB2q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Jun 2023 21:28:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240383AbjFGB2o (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Jun 2023 21:28:44 -0400
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 514EB19AB
        for <linux-input@vger.kernel.org>; Tue,  6 Jun 2023 18:28:44 -0700 (PDT)
Received: from nebulosa.vulpes.eutheria.net (unknown [50.47.218.115])
        by endrift.com (Postfix) with ESMTPSA id 27C57A29D;
        Tue,  6 Jun 2023 18:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1686101323; bh=64DKrYCpzykZvpU+00jat8F30txAV21MDf4b9l1LmsI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HKc4XjaddZ/C5VV6PD//dPzaEUiT9Msa/wiG5/1llkHc98Mw8/aDR1h80SGdwmoMw
         LPUBcaOvcDpmXfFMhLnnjy+/AwHdxnvTX0yhiZo4sN0bR3rv01p/FVRfF8tbuJJMDJ
         noxYQeTdBaRWrrtP8TWAyK7DOZGAxYTQiAI08PanMZd4Fwo1pGkld5J+yIb+o8dg6g
         GCn7CYImCjxUIry3Ocj9VFi/9vXibPXyFx0m2fWWczpf9l6q8gMg9TkVpXSKLTMK8H
         LAOBhCAu02LBloNvTE+MBT1a0Bd1F38zQj9w5Xmvf/LOBkQmo1pa/shuCMwmjyTAHc
         jaj47QjeHiB0g==
From:   Vicki Pfau <vi@endrift.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Sam Lantinga <slouken@libsdl.org>,
        Pavel Rojtberg <rojtberg@gmail.com>,
        Vicki Pfau <vi@endrift.com>
Subject: [PATCH 2/2] Input: xpad - Add GameSir VID for Xbox One controllers
Date:   Tue,  6 Jun 2023 18:28:12 -0700
Message-Id: <20230607012812.379640-3-vi@endrift.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230607012812.379640-1-vi@endrift.com>
References: <20230607012812.379640-1-vi@endrift.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Sam Lantinga <slouken@libsdl.org>

Signed-off-by: Sam Lantinga <slouken@libsdl.org>
Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/input/joystick/xpad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 745047215e42..459b5c507399 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -499,6 +499,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOXONE_VENDOR(0x2dc8),		/* 8BitDo Pro 2 Wired Controller for Xbox */
 	XPAD_XBOXONE_VENDOR(0x2e24),		/* Hyperkin Duke Xbox One pad */
 	XPAD_XBOX360_VENDOR(0x2f24),		/* GameSir controllers */
+	XPAD_XBOXONE_VENDOR(0x3537),		/* GameSir Controllers */
 	XPAD_XBOX360_VENDOR(0x31e3),		/* Wooting Keyboards */
 	XPAD_XBOX360_VENDOR(0x3285),		/* Nacon GC-100 */
 	{ }
-- 
2.40.1

