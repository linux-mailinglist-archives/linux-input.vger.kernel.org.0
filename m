Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 374105B24F0
	for <lists+linux-input@lfdr.de>; Thu,  8 Sep 2022 19:41:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232257AbiIHRlN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Sep 2022 13:41:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231274AbiIHRku (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Sep 2022 13:40:50 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E07982608
        for <linux-input@vger.kernel.org>; Thu,  8 Sep 2022 10:39:37 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id 78so17401171pgb.13
        for <linux-input@vger.kernel.org>; Thu, 08 Sep 2022 10:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yocom-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=FKRPxQ5naxQK7DTBiolb96pHzElhA3kQapK3dHX4GyI=;
        b=64adH5I4fYXThrhknLfUKFk2qgQ5orBkYnjbBIu2+9qcbBrDhIaUz6/0TXhBROM+V9
         GoBFfWtdjPZOiJmAkeXNxxCIMJj/7yjBQ0R+yg/mApkAvFX0t0SxPJk2HDooKO7x3mTH
         5oUNuLNT7Knvvrjp43o3qwkuymNNarTCQfAHFvjOFmjsgxHVzXi6GkJkk9enmQ8T/03G
         +Ve3n4fCzm8nN1JhFDnTG6lSvf6W9bZec3Ly2dwSTsPIyu5N4WueDjuRcpZo/P9mxQGW
         giefMHoNzjhVQTIS2tBcE9Fp4r0k8ZroYpRr/dE2C1u8DVcoUiHo+1f3DB0Ga8MbBAM4
         iHeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=FKRPxQ5naxQK7DTBiolb96pHzElhA3kQapK3dHX4GyI=;
        b=0Ep1vI1N+4UD9OHDE7rA1LRmcw00+kotOV9UXQEnOJJEXQ+dxd72qWjz0dZgBOd+ZC
         m2XnmyVr415sSL7fgRaDkw5qCZ0FF2JQ+wuALIAiPRITNqhDxqORiXvkdX4KkxJD/4BU
         HJef2IC+Ss2CBATh/Puidv+Dfc63Rt+0LHC07/CQfTkWvIfqu49ZhRNbebz900fIj763
         6wKW1afPNmTqk9b9C4LN26lT/KqUJnNWtc6FM3bGmoJWTiMfuUD+9n+lcXeWCNotUXP5
         Oa02u0o8/NOuXanxPSCRanYSDohK2wBL71SqcJ1vwfHCtnNnEQZWJ9Ti5JzGH4w+HPoz
         fpZQ==
X-Gm-Message-State: ACgBeo350msMlHMjUxA5N/liGCn7neynXI6uZ5DVC/QpNZDfbiWwnbtf
        uhZfw5oi5kARErQlJIRZbWaimA==
X-Google-Smtp-Source: AA6agR5mOhvkHP0/rVnWqdL6DhOZwPuxfZnHYmEAP/YWN/jX6dy4BAUGE//gzBGs2IBk7BF1T2OhDg==
X-Received: by 2002:a63:1d58:0:b0:434:93f1:2e9f with SMTP id d24-20020a631d58000000b0043493f12e9fmr8904266pgm.157.1662658776105;
        Thu, 08 Sep 2022 10:39:36 -0700 (PDT)
Received: from ghaven-kernel.yocom.org.beta.tailscale.net ([2601:600:8f80:973::5f])
        by smtp.gmail.com with ESMTPSA id x76-20020a62864f000000b0052d4b0d0c74sm15166767pfd.70.2022.09.08.10.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 10:39:35 -0700 (PDT)
From:   Nate Yocom <nate@yocom.org>
To:     dmitry.torokhov@gmail.com
Cc:     nate@yocom.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, hadess@hadess.net,
        benjamin.tissoires@redhat.com
Subject: [PATCH v6 2/5] Input: joystick: xpad: Add X-Box Adaptive XBox button
Date:   Thu,  8 Sep 2022 10:39:27 -0700
Message-Id: <20220908173930.28940-3-nate@yocom.org>
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

Adaptive controller sets 0x02 bit for this button, all others set 0x01
so presence of either is used for BTN_MODE.

Signed-off-by: Nate Yocom <nate@yocom.org>
Tested-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/input/joystick/xpad.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index c8b38bb73d34..dff0d099d416 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -858,7 +858,7 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
 		if (data[1] == 0x30)
 			xpadone_ack_mode_report(xpad, data[2]);
 
-		input_report_key(dev, BTN_MODE, data[4] & 0x01);
+		input_report_key(dev, BTN_MODE, data[4] & 0x03);
 		input_sync(dev);
 		return;
 	}
-- 
2.30.2

