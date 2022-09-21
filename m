Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16DDE5C0367
	for <lists+linux-input@lfdr.de>; Wed, 21 Sep 2022 18:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230282AbiIUQE1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Sep 2022 12:04:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232412AbiIUQDp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Sep 2022 12:03:45 -0400
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5481619008
        for <linux-input@vger.kernel.org>; Wed, 21 Sep 2022 08:54:25 -0700 (PDT)
Received: by mail-il1-f179.google.com with SMTP id y15so3357356ilq.4
        for <linux-input@vger.kernel.org>; Wed, 21 Sep 2022 08:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=H54d0G6AAErtN9paRV2+6Wo2Il0gAFeOcBLywRUXXa0=;
        b=aPT4P7qoRZWdL5Bmar/LZHlelSGaUIcO+KvnefvZmwjLeCnKyFua9Sdj/jZ3OYL968
         cQxDi+jSWtUu8TdBqWCYELC8kdx3qAM2gxeRYH8iHLqWA9+l0/9xs6ERSCp/n70oZaHw
         z/ZVSYsY35pX3YiNhdheaP4Q62BbzLzk4j470=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=H54d0G6AAErtN9paRV2+6Wo2Il0gAFeOcBLywRUXXa0=;
        b=YlqW8N6U62QDGR1DSfKfZUuHtLh519A7P1sJY4ZzAR4dCyFIonszJtfAlSZhxlS6NV
         axDL3rGHnBFWiub6FNp6cCoCaEPRjP0Im8mc5zf6WlZswof1fbHMpC10/VixB8/+F8is
         h6pfAvpJWQ/rJiw3XJUyRGTDLLpfY0PyRHLP5F7yqA/8TLq+Z3cgQyL9r885gm5rgCY5
         5uQ3OAuHg8UHzpZKu82qD8PDaqZdg6yc+FQQKld3oTp+7m5IWolw/aSIPhjjPcAMpW2s
         bClfVRuxULvjxbFhNZAj5kP5Lewmb50pkrh4w+LRj1H+cpNwFLwKQ8jfuMaHHXMFDW+b
         u56Q==
X-Gm-Message-State: ACrzQf0n8C/fR1l7i7Ot6VUUVOX7QoLI0ZGLW7i++auMYndjgz+c9Bg5
        R1bcYXTsbqeE4djulymlFYWkBw==
X-Google-Smtp-Source: AMsMyM7LF80A56RG5rA5mp7cs5aIJCOrf0Zc81Hwi3Jug3DDAhNSylTY9RpImJUvdn25Fw0A8rtlVg==
X-Received: by 2002:a92:c546:0:b0:2f1:ceaf:89f8 with SMTP id a6-20020a92c546000000b002f1ceaf89f8mr12931327ilj.195.1663775542631;
        Wed, 21 Sep 2022 08:52:22 -0700 (PDT)
Received: from rrangel920.bld.corp.google.com (h24-56-189-219.arvdco.broadband.dynamic.tds.net. [24.56.189.219])
        by smtp.gmail.com with ESMTPSA id c14-20020a023b0e000000b0035a8d644a31sm1148061jaa.117.2022.09.21.08.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 08:52:22 -0700 (PDT)
From:   Raul E Rangel <rrangel@chromium.org>
To:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org
Cc:     rafael@kernel.org, timvp@google.com,
        mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, jingle.wu@emc.com.tw,
        hdegoede@redhat.com, mario.limonciello@amd.com,
        linus.walleij@linaro.org, Raul E Rangel <rrangel@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 11/13] Input: elan_i2c - Don't set wake_capable and wake_irq
Date:   Wed, 21 Sep 2022 09:52:03 -0600
Message-Id: <20220921094736.v5.11.I7309b8f322082437b93581c6e2953886eeb998d7@changeid>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
In-Reply-To: <20220921155205.1332614-1-rrangel@chromium.org>
References: <20220921155205.1332614-1-rrangel@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
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

