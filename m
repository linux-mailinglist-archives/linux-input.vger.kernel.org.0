Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B33752A7A2B
	for <lists+linux-input@lfdr.de>; Thu,  5 Nov 2020 10:13:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730542AbgKEJNR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Nov 2020 04:13:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730061AbgKEJNK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Nov 2020 04:13:10 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E05AC0613CF
        for <linux-input@vger.kernel.org>; Thu,  5 Nov 2020 01:13:09 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id h22so821433wmb.0
        for <linux-input@vger.kernel.org>; Thu, 05 Nov 2020 01:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ppYF0PlErbRwfu8mEHF7wqc9jdX4m5kx1kPLbT7peag=;
        b=IttUDjlTiYiGPb0c5L/usFI9KKlI5FGGTYkpqXQRVcDYOmEHfwHcdcpHZHXlj/CUmd
         mI1zRNsW15M6Ga+fV2uIBZAabTC4bS8o6ifnFzbK2r2JDvSaBnpFXH8eTgWUkhgeg9yC
         CUGAiYM+cZUrTy879BMVrpxQMa/sVLAqVLmaKjN9lOnK6v/AuTkDT027AqrfF8otY8y2
         1jgLd9zYccP0nT43isgCkcIcVjYrKBgayW+iCMX87a41BtPzuyl+E1VUrWjFFQsW9hs+
         k8q6/6lDlD1VSNaHrrcyw/k7zXv4Eusjh4gHumas/7Hcz7zH5sJGIwo8fIWnYlewFlkI
         pP4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ppYF0PlErbRwfu8mEHF7wqc9jdX4m5kx1kPLbT7peag=;
        b=GvtyFXpj56sqUVWeZCmFaqFx98oy7yCJpuM71/4IMJ+cv5Ypo2+lk/UE8AsV2gvCgS
         66Hxc382Ti8do3COqc6af5HAa29w6cR1S0HYw7SyAntb9qAKy1okw0I/m/Q8ZPFAzMEc
         rrmxAXrU0cC3kSMXlJmp+mxmguN60O1McC8mFVcrn4UpthKdhSWqkiDCVfDnG7ytO1eg
         KD17OsXR4RrOZs+e4e2kda4m8wOjPPBriiYAek+Fha5/9rnCbSoDfszHwoZM29YRYDc4
         rN3HUrQZoNGLHoRd+pw1gZg/JvikunZqebwaasV3wmwFVskt1aMrvWci1Xfa53YiftYE
         Flcg==
X-Gm-Message-State: AOAM530Q5P4T2m1+f9NYXjIqMwLdLXRkuQsXP+sQttfSxj9FvpAk1aov
        43d6s4XjjLcgmAh9PkM7xOQyGg==
X-Google-Smtp-Source: ABdhPJzwvxvC55mfhNxs1rZhTHZFiQyUhDp2eRPI3OFsmvNmIkibkr1lXvdEhVgU6KPpcLyTBYaaeA==
X-Received: by 2002:a1c:9a0e:: with SMTP id c14mr1603242wme.35.1604567587575;
        Thu, 05 Nov 2020 01:13:07 -0800 (PST)
Received: from dell ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id y10sm1453811wru.94.2020.11.05.01.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 01:13:06 -0800 (PST)
Date:   Thu, 5 Nov 2020 09:13:05 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-kernel@vger.kernel.org, dusonlin@emc.com.tw,
        KT Liao <kt.liao@emc.com.tw>, linux-input@vger.kernel.org
Subject: Re: [PATCH 06/20] include: input: elan-i2c-ids: Mark 'elan_acpi_id'
 as __maybe_unused
Message-ID: <20201105091305.GH4488@dell>
References: <20201104162427.2984742-1-lee.jones@linaro.org>
 <20201104162427.2984742-7-lee.jones@linaro.org>
 <20201104225054.GC1003057@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201104225054.GC1003057@dtor-ws>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 04 Nov 2020, Dmitry Torokhov wrote:

> Hi Lee,
> 
> On Wed, Nov 04, 2020 at 04:24:13PM +0000, Lee Jones wrote:
> > Some drivers which include 'elan-i2c-ids.h' make use of
> > 'elan_acpi_id', but not all do.  Tell the compiler that this is
> > expected behaviour.
> > 
> > Fixes the following W=1 kernel build warning(s):
> > 
> >  include/linux/input/elan-i2c-ids.h:26:36: warning: ‘elan_acpi_id’ defined but not used [-Wunused-const-variable=]
> > 
> > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Cc: dusonlin@emc.com.tw
> > Cc: KT Liao <kt.liao@emc.com.tw>
> > Cc: linux-input@vger.kernel.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  include/linux/input/elan-i2c-ids.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/include/linux/input/elan-i2c-ids.h b/include/linux/input/elan-i2c-ids.h
> > index 520858d126808..b6976d99b6b75 100644
> > --- a/include/linux/input/elan-i2c-ids.h
> > +++ b/include/linux/input/elan-i2c-ids.h
> > @@ -23,7 +23,7 @@
> >  
> >  #include <linux/mod_devicetable.h>
> >  
> > -static const struct acpi_device_id elan_acpi_id[] = {
> > +static const struct acpi_device_id __maybe_unused elan_acpi_id[] = {
> >  	{ "ELAN0000", 0 },
> >  	{ "ELAN0100", 0 },
> >  	{ "ELAN0600", 0 },
> 
> I think I'd prefer something like this instead:
> 
> diff --git a/drivers/input/mouse/elan_i2c_core.c
> b/drivers/input/mouse/elan_i2c_core.c
> index c599e21a8478..65d21a050cea 100644
> --- a/drivers/input/mouse/elan_i2c_core.c
> +++ b/drivers/input/mouse/elan_i2c_core.c
> @@ -34,7 +34,6 @@
>  #include <linux/completion.h>
>  #include <linux/of.h>
>  #include <linux/property.h>
> -#include <linux/input/elan-i2c-ids.h>
>  #include <linux/regulator/consumer.h>
>  #include <asm/unaligned.h>
> 
> @@ -1413,6 +1412,7 @@ static const struct i2c_device_id elan_id[] = {
>  MODULE_DEVICE_TABLE(i2c, elan_id);
> 
>  #ifdef CONFIG_ACPI
> +#include <linux/input/elan-i2c-ids.h>
>  MODULE_DEVICE_TABLE(acpi, elan_acpi_id);
>  #endif

Moving an #include file to the bottom of a source file, really?

I can do as you wish, but it's a pretty 'interesting' solution. :)

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
