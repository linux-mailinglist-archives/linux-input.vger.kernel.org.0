Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD6E34AA00
	for <lists+linux-input@lfdr.de>; Fri, 26 Mar 2021 15:37:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230490AbhCZOf6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Mar 2021 10:35:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbhCZOfY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Mar 2021 10:35:24 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A920C0613AA
        for <linux-input@vger.kernel.org>; Fri, 26 Mar 2021 07:35:23 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id c8so5843696wrq.11
        for <linux-input@vger.kernel.org>; Fri, 26 Mar 2021 07:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3OURK0/BtiRmYmxdr9eDjqtjV+BCQ8RHntM2yCP2zSg=;
        b=PtT7cwy7Kq+1bup/YFbEJarCVzHxuEVc84amtcMt2h+VpFZrtcrInuDnq6EqibA2Fd
         fj68TSdpiKv4NbeM2Uww/Bs+rUREHG1Ec0QSCmFZdLwd/BrgKiKUI61ekI12IC8wH6la
         uNBN7ibIy1PNF2z9mutas7vHVc6k/3Xe9IbpSZaIi4YeGFe9WL5soXxTfHc3gvbrFhVm
         zAjvp5E8L1Dr79OibPl0dfASqXLujV2VUIBhSL268DEwj1FvBNG2DRuLL+w3jstQznTr
         ScQzsT5V3hDnqeV4Ac7uuKMutmm9q5NiAbXe/ozjwXZ5prQy6O7QC8hBbLGTeDGMefxK
         fo6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3OURK0/BtiRmYmxdr9eDjqtjV+BCQ8RHntM2yCP2zSg=;
        b=r+EnXB0bs6Bhm6J7Qv7OQBpLKrDF0km/UamwKfWNblKhLBH8caEc9JmfUfqI0kDDvI
         z0IHU1LSCkzukI0TBrtOgGK6xqaC3Eh42lKzkKcXxCs8wJ5EqI9f/0brUwBCfUkmRoKS
         I6wOI3YnIfQ+N0N0m5Er4N+F5JZ6EW6gEeqxrmQ1AKSyp3CuTNAJ6EwnWSnmyARECytB
         Mz8jTWk+3+19jaU+Op4uu+BtJs1guf1Qh31VFXzDSSQUbKNh+u7K9BtpuzuxluEvpvor
         15UYZ7EwkSHe15SKYMhqX/hRgm/L1qqzG70M3sFRGNQygZUMt5ewILhf1YXuN6IMXF3+
         uiNg==
X-Gm-Message-State: AOAM533NLiQZ8/Bs+ovxn/AZbjR8K8itPkocAqEhhQBFrjL5Om9+G8xM
        uVyTGP00pvYZFRmH+/SSM9Jeng==
X-Google-Smtp-Source: ABdhPJyx2thqrRk6seohVbZh5o5G2l8H68FVAIdYkEEG0m4XDCj/sno1gMcTDejHXnqfiBiYzqMxXQ==
X-Received: by 2002:adf:dfc3:: with SMTP id q3mr15131963wrn.121.1616769322202;
        Fri, 26 Mar 2021 07:35:22 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
        by smtp.gmail.com with ESMTPSA id j26sm12878225wrh.57.2021.03.26.07.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:35:21 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-iio@vger.kernel.org
Subject: [PATCH 20/25] HID: hid-sensor-custom: Remove unused variable 'ret'
Date:   Fri, 26 Mar 2021 14:34:53 +0000
Message-Id: <20210326143458.508959-22-lee.jones@linaro.org>
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

 drivers/hid/hid-sensor-custom.c: In function ‘store_value’:
 drivers/hid/hid-sensor-custom.c:400:7: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]

Cc: Jiri Kosina <jikos@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org
Cc: linux-iio@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/hid/hid-sensor-custom.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-sensor-custom.c b/drivers/hid/hid-sensor-custom.c
index 2628bc53ed809..2e6662173a79c 100644
--- a/drivers/hid/hid-sensor-custom.c
+++ b/drivers/hid/hid-sensor-custom.c
@@ -397,15 +397,14 @@ static ssize_t store_value(struct device *dev, struct device_attribute *attr,
 
 	if (!strncmp(name, "value", strlen("value"))) {
 		u32 report_id;
-		int ret;
 
 		if (kstrtoint(buf, 0, &value) != 0)
 			return -EINVAL;
 
 		report_id = sensor_inst->fields[field_index].attribute.
 								report_id;
-		ret = sensor_hub_set_feature(sensor_inst->hsdev, report_id,
-					     index, sizeof(value), &value);
+		sensor_hub_set_feature(sensor_inst->hsdev, report_id,
+				       index, sizeof(value), &value);
 	} else
 		return -EINVAL;
 
-- 
2.27.0

