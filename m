Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A7E15C036A
	for <lists+linux-input@lfdr.de>; Wed, 21 Sep 2022 18:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231586AbiIUQE2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Sep 2022 12:04:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232172AbiIUQCs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Sep 2022 12:02:48 -0400
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26D85A2868
        for <linux-input@vger.kernel.org>; Wed, 21 Sep 2022 08:54:15 -0700 (PDT)
Received: by mail-il1-f177.google.com with SMTP id g6so3356432ild.6
        for <linux-input@vger.kernel.org>; Wed, 21 Sep 2022 08:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=THUFniOK+VEaZvk3WrlhDVy764x1MLYSOQIxcILEvxQ=;
        b=X0gOecgOXbR09B7uWiGNA3l57ZH5gzdV7m2fMkuQmBtbM0SHP5TFh/xGTkWyKMdd6k
         bYpQNI35i3B3pvOfI+0U3gvY9f46t3tfzi3Cngcf2p06SP/YugBowaJzwFQnjtycWsIm
         yvQwRVcp/HB0tQHhH92QQfiTU3aLyBnLZx8zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=THUFniOK+VEaZvk3WrlhDVy764x1MLYSOQIxcILEvxQ=;
        b=VnTFUU4FHtNbup+VgSqjohrUyEdrQ0GcFndQVb6N2H7inU4zdOEDv1r0Fwg1HbML6R
         MSxltih3uJYXm1eFmIAqTaX4YHrvO78L31xPr943GprqS+0Omvfw3q7hF5QwVMup3Qr5
         EkIh7m6NUN60K1J+FaGwidf5f5hZKWd42SqN9yqFVUdnpQtST+mBpGbyb63akkv+6oEu
         GCiIuIq9o379pJ86CUTiUIhf5sbg+Y+az4re9GHRnAY8eQABrCgbjctn+swjy4LiWxVH
         HxhlDCGuLz9wvxcoGHQj/9Xun6SzC2OjlssVaJFmRogvkzpG22k5BSYtnWyt+mePVJ1l
         R7Tw==
X-Gm-Message-State: ACrzQf33+3JfAmtbSsuenHt3bU3VKAo/E6EagCN2b/73TziXkMmOKwMC
        Rhqw8ZtJ5DCov8eKxC6FJKSslQ==
X-Google-Smtp-Source: AMsMyM7Y39hoLqgIounsHo+rfvleaY90wBHu2R1tTiv/+BtlKIZ58AXKbEM8mFWmHFs9E7lq3sofGg==
X-Received: by 2002:a05:6e02:1c48:b0:2f1:db4b:66df with SMTP id d8-20020a056e021c4800b002f1db4b66dfmr12601061ilg.35.1663775541555;
        Wed, 21 Sep 2022 08:52:21 -0700 (PDT)
Received: from rrangel920.bld.corp.google.com (h24-56-189-219.arvdco.broadband.dynamic.tds.net. [24.56.189.219])
        by smtp.gmail.com with ESMTPSA id c14-20020a023b0e000000b0035a8d644a31sm1148061jaa.117.2022.09.21.08.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 08:52:21 -0700 (PDT)
From:   Raul E Rangel <rrangel@chromium.org>
To:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org
Cc:     rafael@kernel.org, timvp@google.com,
        mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, jingle.wu@emc.com.tw,
        hdegoede@redhat.com, mario.limonciello@amd.com,
        linus.walleij@linaro.org, Raul E Rangel <rrangel@chromium.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Alistair Francis <alistair@alistair23.me>,
        Bartosz Szczepanek <bsz@semihalf.com>,
        Jiri Kosina <jikos@kernel.org>, Rob Herring <robh@kernel.org>,
        Yang Li <yang.lee@linux.alibaba.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 10/13] HID: i2c-hid: Don't set wake_capable and wake_irq
Date:   Wed, 21 Sep 2022 09:52:02 -0600
Message-Id: <20220921094736.v5.10.Id22d056440953134d8e8fe2c2aff79c79bc78424@changeid>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
In-Reply-To: <20220921155205.1332614-1-rrangel@chromium.org>
References: <20220921155205.1332614-1-rrangel@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The i2c-core will now handle setting the wake_irq for DT and ACPI
systems.

Signed-off-by: Raul E Rangel <rrangel@chromium.org>
Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---

Changes in v5:
- Added Acked-by: Benjamin Tissoires

 drivers/hid/i2c-hid/i2c-hid-core.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index a2fa40dec04ea5..65b7a95956866d 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -1036,15 +1036,6 @@ int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
 	if (ret < 0)
 		goto err_powered;
 
-	/*
-	 * The wake IRQ should be declared via device tree instead of assuming
-	 * the IRQ can wake the system. This is here for legacy reasons and
-	 * will be removed once the i2c-core supports querying ACPI for wake
-	 * capabilities.
-	 */
-	if (!client->dev.power.wakeirq)
-		dev_pm_set_wake_irq(&client->dev, client->irq);
-
 	hid = hid_allocate_device();
 	if (IS_ERR(hid)) {
 		ret = PTR_ERR(hid);
-- 
2.37.3.968.ga6b4b080e4-goog

