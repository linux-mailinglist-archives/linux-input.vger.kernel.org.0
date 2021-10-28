Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 760EE43DDA6
	for <lists+linux-input@lfdr.de>; Thu, 28 Oct 2021 11:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbhJ1JYm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Oct 2021 05:24:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhJ1JYl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Oct 2021 05:24:41 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A26BC061570
        for <linux-input@vger.kernel.org>; Thu, 28 Oct 2021 02:22:15 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id u18so8970393wrg.5
        for <linux-input@vger.kernel.org>; Thu, 28 Oct 2021 02:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=hjM2WUF1lzXY8XSn9CQ+qLQ2WnGf0S7Zj6og2AgfuJU=;
        b=yaFTZ4zR2QmWIVjESn3Y65WO8ch2AOc5eL+KxRsT4jZxAcetkP57727q/8bYQHwXHb
         7c3Q6nevCFj+6sGfkxk1GuYJw7npoMdcfIIh63dB4xTcwFhfDtXv7sahs45XvGBRpyrG
         mAHc5MHISu0zGqNlLdCdMGttf+cu8TINSJ6S4j+7rX1bTc0xG/thBkaWGsJPaQpjmxCi
         Y9jvwuLs7L3VkRq9OLSQeijRCObVyhS0/KWUaVe9oHcPM+CkeIlUIl4Lfh51OupvQOIG
         CpKEdvSDROUuVH/M3u/inoe5yQx3x4p19XLtFATMF2Uf2Fo2zwWQowFM9tsy2HnX5+P+
         SmhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=hjM2WUF1lzXY8XSn9CQ+qLQ2WnGf0S7Zj6og2AgfuJU=;
        b=klDG88/TpHavGimp++/uo3VMkMgfmSIuQiNOO8lcghBvqerW6JuBHUCykF+s86a3mO
         G5f+yuzayG3ulIHzMuIoudhmQCmCr6H5gYifEk6AeOXegOpxwfpsGgwUJ5jXmL+VcksN
         BVW3CkMFHmoj3q1lSVUXj/wTjXa9/aaOgwsiGpSIZ/HGjXbmpS//eNeCQ0In46JI5q/s
         bFhKzf1YDm19B+x1aplPj05ZJ5Sl+6TszNiNzGMuyWE6TA0W3or0clqi+siyyeF/BUgS
         oNfR2vJ3r4mHRET1S8N0GnmTxbnuycAIvJdaSp9WgkhP4bITY390Np0KoS9RhTDiTYC2
         ZeNg==
X-Gm-Message-State: AOAM533EpofLZijzsmz053Ft0f1dsWc4AbQ7bAtBaGoSuUyqTM2gqr+j
        ZICyGgP7Q2WdhbwYm/4M8I63Cg==
X-Google-Smtp-Source: ABdhPJzkET2NSmN7fnLN770Afk92wICEMQOVBpfINnQdf2Gqih5ZSTfMEZyS69olXJKc7QWdi3ck1A==
X-Received: by 2002:a5d:59a7:: with SMTP id p7mr4137467wrr.141.1635412933579;
        Thu, 28 Oct 2021 02:22:13 -0700 (PDT)
Received: from localhost.localdomain ([88.160.176.23])
        by smtp.gmail.com with ESMTPSA id h22sm2153607wmq.42.2021.10.28.02.22.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Oct 2021 02:22:13 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     dmitry.torokhov@gmail.com
Cc:     aduggan@synaptics.com, linux-input@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] Input: synaptics-rmi4 - Fix doze-holdoff value
Date:   Thu, 28 Oct 2021 11:33:37 +0200
Message-Id: <1635413617-2869-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

doze-holdoff is in 100ms unit not 10us.

Fixes: d8a8b3edfd92 ("Input: synaptics-rmi4 - add device tree support for RMI4 I2C devices")
Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/input/rmi4/rmi_f01.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/rmi4/rmi_f01.c b/drivers/input/rmi4/rmi_f01.c
index d7603c5..e90c618 100644
--- a/drivers/input/rmi4/rmi_f01.c
+++ b/drivers/input/rmi4/rmi_f01.c
@@ -362,13 +362,15 @@ static int rmi_f01_of_probe(struct device *dev,
 	if (retval)
 		return retval;
 
-	pdata->power_management.doze_holdoff = val * 100;
+	/* Doze holdoff is in 100ms unit */
+	pdata->power_management.doze_holdoff = val / 100;
 
 	retval = rmi_of_property_read_u32(dev, &val,
 			"syna,doze-interval-ms", 1);
 	if (retval)
 		return retval;
 
+	/* Doze interval is in 10ms unit */
 	pdata->power_management.doze_interval = val / 10;
 
 	return 0;
-- 
2.7.4

