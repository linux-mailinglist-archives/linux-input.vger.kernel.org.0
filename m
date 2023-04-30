Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F0F26F2803
	for <lists+linux-input@lfdr.de>; Sun, 30 Apr 2023 10:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbjD3IBU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 30 Apr 2023 04:01:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbjD3IBS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 30 Apr 2023 04:01:18 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4853213F
        for <linux-input@vger.kernel.org>; Sun, 30 Apr 2023 01:01:16 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2a8bcfbf276so12993201fa.3
        for <linux-input@vger.kernel.org>; Sun, 30 Apr 2023 01:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682841674; x=1685433674;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KzHCdUldIUq8/QYyBbGX3bl3HJePW361rnxBXZ4lJBo=;
        b=FCrF/tVB7x7jGc6xxNEZjXmql9I/wEpI10kYuzgdM9FuLD0Nh0Q3rESzombBxEPqMN
         ZX8yemYYNTgvcF6cTBMuiIhnkXgwZAYlQkcYmie5z95CWdnVcV+c9r5DhgXTwg1nNLnv
         vMya3sOFFVQzgjzIzFfMZ3M4Ke5JZl+8k232/AZ3uoaAmcLxMuhnGdVcL9NyeKS98fjt
         ODRGdyEThcAQuvAaKuOAI9KD0YEJWFQsj7h4MeymsECNKjK8GfDFgz4dgU5lLY6wJ5d1
         hCg+LTM5jiAjUus2rMkYuphstoWiyheNM93b4VgCFqbOmP1QVjHzcExBssi8Q2zNI5Tx
         c7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682841674; x=1685433674;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KzHCdUldIUq8/QYyBbGX3bl3HJePW361rnxBXZ4lJBo=;
        b=c4/uLNSINGhB5RfSLum2S/0SnuQx+f7luX5p7RS4hNd9RE/zWYXqpMK29DwDiMfRBQ
         T9T4KTuAadHViOfehSVNjForuq2xhnzWLrjZRqHtHInZL5rC8AdgBpgGFADQqSgNP1AI
         HgncD2S6bb81yeTXzjUivOxp8o6AR8hZWiyY50Vx1iSjxdXv4DlAvxEYgdzHOdTvPfPB
         RTCuuUt1IjYuq+Q9Y5/JMgbELlwSqSx2HpbBt3KC1QJxzK47fEKxJgwKZ8d2I4IGczAx
         y5NuHcs9ek7xklc2nHHfgwtagZlYbIjZXROZZPVQ1wzv59WEQJHipyYTa74Ismxp1hz5
         x0/A==
X-Gm-Message-State: AC+VfDySY9KxhkX7pAX/iOegZZhbUdv/Ih5r9qqVL3GpTzaVvpgmdyLH
        QkoAE140Lp2DzWdZnFmjsxUK9XUbiPdVdA==
X-Google-Smtp-Source: ACHHUZ6r4FWFLByQB/5zytuCncjh0iAzi5ELPZJJ9VFZTIFrvtont6aUN6eoEuq7V2i8QBhbd+CkTA==
X-Received: by 2002:a2e:9ec1:0:b0:2a7:9b39:eff8 with SMTP id h1-20020a2e9ec1000000b002a79b39eff8mr2861574ljk.6.1682841674677;
        Sun, 30 Apr 2023 01:01:14 -0700 (PDT)
Received: from avdeevavpc ([5.227.26.109])
        by smtp.gmail.com with ESMTPSA id n19-20020a2eb793000000b002a76e600228sm4070489ljo.47.2023.04.30.01.01.13
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 01:01:13 -0700 (PDT)
Date:   Sun, 30 Apr 2023 11:01:10 +0300
From:   Andrey Avdeev <jamesstoun@gmail.com>
To:     linux-input@vger.kernel.org
Subject: [PATCH] touchscreen_dmi: Add info for the Dexp Ursus KX210i
Message-ID: <ZE4gRgzRQCjXFYD0@avdeevavpc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add touchscreen info for the Dexp Ursus KX210i

Signed-off-by: Andrey Avdeev <jamesstoun@gmail.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 13802a3c3591..0d3ac1e7a43c 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -336,6 +336,22 @@ static const struct ts_dmi_data dexp_ursus_7w_data = {
 	.properties	= dexp_ursus_7w_props,
 };
 
+static const struct property_entry dexp_ursus_kx210i_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-min-x", 5),
+	PROPERTY_ENTRY_U32("touchscreen-min-y",  2),
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1720),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1137),
+	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-dexp-ursus-kx210i.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	PROPERTY_ENTRY_BOOL("silead,home-button"),
+	{ }
+};
+
+static const struct ts_dmi_data dexp_ursus_kx210i_data = {
+	.acpi_name	= "MSSL1680:00",
+	.properties	= dexp_ursus_kx210i_props,
+};
+
 static const struct property_entry digma_citi_e200_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1980),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1500),
@@ -1185,6 +1201,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "7W"),
 		},
 	},
+	{
+		/* DEXP Ursus KX210i */
+		.driver_data = (void *)&dexp_ursus_kx210i_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "INSYDE Corp."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "S107I"),
+		},
+	},
 	{
 		/* Digma Citi E200 */
 		.driver_data = (void *)&digma_citi_e200_data,
-- 
2.40.0

