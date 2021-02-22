Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8998321B76
	for <lists+linux-input@lfdr.de>; Mon, 22 Feb 2021 16:32:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231488AbhBVPb0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Feb 2021 10:31:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231418AbhBVPbX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Feb 2021 10:31:23 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7686C061794
        for <linux-input@vger.kernel.org>; Mon, 22 Feb 2021 07:30:19 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id r3so7875854wro.9
        for <linux-input@vger.kernel.org>; Mon, 22 Feb 2021 07:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=yPjMBhojUCoon9NDnK8Nh4YqsBmKwJwjusKAtHDxYIs=;
        b=OjNx+KbZDkEk7LQ/ccSS9UrYj0/EXZrMMqVlZW99G0CSZSvk2uZ/ZR3Q9ddUnSebHx
         3BBJRkRLE4b30dqs69hAjAm0a/vNAcXDhp8AIF6552Jlfncuu0do0kQ/emuDmL5k7oo0
         FQbpcYINidws4EaU1VeXJ6sq2TUyI5HRj+2nr2ZJj/p8zIzOQDcx/69YziNpje27sx8n
         h4p3UqgA4b1bkJXaqx1WSPLq3WArsUdyJGfbQ+DyW9s/dRORi+HeMaJSHkrDnekZqnV7
         oENgEV2hnWNFnbEUREHiuxaj4LulB4CA5x/7arpv70dWDKl3czrC4Nqc9T5LgfUKv5P/
         BtZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=yPjMBhojUCoon9NDnK8Nh4YqsBmKwJwjusKAtHDxYIs=;
        b=ZnJN3fVebkO7niqfy8mtciUxdY1of9k3iOwchmPMCbTOL/qlZ/2Em1mpnOXAcJO3wy
         4q2ESBwusnrVyJaEKN7JOMoq9mCjjNRk0SKmahnBcwAl827QK3+VEOPpCbO0eulHS4xq
         YmCqcS+vVqHdb+qMvSxoXA3dtHgmk+LEF//XgUDtjnZyGuBqnzzeDpu76ScJrxTBOqdH
         5gmMUCOKKHCwPK0nldVXLwLkl9gB9F6ZfmkrDKOFH9GPASdxBaVH8/izgmlcO+A0uTXe
         +mJplmiTFCN1rSBKoU4GjO3oqXvBY2XsFavXCiaP1KYTP0155JfwNY+hGwGqEMxYOW5n
         UxbQ==
X-Gm-Message-State: AOAM533mGe84E1gSSsRLkn3i+FRTp9PPxAAyrKXlb7bSwdsp4Wpd42yR
        pXmF6UBR85IiuY4r+mqrdq/AHA==
X-Google-Smtp-Source: ABdhPJw5IU/i+9v0evRsCf/R2OGTjpriS7h0ZgwtXoJtP5oiyOJQEa8J03FTXvIz25R2t+h9dhymUg==
X-Received: by 2002:adf:f1c4:: with SMTP id z4mr4413127wro.52.1614007818549;
        Mon, 22 Feb 2021 07:30:18 -0800 (PST)
Received: from dell ([91.110.221.155])
        by smtp.gmail.com with ESMTPSA id f17sm28937083wrx.57.2021.02.22.07.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 07:30:18 -0800 (PST)
Date:   Mon, 22 Feb 2021 15:30:16 +0000
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
Subject: Re: [PATCH v7 0/5] Add initial support for ATC260x PMICs
Message-ID: <20210222153016.GG376568@dell>
References: <cover.1611653995.git.cristian.ciocaltea@gmail.com>
 <20210221163602.GA297639@BV030612LT>
 <20210222090247.GA376568@dell>
 <20210222151649.GA467803@BV030612LT>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210222151649.GA467803@BV030612LT>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 22 Feb 2021, Cristian Ciocaltea wrote:

> On Mon, Feb 22, 2021 at 09:02:47AM +0000, Lee Jones wrote:
> > On Sun, 21 Feb 2021, Cristian Ciocaltea wrote:
> > 
> > > Hi Lee,
> > > 
> > > I have just noticed your mfd-next tag for 5.12 doesn't include the
> > > support for the ATC260x PMICs.
> > > 
> > > I assumed the patchset is ready for merging.. Did I miss something?
> > 
> > The MFD driver needs another review.
> > 
> > For some reason, this didn't register on my TODO list.
> 
> You have already tagged v6 with 'Acked-for-MFD-by: Lee Jones
> <lee.jones@linaro.org>':
> https://lore.kernel.org/lkml/20210125142558.GA4903@dell/
> 
> I have submitted v7 to drop the patches that had been already picked up,
> as previously agreed, but otherwise there are no other changes.
> 
> That is why I didn't expect another round of review..

I see what's happened.  You forgot to:

  "apply this as-is to your sign-off block"

... as requested, which made me think it needs a subsequent review.

> > In general, if you don't receive a review within ~2 weeks of posting
> > (and the merge window is not open), you should consider it lost and
> > submit a [RESEND].

Due to the fragility of email reviews, this is still very important.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
