Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAB665B4A28
	for <lists+linux-input@lfdr.de>; Sat, 10 Sep 2022 23:27:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231183AbiIJV1Z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 10 Sep 2022 17:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231158AbiIJV0p (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 10 Sep 2022 17:26:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A46652E64;
        Sat, 10 Sep 2022 14:21:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7E55E60EDC;
        Sat, 10 Sep 2022 21:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 133F2C43470;
        Sat, 10 Sep 2022 21:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662844773;
        bh=h/2VHYflfI4l94B4W06etXhd5jyq4NPY5MSNpkIzHos=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NZ1yFpuH7WC/4n49Gt39YX8YZPI70sKLoLEbJgFuFk/IVBoCwVTL5cWRgTkN/F7+S
         E1gC/12t+PaXoUuuzazlKWq6mB8gu17s3UU4RGEaH8FFuQvV3HoIKsDecxRjNC17tO
         +DwrXg6PQRCL30Z4hsL798tTBQAaqxEdVDBz9SFaCuZPYq3pYrvKw9q276eCaDCuRt
         hXD/1p/5y7xw7yf02SZt1+J3ItQOXr9svrC0WFuMQGparxiJHhf3ivZF110Dy/zAaD
         D8jyOHE+SWZ9zUBI67rqSElyshZLq/vWZXuXN9XpIr34wCQhvnoEGtyAxNPaC17hGr
         ilPvOot/JVZQg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Greg Tulli <greg.iforce@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sasha Levin <sashal@kernel.org>, corbet@lwn.net,
        linux-input@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 5/8] Input: iforce - add support for Boeder Force Feedback Wheel
Date:   Sat, 10 Sep 2022 17:19:18 -0400
Message-Id: <20220910211921.70891-5-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220910211921.70891-1-sashal@kernel.org>
References: <20220910211921.70891-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Greg Tulli <greg.iforce@gmail.com>

[ Upstream commit 9c9c71168f7979f3798b61c65b4530fbfbcf19d1 ]

Add a new iforce_device entry to support the Boeder Force Feedback Wheel
device.

Signed-off-by: Greg Tulli <greg.iforce@gmail.com>
Link: https://lore.kernel.org/r/3256420-c8ac-31b-8499-3c488a9880fd@gmail.com
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/input/joydev/joystick.rst     | 1 +
 drivers/input/joystick/iforce/iforce-main.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/input/joydev/joystick.rst b/Documentation/input/joydev/joystick.rst
index 9746fd76cc581..f38c330c028e5 100644
--- a/Documentation/input/joydev/joystick.rst
+++ b/Documentation/input/joydev/joystick.rst
@@ -517,6 +517,7 @@ All I-Force devices are supported by the iforce module. This includes:
 * AVB Mag Turbo Force
 * AVB Top Shot Pegasus
 * AVB Top Shot Force Feedback Racing Wheel
+* Boeder Force Feedback Wheel
 * Logitech WingMan Force
 * Logitech WingMan Force Wheel
 * Guillemot Race Leader Force Feedback
diff --git a/drivers/input/joystick/iforce/iforce-main.c b/drivers/input/joystick/iforce/iforce-main.c
index 58d5cfe465263..12d96937c83f0 100644
--- a/drivers/input/joystick/iforce/iforce-main.c
+++ b/drivers/input/joystick/iforce/iforce-main.c
@@ -64,6 +64,7 @@ static struct iforce_device iforce_device[] = {
 	{ 0x046d, 0xc291, "Logitech WingMan Formula Force",		btn_wheel, abs_wheel, ff_iforce },
 	{ 0x05ef, 0x020a, "AVB Top Shot Pegasus",			btn_joystick_avb, abs_avb_pegasus, ff_iforce },
 	{ 0x05ef, 0x8884, "AVB Mag Turbo Force",			btn_wheel, abs_wheel, ff_iforce },
+	{ 0x05ef, 0x8886, "Boeder Force Feedback Wheel",		btn_wheel, abs_wheel, ff_iforce },
 	{ 0x05ef, 0x8888, "AVB Top Shot Force Feedback Racing Wheel",	btn_wheel, abs_wheel, ff_iforce }, //?
 	{ 0x061c, 0xc0a4, "ACT LABS Force RS",                          btn_wheel, abs_wheel, ff_iforce }, //?
 	{ 0x061c, 0xc084, "ACT LABS Force RS",				btn_wheel, abs_wheel, ff_iforce },
-- 
2.35.1

