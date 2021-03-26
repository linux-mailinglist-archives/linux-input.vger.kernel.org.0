Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 769B534A9F8
	for <lists+linux-input@lfdr.de>; Fri, 26 Mar 2021 15:37:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230454AbhCZOfx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Mar 2021 10:35:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbhCZOfP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Mar 2021 10:35:15 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5ECAC0613BA
        for <linux-input@vger.kernel.org>; Fri, 26 Mar 2021 07:35:13 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id k128so3095433wmk.4
        for <linux-input@vger.kernel.org>; Fri, 26 Mar 2021 07:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gK4GBHDnYjUKGItp7Cpn1OqRPa6zrE034rZiLZ47Q+0=;
        b=FQgVhM/HPmIVSaTR75VGvplCpT7A/KPgSILda5lhc4gG8cVL8wV363q2YP+MKT6ofS
         qtp1/el3hpW/j7iCBAJnS61kbgUgdf/9XFnERQE32l8LoSMOY8ri5jNb36Tot+BIOwNQ
         xlCPwO2nXo6Bi2SF43RlOTlky0nw+kpPePRZYzYf4SaMuO+8wCOIM7DUUTUGCTi4qmAn
         LIpeeZtt6Bv3HMyZIWAsnwhGUHc7Azqyr0+o3nWqO1YNp4t61K4IgTQCWCOHrlHaYzC+
         22caIlgT+ccj+M1xjj3O2lfz+JDBIMpb6YzfdPO4TTHt2TTtEM7c97cPEigXlYbQsCoJ
         Kg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gK4GBHDnYjUKGItp7Cpn1OqRPa6zrE034rZiLZ47Q+0=;
        b=Klb5d1Z9XPVexp4L77OatrAvdQZ/SL+65oJPFzISKERELtaEji7F5psHJyCZ4AXwhf
         piIc0KqDPs9F4v0JUx6dwW3pNiqegd+q9RF2nUWNv2363FzNsZNus8SEWcIhMkElZP+8
         F4mEoe8M1WoAUk5OtyBtvBH+7lVCUOFNzkQyhXmh1J2k8MsEPYKTdbFHTu1qQCtlBEaB
         Imn6EiafEMRHIzL6BVlqKkJ1PhyvJ1J6srga0SYm5Ey4eHZIFWo0BtbJas8VJew7gQgw
         MgSXU2XKdSWiu6jlGfUvXLyBE4wEhMEr8UoUTB7xPktwbG6xyggBvq6GKo3hmpsj8AJW
         zbPw==
X-Gm-Message-State: AOAM533YZqUnP5/NeX36todr6+iqM8SCwwaY7RVuhR3jnpmUTo7OdUKH
        Oyy5WwWpB94Eci3O/ezuzJr1EmycOu+bTw==
X-Google-Smtp-Source: ABdhPJw+y6RAQUFh0yOSkeayDQx3lR4W+C9cJD48v/0NkLQc6flNcqartCxarA+D9tpVMmL5IMFB7w==
X-Received: by 2002:a05:600c:1553:: with SMTP id f19mr13397053wmg.33.1616769312057;
        Fri, 26 Mar 2021 07:35:12 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
        by smtp.gmail.com with ESMTPSA id j26sm12878225wrh.57.2021.03.26.07.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:35:11 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 10/25] HID: intel-ish-hid: Fix potential copy/paste error
Date:   Fri, 26 Mar 2021 14:34:43 +0000
Message-Id: <20210326143458.508959-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210326143458.508959-1-lee.jones@linaro.org>
References: <20210326143458.508959-1-lee.jones@linaro.org>
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
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
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

