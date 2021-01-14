Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A21072F6479
	for <lists+linux-input@lfdr.de>; Thu, 14 Jan 2021 16:26:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727450AbhANPZE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Jan 2021 10:25:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729404AbhANPYz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Jan 2021 10:24:55 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8ADAC061796
        for <linux-input@vger.kernel.org>; Thu, 14 Jan 2021 07:23:43 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id k10so4867120wmi.3
        for <linux-input@vger.kernel.org>; Thu, 14 Jan 2021 07:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j/+bCy6NrhocYkhQjIFLsXRroyVux/dbH+svWNWdQyQ=;
        b=ERomriJ5NywBp23UX4u658HW/Nqh6AIqaycBNvleJNsA1Ud7a5YalC0I1tzz0fC5Od
         fwYjHvaaSrXnwaf11CdOVPvy3SjksfFQJ3jVKe2/I6WG1sAvkUbYXhP/GTCw+Jh2mFiT
         wZRDhrP8rYmcOyhpozbE7EvpOLJvZUyTmmJAMSD801UGfV2EEawB7QH703cVvVhRuhOC
         4UsILN0LirRxIgkt/4BUIfyeCvSt697EHySQjjr42tE+XPF/K05dCHFSxLWKONRWvPj3
         PfnUsZOpohgo9ShFwvhpOkB1abEhWH/tcVzRfNQ/XIvuZrXh6sfMD9a8isblKDYKo0jl
         BvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j/+bCy6NrhocYkhQjIFLsXRroyVux/dbH+svWNWdQyQ=;
        b=AutgcMZrK0RFYSaqGFhXFMX08IbA+M2NXgNuV+cBjHuAtp1Taw5SRBZ7FL0Yq0N2yu
         QXJHXnd2onqG8np/CEOFyKyp2qtg0PyY2aNr8WL70fss2pfY3H/QdVzkBcxlPvCM2/Bo
         HVaUJXHxYpVHQvX4bS91v1PRQP8JVodIfMCPax7HOZcWkiSjwT05vveEkmu/0hx0vsS/
         O1zfuf2TM/JOXwir/q8PMwUVeu/MR2D3c7Sdpl2Q2iJtyfsjsDFcqHR/ijXvFK9d5VVz
         pJ3EIKfRb260ZhjeHxdVH+oVqX3pM0o1E8PSTjfRuCe4MXlfBXhfQRl/PSvtlo74Bc5j
         KT5Q==
X-Gm-Message-State: AOAM533M5a4WBTlgx7ISVBJwiowqsIwl0EwZqVKHpivXhy+sN6fObT0c
        D5XtjyqgmDo5QMsE3yLP9koQjw==
X-Google-Smtp-Source: ABdhPJyB5UCo1HKIbdX59cHs1y1+H/YppQr8pHhUpqQnshgUA1zoSs1SW9jgNoHwXrjI1Ae5j6gnhw==
X-Received: by 2002:a1c:acc9:: with SMTP id v192mr4340744wme.174.1610637822501;
        Thu, 14 Jan 2021 07:23:42 -0800 (PST)
Received: from dell.default ([91.110.221.178])
        by smtp.gmail.com with ESMTPSA id e15sm10777713wrx.86.2021.01.14.07.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 07:23:41 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        Luotao Fu <l.fu@pengutronix.de>, linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/5] input: touchscreen: stmpe-ts: Add description for 'prop' struct member
Date:   Thu, 14 Jan 2021 15:23:23 +0000
Message-Id: <20210114152323.2382283-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114152323.2382283-1-lee.jones@linaro.org>
References: <20210114152323.2382283-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/input/touchscreen/stmpe-ts.c:82: warning: Function parameter or member 'prop' not described in 'stmpe_touch'

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Stefan Riedmueller <s.riedmueller@phytec.de>
Cc: Luotao Fu <l.fu@pengutronix.de>
Cc: linux-input@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/input/touchscreen/stmpe-ts.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/touchscreen/stmpe-ts.c b/drivers/input/touchscreen/stmpe-ts.c
index cd747725589b1..25c45c3a35615 100644
--- a/drivers/input/touchscreen/stmpe-ts.c
+++ b/drivers/input/touchscreen/stmpe-ts.c
@@ -52,6 +52,7 @@
  * @idev: registered input device
  * @work: a work item used to scan the device
  * @dev: a pointer back to the MFD cell struct device*
+ * @prop: Touchscreen properties
  * @ave_ctrl: Sample average control
  * (0 -> 1 sample, 1 -> 2 samples, 2 -> 4 samples, 3 -> 8 samples)
  * @touch_det_delay: Touch detect interrupt delay
-- 
2.25.1

