Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33AA463126A
	for <lists+linux-input@lfdr.de>; Sun, 20 Nov 2022 04:35:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbiKTDfF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 19 Nov 2022 22:35:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiKTDfE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 19 Nov 2022 22:35:04 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E38685FF5
        for <linux-input@vger.kernel.org>; Sat, 19 Nov 2022 19:35:02 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id v3-20020a17090ac90300b00218441ac0f6so10818769pjt.0
        for <linux-input@vger.kernel.org>; Sat, 19 Nov 2022 19:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4n91bNIbfWP5I/fcxWuzLsE6ZQT/buxAzn7+lWv7Euw=;
        b=fx06l9QYxkQnOdQP1HuF3L5UpGJRHFR+jOMgRVUQzAUyEzOrz1wmq4BnxElYhPHIgT
         guaNuOEbiuWzfaIY9qS3LKhnk3QFjsq3dQo8R1VGZGNJzgTORBrEs/8/qkGELi2i3vo3
         MPzxBooGhonvLCUw+bL4P/SPjP5SZ7XXA5RYgMpZJxd1OTCcy5GGVRtlRXHEc0Q8KelU
         Jbd/b2MkipDI1HnplQfgMBdiwcdZcJ3aoLqZ1uUT+n06YnFAt9QhVOWankMQV8sDgo2t
         hnGJlgfKAcczt64u7KyFsFBWTvG3ns40n0lbUXMd5kKGynOuOjzFzvA5JTnZFCimqPyt
         WBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4n91bNIbfWP5I/fcxWuzLsE6ZQT/buxAzn7+lWv7Euw=;
        b=3K97vyjJ7oCtLd8dWxsqbWDK1apvnYk1qHTbWVRMJpTFGQIwRi7HkkY5DGSUMIQo/p
         1ac9JCG1pPypyGWczIUOlXWce3ZsgsmHbrkD21EzmblxG3MiyrEcU4D9Z/knM8Fjajf7
         jqVhbBdWhBzYh+7R9qbs0CtWAFEbwOPqLfor2Sgg4C5gRNpLxVb9qvvJ4LR3IQknqt2/
         32XKcw40NM1nvTg+johEsU9VoRGaRaMS25W1/9Ca4PFrJvOe1bs7nlI0+Y1aZhKBnBi1
         TvJ0/hbqSlfKpWD3j2gBolAOuHFj7EauRd+nSzJxzkkZl2KkJ4H+F534J2AU+Ymssa1Z
         Gb8Q==
X-Gm-Message-State: ANoB5pnjNS6GKtIBPR+Wu7bf+1SdmjAmjoMymVZp1VX98X7LC0W7k4i1
        41vtN2KgKzEtAzcLGpG4vao=
X-Google-Smtp-Source: AA0mqf6xm3Vm5ZUTW2fEf2pxCgV7DLEJhFT5wTzRoSxduy6K5eOlAnKGs/BQmB8r2A7ouu1xevMyjA==
X-Received: by 2002:a17:902:6ac4:b0:186:bb44:946d with SMTP id i4-20020a1709026ac400b00186bb44946dmr6460060plt.11.1668915302398;
        Sat, 19 Nov 2022 19:35:02 -0800 (PST)
Received: from localhost.localdomain ([220.244.252.98])
        by smtp.gmail.com with ESMTPSA id y65-20020a626444000000b0056d73ef41fdsm5859130pfb.75.2022.11.19.19.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 19:35:01 -0800 (PST)
From:   Albert Zhou <albert.zhou.50@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org
Subject: [PATCH] hid: add info to Kconfig
Date:   Sun, 20 Nov 2022 14:34:56 +1100
Message-Id: <20221120033456.4332-1-albert.zhou.50@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Nowadays many laptops use multitouch for their touchpads. This is now
indicated in the help message for HID_MULTITOUCH in the Kconfig.

Signed-off-by: Albert Zhou <albert.zhou.50@gmail.com>
---
 drivers/hid/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 185a077d59cd..86f65258a912 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -697,7 +697,8 @@ config HID_MONTEREY
 config HID_MULTITOUCH
 	tristate "HID Multitouch panels"
 	help
-	  Generic support for HID multitouch panels.
+	  Generic support for HID multitouch panels. Many newer laptops (like
+	  the Dell XPS 13 9360) use multitouch for their touchpads.
 
 	  Say Y here if you have one of the following devices:
 	  - 3M PCT touch screens

base-commit: fe24a97cf2543e8832e7a2124802e5c32aac05aa
-- 
2.34.1

