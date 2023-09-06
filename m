Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F14CA7946DA
	for <lists+linux-input@lfdr.de>; Thu,  7 Sep 2023 01:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232620AbjIFXPo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Sep 2023 19:15:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236302AbjIFXPm (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Sep 2023 19:15:42 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CB1119AE
        for <linux-input@vger.kernel.org>; Wed,  6 Sep 2023 16:15:36 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-1c337aeefbdso3402025ad.0
        for <linux-input@vger.kernel.org>; Wed, 06 Sep 2023 16:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694042136; x=1694646936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zanLnHTNyyO2AIIdcoS63tpd7En7tn/QWOYCNadAJFo=;
        b=D0ZogCt6xbfSfEjcf+Sz9I/6PfXeFErH/C2EaLTnxkV+iUSe6gHSL1yp64B3DEu0+E
         VlhLsY+4LaSjgQPFf/DDyxqzTj5Hdn4Bn6jlJYyL/oxI0KgRdOUZczxFHnuXTV/nBy4e
         ENy8nqY3KtQV/cm4QozPNwqOZPCBj1eLsolvkWWCl4bHj0vlrb2ubfsUDr3mgL7912+1
         sFrD+brH0uSoPifJ4lNHCUpOf8J26noVhysttgkYviyusv8DuXMhlikHV9bQFI4a+oiT
         9MqXBiy3BcwqP7MzSDL/uYNv4In/8V0Ps/3H3XT+QbhO0cM/c4z29CF/86CC6Cwj/Kj0
         opIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694042136; x=1694646936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zanLnHTNyyO2AIIdcoS63tpd7En7tn/QWOYCNadAJFo=;
        b=LGHN8CBJPyIqSekAzGOxGffyjfgoXvGWgTeYkUu1xqr7nAKxE9Oy9EmYuTBGmjcC1Q
         1bLfHdt0Wfh+6fp7FOck6bHFxBqDKpsr+jxY6klmX1SYWDcPV4BKDxNvT701hYC/7pEV
         VkAC4he7CzIbPWWa9z4fUN4t3bNYVlqXi7/VD9ejmrKRm+97jz+Kko+QrNWndCmLXrh+
         nfiFpOt24sNx3BcZKavAkO4iRrE2fQpGfSx278VHcintjB9GBD0zOkz/RwaTYGqmJASF
         h/UYxVZOPUtUm6RpuKphApBK6Om62fsWZG3HF2bc8O3xOi+gJDoC3bx/IjBulOA4Vlw8
         sgmA==
X-Gm-Message-State: AOJu0YxIzkR2Nv9PsCjMoGTEKx48prEL0xCXyPei7igGBYRmojR4FL+1
        DjWVoeLtUlt2/0MavK7MY/rE28luz+Uhkg==
X-Google-Smtp-Source: AGHT+IHCemfr55uqBgyps6ZztbIKA/73BfMg6AFL5swc1lHfqeGa+p7PpqMH085a3/5Ra/3rak1CtQ==
X-Received: by 2002:a17:902:e551:b0:1b6:6f12:502e with SMTP id n17-20020a170902e55100b001b66f12502emr21790136plf.49.1694042135710;
        Wed, 06 Sep 2023 16:15:35 -0700 (PDT)
Received: from google.com ([104.129.198.114])
        by smtp.gmail.com with ESMTPSA id g15-20020a1709029f8f00b001b895a17429sm11536717plq.280.2023.09.06.16.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 16:15:35 -0700 (PDT)
From:   HP Dev <hphyperxdev@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, HP Dev <hphyperxdev@gmail.com>,
        Chris Toledanes <chris.toledanes@hp.com>,
        Carl Ng <carl.ng@hp.com>, Max Nguyen <maxwell.nguyen@hp.com>
Subject: [PATCH RESEND] Input: xpad - Add HyperX Clutch Gladiate Support
Date:   Wed,  6 Sep 2023 16:15:15 -0700
Message-Id: <20230906231514.4291-1-hphyperxdev@gmail.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add HyperX controller support to xpad_device and xpad_table.

Suggested-by: Chris Toledanes <chris.toledanes@hp.com>
Reviewed-by: Carl Ng <carl.ng@hp.com>
Signed-off-by: Max Nguyen <maxwell.nguyen@hp.com>
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index cdb193317c3b..1e377d040c43 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -130,6 +130,7 @@ static const struct xpad_device {
 	{ 0x0079, 0x18d4, "GPD Win 2 X-Box Controller", 0, XTYPE_XBOX360 },
 	{ 0x03eb, 0xff01, "Wooting One (Legacy)", 0, XTYPE_XBOX360 },
 	{ 0x03eb, 0xff02, "Wooting Two (Legacy)", 0, XTYPE_XBOX360 },
+	{ 0x03f0, 0x0495, "HyperX Clutch Gladiate", 0, XTYPE_XBOXONE },
 	{ 0x044f, 0x0f00, "Thrustmaster Wheel", 0, XTYPE_XBOX },
 	{ 0x044f, 0x0f03, "Thrustmaster Wheel", 0, XTYPE_XBOX },
 	{ 0x044f, 0x0f07, "Thrustmaster, Inc. Controller", 0, XTYPE_XBOX },
@@ -457,6 +458,7 @@ static const struct usb_device_id xpad_table[] = {
 	{ USB_INTERFACE_INFO('X', 'B', 0) },	/* Xbox USB-IF not-approved class */
 	XPAD_XBOX360_VENDOR(0x0079),		/* GPD Win 2 controller */
 	XPAD_XBOX360_VENDOR(0x03eb),		/* Wooting Keyboards (Legacy) */
+	XPAD_XBOXONE_VENDOR(0x03f0),		/* HP HyperX Xbox One controllers */
 	XPAD_XBOX360_VENDOR(0x044f),		/* Thrustmaster Xbox 360 controllers */
 	XPAD_XBOX360_VENDOR(0x045e),		/* Microsoft Xbox 360 controllers */
 	XPAD_XBOXONE_VENDOR(0x045e),		/* Microsoft Xbox One controllers */
-- 
2.39.3

