Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 312F17602AC
	for <lists+linux-input@lfdr.de>; Tue, 25 Jul 2023 00:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbjGXWuR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Jul 2023 18:50:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjGXWuQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Jul 2023 18:50:16 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6403DF
        for <linux-input@vger.kernel.org>; Mon, 24 Jul 2023 15:50:15 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-6862842a028so2717687b3a.0
        for <linux-input@vger.kernel.org>; Mon, 24 Jul 2023 15:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690239015; x=1690843815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9vFliQUMwwh/n9TzeGKSHboQWIy8TTdz1lJJKkDUynI=;
        b=Rw23z8vcRNm0MG5eJVivVlSnwho6lfpPclwZAR6JMnO7p4AzjLhc/fKQvzk/JISBVN
         IE3noBUxL6h/ITcyQKfH9tSNsCdeQkxCLYXyQUtKqfqNnCh+8oSD1NzTJBqSPDxsfafL
         Q7C4gwxKMADGUdd2smBOcmNINrB1NFDdiiAUZo+vM5OcJGSJ97xkROe4T0xM1TlJYT1W
         lD/ljJgz4PwOz2yyeBWjwsqVo8xIzyxnTWSkquvGJJkROwPNr3fvvaPP1Ps2Sy17fHja
         UrfC1ZW9DJKtatzd+DAVAZZUkb7osQtjpLWbcmoT40suwfG5WksN6tFr3WU4/R5Uceio
         IBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690239015; x=1690843815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9vFliQUMwwh/n9TzeGKSHboQWIy8TTdz1lJJKkDUynI=;
        b=CHbiMXCz4E/3pmAmD67UmVUNawaIDeLg4TPg5gh8/qMz9SL+LAD8xLc+l6FQ6LvnCB
         xdIzFhZGetqcMZaUxKXtuhI+yvLLT+T/Ys2WC7ks3wo46Yb/EJKRsWOWrF8Ubmk9koE2
         UbUF3+Z49x2er3XK7AQsft6PL7n8nqekReqKiJ+AEUep00i9mP3Xhm2Zmvc8ZEkKAQ/h
         wZRVT7D9IaFmOJ/jXZVGSwQ4Ky1PMvfSbNyEuCeEm+T1n2QcapNg3vZRgrQS/NbrFGm3
         I4GVvvhMEn6iGr+a4EGsPqoN7NPIjg0AfMH8AHF/97cNrOzJcjAkPy80mpqZVf+FQaRP
         0aCg==
X-Gm-Message-State: ABy/qLbRxEx/jp5L+hcNE1Kv5JjuuOsPmHas4jM0cB9SZCjymNsh83T8
        fS6Jxfu/4zf2B+GvURfagRc=
X-Google-Smtp-Source: APBJJlFqg0XxsJ7WGGcyFL39cV0JB0ig5RWV2oBzrCZrdVjre/uaexXS8sFdbTwIY585w23BMclNiQ==
X-Received: by 2002:a05:6a20:1590:b0:13a:8082:5324 with SMTP id h16-20020a056a20159000b0013a80825324mr4787499pzj.44.1690239015105;
        Mon, 24 Jul 2023 15:50:15 -0700 (PDT)
Received: from google.com ([104.129.198.114])
        by smtp.gmail.com with ESMTPSA id ix20-20020a170902f81400b001b80760fd04sm2996549plb.112.2023.07.24.15.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 15:50:14 -0700 (PDT)
From:   HP Dev <hphyperxdev@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, HP Dev <hphyperxdev@gmail.com>,
        Chris Toledanes <chris.toledanes@hp.com>,
        Carl Ng <carl.ng@hp.com>, Max Nguyen <maxwell.nguyen@hp.com>
Subject: [PATCH V2] Input: xpad - Add HyperX Clutch Gladiate Support
Date:   Mon, 24 Jul 2023 15:49:05 -0700
Message-Id: <20230724224903.146092-1-hphyperxdev@gmail.com>
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

Suggested-by: Chris Toledanes <chris.toledanes@hp.com>
Reviewed-by: Carl Ng <carl.ng@hp.com>
Signed-off-by: Max Nguyen <maxwell.nguyen@hp.com>
---
V1 -> V2: Remove Xbox 360 vendor-specific class support.

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

