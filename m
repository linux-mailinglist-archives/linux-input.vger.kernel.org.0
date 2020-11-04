Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB7B32A699A
	for <lists+linux-input@lfdr.de>; Wed,  4 Nov 2020 17:26:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731163AbgKDQ0d (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Nov 2020 11:26:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730853AbgKDQYp (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Nov 2020 11:24:45 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2556C061A4C
        for <linux-input@vger.kernel.org>; Wed,  4 Nov 2020 08:24:43 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id h22so2906251wmb.0
        for <linux-input@vger.kernel.org>; Wed, 04 Nov 2020 08:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EFFGDIM6YxbyjqNmdxEzSxYZvjxZnEKm0jHptMdsaWs=;
        b=qa0UA7LeVIfHKJbOBgEUrNGqnwsyUh3ZXyRI95cNiijvXFriiQeSjlAdRqKgdhgTuZ
         VKidCqYL5gYT4LhaZYEGl75vPOUP3ykUejSwnh7Q7qOhFtnh5pupGR06AgPqK5N75rU9
         BNa8rQl+KYQGjxl7EBdV0d8Ug9REGtfMe2UsZO0AVf0eU+39CurvcnluYbRgPC+PW+2A
         KoHhtLC+14wLmSmurMNK1I8H6xWDJwLnePRnH8PuVMG3UFYFXU1gr/qTzx1stZAQd2Mi
         Kti6TrrXz9j11RrG+B5NX57cICiAHrNjVl0TkF1/2u2MR/ttWpvnukOLR1KrqsDaO4vW
         eFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EFFGDIM6YxbyjqNmdxEzSxYZvjxZnEKm0jHptMdsaWs=;
        b=WBomPLf9xLxqepSAK0Lr567gCuoveXWXbBBIgk388dINnruKBNu5AnGAOL+P3K4rKw
         98/sPzZWjbWxc053yWcmkg13DsS7iwd96HqhIM4Wblb82EYtTuGZ6FO3bo/xIv3fSeOW
         ajOu8cnHhk1Kx/knltQd0kKuS0ZKqADwl9l1WRKpydMwV0G5dRO/ix1r4nVCzcfXMqCb
         0BhdqM7OnRqJSMCvs26vkGXBvuzzzZ9mDSIXXRJs6/zzgmwobOBwk1endJfA5L31Rv4k
         jCfKqGhUEuVnW+W1l+BKcpuZXoijRrvfQ+z2ZyKd23iBzrE85DhHEhICmim2sfrvguUd
         1Bng==
X-Gm-Message-State: AOAM530cr+aYGCnyJChXG4uSwkg/OnOoGyQmWU+zF3+m4L+oCOFtMKf2
        rdrRbG7mCoJtMMIm49nDirghCg==
X-Google-Smtp-Source: ABdhPJxhvdIjV+YfPIEcOUvtay4LNDugBEPgNMSeioIVBMDoFKZL6foblf8yKGtLSCX5g+4BdGYFyw==
X-Received: by 2002:a1c:84:: with SMTP id 126mr3535343wma.160.1604507082436;
        Wed, 04 Nov 2020 08:24:42 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id o129sm3008564wmb.25.2020.11.04.08.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 08:24:41 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Vincent Huang <vincent.huang@tw.synaptics.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andrew Duggan <aduggan@synaptics.com>,
        Christopher Heiny <cheiny@synaptics.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 01/20] input: rmi4: rmi_bus: Fix misnaming of '__rmi_register_function_handler's 'owner' param
Date:   Wed,  4 Nov 2020 16:24:08 +0000
Message-Id: <20201104162427.2984742-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201104162427.2984742-1-lee.jones@linaro.org>
References: <20201104162427.2984742-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/input/rmi4/rmi_bus.c:299: warning: Function parameter or member 'owner' not described in '__rmi_register_function_handler'
 drivers/input/rmi4/rmi_bus.c:299: warning: Excess function parameter 'module' description in '__rmi_register_function_handler'

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Vincent Huang <vincent.huang@tw.synaptics.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Andrew Duggan <aduggan@synaptics.com>
Cc: Christopher Heiny <cheiny@synaptics.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/input/rmi4/rmi_bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/rmi4/rmi_bus.c b/drivers/input/rmi4/rmi_bus.c
index 47d1b97ed6cf3..24f31a5c0e04a 100644
--- a/drivers/input/rmi4/rmi_bus.c
+++ b/drivers/input/rmi4/rmi_bus.c
@@ -286,7 +286,7 @@ void rmi_unregister_function(struct rmi_function *fn)
 /**
  * rmi_register_function_handler - register a handler for an RMI function
  * @handler: RMI handler that should be registered.
- * @module: pointer to module that implements the handler
+ * @owner: pointer to module that implements the handler
  * @mod_name: name of the module implementing the handler
  *
  * This function performs additional setup of RMI function handler and
-- 
2.25.1

