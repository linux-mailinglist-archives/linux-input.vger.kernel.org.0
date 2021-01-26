Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54F9F3037B1
	for <lists+linux-input@lfdr.de>; Tue, 26 Jan 2021 09:17:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729073AbhAZIRU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 Jan 2021 03:17:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389578AbhAZIQj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 26 Jan 2021 03:16:39 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CED14C0613D6
        for <linux-input@vger.kernel.org>; Tue, 26 Jan 2021 00:15:39 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id g10so15472182wrx.1
        for <linux-input@vger.kernel.org>; Tue, 26 Jan 2021 00:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Fh17X1oGkTFsnIkpB4JAuYpv4oKsLeUxJIgTn2ARuGY=;
        b=uQ5oGbgzWTCpuDMVUzvFkh/vB8P54bwF4Td57s2a2iHLdgc1g4UKzszqHzfv2e5AhR
         gAPMceK9UiAjyy+hfICSW+LHB0quf87EEF30lYbTPBDuRgIk4yYU2P92wRWx/9Ty/Tu0
         3HxL6Nku4sCYzTI/hvdgP15PXncBjxVv+1fhGUlBE8KpOP+UOiiiWsEoi6t0jJnFu3/y
         vXWl0Y0vTnc6ih59wmMMV19Jd4f3EiJxelJUMWz+NIwyKEaNkdUq+lDNBcRpv7R6LDx/
         NPZTLMn9WrN5eBl5NijCqIws7a+EmcpCzITZnOS3EPcwKrIMmDFpvp4Ywt9ePljE3j7Z
         yaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Fh17X1oGkTFsnIkpB4JAuYpv4oKsLeUxJIgTn2ARuGY=;
        b=TkhBHswV/zV+oNpSJUQfXwdL/c56u0fy7FSxp5I7JDyC5XbnvodNsGIuV3XyMwKKkl
         j8m6M5rLSZzoREfVNmmk3nZzaRFo567wBEgsk3IPHf0kB1SA1Y3bRowQaPlZalPIDuel
         0sBqTMhneeHJDOTHboFH/k3x3k2xYdXaMgdftMf31sfxa+uJaXdkUxrbbYRTnCaBQT4E
         foJqL6XtrMjc/5IOJyH+ImKtWomFxCoNatGRxlrDETDP739DsHr0lcZlcuJodnWs9d6W
         D6sUWBMuDC2CJpZWW3lu0H2/+rQlgdppFPDa/z4/btAUpb/6HRF/6Q3HqKUK3KY84n8f
         m6bg==
X-Gm-Message-State: AOAM5333Zu6SBVZk/i9qfHD7LRi3oL8+PSmVs6O95qqMSE7++KpqirpV
        bNidxdukRLYeWqHZ8q3dln+TnA==
X-Google-Smtp-Source: ABdhPJwQfJcTCXZFY2/bo71X/d025nsEV6vjA3foLfWWnHWxFrHSS2FTrrfm1YpDk53lzrPnfFcMTw==
X-Received: by 2002:adf:9d82:: with SMTP id p2mr4725387wre.330.1611648938481;
        Tue, 26 Jan 2021 00:15:38 -0800 (PST)
Received: from dell ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id o13sm27797044wrh.88.2021.01.26.00.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 00:15:37 -0800 (PST)
Date:   Tue, 26 Jan 2021 08:15:35 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-actions@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v6 3/7] mfd: Add MFD driver for ATC260x PMICs
Message-ID: <20210126081535.GB4903@dell>
References: <cover.1611165200.git.cristian.ciocaltea@gmail.com>
 <4bc76f9e3dc7204d7f407af6ee61c9f193a789d3.1611165200.git.cristian.ciocaltea@gmail.com>
 <20210125142558.GA4903@dell>
 <20210125184715.GA1061394@BV030612LT>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210125184715.GA1061394@BV030612LT>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 25 Jan 2021, Cristian Ciocaltea wrote:

> Hi Lee,
> 
> On Mon, Jan 25, 2021 at 02:25:58PM +0000, Lee Jones wrote:
> > On Wed, 20 Jan 2021, Cristian Ciocaltea wrote:
> > 
> > > Add initial support for the Actions Semi ATC260x PMICs which integrates
> > > Audio Codec, Power management, Clock generation and GPIO controller
> > > blocks.
> > > 
> > > For the moment this driver only supports Regulator, Poweroff and Onkey
> > > functionalities for the ATC2603C and ATC2609A chip variants.
>  
> [...]
> 
> > > +static void regmap_lock_mutex(void *__mutex)
> > > +{
> > > +	struct mutex *mutex = __mutex;
> > > +
> > > +	/*
> > > +	 * Using regmap within an atomic context (e.g. accessing a PMIC when
> > > +	 * powering system down) is normally allowed only if the regmap type
> > > +	 * is MMIO and the regcache type is either REGCACHE_NONE or
> > > +	 * REGCACHE_FLAT. For slow buses like I2C and SPI, the regmap is
> > > +	 * internally protected by a mutex which is acquired non-atomically.
> > > +	 *
> > > +	 * Let's improve this by using a customized locking scheme inspired
> > > +	 * from I2C atomic transfer. See i2c_in_atomic_xfer_mode() for a
> > > +	 * starting point.
> > > +	 */
> > > +	if (system_state > SYSTEM_RUNNING && irqs_disabled())
> > > +		mutex_trylock(mutex);
> > > +	else
> > > +		mutex_lock(mutex);
> > > +}
> > 
> > Would this be useful to anyone else?
> 
> If you refer to the locking scheme, it is currently required by the
> power-off driver to handle atomic contexts.

Right, but would this be helpful to any non-Actions drivers?

If so, perhaps it should reside as a Regmap helper?

> > For my own reference (apply this as-is to your sign-off block):
> 
> Please note the patches "[4/7] regulator: ..." and "[5/7] power: ..."
> have been already picked up by Mark and Sebastian, respectively, while
> Dmitry suggested to merge "[6/7] input: ..." through MFD.

That's fine.

Please re-submit the patches which have not been applied already.

> >   Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> > 
> 
> Thanks,
> Cristi

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
