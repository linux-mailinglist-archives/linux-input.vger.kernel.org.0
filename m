Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5F80709266
	for <lists+linux-input@lfdr.de>; Fri, 19 May 2023 11:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbjESJCn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 May 2023 05:02:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjESJCm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 May 2023 05:02:42 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EECCE42
        for <linux-input@vger.kernel.org>; Fri, 19 May 2023 02:02:41 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-643a1fed360so2182529b3a.3
        for <linux-input@vger.kernel.org>; Fri, 19 May 2023 02:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20221208.gappssmtp.com; s=20221208; t=1684486960; x=1687078960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dgyhdD0Z5uIMOVTz0Ju4X2/oVNPW1i/oYYXsh7N4X4M=;
        b=OWYBiz6WlIh1V/l9X/Gdf+xPSgBsF7e7sXV6UyuHEndXrapxhmrB3TkC8R3zfq/hCB
         3z1Q1aBMLMESjZAzDRx7Fh+BF0rEqnRHgzz5uOvdWZ4uvQAK7lp95KBQdSKKsfs+YH/m
         paaxoRemHtRz+QfjeLSxWOHRgbF+QdNq7CjbMhxHIn8lIjjDCXynHoJDi58uoqzKNgFW
         tkTVDKAoA/kBReaBp0KaewU/1eYhT+5kRq0V9jQjW0VxL2hI8oqlMQFyfGHbCuB5DE3G
         q9UO7sUdKNhlxskD0bSC80KJPycUjuPk7oU92vWmsykPaF+RaTr0FMys670hQoP9Aizb
         sx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684486960; x=1687078960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dgyhdD0Z5uIMOVTz0Ju4X2/oVNPW1i/oYYXsh7N4X4M=;
        b=I6mn+Au2tY2fEsDRywpvQZ+GH+pEah0Wz+skjdUrz5OlxQtzJs+pNZbYRDNxUGw1EY
         bfFXD74mVmTsJmNUm81yqgGsv0wskrP0kORazqAXXRj0MVXpJKpf7i2XS/XOtv5SmDPP
         xGBHvpiZzbuPjNWJh+nd7I4+NfNKTXUzbyLHSpVgUqdhebaAclCae37C5XiIwe0n6Mel
         NKBnYk+rRIjXW2ZnLrfCQBFQpcOTpSL+MZ1YXDu/BsKwFDd/0xTIigAVDw2xtDer+5w5
         03fAiIRDUdwSOlWeJi4VS9IfgFqJLPaZ9y3Y6vCdnDfHE6QB9Gqe++hlXB4wJexMSPLA
         j4fQ==
X-Gm-Message-State: AC+VfDxKNkdpPWAp3UwV6mlGz0ajMWM4vztc0/tKgV2+ZIoPgTUmAOmP
        2Su5oCJFjsBc8WKorb9Ca5b3Ag==
X-Google-Smtp-Source: ACHHUZ7wFFt/rKk0Cxr4ucwSXRW4PIJaDmBYFThv9U1k7G56FqIDDwZ4dNN/aLv5j+zmomsAxW5B7A==
X-Received: by 2002:a05:6a00:8c7:b0:64d:1215:a0f5 with SMTP id s7-20020a056a0008c700b0064d1215a0f5mr2448868pfu.34.1684486960613;
        Fri, 19 May 2023 02:02:40 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.214])
        by smtp.gmail.com with ESMTPSA id c24-20020aa78e18000000b00622e01989cbsm2649274pfr.176.2023.05.19.02.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 02:02:40 -0700 (PDT)
From:   Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        dianders@chromium.org, mka@chromium.org, dmitry.torokhov@gmail.com,
        hsinyi@google.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH] HID: i2c-hid: goodix: Add ili9882t timing
Date:   Fri, 19 May 2023 17:01:49 +0800
Message-Id: <20230519090149.4407-1-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The ili9882t is a TDDI IC ((Touch with Display Driver)). It requires the
panel reset gpio to be high before i2c commands. Use a longer delay in
post_power_delay_ms to ensure the poweron sequence.

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
---
 drivers/hid/i2c-hid/i2c-hid-of-goodix.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c b/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
index 0060e3dcd775..c5870b683a26 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
@@ -101,8 +101,14 @@ static const struct goodix_i2c_hid_timing_data goodix_gt7375p_timing_data = {
 	.post_gpio_reset_delay_ms = 180,
 };
 
+static const struct goodix_i2c_hid_timing_data ilitek_ili9882t_timing_data = {
+	.post_power_delay_ms = 200,
+	.post_gpio_reset_delay_ms = 180,
+};
+
 static const struct of_device_id goodix_i2c_hid_of_match[] = {
 	{ .compatible = "goodix,gt7375p", .data = &goodix_gt7375p_timing_data },
+	{ .compatible = "ilitek,ili9882t", .data = &ilitek_ili9882t_timing_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, goodix_i2c_hid_of_match);
-- 
2.25.1

