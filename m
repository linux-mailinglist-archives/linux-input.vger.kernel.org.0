Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D01425A717C
	for <lists+linux-input@lfdr.de>; Wed, 31 Aug 2022 01:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231190AbiH3XQn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Aug 2022 19:16:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231653AbiH3XQZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Aug 2022 19:16:25 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 961EA61D4A
        for <linux-input@vger.kernel.org>; Tue, 30 Aug 2022 16:16:17 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id v15so4016333iln.6
        for <linux-input@vger.kernel.org>; Tue, 30 Aug 2022 16:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=+Zr3ySvWsAbTk84Odn6RLHHn6wzrbctElmly11wkN94=;
        b=iLHDN+YCP6SEeigDXR6QMVNZFzSVxBxLEqWFEgoiIaApBvqp2Talh4Hx2+dYlXR7Jg
         sKyZE385q5vEsw6K/Q8Fuww3vSMn1euFi9t/lIKKrqqbkqRKE7VJ+YSobkQmze6jdN59
         8uNPyKYMmbP/2VRiezTaqz6binp1k6h3Wm+Ig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=+Zr3ySvWsAbTk84Odn6RLHHn6wzrbctElmly11wkN94=;
        b=ElR47xjhWQvC4qe2NjoD0ixmpDTJKa1vhpEVrV257kYuNghnq4J2YLepMEh7lQdgMx
         FangqpItalw35nmvCe3WzLbPefVxrby5rGtlh9I1SFq/fGz18N8+qbyW/3+0WgJY5kzX
         gVRPMKnUMjMULA2waNeO+8QFTrMGXp50dFcajaIO2EcG4d5CWS6wTvz3stFlV7eO2sjH
         IjnBNt/W4uEWlHbaOjSg+pzTNbDC+T9qUYTJ8XXOyVJ8a9uAfXnIwQivlkpmF8aUWE56
         nDsI+RlgauU7BS+NjVJrdZ9+/SdD5X/Fyz1n/mWtSEhKoWGhN3i93dsvxl1AcSo6FVNt
         26tA==
X-Gm-Message-State: ACgBeo2/nmcPWmgK0EJWMdQ4fp/HSkI0a5uTmUB7K42/BEiEQaaEgGKb
        QrzLgF6X8Bza5n4dVcfsuqrxStXE7nUcKg==
X-Google-Smtp-Source: AA6agR7EnYpMbsonCArvzFQ6q8M1F4HNUWE8hMQhf14cPNEIMWVzS2p0V6Na5vd2QXE/tx8fjaV4Yg==
X-Received: by 2002:a05:6e02:1a41:b0:2eb:7762:f42e with SMTP id u1-20020a056e021a4100b002eb7762f42emr1374216ilv.151.1661901376420;
        Tue, 30 Aug 2022 16:16:16 -0700 (PDT)
Received: from rrangel920.bld.corp.google.com (h24-56-189-219.arvdco.broadband.dynamic.tds.net. [24.56.189.219])
        by smtp.gmail.com with ESMTPSA id z30-20020a056602081e00b0068b1858c81asm6165821iow.13.2022.08.30.16.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 16:16:16 -0700 (PDT)
From:   Raul E Rangel <rrangel@chromium.org>
To:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org
Cc:     hdegoede@redhat.com, mario.limonciello@amd.com, timvp@google.com,
        rafael@kernel.org, Raul E Rangel <rrangel@chromium.org>,
        Alistair Francis <alistair@alistair23.me>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] HID: i2c-hid: acpi: Stop setting wakeup_capable
Date:   Tue, 30 Aug 2022 17:15:38 -0600
Message-Id: <20220830171332.5.I2efb7f551e0aa2dc4c53b5fd5bbea91a1cdd9b32@changeid>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
In-Reply-To: <20220830231541.1135813-1-rrangel@chromium.org>
References: <20220830231541.1135813-1-rrangel@chromium.org>
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

This is now handled by the i2c-core driver.

Signed-off-by: Raul E Rangel <rrangel@chromium.org>
---

 drivers/hid/i2c-hid/i2c-hid-acpi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-acpi.c b/drivers/hid/i2c-hid/i2c-hid-acpi.c
index b96ae15e0ad917..375c77c3db74d9 100644
--- a/drivers/hid/i2c-hid/i2c-hid-acpi.c
+++ b/drivers/hid/i2c-hid/i2c-hid-acpi.c
@@ -105,11 +105,6 @@ static int i2c_hid_acpi_probe(struct i2c_client *client)
 
 	acpi_device_fix_up_power(adev);
 
-	if (acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0) {
-		device_set_wakeup_capable(dev, true);
-		device_set_wakeup_enable(dev, false);
-	}
-
 	return i2c_hid_core_probe(client, &ihid_acpi->ops,
 				  hid_descriptor_address, 0);
 }
-- 
2.37.2.672.g94769d06f0-goog

