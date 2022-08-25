Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E15D5A1C3B
	for <lists+linux-input@lfdr.de>; Fri, 26 Aug 2022 00:24:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244339AbiHYWYm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Aug 2022 18:24:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238261AbiHYWYj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Aug 2022 18:24:39 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A41D5C578D
        for <linux-input@vger.kernel.org>; Thu, 25 Aug 2022 15:24:37 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id w2so70866pld.0
        for <linux-input@vger.kernel.org>; Thu, 25 Aug 2022 15:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yocom-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=vTaJzQMO9aQaSOztqsBCXeGz2f0zGMSY5MlxCdWwSg8=;
        b=XnjJkmq6u8U4v8LTvkmJXfZqTtNkoIPS2vXVr6w6A31HXSAKy3omT0D6Hu3vy/y9f6
         6KbNrzL6Ga/Kmoy3sYuKNkjTKnebJw5l7D0Yv02Cykq08nK4w60sV2Bl+bpDLdpNKC9W
         7DBjT6Q0EOF11ssVZu2d2SG4lFT8luTotjDuRhnNHvCTZITEDGgycasInYxso+/crnRW
         NzbsxC7dgiSA7+/9vC0IT+yyI9AVLb7Q/405BEhDIAWBAW9qCt54EwGLxumqvD44IxvD
         u3JMRl8ZEhv7LEVyiL4gMJ/z1cl+Cy7HJuQGVKO5eWp7NIL32gwvVJRvUnflJLAN+1Xv
         65Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=vTaJzQMO9aQaSOztqsBCXeGz2f0zGMSY5MlxCdWwSg8=;
        b=KGlHxulzt0kbomiqyBm3892sG3QC0XlihdM/OpYoGcqS8gD7WQtcVT35/JYEDG7QjT
         HOG6paRrZdIYaR4iw7eLnwPpJQpa8cALG0TrLNvxelP8kNENj0WQu/HRkyh4LED7iVTH
         kzUUL2rkY+HObwVMFoh1F5WZouRYBLQeZJJp3VV1HDX8h+Aj9BOXVhhSFCFpXZLwPNxc
         jk4IfQzC/3e/3e/TcxphpbyG/j463V3kEsZOXvkg855lKyem4bYFMD+D5ebG8VjhvaKm
         CKipqLam5HDC4mC1YySYV0TXbN+zWEOS9PteHFZ2PsVM0q3exClg41XUDBdL3Xvl+kJr
         rBKQ==
X-Gm-Message-State: ACgBeo0ZWChlkCrE0FJecVqcVqGWXZmb74aZpl+Eoz7AcD5ydwsK57f5
        RIOxe2zxZuDxpoM70LpJENdIhA==
X-Google-Smtp-Source: AA6agR4LjPJYprSCKGQdARvvaSzcXHKYqunWoN7K+wLtj3MBvKXjL3vhYsWfkFMNvHUT2JgeiTnMOA==
X-Received: by 2002:a17:902:7c8a:b0:16f:4d4:ced8 with SMTP id y10-20020a1709027c8a00b0016f04d4ced8mr1015727pll.15.1661466277179;
        Thu, 25 Aug 2022 15:24:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:600:8f80:973::5f])
        by smtp.gmail.com with ESMTPSA id e23-20020a63db17000000b00429b6e6c539sm81820pgg.61.2022.08.25.15.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 15:24:36 -0700 (PDT)
From:   Nate Yocom <nate@yocom.org>
To:     dmitry.torokhov@gmail.com
Cc:     nate@yocom.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, hadess@hadess.net,
        benjamin.tissoires@redhat.com
Subject: [PATCH v5 1/4] Input: joystick: xpad: Add X-Box Adaptive Controller support
Date:   Thu, 25 Aug 2022 15:24:17 -0700
Message-Id: <20220825222420.6833-2-nate@yocom.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220825222420.6833-1-nate@yocom.org>
References: <20220825222420.6833-1-nate@yocom.org>
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

