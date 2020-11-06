Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 068CA2A904B
	for <lists+linux-input@lfdr.de>; Fri,  6 Nov 2020 08:28:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbgKFH2K (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Nov 2020 02:28:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgKFH2K (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Nov 2020 02:28:10 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44685C0613CF;
        Thu,  5 Nov 2020 23:28:10 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id 13so519853pfy.4;
        Thu, 05 Nov 2020 23:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=sQzH86admYF7srXxkd7COxlo3AD4wPFD2h4sygtMlnM=;
        b=lg8QnlBJwUhNIv3qXlY+jmvFq4GseX4G8TxNCDGUxRUqZH9G4Lp5yvgz8fyhLeYvkC
         TZ7hglWxamtDyBTc7DkxtaMVOSRZadvyeNM+jCVC9YKsfT4kIvabl6cBmvFwxSHRpBcX
         dg9mnv7uI/ZbORY0mEOc789mggr9olMBW2LxFyR7DWtedSuUJMNQMPVwIOMjLWX3GNo1
         vroQe1KMvN1UkNxe2it7q/Oh5lXV9I6lEWUaZJ9qImkMVTHpPMpM77Ui5qLsihLj7Yzp
         SKbTvaMPqr7J17NuoMi73aCnbn9yTgguxsc9hOW3LVL+74HSLlE4A8g8Mr9G0ZOvCFiC
         MNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=sQzH86admYF7srXxkd7COxlo3AD4wPFD2h4sygtMlnM=;
        b=pnxcIJ9UNMG3LpICP/IrucIdBrqVzrMjAjodB3yrJ2+KPDeVvjkkVpkadH+g2CJIXZ
         +jOGVoqYdp2txm4tGBlU3WKOqAh/ZfK0XS3Ad6Yr1nGsQdM0m6gRi3P/hUN293/AShmT
         iGApPiWNQINSKiadguK9h7LysBNzuzyt59Ore+BuDcpAYGwY3WD6C/Cun/s04jjrIhKL
         qJQaXRZuDQkJ5/jlLBwZCGXVISzM3eueeu6ZJsZLKj5DNjOpBp9qSRw5S5EaG5CoTFxX
         cZptetkl7AxLVKJcPWIAwYt3CBUqnfF6hSrk/WFEPiJ15yFGxNEBFfEXsSdABc4pmvwP
         hqfw==
X-Gm-Message-State: AOAM533py/SCbehklEgBUyOQIU1w97O/dsLLFLQy1o4bvu6el+dn29vd
        xhiki9EgmSWHdvlJVvHkrwg=
X-Google-Smtp-Source: ABdhPJzs4IldNSPW4AtNtCxsP5ODDTZ1mKkZ7TXwugqwmb2gfNUZeVXV6iVnB4ZCElXZxp+6JBnqNQ==
X-Received: by 2002:a62:528c:0:b029:160:193:76bc with SMTP id g134-20020a62528c0000b0290160019376bcmr746111pfb.24.1604647689791;
        Thu, 05 Nov 2020 23:28:09 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id a18sm665902pgw.50.2020.11.05.23.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 23:28:08 -0800 (PST)
Date:   Thu, 5 Nov 2020 23:28:06 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, dusonlin@emc.com.tw,
        KT Liao <kt.liao@emc.com.tw>, linux-input@vger.kernel.org
Subject: Re: [PATCH 06/20] include: input: elan-i2c-ids: Mark 'elan_acpi_id'
 as __maybe_unused
Message-ID: <20201106072806.GE1003057@dtor-ws>
References: <20201104162427.2984742-1-lee.jones@linaro.org>
 <20201104162427.2984742-7-lee.jones@linaro.org>
 <20201104225054.GC1003057@dtor-ws>
 <20201105091305.GH4488@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201105091305.GH4488@dell>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 05, 2020 at 09:13:05AM +0000, Lee Jones wrote:
> On Wed, 04 Nov 2020, Dmitry Torokhov wrote:
> 
> > Hi Lee,
> > 
> > On Wed, Nov 04, 2020 at 04:24:13PM +0000, Lee Jones wrote:
> > > Some drivers which include 'elan-i2c-ids.h' make use of
> > > 'elan_acpi_id', but not all do.  Tell the compiler that this is
> > > expected behaviour.
> > > 
> > > Fixes the following W=1 kernel build warning(s):
> > > 
> > >  include/linux/input/elan-i2c-ids.h:26:36: warning: ‘elan_acpi_id’ defined but not used [-Wunused-const-variable=]
> > > 
> > > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > Cc: dusonlin@emc.com.tw
> > > Cc: KT Liao <kt.liao@emc.com.tw>
> > > Cc: linux-input@vger.kernel.org
> > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > ---
> > >  include/linux/input/elan-i2c-ids.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/include/linux/input/elan-i2c-ids.h b/include/linux/input/elan-i2c-ids.h
> > > index 520858d126808..b6976d99b6b75 100644
> > > --- a/include/linux/input/elan-i2c-ids.h
> > > +++ b/include/linux/input/elan-i2c-ids.h
> > > @@ -23,7 +23,7 @@
> > >  
> > >  #include <linux/mod_devicetable.h>
> > >  
> > > -static const struct acpi_device_id elan_acpi_id[] = {
> > > +static const struct acpi_device_id __maybe_unused elan_acpi_id[] = {
> > >  	{ "ELAN0000", 0 },
> > >  	{ "ELAN0100", 0 },
> > >  	{ "ELAN0600", 0 },
> > 
> > I think I'd prefer something like this instead:
> > 
> > diff --git a/drivers/input/mouse/elan_i2c_core.c
> > b/drivers/input/mouse/elan_i2c_core.c
> > index c599e21a8478..65d21a050cea 100644
> > --- a/drivers/input/mouse/elan_i2c_core.c
> > +++ b/drivers/input/mouse/elan_i2c_core.c
> > @@ -34,7 +34,6 @@
> >  #include <linux/completion.h>
> >  #include <linux/of.h>
> >  #include <linux/property.h>
> > -#include <linux/input/elan-i2c-ids.h>
> >  #include <linux/regulator/consumer.h>
> >  #include <asm/unaligned.h>
> > 
> > @@ -1413,6 +1412,7 @@ static const struct i2c_device_id elan_id[] = {
> >  MODULE_DEVICE_TABLE(i2c, elan_id);
> > 
> >  #ifdef CONFIG_ACPI
> > +#include <linux/input/elan-i2c-ids.h>
> >  MODULE_DEVICE_TABLE(acpi, elan_acpi_id);
> >  #endif
> 
> Moving an #include file to the bottom of a source file, really?
> 
> I can do as you wish, but it's a pretty 'interesting' solution. :)

I see absolutely nothing wrong with it, and if you check kernel sources
you will see #includes used this way.

What is your concern?

Thanks.

-- 
Dmitry
