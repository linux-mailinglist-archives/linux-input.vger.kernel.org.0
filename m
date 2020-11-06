Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B18672A907E
	for <lists+linux-input@lfdr.de>; Fri,  6 Nov 2020 08:37:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgKFHhn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Nov 2020 02:37:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbgKFHhn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Nov 2020 02:37:43 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41B07C0613D2
        for <linux-input@vger.kernel.org>; Thu,  5 Nov 2020 23:37:43 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id p1so229309wrf.12
        for <linux-input@vger.kernel.org>; Thu, 05 Nov 2020 23:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=cq2BrINU7i2UnBGqhgb04k+JHny8Kfdcz7cdbqx1ieU=;
        b=uO2gUcrXMVAaeTmVyjG34jmFYM6kC3QV3vP0PmNC8R7xcDVw+Y5AoERS7s504QqNLj
         J0stutogzzeg2qQbpnBiQ2BVYzPMLd21ogP0ObdKYbGUPqaUUA0/cMvh+YOBjdK06RFH
         W05puos5ExXOPXmz55e7O5pFp/3+0x7FYbuHEthVYOPNWsF6vUg4waQ0oIiFDQqgDAVi
         tOd9/kk1/6UJ3S62Q4UUxaJWGaD7pKw1xMzhX5lbh3gC8clmwCkDXNAp6mDDK+3yDbK4
         JzaQdBfFG7W+G0ojhbFTpyfRGR4FSTuorAref44zL9f8VHqpmRxx4VgUT2clAjrTfZeI
         x99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=cq2BrINU7i2UnBGqhgb04k+JHny8Kfdcz7cdbqx1ieU=;
        b=uZ2eCAvYtVGsYhchRwYWajZHsZXyPkFNduZNLKER269u31/KkNM5nASQ3C3bWUu2t8
         ewGI7uz6Kf7zYJEDqgmzUf5AtXdYblz81CNMnOmZZToGfu/7dNhjPmg01qWxLnTJi8d3
         FT+Rh3oZj05GxE4bDdwW/Xj+TLrXuREl4xQkyijgQlfhsQZ7qCJENh7Ew/BTWcS4W5si
         CHRj3jrUhIhSQORt5ppCGa+Hp00Ep9iyyynGU1Klxg6yrU9wLOHEfBBmArjNzsrCTR+Q
         t2Mmm8izE3cAp8/ADWqaQw6hR6QwqjnqVR/ID90I7MkmpICCEcelhOmkP3t3Yo3ku9V3
         fTaw==
X-Gm-Message-State: AOAM531HDAMKohKq10zxLwRLztcVVSGB028XYf12l+d5bbxVDbpNuzl3
        zlWfVeOqsidbzt3MesZ9Awv2eA==
X-Google-Smtp-Source: ABdhPJyX5lklRsqKG1z5xZeNyVltvE6BJL1gs/XIBcoMLsanWU6jmTyDbQv3TITfDKk1BIrnHiNYiQ==
X-Received: by 2002:adf:df91:: with SMTP id z17mr1030299wrl.379.1604648262016;
        Thu, 05 Nov 2020 23:37:42 -0800 (PST)
Received: from dell ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id 109sm762061wra.29.2020.11.05.23.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 23:37:41 -0800 (PST)
Date:   Fri, 6 Nov 2020 07:37:39 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-kernel@vger.kernel.org, dusonlin@emc.com.tw,
        KT Liao <kt.liao@emc.com.tw>, linux-input@vger.kernel.org
Subject: Re: [PATCH 06/20] include: input: elan-i2c-ids: Mark 'elan_acpi_id'
 as __maybe_unused
Message-ID: <20201106073739.GS4488@dell>
References: <20201104162427.2984742-1-lee.jones@linaro.org>
 <20201104162427.2984742-7-lee.jones@linaro.org>
 <20201104225054.GC1003057@dtor-ws>
 <20201105091305.GH4488@dell>
 <20201106072806.GE1003057@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201106072806.GE1003057@dtor-ws>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 05 Nov 2020, Dmitry Torokhov wrote:

> On Thu, Nov 05, 2020 at 09:13:05AM +0000, Lee Jones wrote:
> > On Wed, 04 Nov 2020, Dmitry Torokhov wrote:
> > 
> > > Hi Lee,
> > > 
> > > On Wed, Nov 04, 2020 at 04:24:13PM +0000, Lee Jones wrote:
> > > > Some drivers which include 'elan-i2c-ids.h' make use of
> > > > 'elan_acpi_id', but not all do.  Tell the compiler that this is
> > > > expected behaviour.
> > > > 
> > > > Fixes the following W=1 kernel build warning(s):
> > > > 
> > > >  include/linux/input/elan-i2c-ids.h:26:36: warning: ‘elan_acpi_id’ defined but not used [-Wunused-const-variable=]
> > > > 
> > > > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > > Cc: dusonlin@emc.com.tw
> > > > Cc: KT Liao <kt.liao@emc.com.tw>
> > > > Cc: linux-input@vger.kernel.org
> > > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > > ---
> > > >  include/linux/input/elan-i2c-ids.h | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/include/linux/input/elan-i2c-ids.h b/include/linux/input/elan-i2c-ids.h
> > > > index 520858d126808..b6976d99b6b75 100644
> > > > --- a/include/linux/input/elan-i2c-ids.h
> > > > +++ b/include/linux/input/elan-i2c-ids.h
> > > > @@ -23,7 +23,7 @@
> > > >  
> > > >  #include <linux/mod_devicetable.h>
> > > >  
> > > > -static const struct acpi_device_id elan_acpi_id[] = {
> > > > +static const struct acpi_device_id __maybe_unused elan_acpi_id[] = {
> > > >  	{ "ELAN0000", 0 },
> > > >  	{ "ELAN0100", 0 },
> > > >  	{ "ELAN0600", 0 },
> > > 
> > > I think I'd prefer something like this instead:
> > > 
> > > diff --git a/drivers/input/mouse/elan_i2c_core.c
> > > b/drivers/input/mouse/elan_i2c_core.c
> > > index c599e21a8478..65d21a050cea 100644
> > > --- a/drivers/input/mouse/elan_i2c_core.c
> > > +++ b/drivers/input/mouse/elan_i2c_core.c
> > > @@ -34,7 +34,6 @@
> > >  #include <linux/completion.h>
> > >  #include <linux/of.h>
> > >  #include <linux/property.h>
> > > -#include <linux/input/elan-i2c-ids.h>
> > >  #include <linux/regulator/consumer.h>
> > >  #include <asm/unaligned.h>
> > > 
> > > @@ -1413,6 +1412,7 @@ static const struct i2c_device_id elan_id[] = {
> > >  MODULE_DEVICE_TABLE(i2c, elan_id);
> > > 
> > >  #ifdef CONFIG_ACPI
> > > +#include <linux/input/elan-i2c-ids.h>
> > >  MODULE_DEVICE_TABLE(acpi, elan_acpi_id);
> > >  #endif
> > 
> > Moving an #include file to the bottom of a source file, really?
> > 
> > I can do as you wish, but it's a pretty 'interesting' solution. :)
> 
> I see absolutely nothing wrong with it, and if you check kernel sources
> you will see #includes used this way.
> 
> What is your concern?

I guess just the unfamiliarity of it.

It's the first time I've seen such a solution.

Will fix.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
