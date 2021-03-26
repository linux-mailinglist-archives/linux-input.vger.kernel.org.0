Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CBE434A9F5
	for <lists+linux-input@lfdr.de>; Fri, 26 Mar 2021 15:37:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbhCZOfv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Mar 2021 10:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230250AbhCZOfQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Mar 2021 10:35:16 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74894C0613AA
        for <linux-input@vger.kernel.org>; Fri, 26 Mar 2021 07:35:15 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id v4so5828828wrp.13
        for <linux-input@vger.kernel.org>; Fri, 26 Mar 2021 07:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ncO0eu8eiprdEfj3NwDMj19+723Jp3QnJo+qgAuvBoM=;
        b=D3M2AflPHYIVQMrCYBkEBM7J18KaEGT7snF1NuKp19oo6CWsWqMxQru/X11H8JFLJf
         iKXohymfei2sqRC9xr8JGOW/+ZJnKaZSTQ7Xjz5eArm2BCn6ViNEFpZJqK07fmo2bAgU
         YKZFlVVbl3rCUQ3gyzOBfY08LbvTmfcmiSxKk1SI88TrivNerJt+P3OHDJ2Q0VLDZv1w
         pOIn07GzR4TtY/7hZz7Qo9yFe3twde1MGRfah/U+Y+E5QVALf9ToIZNlUTYJb1MKdSM5
         nKB8rcFDa4LhBrAo53pl7QB1sKnaKJkaQWjTySXoc3sloRYTlNefcQ2ITRKPldgKAFgX
         ZqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ncO0eu8eiprdEfj3NwDMj19+723Jp3QnJo+qgAuvBoM=;
        b=IwTxkSkTrj+nj4EnkcwWuG8KYVic89t7ig/oGPhb1r5TL7XEDIIQxLVWGqtOQPGLel
         AXFhS4ZsNCo+Ar/tKnOecK3oFso82E8BHsg21IvU4fKEaaB9t9gBt5ON1EnYVtZP1BX7
         qZRTnMYcksem2MdizpVR50bKsJc4k3dXq/hLSBaaLca5Z/Wn/JdQdfi2JQIBbMnT036z
         eF2dO6a9Y2WCiImWite4cl5ndEM3cJ8mAf1R24gM230prBIbNKzNsIL8CsCf+NDpXyF0
         yTJeM2fNmCqGzD9sA/OIDgAagvw/aeeV+9F8QuELuXi3/4PJi+jH+AKqdxdWzt5cX806
         nrdA==
X-Gm-Message-State: AOAM530BZbU78Y+s5p7LmNX7B0tPMhY9spzqRp51CRlnFO+1SFQ7x5ZQ
        6QCUCqMhwrO48kQqI+SBuFC5ag==
X-Google-Smtp-Source: ABdhPJxyz85Q/+mRvHz1FDY3Yxoego7N1UdFt2rgIPb7W9U3d8zDHFD6Hu4HykqzJPVkIWwH5f+XhQ==
X-Received: by 2002:adf:ea0e:: with SMTP id q14mr15168379wrm.389.1616769314240;
        Fri, 26 Mar 2021 07:35:14 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
        by smtp.gmail.com with ESMTPSA id j26sm12878225wrh.57.2021.03.26.07.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:35:13 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Zhang Lixu <lixu.zhang@intel.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 12/25] HID: intel-ish-hid: ipc: Correct fw_reset_work_fn() function name in header
Date:   Fri, 26 Mar 2021 14:34:45 +0000
Message-Id: <20210326143458.508959-14-lee.jones@linaro.org>
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

 drivers/hid/intel-ish-hid/ipc/ipc.c:553: warning: expecting prototype for ish_fw_reset_work_fn(). Prototype was for fw_reset_work_fn() instead

Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Zhang Lixu <lixu.zhang@intel.com>
Cc: "Krzysztof Wilczyński" <kw@linux.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ipc/ipc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/intel-ish-hid/ipc/ipc.c b/drivers/hid/intel-ish-hid/ipc/ipc.c
index 47bbeb8b492b0..9037816e2bf74 100644
--- a/drivers/hid/intel-ish-hid/ipc/ipc.c
+++ b/drivers/hid/intel-ish-hid/ipc/ipc.c
@@ -544,7 +544,7 @@ static int ish_fw_reset_handler(struct ishtp_device *dev)
 #define TIMEOUT_FOR_HW_RDY_MS			300
 
 /**
- * ish_fw_reset_work_fn() - FW reset worker function
+ * fw_reset_work_fn() - FW reset worker function
  * @unused: not used
  *
  * Call ish_fw_reset_handler to complete FW reset
-- 
2.27.0

