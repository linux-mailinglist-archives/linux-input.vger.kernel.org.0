Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DABFE4BA686
	for <lists+linux-input@lfdr.de>; Thu, 17 Feb 2022 17:58:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243484AbiBQQ4a (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Feb 2022 11:56:30 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243472AbiBQQ4Z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Feb 2022 11:56:25 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3EC32B356E
        for <linux-input@vger.kernel.org>; Thu, 17 Feb 2022 08:56:10 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id p9so8746318ejd.6
        for <linux-input@vger.kernel.org>; Thu, 17 Feb 2022 08:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CDm5jz0D+G162hhNQQb+42Oen0khrTArByJVDch1fBg=;
        b=d/xa9ZzlkaV74zSGE4aEZA5l+U6zoyyQLko3FPT+5xJO/khMDluXU5Ql2O6iL64Vfq
         Bsm03d+JHrsnJ0miXZ9L/+hpk4zzcgJOHfLzmmZIMBvVynfu4aGDyhAhYFZdbuRFNwf1
         jOykPokMVmOdGksVryUHgQwEbOB/uE3U64eRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CDm5jz0D+G162hhNQQb+42Oen0khrTArByJVDch1fBg=;
        b=aoeP3NdFqS/F/1ASOvHZpgAvpXueoC8YZHB3J1oqFkKxZES09ZFQ74cxm3hNLcjkjq
         EizoUveNzqc5DFIUCsQzJcpeV9ITiq1saiBw+XKwpfe53Vl2ebge9oZPH5XayTw5HlPg
         F+BfaX4Jzn4wBmG0r9PRCGCMoLLYIdjLmiEV40x6yZnkQQedt0bhDeeqODAFJLsab6hf
         Msjj8WFn0DNgJ5vjiOJjRbEAxBLmkYLJUheLN7GWSMEmriZcnrru3A1+K03tdL9JuGe/
         fKZo2FwoEdGKqUnM2ATfB+bAUKMGGUHO2IkAitpf/07ROL6lJKVMj+d8Lu23Y+csQIEb
         jAIQ==
X-Gm-Message-State: AOAM530AYIrrQow6tBSl/PzmIZ7JVrkb4ICOjif9EwMvRah7kiXPag0C
        dNIGVuglIDlZ/aGlOwzWKlhOOrmNBRs78w==
X-Google-Smtp-Source: ABdhPJzzjCUyb0VmdzDUT42y8ZyBZDTPXeCXWb/oUvKUkjhvpgJKI/xCdxMVYxQJ+byNmygM5FY1vQ==
X-Received: by 2002:a17:906:3283:b0:6ce:78f9:fafd with SMTP id 3-20020a170906328300b006ce78f9fafdmr3048502ejw.534.1645116969198;
        Thu, 17 Feb 2022 08:56:09 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch (host-87-0-15-73.retail.telecomitalia.it. [87.0.15.73])
        by smtp.gmail.com with ESMTPSA id v4sm965323ejb.72.2022.02.17.08.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:56:08 -0800 (PST)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-input@vger.kernel.org
Subject: [PATCH v2 3/6] Input: edt-ft5x06 - set report rate by dts property
Date:   Thu, 17 Feb 2022 17:55:55 +0100
Message-Id: <20220217165559.313366-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220217165559.313366-1-dario.binacchi@amarulasolutions.com>
References: <20220217165559.313366-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

It allows to change the M06/M12 default scan rate on driver probing.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 drivers/input/touchscreen/edt-ft5x06.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 77f061af5c61..b3e492cfc41c 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -1213,6 +1213,14 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
 	edt_ft5x06_ts_get_defaults(&client->dev, tsdata);
 	edt_ft5x06_ts_get_parameters(tsdata);
 
+	if (tsdata->reg_addr.reg_report_rate != NO_REGISTER &&
+	    !of_property_read_u32(client->dev.of_node, "report-rate",
+				  (u32 *)&tsdata->report_rate)) {
+		edt_ft5x06_register_write(tsdata,
+					  tsdata->reg_addr.reg_report_rate,
+					  tsdata->report_rate);
+	}
+
 	dev_dbg(&client->dev,
 		"Model \"%s\", Rev. \"%s\", %dx%d sensors\n",
 		tsdata->name, fw_version, tsdata->num_x, tsdata->num_y);
-- 
2.32.0

