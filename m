Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D0203B6C7F
	for <lists+linux-input@lfdr.de>; Tue, 29 Jun 2021 04:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbhF2Cc6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Jun 2021 22:32:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230152AbhF2Cc6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Jun 2021 22:32:58 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83E90C061574
        for <linux-input@vger.kernel.org>; Mon, 28 Jun 2021 19:30:31 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id l11so11452163pji.5
        for <linux-input@vger.kernel.org>; Mon, 28 Jun 2021 19:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=PGw82epzk6iSPnchds6h6A2TxOtpwKsb733CwTt40/8=;
        b=JY2U0Vu2UIfTd34jGxmHb1oET48immRTchOyMGpeS2UJI6jxqeUS5zWWUuxFyTXq9T
         U3MXT2zbN+Fofuo1uW5oApsE+u7zBPi9SkECLNUt4IMA+tHK14k1WpdNwXkXKDs8AQXn
         xOMe/Vynd+71N76pL7bNh7bL40S/j85/ZTNfTIRC2kCJ5Yt9MiGoT51m5Mc7LCc22dKd
         6k2J5x7OTAD15j6I8CkD6RtDb1Sq/8truZJwqNaCD6+o99OMrj+fZzbb27oTMZXvslhW
         Ddtzpp2Of+1lrzAaBZPnUjPxsL3z2nW/1eY6V3ydgxQlxJ4Ztbeqv7bxUL+CgGUKAmoE
         I1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=PGw82epzk6iSPnchds6h6A2TxOtpwKsb733CwTt40/8=;
        b=awCzpuPGgZ0CayXwHF/bdp0gl7ayk0CH+FSVllS9HirdnOAYPYLnKqVh9aRiPqvVh2
         B7Ihw9uoh0kWj2PhjZLYT6uD0ZuiqGoBNsXBa7HhqqvgPY7KcPD8yuKxsldLXdQO1alw
         xDVusnXbyxONjXY+8kJ6vaIMJJWk9NywW6MkaMz96RgTbCi2sfJ0M5Y6+rAy56xfZqqb
         Tba4pCslG+DXS4Qv291MczRLsDzm6IdFz3TdnAqtj3F1vLZdiIdfSjN8Doe96u2UQ6Kq
         8DqKy64vS9T54eMvUPLMYMlDseWGmLrOtcMoE6JCTWD8xFuMfTN1+eUDqKpByor3lOfs
         95pw==
X-Gm-Message-State: AOAM533f+kk74njmdgr6BVk3Nb0nHapvgBA9kqamXmXrCfEl/c0Quki7
        jkOF6DM5qJpxrCTy6DbReVp9hw==
X-Google-Smtp-Source: ABdhPJwQEr5P4K0ooyHKsDKfvju7BRWTsVcUOJEympAC2jzZeoqSeyptwYERNOTZn2laKSjhduBbFQ==
X-Received: by 2002:a17:90a:400f:: with SMTP id u15mr42067759pjc.86.1624933830957;
        Mon, 28 Jun 2021 19:30:30 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id v69sm17397130pfc.18.2021.06.28.19.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 19:30:30 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Nick Dyer <nick@shmanahar.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] Input: atmel_mxt_ts - add config_crc sysfs entry
Date:   Tue, 29 Jun 2021 10:30:23 +0800
Message-Id: <20210629023023.32017-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

It's useful for checking the config version that is currently installed
on the device.

The code is taken from downstream maXTouch_linux tree.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 05de92c0293b..41a3d4df3ebd 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3002,16 +3002,27 @@ static ssize_t mxt_update_fw_store(struct device *dev,
 	return count;
 }
 
+/* Configuration crc check sum is returned as hex xxxxxx */
+static ssize_t mxt_config_crc_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct mxt_data *data = dev_get_drvdata(dev);
+
+	return scnprintf(buf, PAGE_SIZE, "%06x\n", data->config_crc);
+}
+
 static DEVICE_ATTR(fw_version, S_IRUGO, mxt_fw_version_show, NULL);
 static DEVICE_ATTR(hw_version, S_IRUGO, mxt_hw_version_show, NULL);
 static DEVICE_ATTR(object, S_IRUGO, mxt_object_show, NULL);
 static DEVICE_ATTR(update_fw, S_IWUSR, NULL, mxt_update_fw_store);
+static DEVICE_ATTR(config_crc, S_IRUGO, mxt_config_crc_show, NULL);
 
 static struct attribute *mxt_attrs[] = {
 	&dev_attr_fw_version.attr,
 	&dev_attr_hw_version.attr,
 	&dev_attr_object.attr,
 	&dev_attr_update_fw.attr,
+	&dev_attr_config_crc.attr,
 	NULL
 };
 
-- 
2.17.1

