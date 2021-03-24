Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48231347F7C
	for <lists+linux-input@lfdr.de>; Wed, 24 Mar 2021 18:35:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237300AbhCXRem (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Mar 2021 13:34:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237249AbhCXReV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Mar 2021 13:34:21 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7E52C0613E1
        for <linux-input@vger.kernel.org>; Wed, 24 Mar 2021 10:34:19 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id hq27so34234846ejc.9
        for <linux-input@vger.kernel.org>; Wed, 24 Mar 2021 10:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0mHXiyIAT3Jh+7rnIdNGX8xbXKM1ZM1Cw7hVW7vTCR8=;
        b=Np7Gqczcop2BAEOd5KsbvKOQIFPBBvyW4fHzsHJIWw9CZVh9CHsbDZVXATtKxFQe4X
         FCZOLULtAcRCBn9wftuKxPYlPRKKw3AuTm9e+FyvheDqQp0XkO6yJ25C2UFNL/PDJ145
         2jx08WTp3s4SVB4VLDqFw+tSEshmMWlPQbe2T6IZCaiiYIxSKRuSaglF2LlJgyr0MCCE
         tED9Y59bYKPKBFa4fqdIDsNMAzpV9/JPPJnoLYkkWd4eF3tTznwA80sgSoRToN2GQEB7
         rScsTfTymhFL6z29hJ+RiLjIA89Flk0EfnncTjR01q2TBpEMYZYMWHZW2i18oSTqkq/c
         yOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0mHXiyIAT3Jh+7rnIdNGX8xbXKM1ZM1Cw7hVW7vTCR8=;
        b=DSw5F2kWz/yv+qnOutnBfFhfb7Bu+JL+Bnmb8r7k9NtBFCsRx3ERVgbLqymyP8wBMl
         nywnhw+ztpI7G0WjTaYEUkeLhI+6ccixU0Q+GEOotw32qWqG+Q6ZCeiNKzL+C+V6T4mf
         0m0MN4IArSN1auHHO/vKgj/ZxR8r9lUPkOv7fbNfcWYhBnQ1fkdWm5Gg2LKwyjbqCrM9
         HJn7v7xkeZ7sVqNpjBjSMna68litIAk1NPXiu3wGhFQUkNm1cTF+V5XqJ0i24OQIRxBR
         fyZDza5rvGddUGNYINvzffaRdOxIEO9pRvHQwgvctd5sx4tlZ3Rj7S6qx3YU7RvZ8J1d
         7VBw==
X-Gm-Message-State: AOAM532N9VSf0SgceS3f4RuqUzw6sd9jJ6zIZ/5K9DcHF8S+eTO+UeCl
        Ln1wRwn5RrBvQAjGMZlUZXgKBA==
X-Google-Smtp-Source: ABdhPJweP98nVFVaq6z1Lu6W/z3sWDeNKQ9W/fuGYpW716/w8Y+LTsbEFyB1kmzbGXH/ejLGt9anwQ==
X-Received: by 2002:a17:906:9bc5:: with SMTP id de5mr5019149ejc.284.1616607258539;
        Wed, 24 Mar 2021 10:34:18 -0700 (PDT)
Received: from dell.default ([91.110.221.180])
        by smtp.gmail.com with ESMTPSA id p19sm1466367edr.57.2021.03.24.10.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 10:34:18 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 10/25] HID: intel-ish-hid: Fix potential copy/paste error
Date:   Wed, 24 Mar 2021 17:33:49 +0000
Message-Id: <20210324173404.66340-11-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210324173404.66340-1-lee.jones@linaro.org>
References: <20210324173404.66340-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 In file included from drivers/hid/intel-ish-hid/ishtp-hid.c:11:
 drivers/hid/intel-ish-hid/ishtp-hid.c:263: warning: expecting prototype for ishtp_hid_probe(). Prototype was for ishtp_hid_remove() instead

Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/hid/intel-ish-hid/ishtp-hid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp-hid.c b/drivers/hid/intel-ish-hid/ishtp-hid.c
index 393bed0abee99..14c271d7d8a94 100644
--- a/drivers/hid/intel-ish-hid/ishtp-hid.c
+++ b/drivers/hid/intel-ish-hid/ishtp-hid.c
@@ -254,7 +254,7 @@ int ishtp_hid_probe(unsigned int cur_hid_dev,
 }
 
 /**
- * ishtp_hid_probe() - Remove registered hid device
+ * ishtp_hid_remove() - Remove registered hid device
  * @client_data:	client data pointer
  *
  * This function is used to destroy allocatd HID device.
-- 
2.27.0

