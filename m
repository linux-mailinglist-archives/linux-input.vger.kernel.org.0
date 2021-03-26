Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F63434A9FA
	for <lists+linux-input@lfdr.de>; Fri, 26 Mar 2021 15:37:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbhCZOfz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Mar 2021 10:35:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230273AbhCZOfS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Mar 2021 10:35:18 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C315C0613AA
        for <linux-input@vger.kernel.org>; Fri, 26 Mar 2021 07:35:18 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id j7so5896143wrd.1
        for <linux-input@vger.kernel.org>; Fri, 26 Mar 2021 07:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NvG+DHxLWGqXLwCLHTxA35O2VaR78VX0X5hX1fU7v18=;
        b=rhuQcSAmr2qobE5MLtzwGEi0Lr/Y4/8iBHF839/53MF2Y9lFQ8GQCe+x75wrZgsaAb
         LMgYAGmQsYZiHJpvm/vSh8fcstZ+DFoaGyOUuXaT0cP+EsWE1v4/JdDHvgDy+DOYGv5M
         YYcUQfeJq1REa1KWNc+wm6CuQbE9ZF5o79O0SwBP2m3L9QLTrcO1HVJPhQbXEY7pJ7qW
         3jprm3kXueIE5fFH1JsBSfeNzWZTnvfbivyVhNtP1bANq+VAhso2JPqVVREHvmNpEwfE
         +unXLRSzUoiys9tWkPjK4aKv0SmMFZBvt96R9lTaj4rHBbpeNVu2PZlfevGLXEkVaKqJ
         pdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NvG+DHxLWGqXLwCLHTxA35O2VaR78VX0X5hX1fU7v18=;
        b=gZaikoREBhmKEc+nTPzDAHtMTGC4pLboIi5vmw2SyezbwOHzBLNJQdaE90/1bDaQER
         IVJ5W4UzVUauhvSJy5ExmP+7OoixmrulapzCenFqvOLhmW++Q/oWP9y4dbZm1adjPO/T
         egdNPmXWZvKsaeoLvoi7/8OWv5+BoVhx2tAZOcQINiRgZBdUwrfOxX1oGV4MC3gzuWbM
         rEuAUH5d2ylGX8S+kWnktuovvzaCA1pxgW3xOzHXmotXs/NHskxTZkhDphODZkt8+Lr/
         H47vmqO9vyEuvjfFsHtcJcjXRoNu7rMzVoidyWx9kW7sKCX2SJJlTSKIepMpn0DPYu+N
         DYeQ==
X-Gm-Message-State: AOAM533PBYao+hTtalRLrIc+6aR+VGG7ejo9R5ojBEKmdQalXirt4xr1
        6njw0zQVrhV5fKNhuUI7gcZcmA==
X-Google-Smtp-Source: ABdhPJzgKpsg9ZVy78ChKXvRowZScKs621lCXY6MP2Gg/TMjc06X/cYy+pFccB0s4qBADlRtz+WTDw==
X-Received: by 2002:a5d:4688:: with SMTP id u8mr14801801wrq.39.1616769316887;
        Fri, 26 Mar 2021 07:35:16 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
        by smtp.gmail.com with ESMTPSA id j26sm12878225wrh.57.2021.03.26.07.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:35:16 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        =?UTF-8?q?Bruno=20Pr=C3=A9mont?= <bonbons@linux-vserver.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "L. Vinyard, Jr" <rvinyard@cs.nmsu.edu>,
        linux-input@vger.kernel.org
Subject: [PATCH 15/25] HID: hid-picolcd_core: Remove unused variable 'ret'
Date:   Fri, 26 Mar 2021 14:34:48 +0000
Message-Id: <20210326143458.508959-17-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210326143458.508959-1-lee.jones@linaro.org>
References: <20210326143458.508959-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/hid/hid-picolcd_core.c: In function ‘picolcd_raw_event’:
 drivers/hid/hid-picolcd_core.c:332:6: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]

Cc: "Bruno Prémont" <bonbons@linux-vserver.org>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: "L. Vinyard, Jr" <rvinyard@cs.nmsu.edu>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/hid/hid-picolcd_core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-picolcd_core.c b/drivers/hid/hid-picolcd_core.c
index 1b5c63241af05..bbda231a7ce30 100644
--- a/drivers/hid/hid-picolcd_core.c
+++ b/drivers/hid/hid-picolcd_core.c
@@ -329,7 +329,6 @@ static int picolcd_raw_event(struct hid_device *hdev,
 {
 	struct picolcd_data *data = hid_get_drvdata(hdev);
 	unsigned long flags;
-	int ret = 0;
 
 	if (!data)
 		return 1;
@@ -342,9 +341,9 @@ static int picolcd_raw_event(struct hid_device *hdev,
 
 	if (report->id == REPORT_KEY_STATE) {
 		if (data->input_keys)
-			ret = picolcd_raw_keypad(data, report, raw_data+1, size-1);
+			picolcd_raw_keypad(data, report, raw_data+1, size-1);
 	} else if (report->id == REPORT_IR_DATA) {
-		ret = picolcd_raw_cir(data, report, raw_data+1, size-1);
+		picolcd_raw_cir(data, report, raw_data+1, size-1);
 	} else {
 		spin_lock_irqsave(&data->lock, flags);
 		/*
-- 
2.27.0

