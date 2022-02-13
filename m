Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE2814B3C6D
	for <lists+linux-input@lfdr.de>; Sun, 13 Feb 2022 18:16:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237307AbiBMRQK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 13 Feb 2022 12:16:10 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235491AbiBMRQJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 13 Feb 2022 12:16:09 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87AD458E74
        for <linux-input@vger.kernel.org>; Sun, 13 Feb 2022 09:16:03 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id k25so32971175ejp.5
        for <linux-input@vger.kernel.org>; Sun, 13 Feb 2022 09:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pqCmSI3oKgXqeKRHORXbpr0RliiGdpjxqXgh77LeuyE=;
        b=UGi8i1E0VtCl4TrRHyJC7+OxbcGu58MuNZmH8NIyBazCX7XnZcl9L09tzxQHXp2ZIa
         Y0N7pIhXSGFKWe+4S4dgBXPvTwEbk4CnSiHw/oFY1gtQPhQ3KHL/ZeFJeY6qkiOBI0t2
         RAluvfJOG9hxIUlo5Ur+kB/K92zvFsYZxLLHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pqCmSI3oKgXqeKRHORXbpr0RliiGdpjxqXgh77LeuyE=;
        b=W2SeqVFfacMH+BWE4p1lmN91YZFfj5lSSg77DQ4vz3o1D0/ShDC0vwCG+fCVu7zuDD
         hXhGjRrybuDaQld7HYOwZqG666LO91uVJDz4pkmcmzVnu22lzvanN9PpsYZWFxE+w7nq
         WO6+vn4EZsMQFi4u7+MnClFVDMnrD+2jkUQUGz0V95TPmfrxyjDaj/GNqzgAWpL81z3d
         YZRFHY1JYhP/a257JJGZCsmMiiDN93AGdxoYEa1UV8UGK1S1d1O+t+v29emtmcyiKS5M
         MsNzSf5IQ8K6geHwJtMHvKD0KnTGVeaADRo3SBC+NoHfWzc8dlapNNmCykfORKm96YBn
         cUfQ==
X-Gm-Message-State: AOAM533F7BU5sQxWSKT6BCKdoEscPZJxHYxDO2FG3ESrYo2hQBTJV249
        SUWHLCkm2TVUh5jQTN+UxqL4dA==
X-Google-Smtp-Source: ABdhPJxAyoFOOO1M/a8oyMsOReXM7VsC/c2C44LtpK2zndZP7PB8W/IICUrzii9PWZgCKw3Vsho7XA==
X-Received: by 2002:a17:906:720e:: with SMTP id m14mr8820358ejk.399.1644772562128;
        Sun, 13 Feb 2022 09:16:02 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-52-8-210.retail.telecomitalia.it. [82.52.8.210])
        by smtp.gmail.com with ESMTPSA id o10sm6598878ejj.6.2022.02.13.09.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Feb 2022 09:16:01 -0800 (PST)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-input@vger.kernel.org
Subject: [PATCH 3/6] Input: edt-ft5x06 - set report rate by dts property
Date:   Sun, 13 Feb 2022 18:15:29 +0100
Message-Id: <20220213171532.346270-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220213171532.346270-1-dario.binacchi@amarulasolutions.com>
References: <20220213171532.346270-1-dario.binacchi@amarulasolutions.com>
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

