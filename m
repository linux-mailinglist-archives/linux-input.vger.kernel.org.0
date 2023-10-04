Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CFA07B9901
	for <lists+linux-input@lfdr.de>; Thu,  5 Oct 2023 02:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240836AbjJEAAM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Oct 2023 20:00:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjJEAAM (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Oct 2023 20:00:12 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5F2CC9
        for <linux-input@vger.kernel.org>; Wed,  4 Oct 2023 17:00:07 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-692c70bc440so308671b3a.3
        for <linux-input@vger.kernel.org>; Wed, 04 Oct 2023 17:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696464007; x=1697068807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Eb+PA/MpdgnguBmnwOf+Jyj/X+3/mDrS5xvnttjyCSo=;
        b=cJZ4byoDOTcSSWjgCBP972aujYgJ2Huy4VH/afHotAPS7XQWEGxWEg3Jcjcf3+ZQZH
         XC2WKQ7dstwNa5iuikQ4Jgd6lm+TBoE7Ybgl2IqENuq4rUUrRrcQm5UiiZpv7sxHWQgt
         AWDOjTAfu7sEpkMGrxy0aF9VdcVfWKfZHoabcUqLkDqlH+QEVsFvlLXUb05eemfRAdeG
         HvYqoCVm1UPk3etmMjuWJemMrWROh1W8EYkHn9YEQtPHQS8D0sxaqj7QuBGhOq761VEg
         1scGryCY2O2rYpA9U9wMCtXtvQr+AelGJrZdegL3A7FYkQ/f7oIWw3SN9j1QlenLTuTN
         eZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696464007; x=1697068807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eb+PA/MpdgnguBmnwOf+Jyj/X+3/mDrS5xvnttjyCSo=;
        b=uLVpKHlHys2G+9VvwuP+rUkWuoR+6rwJ4tKHB3KejiSrBqXkoexWkR6UQ/0U7LrvdX
         ApmpqvZGACwdHsATwibWgXEhIUhpFOZWaqveasp5pHREXVoBWGhesuF4uTC94fMwN5jR
         YIxwpTQ0uFdDEpNVUSClUcbVzrGvsEhCmMh4AIMkTwmJnXWt/8cruIDdwbYXno8VGjIA
         eYdJVjU7iNstQVC3qljzoKgXnbyQZH5ho8ZV2Qcq9Oe5ykBj7KWg1b6FIfCfqB175YM/
         wJ6X89FxqK3gw5psTNvF6bt7y4wqTW7YPdtCnyz89gFDMf+T6lY4whzmYAXdGvKbQnd2
         kblg==
X-Gm-Message-State: AOJu0YxYWD2G7YvimyNv/+6n0i+iBRHoeryX+au0F4/KahA9mxfCXpRR
        PxCa0AWNStKqbyAgXCiLxoHhbBpSerDa8Wen
X-Google-Smtp-Source: AGHT+IHOlM0EVLKV2dQmwj0o+7rNA8B1egHdXQEgpLH6c2qpYH0PPsuPCYng3EReSP6yvEw1xGsPrA==
X-Received: by 2002:a05:6a20:3d29:b0:15d:7e2a:cc77 with SMTP id y41-20020a056a203d2900b0015d7e2acc77mr4323722pzi.48.1696464006846;
        Wed, 04 Oct 2023 17:00:06 -0700 (PDT)
Received: from incineroar.home.arpa ([2804:14d:cc81:5b85:b62e:99ff:fef4:b1f3])
        by smtp.gmail.com with ESMTPSA id c8-20020aa78e08000000b0068e4c5a4f3esm98239pfr.71.2023.10.04.17.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 17:00:06 -0700 (PDT)
From:   Renan Guilherme Lebre Ramos <japareaggae@gmail.com>
To:     linux-input@vger.kernel.org, hdegoede@redhat.com
Cc:     Renan Guilherme Lebre Ramos <japareaggae@gmail.com>
Subject: [PATCH] platform/x86: touchscreen_dmi: Add info for the Positivo C4128B
Date:   Wed,  4 Oct 2023 19:59:00 -0400
Message-ID: <20231004235900.426240-1-japareaggae@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add information for the Positivo C4128B, a notebook/tablet convertible.

Link: https://github.com/onitake/gsl-firmware/pull/217
Signed-off-by: Renan Guilherme Lebre Ramos <japareaggae@gmail.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index f9301a9382e7..0f6b30285381 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -756,6 +756,21 @@ static const struct ts_dmi_data pipo_w11_data = {
 	.properties	= pipo_w11_props,
 };
 
+static const struct property_entry positivo_c4128b_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-min-x", 4),
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 13),
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1915),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1269),
+	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-positivo-c4128b.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	{ }
+};
+
+static const struct ts_dmi_data positivo_c4128b_data = {
+	.acpi_name	= "MSSL1680:00",
+	.properties	= positivo_c4128b_props,
+};
+
 static const struct property_entry pov_mobii_wintab_p800w_v20_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-min-x", 32),
 	PROPERTY_ENTRY_U32("touchscreen-min-y", 16),
@@ -1480,6 +1495,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_BIOS_VERSION, "MOMO.G.WI71C.MABMRBA02"),
 		},
 	},
+	{
+		/* Positivo C4128B */
+		.driver_data = (void *)&positivo_c4128b_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Positivo Tecnologia SA"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "C4128B-1"),
+		},
+	},
 	{
 		/* Point of View mobii wintab p800w (v2.0) */
 		.driver_data = (void *)&pov_mobii_wintab_p800w_v20_data,
-- 
2.42.0

