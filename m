Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCB45779B13
	for <lists+linux-input@lfdr.de>; Sat, 12 Aug 2023 01:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237259AbjHKXOI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Aug 2023 19:14:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237189AbjHKXNa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Aug 2023 19:13:30 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFA2D3AA6
        for <linux-input@vger.kernel.org>; Fri, 11 Aug 2023 16:02:44 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-687087d8ddaso2388085b3a.1
        for <linux-input@vger.kernel.org>; Fri, 11 Aug 2023 16:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691794964; x=1692399764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=40/F/xhYgdg3qyLWH/hdqKqM3JZawQXJYuPnTmXPa30=;
        b=NZhr6wEOFPqjfZ41bXPtg6dcUa6oBqOiofkiahhHxrYlMEHl1+KV0ahQjy908lfgz1
         M/fYBmjwuRfvrhRUsg62RPwREpIw8TcTi1iprZIRJm6U/CNbfE6kygoLhxRvXCImyN2l
         r6XulCRKIfYxQSzVWm1MF708QOBPyQDR1EDA3r/0odVlECnvFwDH3afbu6fi2kWjOm7y
         c+aaGAs1zQm/fYO61RMN72uVsc9c0Ie1Aoz85qTBNcAJtUeqNK/01fSJNz3Sv5JA/RZr
         3547f5V8/xfFDhRGAd7Q0PMkEdPw3U98sFzJyHetXfCoLms0Pf0R5PmSa5OtehlXlNFH
         UAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691794964; x=1692399764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=40/F/xhYgdg3qyLWH/hdqKqM3JZawQXJYuPnTmXPa30=;
        b=B7TWpPCjtXATFXhP2pN4SLK/eVlKwSu/wni1DZscb2ma0+eNTb+PQbhFw3yfadKXRI
         uFbtDpS66jKk/QpGwB7EVTKiaxMm/jbfKyLivP74FFsj/H5aijsaSG41mPZSGtF074ZI
         axt9j9kRDl1UgtTnvZsWi9tVb1DdQ34j/RrJjo681bfk0kZv3+Cvsk3HShDIiEVyb3uz
         nvIuyBcmsoEuGM/fMG3tP66F8NrvvksHiEoXIYiIkGOyfY0OtbvgD7Ci2P4d3kRJJi/A
         cLRU0Gb2gMNXyaKzUudujWpZjB6Ws4zPQmJI+G9baIfATv+xUvCPhwZCkLqG3yzwTpbk
         lcUw==
X-Gm-Message-State: AOJu0Yx/QIoGXJ0OyS6BV+4lF0Z1kKoaCjuWBdm+L3I109Kb7Y/aLg4J
        eP+ONvrLSmwDi1m4IlqG9Fw=
X-Google-Smtp-Source: AGHT+IFy1Y0++QawL5g07dcCsNNJMYkzB1wnaExSZMEqfMy5fTd16mPeJX1pJ0wOOgK/x57ioRMNQA==
X-Received: by 2002:a05:6a00:189f:b0:67a:553d:3bc3 with SMTP id x31-20020a056a00189f00b0067a553d3bc3mr4204004pfh.6.1691794964211;
        Fri, 11 Aug 2023 16:02:44 -0700 (PDT)
Received: from google.com ([104.129.198.114])
        by smtp.gmail.com with ESMTPSA id c23-20020aa78c17000000b0067459e92801sm3800228pfd.64.2023.08.11.16.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 16:02:43 -0700 (PDT)
From:   HP Dev <hphyperxdev@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, HP Dev <hphyperxdev@gmail.com>,
        Chris Toledanes <chris.toledanes@hp.com>,
        Rahul Rameshbabu <rrameshbaby@nvidia.com>,
        Carl Ng <carl.ng@hp.com>, Max Nguyen <maxwell.nguyen@hp.com>
Subject: [PATCH V2 RESEND] Input: xpad - Add HyperX Clutch Gladiate Support
Date:   Fri, 11 Aug 2023 15:54:00 -0700
Message-Id: <20230811225359.66751-1-hphyperxdev@gmail.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add HyperX controller support to xpad_device and xpad_table.

Suggested-by: Chris Toledanes <chris.toledanes@hp.com>
Reviewed-by: Rahul Rameshbabu <rrameshbaby@nvidia.com>
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

