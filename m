Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16F3A2B02FE
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 11:44:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727940AbgKLKo0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 05:44:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbgKLKoZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Nov 2020 05:44:25 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEAA6C0613D1
        for <linux-input@vger.kernel.org>; Thu, 12 Nov 2020 02:44:23 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id 19so4845523wmf.1
        for <linux-input@vger.kernel.org>; Thu, 12 Nov 2020 02:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ygXEyC17mmqkLuT+LSwnv8yANRbLqR9DFVnrEPXtZ4M=;
        b=I6ogObdQP+1zd9NhSXGSnPGJAG4gcJxrpgTyuCCN5IYGW5plCifjhj9ca2dMhtwJBj
         +jAJIokPCuZDcPcoK16EIoxoHBrIJcm5KCT1lZwZfpyso0Cr0bQqsB/PbW+chwaIIN7Q
         RIwBigEbiHi8+MKGZwG4/OfPhr5JXtoTtf4CE+AYu4I9Ae7J9/Y8FnL481pzNwSw4pWj
         iQCws3HhM81hlBYKDbsuiZZ5xEDoXR1TUo2SghQx9hNtGb6eDUaMjD5cbffC888x6Le+
         f7CEDPIPfSVSLFTAXpgXbi2/jAYDOlXH3AthoEzNKrCI/VO4t4DkhcO6vjbsCkRK0+SO
         /Drw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ygXEyC17mmqkLuT+LSwnv8yANRbLqR9DFVnrEPXtZ4M=;
        b=Q+q01OCaEVX1iXiedkPXOlLDDL2WG52YOa2UnK7ZqBp5H3zUhOb1M597Qc6cR99Pam
         s9HQ6v2O0G+aRMQlP544vWWhaHYsChI4dr1EHyQ6x5zxuwfoV/XxNeiV3E5wWxE5iROL
         Lh9TAGj7ZOmlcNQyMgWYCPpzCyggauuSWxTmyxkfabbO06VqBDZ4Y2yzF8jtW9cOxF3z
         lh9FTnbWF8dzA03pMWJM7h5NHlMmzOseXE6vy22DvC4eWI3Z7/l768efDpQhGLgvdN9Z
         uzUXP6T4x1QBdEowKlosZCjKfXRGXysoNQVZJupX8dU408rqN/o8PVpyiFJCqIEDT6Zq
         s5JA==
X-Gm-Message-State: AOAM533Nhp4gQa9DeZzmjTpBEWg11ooMh2c9M/c2ZMyd5b0CIEMr66Px
        83w5wB6YhrAkAMWDj9w7MpmdUQ==
X-Google-Smtp-Source: ABdhPJxxSp68T0y9TRXVHc8JIto9ZdMg6AEEVOoiRgdoeOZ7uP+qT6GcEu2n8vbhXI9PC5geDUUPmA==
X-Received: by 2002:a1c:7d12:: with SMTP id y18mr8856951wmc.103.1605177862562;
        Thu, 12 Nov 2020 02:44:22 -0800 (PST)
Received: from dell ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id h62sm6060487wrh.82.2020.11.12.02.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 02:44:21 -0800 (PST)
Date:   Thu, 12 Nov 2020 10:44:20 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        dusonlin@emc.com.tw, KT Liao <kt.liao@emc.com.tw>,
        linux-input@vger.kernel.org
Subject: [PATCH] input: mouse: elan_i2c_core: Move header inclusion inside
Message-ID: <20201112104420.GG1997862@dell>
References: <20201104162427.2984742-1-lee.jones@linaro.org>
 <20201104162427.2984742-7-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201104162427.2984742-7-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The same clause as its use.

Fixes the following W=1 kernel build warning(s):

 include/linux/input/elan-i2c-ids.h:26:36: warning: ‘elan_acpi_id’ defined but not used [-Wunused-const-variable=]

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>
Cc: Jingle Wu <jingle.wu@emc.com.tw>
Cc: dusonlin@emc.com.tw
Cc: KT Liao <kt.liao@emc.com.tw>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/input/mouse/elan_i2c_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index c599e21a84784..65d21a050cea0 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -34,7 +34,6 @@
 #include <linux/completion.h>
 #include <linux/of.h>
 #include <linux/property.h>
-#include <linux/input/elan-i2c-ids.h>
 #include <linux/regulator/consumer.h>
 #include <asm/unaligned.h>
 
@@ -1413,6 +1412,7 @@ static const struct i2c_device_id elan_id[] = {
 MODULE_DEVICE_TABLE(i2c, elan_id);
 
 #ifdef CONFIG_ACPI
+#include <linux/input/elan-i2c-ids.h>
 MODULE_DEVICE_TABLE(acpi, elan_acpi_id);
 #endif
 
-- 
2.25.1
