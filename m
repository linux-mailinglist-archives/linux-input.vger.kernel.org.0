Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C341B5B915A
	for <lists+linux-input@lfdr.de>; Thu, 15 Sep 2022 01:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbiINX7m (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Sep 2022 19:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229913AbiINX7P (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Sep 2022 19:59:15 -0400
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F8D189926
        for <linux-input@vger.kernel.org>; Wed, 14 Sep 2022 16:58:25 -0700 (PDT)
Received: by mail-il1-x133.google.com with SMTP id k2so8844728ilu.9
        for <linux-input@vger.kernel.org>; Wed, 14 Sep 2022 16:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=H54d0G6AAErtN9paRV2+6Wo2Il0gAFeOcBLywRUXXa0=;
        b=KKodXfjiFWL8hO25Cc/Etaa8UU5/33Qel0Ut/93Dd4jFqU1m4zVtYj9oryjfKZXV+1
         SQH08v978uhL8OKjdw72ZoFUvOyKL23NvujZmenkJYBdgBBPzl8PgFPnPvmDXd4qPy4p
         DKxG6UM6GG2c7X5o80ffKWILUsl3cYsiVRciI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=H54d0G6AAErtN9paRV2+6Wo2Il0gAFeOcBLywRUXXa0=;
        b=KN1ap697gZzdmyODS5qCEdBP4TBQdQ7DrCJ/a7Nb3xP7t1gbLbvi4G6jauCS2AdDSm
         +tNuyjb61oD85o426qzNcyYdcCii9vHbka9Ia2hooLKaDxc3Ueij2W7MvbCXI8fm0U9b
         BKcuNiwoiVqnWGrQNAb/ZwNCXHDWmT+JSPkGhS2OaSTQ3LVSMK5tVgZgj15Y1xJG1e6U
         OM2eXh3GrsMp90bZsYrGR6/AgBwacvjWeGaZQI1wACdfzdvBlWJsAssp+COwhQrnI3Er
         889/mQ8Fu4VKHr49GIt+8wrSvDLR+ddY5eZJVMxDBKMNtTksfgGdXFJ2yn8xI7lQcL5Z
         JJEQ==
X-Gm-Message-State: ACgBeo24g30nzQ7sdHdJOx8bKHpQFIyqET1jqybg/0WOLDgk4K8emhrb
        qcAV0eLuHHU62mhBvF8f1Cm/0g==
X-Google-Smtp-Source: AA6agR77Y9L4Cs5c5NRnJj3AxXZXt2uIl+CPQ8FXJ/1cBBUpbTm6gMAL8RdFcXZFMGBt4hdpYAgA9g==
X-Received: by 2002:a05:6e02:15c9:b0:2da:c33e:49c7 with SMTP id q9-20020a056e0215c900b002dac33e49c7mr15445970ilu.26.1663199904317;
        Wed, 14 Sep 2022 16:58:24 -0700 (PDT)
Received: from rrangel920.bld.corp.google.com (h24-56-189-219.arvdco.broadband.dynamic.tds.net. [24.56.189.219])
        by smtp.gmail.com with ESMTPSA id a14-20020a027a0e000000b0034c0e8829c0sm353721jac.0.2022.09.14.16.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 16:58:23 -0700 (PDT)
From:   Raul E Rangel <rrangel@chromium.org>
To:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org
Cc:     jingle.wu@emc.com.tw, rafael@kernel.org,
        andriy.shevchenko@linux.intel.com, mario.limonciello@amd.com,
        hdegoede@redhat.com, linus.walleij@linaro.org, timvp@google.com,
        dmitry.torokhov@gmail.com, Raul E Rangel <rrangel@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 11/13] Input: elan_i2c - Don't set wake_capable and wake_irq
Date:   Wed, 14 Sep 2022 17:57:59 -0600
Message-Id: <20220914155914.v3.11.I7309b8f322082437b93581c6e2953886eeb998d7@changeid>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
In-Reply-To: <20220914235801.1731478-1-rrangel@chromium.org>
References: <20220914235801.1731478-1-rrangel@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The i2c-core will now handle setting the wake_irq and wake capability
for DT and ACPI systems.

Signed-off-by: Raul E Rangel <rrangel@chromium.org>
---

(no changes since v2)

Changes in v2:
- I chose not to keep the legacy code around since systems without DT or ACPI should be rare.

 drivers/input/mouse/elan_i2c_core.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index 3947474e93d16a..b25b94aba3e88e 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -1332,22 +1332,6 @@ static int elan_probe(struct i2c_client *client,
 		}
 	}
 
-	/*
-	 * Systems using device tree should set up wakeup via DTS,
-	 * the rest will configure device as wakeup source by default.
-	 */
-	if (!dev->of_node)
-		device_init_wakeup(dev, true);
-
-	/*
-	 * The wake IRQ should be declared via device tree instead of assuming
-	 * the IRQ can wake the system. This is here for legacy reasons and
-	 * will be removed once the i2c-core supports querying ACPI for wake
-	 * capabilities.
-	 */
-	if (!dev->power.wakeirq)
-		dev_pm_set_wake_irq(dev, client->irq);
-
 	return 0;
 }
 
-- 
2.37.3.968.ga6b4b080e4-goog

