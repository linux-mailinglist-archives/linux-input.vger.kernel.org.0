Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 308582A696E
	for <lists+linux-input@lfdr.de>; Wed,  4 Nov 2020 17:25:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730898AbgKDQYv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Nov 2020 11:24:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730886AbgKDQYu (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Nov 2020 11:24:50 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87E75C0613D4
        for <linux-input@vger.kernel.org>; Wed,  4 Nov 2020 08:24:49 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id c9so2932375wml.5
        for <linux-input@vger.kernel.org>; Wed, 04 Nov 2020 08:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9NHmedOCRIc2xnnGH01/ejWH5JuRMMipEGdnpJjxqx0=;
        b=ihd4cjor+G6rX1ggGASF3+GjYf0ln8/wEy6pGL3SzwMX98KaSj0EcyR7Y/WGIfYp3M
         pUXD2dcjMEKpJjTL01KRKr99ewg4xK2se+OWdpfjcJ5PSe5fuGbw2exkIwmXaSV6kHNY
         yqYExKB+gb0ewMroVbBS2PXG8MBBORwKRNhVIAyNYdJeG9REXbflyKQC2cYt2I8zK+OK
         ojfUkUN9Bn8gyxPfgZg4FJo36TjcrGVu67tKHfiE1KvqCuwWLLRcVre0wGyIiDU5CJIs
         w9lAnUddYUvAtb5Ur8D8e3n4BFYwb1OIjRX3obRAPXRL6lJ0UjnTSyDBS0YK6QNbsgCJ
         rYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9NHmedOCRIc2xnnGH01/ejWH5JuRMMipEGdnpJjxqx0=;
        b=PqFAPfqSFVU0r/79ItCBVI1FJyBlw6xPVWcrjAAyVb/bBEFCTny0Yt2+A6gaUO/P+K
         JPVfFiPJEvcTsEXUJo2ZAfJIufAU5c0pvw5gFAMwKJfcoYcfdEUxEgyj/RgUJlDmU83a
         L5vgcbrDoErmuQHm6HZzf5kG53lI+C2d5RLLPTgFcVsPphpvIxTDJ6ZcrL84GhXq0QAo
         WqDIYqDgQQg8xciiDmxZghbbONcMp98Pgj3aORWkbj0p+A4u140lJqpG8oH0kFQJPbil
         hepLW0xf3L3mSD20emSQsRX3KGDEBAdexQxFjcvP2khdYuFEQTx7BRyLQyTTbxAR+PIu
         OHHg==
X-Gm-Message-State: AOAM530uIDnGVPG07voe3wcVLfyDHaUCyyiWbLXIH6JD4w/Sk1XSevQT
        1X50lpOqqcx5qyvX5cSDnZ2VVg==
X-Google-Smtp-Source: ABdhPJzN5pQ/mhwlh+PDZoLgd0UVb2djL7JMH20PolKMy8rlUhESY4VSUAiZsRqeTBcInCSLAH7P3g==
X-Received: by 2002:a1c:8087:: with SMTP id b129mr5455110wmd.10.1604507088195;
        Wed, 04 Nov 2020 08:24:48 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id o129sm3008564wmb.25.2020.11.04.08.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 08:24:47 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 05/20] input: rmi4: rmi_f01: Struct headers are expected to start with 'struct <name>'
Date:   Wed,  4 Nov 2020 16:24:12 +0000
Message-Id: <20201104162427.2984742-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201104162427.2984742-1-lee.jones@linaro.org>
References: <20201104162427.2984742-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/input/rmi4/rmi_f01.c:106: warning: Cannot understand  * @ctrl0 - see the bit definitions above.

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/input/rmi4/rmi_f01.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/rmi4/rmi_f01.c b/drivers/input/rmi4/rmi_f01.c
index e623c956376e3..23618fcb1f322 100644
--- a/drivers/input/rmi4/rmi_f01.c
+++ b/drivers/input/rmi4/rmi_f01.c
@@ -103,6 +103,7 @@ struct f01_basic_properties {
 #define RMI_F01_CTRL0_CONFIGURED_BIT	BIT(7)
 
 /**
+ * struct f01_device_control
  * @ctrl0 - see the bit definitions above.
  * @doze_interval - controls the interval between checks for finger presence
  * when the touch sensor is in doze mode, in units of 10ms.
-- 
2.25.1

