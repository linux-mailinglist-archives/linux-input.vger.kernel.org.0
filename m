Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E242E34E392
	for <lists+linux-input@lfdr.de>; Tue, 30 Mar 2021 10:55:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbhC3Iyv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Mar 2021 04:54:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231310AbhC3Iyi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Mar 2021 04:54:38 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56E65C061764
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 01:54:38 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id s17so19024894ljc.5
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 01:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UfaoV/sNb42ikH43Koy/D/irGAW84Qvp9X/UlbMwEzk=;
        b=k32sLOjiJYsWxfXX9S+t/N5vmo6WuHtFecVAec02o04ogYTmrhDbf49bzsuQmTcarm
         k1AzPPp4N2U9XcEGtTrriIUaPI6fs8t8aYOVdmhh5M5f5SxVuRx/sp5uoJ0PyW1AVtyC
         pPedra8xXAQW9smWbiy4HqQMxs7FfMBq3LJdhSi/eRIPz4+7iFPU+vN/bIlUt4CD84q+
         M9D27r375cxfmS5yrLiLPpt4ThCv0wejNxLobKsI+50W6dqXFD0GDO4nSPyEf8MdpInt
         X+D79lXpVr3qJAfD0/ysNE18sAvgjEr21FRKPjJCNkv5vntN71KtpvX3TPSTTmmPqPFb
         EiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UfaoV/sNb42ikH43Koy/D/irGAW84Qvp9X/UlbMwEzk=;
        b=ZMofqDZywWhOKSDeQqal6nKp5pQXKpcZJMp4CWc8gc7YF9AJG1kwaWXz7iMgJQYbTm
         9mVTQsovxSrle7stJlokUWwlPc6RBqSc1nNQs9W6veZQ/fYVaPKbDN4WL8u6pV7H5DFB
         36xz8ADAlxxcZXOFm0mHLPPzxOhMkCZnqmaJ8cBoHf3hdSsBinxsxevqBTN519fGMTVP
         PMTDlqJo6JkrqmKXn2zsUXHbJC7BbW4L9UQl2fo+pB0rzEB3a6R6O0OyO3F/CXC0qzla
         nj8yE0S0ZMxQB0r+hq7s84p9c7ojvosA9unJjGL6DV6bgxkMGQULIbCv1k3erTasVlcx
         kR/w==
X-Gm-Message-State: AOAM531EgdQz75nR6ExS27HnwGfsX86XxqsmKibPU14ygoPTumRs/URh
        2s6h3fekYJU1O3Wd5dJxWJaBCw==
X-Google-Smtp-Source: ABdhPJxqwpf7ujkInmHkQZAME5T06FwK36cvAikR0qzwohiEXbf4vFgV7HFZxdZk95adqYqVhHdFFQ==
X-Received: by 2002:a2e:9a96:: with SMTP id p22mr19652691lji.167.1617094476870;
        Tue, 30 Mar 2021 01:54:36 -0700 (PDT)
Received: from localhost.localdomain (c-14cb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.203.20])
        by smtp.gmail.com with ESMTPSA id 201sm2104238lfm.108.2021.03.30.01.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 01:54:36 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Ferruh Yigit <fery@cypress.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Javier Martinez Canillas <javier@dowhile0.org>
Cc:     Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 7/7] Input: cyttsp - Flag the device properly
Date:   Tue, 30 Mar 2021 10:54:24 +0200
Message-Id: <20210330085424.2244653-8-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210330085424.2244653-1-linus.walleij@linaro.org>
References: <20210330085424.2244653-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This device is certainly a very simple touchscreen so
we set INPUT_MT_DIRECT.

The sibling driver for CY8CTMA140 also sets
INPUT_MT_DROP_UNUSED and experimenting with this driver
it clearly does not hurt: the touchscreen is working just
fine so let's set it for this one as well.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/input/touchscreen/cyttsp_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/cyttsp_core.c b/drivers/input/touchscreen/cyttsp_core.c
index ac412bcb15d8..fb71cd0d2070 100644
--- a/drivers/input/touchscreen/cyttsp_core.c
+++ b/drivers/input/touchscreen/cyttsp_core.c
@@ -672,7 +672,8 @@ struct cyttsp *cyttsp_probe(const struct cyttsp_bus_ops *bus_ops,
 
 	touchscreen_parse_properties(input_dev, true, NULL);
 
-	error = input_mt_init_slots(input_dev, CY_MAX_ID, 0);
+	error = input_mt_init_slots(input_dev, CY_MAX_ID,
+				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
 	if (error) {
 		dev_err(dev, "Unable to init MT slots.\n");
 		return ERR_PTR(error);
-- 
2.29.2

