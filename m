Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 635522A6977
	for <lists+linux-input@lfdr.de>; Wed,  4 Nov 2020 17:25:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730999AbgKDQZF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Nov 2020 11:25:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730947AbgKDQY7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Nov 2020 11:24:59 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA6C2C061A4D
        for <linux-input@vger.kernel.org>; Wed,  4 Nov 2020 08:24:56 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id h22so2906994wmb.0
        for <linux-input@vger.kernel.org>; Wed, 04 Nov 2020 08:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4Wus8zLlMTZdwx+8H6IUw2g9q/prHivgi0ht3FgmUO4=;
        b=eySFgeGHZ6y6orDLmCBdDXmmCFlZs55lHR+lsoCgHO5GOXgEu4xC5h28XqTJvuflrD
         C6NqtqXsTiDhMy8DJClV9SD55fRrZM+bGRf9scc7aB+4M6IqRcD9z5IA66xTZAajcOE7
         24Pv2MmJpAPBRLyJzTRmFPbNynSys3FuzIo8lEW1Nit10Xw8C+HjMEugcizw1kYrGtRL
         4PmUKI/m3vd4A9EJPuQuRL9O5I3nkdMk1NVRrL9ive49EarztXf4lBd3exmTEv3ceYpx
         bGGlflI4nLRxohw+l/6Hm4vNftnI2QqycMLJBO74l9cCFQi4RSywFfgpVSOD75MOX80J
         o5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4Wus8zLlMTZdwx+8H6IUw2g9q/prHivgi0ht3FgmUO4=;
        b=VlQ6vIjl6v0cHDybHE9I/v7bWpGuCmnVOKhpZBw/Cvu/ZeEeoPUVSO5g74pGaUD+ou
         gRG5iqdid15TOU4tyNAbUpHXTbdcSiI4wgKX2sIbwOjsLT29qqoCInWuBzYDOvFA6MSu
         X9SghXEegwLHXNydZBzatsDcjAtfjnZR0pxM7JqjKejoo3Ei8RrkXv/B1MsTYGMaxDE1
         zKbiJgNI/LIB4Ov9vhwrpohiBL3nzcp8iAMsJPK2IvhyUhxx9AHTjiDhMuHeEk9E9Idc
         xLpUzFTr4Vtc3XSKHO9cB4mOLsIT5X/iPVfTouICAz4X0AtbeibvgQ5cU0sZW1kHP23C
         7vvA==
X-Gm-Message-State: AOAM5328015bQB7hzeTpdpsOpnf6v7SRP0JT/DPkyT11pDWJQB90TWWr
        k1X444VBAggmfepZ7gmnN8+WEQ==
X-Google-Smtp-Source: ABdhPJzh49GwcsjyMJuXN6DtlEk8btIl7d2MbHgGlXgbi94tJRPrtmwu9voNb68zeSPDwq26W85MPA==
X-Received: by 2002:a1c:9a83:: with SMTP id c125mr5338586wme.116.1604507095671;
        Wed, 04 Nov 2020 08:24:55 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id o129sm3008564wmb.25.2020.11.04.08.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 08:24:54 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        David Jander <david@protonic.nl>,
        Phil Blundell <pb@handhelds.org>, linux-input@vger.kernel.org
Subject: [PATCH 11/20] input: keyboard: gpio_keys: Fix misnamed function parameter 'dev'
Date:   Wed,  4 Nov 2020 16:24:18 +0000
Message-Id: <20201104162427.2984742-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201104162427.2984742-1-lee.jones@linaro.org>
References: <20201104162427.2984742-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/input/keyboard/gpio_keys.c:119: warning: Function parameter or member 'dev' not described in 'get_bm_events_by_type'
 drivers/input/keyboard/gpio_keys.c:119: warning: Excess function parameter 'input' description in 'get_bm_events_by_type'

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: David Jander <david@protonic.nl>
Cc: Phil Blundell <pb@handhelds.org>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/input/keyboard/gpio_keys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index f2d4e4daa818f..a079504e98e82 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -108,7 +108,7 @@ static int get_n_events_by_type(int type)
 
 /**
  * get_bm_events_by_type() - returns bitmap of supported events per @type
- * @input: input device from which bitmap is retrieved
+ * @dev: input device from which bitmap is retrieved
  * @type: type of button (%EV_KEY, %EV_SW)
  *
  * Return value of this function can be used to allocate bitmap
-- 
2.25.1

