Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 051BC5B24F6
	for <lists+linux-input@lfdr.de>; Thu,  8 Sep 2022 19:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232316AbiIHRlZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Sep 2022 13:41:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232113AbiIHRlB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Sep 2022 13:41:01 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6B97EBC
        for <linux-input@vger.kernel.org>; Thu,  8 Sep 2022 10:39:36 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id l65so18657209pfl.8
        for <linux-input@vger.kernel.org>; Thu, 08 Sep 2022 10:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yocom-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=vTaJzQMO9aQaSOztqsBCXeGz2f0zGMSY5MlxCdWwSg8=;
        b=gM1cOCVOyZsazktciwe2XNqwD+uixc4yUsTQG3i3iDnLna/bfq7pPsNHpfIYwKKjLm
         2Yl/txOCUwQELNiVtzqWmdK4kppkfWXmgHkgE13VfJpVO0naIESplhWl2C1eukWHLe93
         GvpNUfViKrFuNe/sMnVrworaKn2c14FQnjfhotFb1tOpoP6sawKR5rjJUrGhWpJzrl8E
         ENKcqBP4xBadxP3muXdquQ6ZfcERDVFIevaHmxj3VPuWA/FSJfZjZTAEell6d9C31ouu
         wV6BGzcVPlOpLMhOAqlRttLZ87WUUYYQG4g4t2cQc0yL7A3WyggwgGRg2lt7Oz+KeCV7
         7Z0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=vTaJzQMO9aQaSOztqsBCXeGz2f0zGMSY5MlxCdWwSg8=;
        b=yp/OibGMd9cs5V3uwGRJPDhcEbgp68Gc+yLr2IKN1shsGiWFT49rqBGQHi1EbF88Np
         ty1CeqJh6uqV3ogQqpBHu2Sy6Eg2l0Wn/JdgBqo4kfD0uo/dpVv26YxkEqr6p8u3gEeW
         qPOUU7BNd82at2ldeou4EgQmRG0t9UJ/PFjiQ4U0PxJu7lVpG2ldbRdzByQOhbDZIirR
         TkNqrJ+BTLljZaOoPqpcPucirDZbrNg0G91HzGnPhUpCkqGJ/JrkOQsl6OcedNegS42G
         tmmPq/6dhcEPIWbaxBcrgvZuWAqSYlkuyZYu/VnWlLH0JsOsmlhIEyny4ZAdTAtekRWo
         2Qbg==
X-Gm-Message-State: ACgBeo3FiJdfYGWco1UFQ+1Cfuwp9vEbGcpHMEPe3niOUJhOjk/ReyFd
        oVY+LnvbphoRVEqXsWNYU3x4tA==
X-Google-Smtp-Source: AA6agR6MrtDO7uvKfnogPTIOMXEJLmmWRDSvCOSO4jhbNzkHSPoRWpisn8/zZaxyoR/AL3wwDvlMsA==
X-Received: by 2002:a63:ec55:0:b0:434:a8e6:7d0 with SMTP id r21-20020a63ec55000000b00434a8e607d0mr8845720pgj.390.1662658774794;
        Thu, 08 Sep 2022 10:39:34 -0700 (PDT)
Received: from ghaven-kernel.yocom.org.beta.tailscale.net ([2601:600:8f80:973::5f])
        by smtp.gmail.com with ESMTPSA id x76-20020a62864f000000b0052d4b0d0c74sm15166767pfd.70.2022.09.08.10.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 10:39:34 -0700 (PDT)
From:   Nate Yocom <nate@yocom.org>
To:     dmitry.torokhov@gmail.com
Cc:     nate@yocom.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, hadess@hadess.net,
        benjamin.tissoires@redhat.com
Subject: [PATCH v6 1/5] Input: joystick: xpad: Add X-Box Adaptive support
Date:   Thu,  8 Sep 2022 10:39:26 -0700
Message-Id: <20220908173930.28940-2-nate@yocom.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220908173930.28940-1-nate@yocom.org>
References: <20220908173930.28940-1-nate@yocom.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
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

