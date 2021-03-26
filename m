Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB20234A9D3
	for <lists+linux-input@lfdr.de>; Fri, 26 Mar 2021 15:35:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbhCZOfP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Mar 2021 10:35:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbhCZOfH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Mar 2021 10:35:07 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0766C0613BB
        for <linux-input@vger.kernel.org>; Fri, 26 Mar 2021 07:35:04 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id e18so5870183wrt.6
        for <linux-input@vger.kernel.org>; Fri, 26 Mar 2021 07:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DBKiLgurMgloDH4dmthaQmSJlqRwCd+7wWZCtSqyx24=;
        b=bvITmmoWQkz/BAmA8clyA6v/M3+4LVQGjzfWYcjfQB8daWbjdZi/gq9mTkUXL2fw/W
         dW3SpncUQ97s56AZ3GH3+VJFN7bcHm/EADf3xINuOVau4zU3K8WwwIAD+g28RNoYrGN2
         AwYI4kqLEsWZ7rRn1m+Yd+TmBHbO4T0OOG2gWLu5SF/aLQwXLieq49mggUigXX7XRh9Y
         yBXuRgHE3KZnHY8QKTUQPz0FeWMzisZRBtF+nks1p3OoPj7yIgZ3kQIqNOIRyuGKAIWK
         p6qN1u9PEaJ9ZUoPhRKrzT3FFazBauvOgSMjB8fdSYkfyBoq3L6fdNBy+xo8zBMhRdB3
         +oqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DBKiLgurMgloDH4dmthaQmSJlqRwCd+7wWZCtSqyx24=;
        b=bdpBPbkMoiGoftdp7AaZl4GCATrkZZ5sGA/YLERE15LOu1sWpeuISRuiihTiTwhcfX
         iwsuXozihJMfXr16JL3EqZnI8AcVHKxcb8p4ngme0x+EhWk8howrNTQj0BgY0eG4u/ym
         Qe1S4f0YrOHDkhENEJ6otB4l9wgkKR1CEO346Y+p/P8kg2RbFRD9Zn9yFQ8Z9ikvb5Nh
         9QzIRUuR/V1t1zM+tX/DEE/Pl1U0o736C9QafEFtaOJzcETKy1a1h4J+lm2z1HIObTyf
         8CMddvlqXs+ADTQWR4bthbxevFX8UOnXsUPf/m0mm+7s79EmDnU91L68e5NiegRVYlTl
         +Rzw==
X-Gm-Message-State: AOAM531QsETKCtICAeUYgQZAWLozSgc5ZBVneNFibcC9uue5A6wXPidR
        dfUQbm51nFILgWeT2dAV2MLZHg==
X-Google-Smtp-Source: ABdhPJxwACsNiurDP1jau2TYaMay4rZXKsXCowrA5fXjZmBqZzO64ouadUb6/eu9bYXbgxk/H6PaiA==
X-Received: by 2002:adf:f4ce:: with SMTP id h14mr14682728wrp.257.1616769303585;
        Fri, 26 Mar 2021 07:35:03 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
        by smtp.gmail.com with ESMTPSA id j26sm12878225wrh.57.2021.03.26.07.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:35:03 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 01/25] HID: intel-ish-hid: Remove unused variable 'err'
Date:   Fri, 26 Mar 2021 14:34:34 +0000
Message-Id: <20210326143458.508959-3-lee.jones@linaro.org>
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

 drivers/hid/intel-ish-hid/ishtp/client.c: In function ‘ishtp_cl_disconnect’:
 drivers/hid/intel-ish-hid/ishtp/client.c:266:6: warning: variable ‘err’ set but not used [-Wunused-but-set-variable]

Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ishtp/client.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp/client.c b/drivers/hid/intel-ish-hid/ishtp/client.c
index 1cc157126fce7..c81a1f8a92685 100644
--- a/drivers/hid/intel-ish-hid/ishtp/client.c
+++ b/drivers/hid/intel-ish-hid/ishtp/client.c
@@ -263,7 +263,6 @@ EXPORT_SYMBOL(ishtp_cl_unlink);
 int ishtp_cl_disconnect(struct ishtp_cl *cl)
 {
 	struct ishtp_device *dev;
-	int err;
 
 	if (WARN_ON(!cl || !cl->dev))
 		return -ENODEV;
@@ -283,7 +282,7 @@ int ishtp_cl_disconnect(struct ishtp_cl *cl)
 		return -ENODEV;
 	}
 
-	err = wait_event_interruptible_timeout(cl->wait_ctrl_res,
+	wait_event_interruptible_timeout(cl->wait_ctrl_res,
 			(dev->dev_state != ISHTP_DEV_ENABLED ||
 			cl->state == ISHTP_CL_DISCONNECTED),
 			ishtp_secs_to_jiffies(ISHTP_CL_CONNECT_TIMEOUT));
-- 
2.27.0

