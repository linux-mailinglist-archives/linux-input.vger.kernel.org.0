Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 089592A6972
	for <lists+linux-input@lfdr.de>; Wed,  4 Nov 2020 17:25:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730934AbgKDQY5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Nov 2020 11:24:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730913AbgKDQYx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Nov 2020 11:24:53 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBE49C061A4A
        for <linux-input@vger.kernel.org>; Wed,  4 Nov 2020 08:24:51 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id w1so22743917wrm.4
        for <linux-input@vger.kernel.org>; Wed, 04 Nov 2020 08:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X0gqY/+HUV0Wr5kDu/23vRzM4J8U3NtwS4/rj4N8QsA=;
        b=lso1mucyGqycLajbhrAkYzP7u5i7QVTrGcp1cPVbYO8d332GYeWLGyef9lRw3CPlwJ
         XpltyVJrrtTJe5qv9u1OiDK05mV6Ioc4rMg5TUp2GmRygBvnJGz55bLjvplQmF/mK5+G
         IgRg/OOD2+2tyyG4kECcOx4kYqGnv6AcC72C4i+LiGI1REKovh4sFGJ9hSg0i3ksaP7F
         C9cLQTVIGrKN0CIBTRxcBZbqx7k6D8fM3S/BKMCWMhGMNbNioj/it64ZDvwYZnLwi35J
         BcgCRdZlccOzvtRBxQ3rL9nbGzaeIZidlEbRU0tXgHxNVN3knnhnZlaM0qwEy747HMfn
         gqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X0gqY/+HUV0Wr5kDu/23vRzM4J8U3NtwS4/rj4N8QsA=;
        b=Hb2sL3wGefz0OdYSn7cQS1+xI/Yvu9gTEIZ1H/3XnZQEwMno1Er64nyjGtb6ljsgLa
         p/lIn49Pb9Oe1oGGq8KzV+Okzlbiuc39YJV6ntS1YQ7GCyGBQ/HBeSFTrsXvU6kLGOwR
         jxP8Gtc+ca15enxXMTLhWO6e1OMeclxJ+9uYno07oTB5a6GyV4QixbLjCoQNaSvSd1yu
         Xoeh7e/0Yo9wqpMhsn6qyTZsDd0LsqPhdpAniAfCG64J6WYdfK8cjMH2gsHHcCR2spxJ
         OFpFdzmlfVllRROQsuaUsXvgPouFX3EiE4iqQrIh/66pVkjPbb/7HIr6466qohcHQ9c7
         dhnw==
X-Gm-Message-State: AOAM531fIYSAaFGs/dKPBptTzOjNQENX+7Og3oIe1B3qCgt/BR/iGY5B
        q7sY8cl15ICf/EInhnYYT7orvQ==
X-Google-Smtp-Source: ABdhPJyIVkNKg158DR7Ruz3lyqCJ3UvU4gBJZ3sbH1KLrh50PA/PjxkN9udRu3pprTPXFw/OvrVM0A==
X-Received: by 2002:a5d:66c9:: with SMTP id k9mr36083715wrw.158.1604507090615;
        Wed, 04 Nov 2020 08:24:50 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id o129sm3008564wmb.25.2020.11.04.08.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 08:24:49 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        linux-input@vger.kernel.org
Subject: [PATCH 07/20] input: keyboard: cros_ec_keyb: Struct headers should start with 'struct <name>'
Date:   Wed,  4 Nov 2020 16:24:14 +0000
Message-Id: <20201104162427.2984742-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201104162427.2984742-1-lee.jones@linaro.org>
References: <20201104162427.2984742-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/input/keyboard/cros_ec_keyb.c:72: warning: cannot understand function prototype: 'struct cros_ec_bs_map '

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Benson Leung <bleung@chromium.org>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/input/keyboard/cros_ec_keyb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index 15d17c7170816..fce0c839e1430 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -58,10 +58,9 @@ struct cros_ec_keyb {
 	struct notifier_block notifier;
 };
 
-
 /**
- * cros_ec_bs_map - Struct mapping Linux keycodes to EC button/switch bitmap
- * #defines
+ * struct cros_ec_bs_map - Struct mapping Linux keycodes to EC button/switch
+ *			   bitmap #defines
  *
  * @ev_type: The type of the input event to generate (e.g., EV_KEY).
  * @code: A linux keycode
-- 
2.25.1

