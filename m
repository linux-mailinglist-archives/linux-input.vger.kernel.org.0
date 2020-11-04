Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 794BE2A6981
	for <lists+linux-input@lfdr.de>; Wed,  4 Nov 2020 17:26:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730918AbgKDQZc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Nov 2020 11:25:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731001AbgKDQZG (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Nov 2020 11:25:06 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88126C0613D3
        for <linux-input@vger.kernel.org>; Wed,  4 Nov 2020 08:25:05 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id b8so22723023wrn.0
        for <linux-input@vger.kernel.org>; Wed, 04 Nov 2020 08:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HLzGMSztWgz07v35Jtjii54NsFsWwuKNfNPhB7AbpDE=;
        b=n7NvpaRz/v65F5A+1qpFB3soNR/82EQVavWkMbv96kAU4YMRJbHd7l3KsRnNOodaPZ
         PemLn7Ogcq8PM1/Cr8PBTg5wleTXiAy+X/wEABMnNLO1EnonfgTbrCDp1uA9h8tDB+A1
         oKIKOB8lXxRPgeUtHqOicYWZHvQrn4DfyOPk9iRiEsz1obM2VLKogw0LiVmh9tKMn0Vm
         viL0HhslU49iVhExW1VzATOOLkR4TvgAykDcbPXyV6NKK9e87yF1sPNwEsvOwYMVy3S7
         hBW6/vMbuq7WlQhnD46vMUc24C2aOFVnoIVe5BPNiIQ0+fmfn82uFyY2ocqau7nFmDAG
         kpJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HLzGMSztWgz07v35Jtjii54NsFsWwuKNfNPhB7AbpDE=;
        b=oVmF8FaRB978GtVe+3n6XxEV5+XiQlS2KLFOHH0LlRPfcbOAJ8gf5yqgwG06RPObIj
         z1YALtAXWOnty0NKs4nL6FzJrKJ2qkuRWx4IstFpc+L3RRntRASD7rChRy+zi+kYNR9K
         szTEY6aLq55C2X/uu2zNNqTllBcA50wL2p6WUkK542j1IqfrG6xCfEiyjBBtBs0W7pHY
         zq5i/F3rVwmrIhTcLi5P3P0ZGeXO6sfjGttvOplvpgMjUMGGx5d++1cDBMo/cHT7i9rS
         mlx0jWu5xE9/kTHTy9AbxV2+IAT5E1j8t10PsWcTYsEYuoxQM2SWmRrmEFNeILavwjap
         Y6Mg==
X-Gm-Message-State: AOAM530xhlj7qbTy3Bw2l6cxHNpAKTkLa/apawxt2QIaUwUTH0p91MXZ
        HYontyUhK4UVQWW+5T++kIiAbkmSWJo152k1
X-Google-Smtp-Source: ABdhPJzLYp68/eaXS5ETCQ873RexEl3JnFhUYZxhzam7N4Xf6ESKsOWLHSsfiMqVIIm42mZ0zk2Ozw==
X-Received: by 2002:adf:ce91:: with SMTP id r17mr34508537wrn.326.1604507104315;
        Wed, 04 Nov 2020 08:25:04 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id o129sm3008564wmb.25.2020.11.04.08.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 08:25:03 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-input@vger.kernel.org
Subject: [PATCH 18/20] input: misc: drv2667: Fix formatting and add missing member docs
Date:   Wed,  4 Nov 2020 16:24:25 +0000
Message-Id: <20201104162427.2984742-19-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201104162427.2984742-1-lee.jones@linaro.org>
References: <20201104162427.2984742-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/input/misc/drv2667.c:109: warning: Function parameter or member 'input_dev' not described in 'drv2667_data'
 drivers/input/misc/drv2667.c:109: warning: Function parameter or member 'client' not described in 'drv2667_data'
 drivers/input/misc/drv2667.c:109: warning: Function parameter or member 'regmap' not described in 'drv2667_data'
 drivers/input/misc/drv2667.c:109: warning: Function parameter or member 'work' not described in 'drv2667_data'
 drivers/input/misc/drv2667.c:109: warning: Function parameter or member 'regulator' not described in 'drv2667_data'
 drivers/input/misc/drv2667.c:109: warning: Function parameter or member 'page' not described in 'drv2667_data'
 drivers/input/misc/drv2667.c:109: warning: Function parameter or member 'magnitude' not described in 'drv2667_data'
 drivers/input/misc/drv2667.c:109: warning: Function parameter or member 'frequency' not described in 'drv2667_data'

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/input/misc/drv2667.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/input/misc/drv2667.c b/drivers/input/misc/drv2667.c
index bb9d5784df17d..dc19eb6a8713f 100644
--- a/drivers/input/misc/drv2667.c
+++ b/drivers/input/misc/drv2667.c
@@ -90,12 +90,14 @@
 
 /**
  * struct drv2667_data -
- * @input_dev - Pointer to the input device
- * @client - Pointer to the I2C client
- * @regmap - Register map of the device
- * @work - Work item used to off load the enable/disable of the vibration
- * @regulator - Pointer to the regulator for the IC
- * @magnitude - Magnitude of the vibration event
+ * @input_dev: Pointer to the input device
+ * @client: Pointer to the I2C client
+ * @regmap: Register map of the device
+ * @work: Work item used to off load the enable/disable of the vibration
+ * @regulator: Pointer to the regulator for the IC
+ * @page: Page number
+ * @magnitude: Magnitude of the vibration event
+ * @frequency: Frequency of the vibration event
 **/
 struct drv2667_data {
 	struct input_dev *input_dev;
-- 
2.25.1

