Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B39B347F7A
	for <lists+linux-input@lfdr.de>; Wed, 24 Mar 2021 18:35:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237306AbhCXRen (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Mar 2021 13:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237255AbhCXReW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Mar 2021 13:34:22 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB00CC0613E4
        for <linux-input@vger.kernel.org>; Wed, 24 Mar 2021 10:34:21 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id r12so34260845ejr.5
        for <linux-input@vger.kernel.org>; Wed, 24 Mar 2021 10:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jT5mq2PVJro8RJoZfCHvbV6Psl3qGToHSXPsuh3akL8=;
        b=X3UPgjPgFuM1gjv4AoGn5rlNFmUuKPcJ9/K+JgE/TaEr4FikUQ2AOLnZ0f1D3dFWkO
         Lfo2zRYe3JZZyNjqx+TxmWJhxYrB7dpXdbjutZVeW0tthmHNzl6mrksr46tcWWnmwATF
         ncSS5UBWHAghGditDfEQJ6H9oLYfXOT2VtT0ifw/FZXWT/0tkSpJwlxCHTf3WwPOnITf
         UBUWbkec7eDKnhpM6IJ9Ehyqqlrsulsp/guBbxhRttwBQnSkj4tZvs3uuBm1A+ynrxbt
         tjrSIPruC3JH2YQavrW3dx3OQEb38lQyAm4AxdTjqKOT6SLFM1UwkQujLn3IcDphMxRX
         ePFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jT5mq2PVJro8RJoZfCHvbV6Psl3qGToHSXPsuh3akL8=;
        b=lzzj7vzHcdJBOXx1Yrpe22ZV/vPebXgGX8CwINo+Q3HnivKsSet/ZUz4w3+lQm7Lqk
         XNQeCahjEemdRWkWQXs7CLYJTuU3Av2ij+oxnaHhCdtRHmdVqUeBblY9PQT9emRd8R7B
         NR6wD1J5dB2kbKa6QKmxXTKw18w2TRZ4z5W8hKYo2wanLqRaIgX4j7vs8epD76zEaBne
         cL+LmfIr/mB10QdVJLQkrMvg3InAIkc6T2wMiSO895wZ3HXBDW/7bGLoCYUk0d4KU995
         183bwLTztIjsWS4nM7bW3E8lVCBnzvEZjLNz9JssaxTgzxKIYUINxSSETFZ0vyBG8Yiw
         3EQw==
X-Gm-Message-State: AOAM530PVjkcEHYi7/IVT5uzU+mAyS0BUF7yCAEJN3wcQzoV8ew9K6q5
        m/lcc0J5p1M9tYSvFLf18NBRZw==
X-Google-Smtp-Source: ABdhPJz3o4iYoCxJd4MRAsh+biBbB2paZewNpbtr9zi3t+MfqwEdxrwnaGcNQTMLUTDZAXMe6t9Zew==
X-Received: by 2002:a17:906:1182:: with SMTP id n2mr5052937eja.234.1616607260457;
        Wed, 24 Mar 2021 10:34:20 -0700 (PDT)
Received: from dell.default ([91.110.221.180])
        by smtp.gmail.com with ESMTPSA id p19sm1466367edr.57.2021.03.24.10.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 10:34:19 -0700 (PDT)
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
Date:   Wed, 24 Mar 2021 17:33:51 +0000
Message-Id: <20210324173404.66340-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210324173404.66340-1-lee.jones@linaro.org>
References: <20210324173404.66340-1-lee.jones@linaro.org>
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

