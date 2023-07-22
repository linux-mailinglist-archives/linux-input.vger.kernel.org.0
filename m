Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B542475D884
	for <lists+linux-input@lfdr.de>; Sat, 22 Jul 2023 03:06:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbjGVBGU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Jul 2023 21:06:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjGVBGT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Jul 2023 21:06:19 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E58430FD
        for <linux-input@vger.kernel.org>; Fri, 21 Jul 2023 18:06:18 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-6686708c986so2206387b3a.0
        for <linux-input@vger.kernel.org>; Fri, 21 Jul 2023 18:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689987978; x=1690592778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KULIJ/1rH46r21DTQUmncJdjZ/HtFgL8ClzBrzIax1k=;
        b=qXOwdm8uW31vuaHxEy1lRqNibWNK697z8raP4wfppluapjlaSmnMZYfPJ0/C88DQ0L
         Fr/aDB1QmZ4iITnw76qiyxEF3gcdTC191i7UTTPHpKw6mlcKd1oT+1aCLPwnQceoa3T0
         8r+WQYcJOdKPAV4DVBRWdeq9BcKsIhLOaolxHl40Otot9OSHf5a2Rjoz+yiSaF1xavKW
         A9JkJdBzDfmXYAL+DIT1+kzWtDP4OaVv6Xi2xtlzZAZHw+Y7XzS5duwgkKE90HHGMzh6
         o7OV+7koFJHrGFpiWZzlp11jg83HVwZH3OpHcYE6JL54ew9lGbF4kLFBDrFNTYo8KL0L
         geTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689987978; x=1690592778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KULIJ/1rH46r21DTQUmncJdjZ/HtFgL8ClzBrzIax1k=;
        b=R2OJOn6MtZEuoJ1RktgjwNtAMwzh8aUa86QAEkfaJPPwHXJdnKFSOP8OjyH6ywFQ3+
         MCqfCXZs9IJaDiR6KtS9g86fUbvbj6tiTrUA0OHxl23VI7a+LjkMHPcSwtE8AverANvm
         2XL5QmeNCckCYS88bf6XY9Kp2VqiaKsFqxzdvkEOMUnEsn7yydCifhjSWHeBThEWv6hq
         Mie7OvuScLFHT6VdTGNtL3hwicK/OYzE6z9Pm8flJlwrdtIZsE30XJKTx5LjTJ5dpdjo
         172nVNsRmBfB1Odm+cnXGGswPRxzm+6QXYFOffA3DFvqVTj9v/on5Kpqiif7N/kuei5z
         9XYA==
X-Gm-Message-State: ABy/qLZl0+QqRcfoDoHuYQC+P2UwL/aBVYsqvppkn54m6R7lCyE0q94C
        NoNwiRHYBxUUgyGkptobXS0=
X-Google-Smtp-Source: APBJJlFfIK9tUM7YdBQ/qanpF+uogOmO7Oby2j7n9v3tGsyvVmZphLm1OShTiNaPjvKPtNbLw1CCgA==
X-Received: by 2002:a05:6a20:1393:b0:131:6464:2178 with SMTP id hn19-20020a056a20139300b0013164642178mr3704788pzc.21.1689987977857;
        Fri, 21 Jul 2023 18:06:17 -0700 (PDT)
Received: from google.com ([104.129.198.114])
        by smtp.gmail.com with ESMTPSA id h26-20020a62b41a000000b00682ed27f99dsm3504765pfn.46.2023.07.21.18.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 18:06:17 -0700 (PDT)
From:   HP Dev <hphyperxdev@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, HP Dev <hphyperxdev@gmail.com>,
        Chris Toledanes <chris.toledanes@hp.com>,
        Carl Ng <carl.ng@hp.com>, Max Nguyen <maxwell.nguyen@hp.com>
Subject: [PATCH] Input: xpad - Add HyperX Clutch Gladiate support
Date:   Fri, 21 Jul 2023 18:05:32 -0700
Message-Id: <20230722010532.120280-1-hphyperxdev@gmail.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add HyperX controller support to xpad_device and xpad_table.

Reported-by: Chris Toledanes <chris.toledanes@hp.com>
Reviewed-by: Carl Ng <carl.ng@hp.com>
Signed-off-by: Max Nguyen <maxwell.nguyen@hp.com>
---
 drivers/input/joystick/xpad.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index cdb193317c3b..dfddb0bba8d8 100644
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
@@ -457,6 +458,8 @@ static const struct usb_device_id xpad_table[] = {
 	{ USB_INTERFACE_INFO('X', 'B', 0) },	/* Xbox USB-IF not-approved class */
 	XPAD_XBOX360_VENDOR(0x0079),		/* GPD Win 2 controller */
 	XPAD_XBOX360_VENDOR(0x03eb),		/* Wooting Keyboards (Legacy) */
+	XPAD_XBOX360_VENDOR(0x03f0),		/* HP HyperX XBox 360 Controllers */
+	XPAD_XBOXONE_VENDOR(0x03f0),		/* HP HyperX Xbox One Controllers */
 	XPAD_XBOX360_VENDOR(0x044f),		/* Thrustmaster Xbox 360 controllers */
 	XPAD_XBOX360_VENDOR(0x045e),		/* Microsoft Xbox 360 controllers */
 	XPAD_XBOXONE_VENDOR(0x045e),		/* Microsoft Xbox One controllers */
-- 
2.39.3

