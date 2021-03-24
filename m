Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFD8B347F7B
	for <lists+linux-input@lfdr.de>; Wed, 24 Mar 2021 18:35:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237206AbhCXRem (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Mar 2021 13:34:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237254AbhCXReV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Mar 2021 13:34:21 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92B09C061763
        for <linux-input@vger.kernel.org>; Wed, 24 Mar 2021 10:34:10 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id e14so16030841ejz.11
        for <linux-input@vger.kernel.org>; Wed, 24 Mar 2021 10:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sGXBjiCFdgwpvHzqPWC3/RPSg9lntmzEIWbK3MkoU6U=;
        b=V3k9oO55MjjZsX1qHzmUi4k1DuLQl/bW1r8/NSBz9AV1Y59ZREKF/pGfgheG7lx+v4
         ggpEUOSwS5OX9re9xERe7vz6yaR6zNOGOGIoxTjMzzSMe/9TDCqIJPIa+tq6f9xiDTP/
         MhFgQYSPl1ZFZzi7W2P7tpdnGXsyp1a5aUMRXu5o5SW3KHNDfQjSfYbHUoASovtIH/XS
         /8f4lsEyvKnASydlj2+jRntf/Onsc1qrDdsOJj4rJSrdV1F6Y+KsUZzns6e65XeuupoR
         HhVN5Rlwcx6YvF38ClCmMpvgRZdQV0NFa0wfXCKK79EkRefOifnO6VMA00c1onOviab4
         uNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sGXBjiCFdgwpvHzqPWC3/RPSg9lntmzEIWbK3MkoU6U=;
        b=DBQnjOpXpINSCr+UpzQsFfWfKKvJCH0zoRakkJH36s0ezky9PVRwYv1N9nOa6u7Loj
         Y4DGgO8ZaQrJATWxMuDEX7rsel1ZAHtRxUD6XiipssXmUI66fpOd54ljNXO4xKUQWwPu
         G6go4akQpyotG1Tw//N2djHou3wHJ2W7HLPZuj2LNqKascwrrwYWYw6PSlROEcFvT8yB
         +yoXfwDeaxfh37BZS5I3UrKyAikj2lm0UX/7C9hkbzF3Fx4oQeqXXJtu9gPfrbw0k7/W
         1PMaXqZSvkkZ/PuCHoP/cZFMzu+CyxuQER/cwwEx7QcnSmKXnBJlSuNpIhfwL81+ON3N
         9igA==
X-Gm-Message-State: AOAM532ZEuj910P40y5PlOdsw8Z2iHokNqFKA7hPOJkafhp6v+m3kpTe
        fg5QHoos/AAbZAfY46qizI6ZgmUZXXXQbQ==
X-Google-Smtp-Source: ABdhPJwCM4qapUK3Em/x+G38ky1Ltx5JRSDQ/uZ3IWpyDINUgpkRcfHgaHTT/NjdsDcbmFXyrEOHsw==
X-Received: by 2002:a17:906:f9db:: with SMTP id lj27mr4964835ejb.399.1616607249278;
        Wed, 24 Mar 2021 10:34:09 -0700 (PDT)
Received: from dell.default ([91.110.221.180])
        by smtp.gmail.com with ESMTPSA id p19sm1466367edr.57.2021.03.24.10.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 10:34:08 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 01/25] HID: intel-ish-hid: Remove unused variable 'err'
Date:   Wed, 24 Mar 2021 17:33:40 +0000
Message-Id: <20210324173404.66340-2-lee.jones@linaro.org>
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

 drivers/hid/intel-ish-hid/ishtp/client.c: In function ‘ishtp_cl_disconnect’:
 drivers/hid/intel-ish-hid/ishtp/client.c:266:6: warning: variable ‘err’ set but not used [-Wunused-but-set-variable]

Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
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

