Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3BC2DF9C4
	for <lists+linux-input@lfdr.de>; Mon, 21 Dec 2020 09:11:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727179AbgLUILG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Dec 2020 03:11:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbgLUILF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Dec 2020 03:11:05 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F39E6C061248
        for <linux-input@vger.kernel.org>; Mon, 21 Dec 2020 00:10:19 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id k10so9022367wmi.3
        for <linux-input@vger.kernel.org>; Mon, 21 Dec 2020 00:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=8twWC59nf0hTSYRSk++JzXeEHnzUQgXnLgzo/+5kK6g=;
        b=ak/30GTUKGf0uURuIBRwK+Z5nJM5LLKw2sFfAb3zHnm6/kGc8thcF/tq1Kdw0YgePc
         quZBt+/yN0XkBbH/2ISxoXBxFlrf5SW/EIvSLp7LpjmM6y7oCghJ+6XmDxWTJl9qxg7A
         VzpHTZ8yM97NEExXS00xYG2q8l7LBzVWExi8rJo5SamM2C1AiyixFAeHyWbzaC3Oxecd
         eQvcC33NzsBe5WsAH1lbD5KtPhsuAvtTZB/NUrsyFXtDYC94GeBeq5bwxYfsxYQqNV0I
         Qy7fowAljpu7XMO0oFZFeYq644ZHr47XXw/yhWS75H17Jk381f8jC5QBpVkeKsWhle4F
         guug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=8twWC59nf0hTSYRSk++JzXeEHnzUQgXnLgzo/+5kK6g=;
        b=TyOItEVed+h/zCc6nNfoL+Lj9gPDUvdp8AocxKEw5F+B5F90Hr1yv8PP+G7vEpctIH
         KXEO8k8ZP6rklgcWx8GXONBuwv/b70hL7kaViVpvV8SXDCbQpUuiQu9S0ud9W2OSWZzO
         BWZ1EcBDDrkLiTuYpp4zOXcdGsfnVM0JAcpxFe+NxEcCKSsQPtOErBYOPJ9vZs+Tvh/B
         1aaLdoB1LtDLD6lD5uJgwCw8u/v0rcpA3FdXviqFbIwDHkj1b08v3kf9dEysytE5i1A4
         FJ9x21NbxU0kxTQMikBz8lLmCZHSZ+u+I3gidBwZPhMZMeODJd6hvJH0CUv2AHQBOHSc
         CyMw==
X-Gm-Message-State: AOAM5312Mh7nAj0GOh5OZ9iF9ldUW1QCt6cE5LAZAr9xeqYi5MqLmMoM
        dV/p8V8y9QTZUm0lCgML8TlbJw==
X-Google-Smtp-Source: ABdhPJyzsu0gxJR0INTrbYFQFjvuiP/hGxunooQWgYOOw8WFVAyYSQeKqMfhChXQwTCsxaVthOHAwA==
X-Received: by 2002:a1c:a5d8:: with SMTP id o207mr15647996wme.30.1608538218599;
        Mon, 21 Dec 2020 00:10:18 -0800 (PST)
Received: from dell ([91.110.221.144])
        by smtp.gmail.com with ESMTPSA id a62sm26520714wmh.40.2020.12.21.00.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 00:10:17 -0800 (PST)
Date:   Mon, 21 Dec 2020 08:10:15 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        linux-actions@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 3/7] mfd: Add MFD driver for ATC260x PMICs
Message-ID: <20201221081015.GA4825@dell>
References: <cover.1607216141.git.cristian.ciocaltea@gmail.com>
 <f538c21de556c66390614bad778f7dc095222e8c.1607216141.git.cristian.ciocaltea@gmail.com>
 <20201216101000.GD207743@dell>
 <20201217231731.GA104305@BV030612LT>
 <20201218132139.GR207743@dell>
 <20201218160710.GA134686@BV030612LT>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201218160710.GA134686@BV030612LT>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 18 Dec 2020, Cristian Ciocaltea wrote:

> On Fri, Dec 18, 2020 at 01:21:39PM +0000, Lee Jones wrote:
> > On Fri, 18 Dec 2020, Cristian Ciocaltea wrote:
> > 
> > > Hi Lee,
> > > 
> > > Thank you for the detailed review!
> > > 
> > > I will prepare a new revision, but there are still a couple of open
> > > points..
> > 
> > Could you please snip your replies, leaving only the open points.
> > 
> > Scrolling through lots of empty quotes or "done" comments is quite
> > time consuming.  Thanks.
> 
> Sure, I'll take that into account.
> 
> > [...]
> > 
> > > > > +	ret = regmap_read(atc260x->regmap, atc260x->rev_reg, &chip_rev);
> > > > > +	if (ret) {
> > > > > +		dev_err(dev, "Failed to get chip revision\n");
> > > > > +		return ret;
> > > > > +	}
> > > > > +
> > > > > +	if (chip_rev < 0 || chip_rev > 31) {
> > > > > +		dev_err(dev, "Unknown chip revision: %d\n", ret);
> > > > > +		return -EINVAL;
> > > > > +	}
> > > > 
> > > > This still seems limiting.
> > > 
> > > This is based on the vendor implementation. Unfortunately I don't have
> > > access to a data sheet or any other source of information about the
> > > management of the chip revisions.
> > 
> > So which versions does this driver work with?  All 32?
> 
> I'm not even sure there are so many revisions, I guess that's just a
> rough validation for a vendor reserved range.
> 
> For the moment, the only place where the functionality is affected
> by the chip revision is in the regulator driver - there is a special
> handling for the ATC2603C rev.B chip variant.
> 
> I expect some additional handling might be required for new drivers
> bringing support for the other functions provided by the hardware.

The current patch seems to insinuate that 32 versions are currently
supported.  What is the chip_rev for the ATC2603C rev.B?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
