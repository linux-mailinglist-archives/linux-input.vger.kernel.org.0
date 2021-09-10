Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 613EF406691
	for <lists+linux-input@lfdr.de>; Fri, 10 Sep 2021 06:50:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230189AbhIJEv5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Sep 2021 00:51:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbhIJEvy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Sep 2021 00:51:54 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14245C061574;
        Thu,  9 Sep 2021 21:50:44 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id w19-20020a17090aaf9300b00191e6d10a19so627767pjq.1;
        Thu, 09 Sep 2021 21:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Sk90z9N1GWVTBAvehl43Ueef6XmGAMn0pIg0eOEqlMA=;
        b=jrlQha2Ls0PLmP6nsly43D58miMAjehbopOGwsdV9cD3I+BZpCxn04cijE/hXsW+3d
         h/4/WVn9oi8aZP7FWKLFhReyoaFbolzgcefgC8upygZGYC8X5Xx7AFoTugjcdGQut79d
         Jl8XtP1ymBPXu6xhL2AHpRtn1qA420ileSNXdqgv19VrHgmc/pUjC8eUF/s4WF+XYic+
         D3FD26Po4O9opu1i/bKDn946nw9kHqoT1IGUkVLqzfuy+TqMGguS/Y3DXygeUeUp0jdM
         5g7hXBGL3BPS+2MtjURFH1B78hwQfZBC6x3Ly5LYWQCKv75xtR+CFJaSsweSq3kN8fGC
         I1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Sk90z9N1GWVTBAvehl43Ueef6XmGAMn0pIg0eOEqlMA=;
        b=yS46TW+ve7kfIbYo+cZE7m2ceMLV7wleX8PXGu+He/PG9EBVJTWGwOnmL5K/McIrYs
         6pBoeWX8o0Ctac7OecQrev6u+GCqy0B1z/rw5isRxH+JKe16ChArfNWgZ2yX9w2rl9c1
         6mnVUTeXtlvARS6+/dwky5z1ZsmDys4BC9TMvkd0O9e+4n9cZ2I1YFcfYUYkJZB+rMpR
         zB5D1PNd5dN1hIN3hgR5+wJ5hLYlqksTjnrhoqfQ0oEUVqQ62sryyvArzBbFt1oy9rwv
         BooBmtGm5T3DFsyKfkWXtz0bAgdoCO0oTPzSkDFxzX5gEChciC/QA6/DI+uiPdeitnME
         ERNA==
X-Gm-Message-State: AOAM530FpwazqsGCqE+VnQ6FKNVpzi3q4pV2LArqavUfg8H82XAvBpMS
        2ksvERh8eUXXU33EedDwQG0PFTaXxUs=
X-Google-Smtp-Source: ABdhPJzbV1JlBF8OTGF+0o3AyU05lRH8sEVf4XQH2kppjlzUvyOKcN0uSZMyDNOxlHqQ/5vuo6LjBA==
X-Received: by 2002:a17:90a:e7c6:: with SMTP id kb6mr7607926pjb.225.1631249443427;
        Thu, 09 Sep 2021 21:50:43 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:acdc:1d22:e20a:2796])
        by smtp.gmail.com with ESMTPSA id y4sm3555477pjw.57.2021.09.09.21.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 21:50:42 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Daniel Mack <daniel@zonque.org>,
        Marco Felsch <m.felsch@pengutronix.de>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] Input: ads7846 - set input device bus type and product ID
Date:   Thu,  9 Sep 2021 21:50:37 -0700
Message-Id: <20210910045039.4020199-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Set input device's bus type as BUS_SPI and use model as product ID.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/ads7846.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index eaa8714ad19d..a018481e9d8b 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -1304,6 +1304,9 @@ static int ads7846_probe(struct spi_device *spi)
 	input_dev->name = ts->name;
 	input_dev->phys = ts->phys;
 
+	input_dev->id.bustype = BUS_SPI;
+	input_dev->id.product = pdata->model;
+
 	input_dev->evbit[0] = BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS);
 	input_dev->keybit[BIT_WORD(BTN_TOUCH)] = BIT_MASK(BTN_TOUCH);
 	input_set_abs_params(input_dev, ABS_X,
-- 
2.33.0.309.g3052b89438-goog

