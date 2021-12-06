Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8D5646AE4F
	for <lists+linux-input@lfdr.de>; Tue,  7 Dec 2021 00:17:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351293AbhLFXUj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Dec 2021 18:20:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245463AbhLFXUi (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Dec 2021 18:20:38 -0500
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A585FC061746
        for <linux-input@vger.kernel.org>; Mon,  6 Dec 2021 15:17:09 -0800 (PST)
Received: by mail-il1-x12a.google.com with SMTP id i9so11907823ilu.1
        for <linux-input@vger.kernel.org>; Mon, 06 Dec 2021 15:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vm8GdCARQBzQb8w6JP72xJNdjEOS7+JFZhU7UA4rycE=;
        b=LPIBnC+QJRQSKFsrkV1kHMmX5fEmdH+c8bWRNIT7SdJWmCPijyxt9x57JBlXJRaziD
         haTH9G30Mq/u56uSuIJ6/JGEDfl8X6la1/ee5vMQu5cX+CzqslN/+efixVkfC7hHXChQ
         /FeqSJbEyVG1qRYg00jxBWabgscwKUvf3B6FiKycJQQfLYz30HeNIlBvRMQhnWegvTA1
         T9Jv+hYoBmBTtQiPTevO5HTKb/Rx0Z+HOZbLk/sudcvUPEzxdl5VeR0AGjQsMM6QHa8C
         IAQL2dtd8vI0YEXj34ADkAIKlvpXfwLvPKbhUPVivP+p2jhSFNBWfDB88SK/jCi4eWWR
         dsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vm8GdCARQBzQb8w6JP72xJNdjEOS7+JFZhU7UA4rycE=;
        b=vctl5SIbvbAAk7JoIolvcVIO1wPlNtEcDK5Q7pxQdrIucHjjqh9tbZ7k/HkJqyWNET
         YnxgYk+4hLbSe6Av5Xi17kTZV7opl1Vd5M7N+tjgo+7HuXNhTA8zqCCKmdWeIAkEKz5Q
         CoPdtUeXaCbs/SSatBtAkwX0y00q0Qvde+q13VYEUcOO7U7r5HijylRh5+c6wOlz/11x
         Ji1+jiFw1LDiz68nk0pRZZbC84WmNVN3qfFOcHwZP0o7Ygs4Immq2jUp3xMu3vd0iOH+
         p9Vtm6+KbtP5Wt9EgpSOP2FRwWAo0cc9+Hhp489JWoCAKsmO5pXhi75v5iiO4KrQgjIm
         nErQ==
X-Gm-Message-State: AOAM530BymLLKLyM1EdMFGcIXyqd64upzgsVozW2vmjwnhX+9UTa5Ybf
        Fwqb7IBUHrvjHl8p/RyE8KtIbAEczY1VaTVB
X-Google-Smtp-Source: ABdhPJxSyI0mPYIBvSNI9eHXb5ILrt5bnQ6cRkbcQkRkeY4nzSmFSeu7J4ZXY/L6QzoCyUXwAuO7jQ==
X-Received: by 2002:a05:6e02:1a81:: with SMTP id k1mr33180396ilv.291.1638832628722;
        Mon, 06 Dec 2021 15:17:08 -0800 (PST)
Received: from ruineka-amd-laptop.. (173-23-172-244.client.mchsi.com. [173.23.172.244])
        by smtp.gmail.com with ESMTPSA id l3sm9101821ilv.37.2021.12.06.15.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 15:17:08 -0800 (PST)
From:   Matthew Anderson <ruinairas1992@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Matthew Anderson <ruinairas1992@gmail.com>
Subject: [PATCH] Added device IDs for the OneXPlayer handheld to get the gamepad working.
Date:   Mon,  6 Dec 2021 17:16:50 -0600
Message-Id: <20211206231650.503680-1-ruinairas1992@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Matthew Anderson <ruinairas1992@gmail.com>
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 4c914f75a902..362845f36592 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -337,6 +337,7 @@ static const struct xpad_device {
 	{ 0x3285, 0x0607, "Nacon GC-100", 0, XTYPE_XBOX360 },
 	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
 	{ 0xffff, 0xffff, "Chinese-made Xbox Controller", 0, XTYPE_XBOX },
+	{ 0x2563, 0x058d, "OneXPlayer Gamepad", 0, XTYPE_XBOX360 },
 	{ 0x0000, 0x0000, "Generic X-Box pad", 0, XTYPE_UNKNOWN }
 };
 
@@ -453,6 +454,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOXONE_VENDOR(0x2e24),		/* Hyperkin Duke X-Box One pad */
 	XPAD_XBOX360_VENDOR(0x2f24),		/* GameSir Controllers */
 	XPAD_XBOX360_VENDOR(0x3285),		/* Nacon GC-100 */
+	XPAD_XBOX360_VENDOR(0x2563),		/* OneXPlayer Gamepad */
 	{ }
 };
 
-- 
2.30.2

