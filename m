Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E15A0597564
	for <lists+linux-input@lfdr.de>; Wed, 17 Aug 2022 19:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbiHQRvk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Aug 2022 13:51:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237586AbiHQRvj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Aug 2022 13:51:39 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0AEA7D79B
        for <linux-input@vger.kernel.org>; Wed, 17 Aug 2022 10:51:38 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id m10-20020a17090a730a00b001fa986fd8eeso2542083pjk.0
        for <linux-input@vger.kernel.org>; Wed, 17 Aug 2022 10:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yocom-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=vTaJzQMO9aQaSOztqsBCXeGz2f0zGMSY5MlxCdWwSg8=;
        b=DsN5uK3Qx9r++HxQBJ1lui6N+wacnFiEazIAmLmiNiJDzWhBbfTpscZgRt/kD1x3en
         bRDEE9ZT90xgeszZQsGk10Pbbyt1Wh9jIfDK5GWOevKkz1sV2wcROYowHFyAAUr1ktRl
         cDjMwxZi9tvYjoZxsJYItha//CYf4pky7QjHPihJxQMRcwKZXKnuRZwW7IklnqWJ5F0j
         Oh1NFSHD2aqrtBjfaGUrCgaCqgyTx9/ng+2z00GNd9t5kOO0MN7JA4JWxgjuCKecwhI0
         oTO9VtQxlWYw4R3nfLrvSjhZFRdo0/Bo4HaS6MJ1/7+cbFZQ8Zox/IAPPG6gFVRSjzjc
         X08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=vTaJzQMO9aQaSOztqsBCXeGz2f0zGMSY5MlxCdWwSg8=;
        b=Yi87FUa++okm+O02wXyz6JYsJ9v9mDkaa0p2P2wfwJGi7vrDVzCCXWWbQ7CPVjtd/V
         j0kXzHjxaFMIznpsou2GoPSBtjJIO27QkieflW6+pjpCfjo6OlQD0IrUOF5p+0CE1qhC
         Ql/h32TJmr5/SRoCozG36cL43Uqh+nYElRmRwppnYTjWMlZGD5Hcv+4WIpZMDOAcviGz
         vX/vyZEKKGcUGLVrazKz1flarIQic72YfMYYEmj4X2jAl0qNAJ6Tuy4xwCWjQDoO7m7G
         x6+/k4F+ALk68ZcU6CR2d+Oapb4q6YlEO+8hBUVXQky/HMEZIRmaKwWiUUKT7dv+T6Ps
         LHhw==
X-Gm-Message-State: ACgBeo11btOCZ9qNjMQTva5lbiNbCIXnwvtlJZ8XIp9VxvGb0iPr7Tos
        Lp2J9Wj6HcGzQnIpErVDFnbR3g==
X-Google-Smtp-Source: AA6agR6ao0Kwumx3g2Nz2iTxby04cWRKempFAOIikTUj3O8i7DqI/uRvjT4Uk3NgWfTcXdY6DLo6Yg==
X-Received: by 2002:a17:902:f548:b0:16f:9649:be69 with SMTP id h8-20020a170902f54800b0016f9649be69mr27156844plf.134.1660758698082;
        Wed, 17 Aug 2022 10:51:38 -0700 (PDT)
Received: from localhost.localdomain ([2601:600:8f80:973::5f])
        by smtp.gmail.com with ESMTPSA id z29-20020aa7991d000000b0052f0a616a87sm10734127pff.168.2022.08.17.10.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 10:51:37 -0700 (PDT)
From:   Nate Yocom <nate@yocom.org>
To:     dmitry.torokhov@gmail.com
Cc:     nate@yocom.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, hadess@hadess.net
Subject: [PATCH v4 1/3] Input: joystick: xpad: Add X-Box Adaptive Controller support
Date:   Wed, 17 Aug 2022 10:51:32 -0700
Message-Id: <20220817175134.15084-2-nate@yocom.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220817175134.15084-1-nate@yocom.org>
References: <20220817175134.15084-1-nate@yocom.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Adds correct VID/PID for this XTYPE_XBOXONE compatible controller to
xpad_device[] table.

Signed-off-by: Nate Yocom <nate@yocom.org>
Tested-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/input/joystick/xpad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 18190b529bca..c8b38bb73d34 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -131,6 +131,7 @@ static const struct xpad_device {
 	{ 0x045e, 0x02e3, "Microsoft X-Box One Elite pad", 0, XTYPE_XBOXONE },
 	{ 0x045e, 0x02ea, "Microsoft X-Box One S pad", 0, XTYPE_XBOXONE },
 	{ 0x045e, 0x0719, "Xbox 360 Wireless Receiver", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
+	{ 0x045e, 0x0b0a, "Microsoft X-Box Adaptive Controller", 0, XTYPE_XBOXONE },
 	{ 0x045e, 0x0b12, "Microsoft Xbox Series S|X Controller", MAP_SELECT_BUTTON, XTYPE_XBOXONE },
 	{ 0x046d, 0xc21d, "Logitech Gamepad F310", 0, XTYPE_XBOX360 },
 	{ 0x046d, 0xc21e, "Logitech Gamepad F510", 0, XTYPE_XBOX360 },
-- 
2.30.2

