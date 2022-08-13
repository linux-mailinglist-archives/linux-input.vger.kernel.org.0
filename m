Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0509F591C57
	for <lists+linux-input@lfdr.de>; Sat, 13 Aug 2022 20:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239636AbiHMSx5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Aug 2022 14:53:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237374AbiHMSx4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Aug 2022 14:53:56 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9AB613F0C
        for <linux-input@vger.kernel.org>; Sat, 13 Aug 2022 11:53:55 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 24so3386714pgr.7
        for <linux-input@vger.kernel.org>; Sat, 13 Aug 2022 11:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yocom-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=xBc1OKt9I3SLTG+JSnIOohJmCNuxJDzx5yrVOi1WQ5g=;
        b=gFkfVq3heDZv6+NCYcbU95EvMqKh7JgRkMH2EOqhQxU5qOscEjNd5Y6zU/0eDH2qXF
         y/j0Mhyxtj8mCZ0ykvtW4qrISl83PA8rLepoxJquISxO+t0Wdslq8GPjZQkRUAmWF3rK
         ZshvkHKmcF3qAv1vKLhAYSUEGt/v0MDp58PmTnQJJadhHQd+ab796Tm3tczZXdxW+Rb+
         qjuNNMwlOeiLiDKkPhdX2lyKUG6O/1tdMnOxRcSzeNI5dlXLtifEoEuWSJCH5M+7KGrr
         5J441B35deMrjAoW6Dm8a4ra3h5Jj4yEOX7gYLczJg7BOCC9cJdihu7OU1VeRK8m2hKt
         z0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=xBc1OKt9I3SLTG+JSnIOohJmCNuxJDzx5yrVOi1WQ5g=;
        b=GCcr4aBGMqk20/BeyIojvg+giO/hDNVMcQuN8fR2pMXSAN9hYv4jtXpq1+Z9mXjvp1
         s9TMMMbeCW0yakUVxiWg6qnRuqDdtikwcGDLOxodfpTlxdqraZqsV4+9kGpL1NS+JU8h
         osIK81ejvh1Dw5MgIZ8N1dVzHDL1ky3/fzvclHBhlPPuJ4j1Z8Y5ybqd+xA1ArPeSJN7
         p9IJwGfIZn0Ga7FpQfqMY3RZ0XMksEZ1CosvmGow2E2iaFvhMh0+V97klJ74ZWYg71mM
         25jvvZWL1tI6ZEBsjeHp5m97O7cx42O6eWvvqW/A1GZEZWRBqxnNJ1Gpfcz7tUGuQ8jc
         8dmA==
X-Gm-Message-State: ACgBeo3ZOnCyPOjAWuMaI4t6nsIcCe3zg25i9kKKIqlvIeCDQjppYcc2
        2rPRlm74z7nLJi2wGl19+KgxZQ==
X-Google-Smtp-Source: AA6agR5MrdT1tVRhOp1Smd4NzHHWvrKLPQO6HtTAYRd7SKSQ0UDuXcBfq7fbLbcd9SGYPpzF0XBXjg==
X-Received: by 2002:a05:6a00:b41:b0:52f:59dc:75 with SMTP id p1-20020a056a000b4100b0052f59dc0075mr9404888pfo.33.1660416835330;
        Sat, 13 Aug 2022 11:53:55 -0700 (PDT)
Received: from localhost.localdomain ([2601:600:a07f:e6ac::1c])
        by smtp.gmail.com with ESMTPSA id fs1-20020a17090af28100b001f246f2a423sm1972183pjb.17.2022.08.13.11.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Aug 2022 11:53:55 -0700 (PDT)
From:   Nate Yocom <nate@yocom.org>
To:     dmitry.torokhov@gmail.com
Cc:     nate@yocom.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, hadess@hadess.net
Subject: [PATCH v3 1/3] Input: joystick: xpad: Add X-Box Adaptive Controller support
Date:   Sat, 13 Aug 2022 11:53:41 -0700
Message-Id: <20220813185343.2306-2-nate@yocom.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220813185343.2306-1-nate@yocom.org>
References: <20220813185343.2306-1-nate@yocom.org>
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

