Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C77912A70D1
	for <lists+linux-input@lfdr.de>; Wed,  4 Nov 2020 23:51:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727711AbgKDWu7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Nov 2020 17:50:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726996AbgKDWu7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Nov 2020 17:50:59 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EDC2C0613CF;
        Wed,  4 Nov 2020 14:50:59 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id z3so3139778pfb.10;
        Wed, 04 Nov 2020 14:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=tAyng+NRbLqoDdZKXQQbVGYLYTF01tOtqb3wwjrvMCQ=;
        b=PIPN+ho8vhqah809l38Brm5NOhW6jT4TPYlijaD2wn1oX0SowkEBMesyb+nFs9+gqO
         o5vP8N9Vn/bLGgaFvlbmXDO1Lvo60yZMcrBqn0TFDarGdXjDvvGa42/p9JAubZ+YBg/M
         6+qEH1p1DwzLBfbRbWZtC4hmGUVl7oXhN3QrM8ClF0/6ETgnZt2DYwcid6FmQlDo6hyF
         Bmya5iX0/v6rwkSt0V0yaPgqfYV+VTyL0GiDzAuhNsSr6ytKIY2GYR2tkTJmItt4k4s+
         9N+VVlkMAyzlCd+XZk1scDQ+WfKHTZQxZGfAuiOZZOMEh2bSvmBgL5FK6KSb0QszWwuR
         3JCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=tAyng+NRbLqoDdZKXQQbVGYLYTF01tOtqb3wwjrvMCQ=;
        b=KEoS8MTOs4ZfVtOn0Y6K7b8jtbS9/4tY1K87/GWByBMzE02zYNCoIbNFtkCbrwIaUH
         aL/RIj17c8kHbL3WFscF2D/JNmS+Mmxplp4ys1RRqoTB5ivMiOraPWBK7Tni19k+Vqv5
         XJv/Q9NB75ZjcQfxpJ+4BiIHJBl8S+7HixtFL8NdFkkELbEIGMLFaZznGYUR8qElPURZ
         nU7K7rOMllP5S2HLr1WsIlEhwZoNpWsITV6G7J6+s6AARRigHwokkJ/a7xBbwShwkMa+
         hfhBafkO1zr8N52VBPHFODg39erfaL65w7LdF1lXIJlmBIb9tNDr8BYsuMA6W03g7LN2
         Di7w==
X-Gm-Message-State: AOAM531BPS2tVwZGYUA7bVt6mVbkXcqdUM/33iogzphB93Aq8kTXTCLU
        9DNx0h07aKuuZ/XVay1HJLI=
X-Google-Smtp-Source: ABdhPJzc+9IhoxfLu/Y+QA1RetmpQho3PcJGRPFSwp4ot8ibWoQA/Ac4OgEj55Hac5S/tLSAxWVDAQ==
X-Received: by 2002:a63:845:: with SMTP id 66mr210596pgi.318.1604530258334;
        Wed, 04 Nov 2020 14:50:58 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id j1sm3577373pfa.96.2020.11.04.14.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 14:50:57 -0800 (PST)
Date:   Wed, 4 Nov 2020 14:50:54 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, dusonlin@emc.com.tw,
        KT Liao <kt.liao@emc.com.tw>, linux-input@vger.kernel.org
Subject: Re: [PATCH 06/20] include: input: elan-i2c-ids: Mark 'elan_acpi_id'
 as __maybe_unused
Message-ID: <20201104225054.GC1003057@dtor-ws>
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

Hi Lee,

On Wed, Nov 04, 2020 at 04:24:13PM +0000, Lee Jones wrote:
> Some drivers which include 'elan-i2c-ids.h' make use of
> 'elan_acpi_id', but not all do.  Tell the compiler that this is
> expected behaviour.
> 
> Fixes the following W=1 kernel build warning(s):
> 
>  include/linux/input/elan-i2c-ids.h:26:36: warning: ‘elan_acpi_id’ defined but not used [-Wunused-const-variable=]
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: dusonlin@emc.com.tw
> Cc: KT Liao <kt.liao@emc.com.tw>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  include/linux/input/elan-i2c-ids.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/input/elan-i2c-ids.h b/include/linux/input/elan-i2c-ids.h
> index 520858d126808..b6976d99b6b75 100644
> --- a/include/linux/input/elan-i2c-ids.h
> +++ b/include/linux/input/elan-i2c-ids.h
> @@ -23,7 +23,7 @@
>  
>  #include <linux/mod_devicetable.h>
>  
> -static const struct acpi_device_id elan_acpi_id[] = {
> +static const struct acpi_device_id __maybe_unused elan_acpi_id[] = {
>  	{ "ELAN0000", 0 },
>  	{ "ELAN0100", 0 },
>  	{ "ELAN0600", 0 },

I think I'd prefer something like this instead:

diff --git a/drivers/input/mouse/elan_i2c_core.c
b/drivers/input/mouse/elan_i2c_core.c
index c599e21a8478..65d21a050cea 100644
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

Thanks.

-- 
Dmitry
