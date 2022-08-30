Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02F485A717E
	for <lists+linux-input@lfdr.de>; Wed, 31 Aug 2022 01:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231666AbiH3XQs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Aug 2022 19:16:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231528AbiH3XQ0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Aug 2022 19:16:26 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34EE3642C2
        for <linux-input@vger.kernel.org>; Tue, 30 Aug 2022 16:16:18 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id i77so10590766ioa.7
        for <linux-input@vger.kernel.org>; Tue, 30 Aug 2022 16:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=9y7lXZfKic1LpjpQXIA9tlb8KUkVBW2jlGcm93skgJQ=;
        b=NcJfK/oaE+ozKaG0LkF54DJtrz2QVlpP3O6ijlLw4aPafT/KGp1lHiHSpirPVul/pi
         8MgftYJtdSiaGFqZ5tpZX1dfUJfdfvncN+Lgg2crIJX0tU73PGyk2jSydcAYdUF6CQg9
         N1XCIrmJSzZV3tPTWDO3lezzc66SBBeCWJQ+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=9y7lXZfKic1LpjpQXIA9tlb8KUkVBW2jlGcm93skgJQ=;
        b=ALglefR1D3CWXqZfh5yPP9T62sZ2sohmD6p7YmzQXudamgxZIxhsCXkXtee0JcUqCk
         e8DPt2iy/bbOWSJpvb7OPNN8mtrsHCaeAfAmGwrTAlQhnC6ivvuVDucf2OhPpOu0nlz9
         1LgpAs7hwSkAuy5j4frk6DNquTraC1zId1urkG0HfV9O5xEK0joKBi+ARHfLJp2+hg9F
         RSWAK8Gn3/9WZZchmYhNwqFbg7VbKUGSGHa3IW9+EaO2Bfu8iqKi1s3eHTL1ORNCMvT6
         nRC9Yq9h9HmOpMIS93xnCH40EM042KxY1qJL50Gw/4r6LXVrYvmgnlliNH1I87IpzcZT
         lyQQ==
X-Gm-Message-State: ACgBeo10iaRaiaPGGX5Os2mbqV8WDC7im/Iy9UaLY+M9ol4MYtFIKhZA
        jKGRQjXmewoK+36p+A5fyqs/lA==
X-Google-Smtp-Source: AA6agR5O6/8tXAxW3fbQdsvlk23iJZe+hw4eqjCS74ugbqYtFuBc+Z/YJhAGmZm8FSUp1ousJAgNLg==
X-Received: by 2002:a05:6638:1456:b0:346:856f:f3c4 with SMTP id l22-20020a056638145600b00346856ff3c4mr13545825jad.179.1661901377151;
        Tue, 30 Aug 2022 16:16:17 -0700 (PDT)
Received: from rrangel920.bld.corp.google.com (h24-56-189-219.arvdco.broadband.dynamic.tds.net. [24.56.189.219])
        by smtp.gmail.com with ESMTPSA id z30-20020a056602081e00b0068b1858c81asm6165821iow.13.2022.08.30.16.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 16:16:16 -0700 (PDT)
From:   Raul E Rangel <rrangel@chromium.org>
To:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org
Cc:     hdegoede@redhat.com, mario.limonciello@amd.com, timvp@google.com,
        rafael@kernel.org, Raul E Rangel <rrangel@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "jingle.wu" <jingle.wu@emc.com.tw>, linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] Input: elan_i2c - Don't set wake_irq when using ACPI
Date:   Tue, 30 Aug 2022 17:15:39 -0600
Message-Id: <20220830171332.6.I7309b8f322082437b93581c6e2953886eeb998d7@changeid>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
In-Reply-To: <20220830231541.1135813-1-rrangel@chromium.org>
References: <20220830231541.1135813-1-rrangel@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The i2c-core will now handle setting the wake_irq for ACPI systems.

I didn't delete the whole block since this also covers systems that
don't use ACPI or DT, but I'm honestly not sure if that's a valid
config.

Signed-off-by: Raul E Rangel <rrangel@chromium.org>
---

 drivers/input/mouse/elan_i2c_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index 7d997d2b56436b..d434c8ff8c4ca2 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -1333,10 +1333,10 @@ static int elan_probe(struct i2c_client *client,
 	}
 
 	/*
-	 * Systems using device tree should set up wakeup via DTS,
+	 * Systems using device tree should set up wakeup via DTS or ACPI,
 	 * the rest will configure device as wakeup source by default.
 	 */
-	if (!dev->of_node) {
+	if (!dev->of_node && !has_acpi_companion(dev)) {
 		device_init_wakeup(dev, true);
 		dev_pm_set_wake_irq(dev, client->irq);
 	}
-- 
2.37.2.672.g94769d06f0-goog

