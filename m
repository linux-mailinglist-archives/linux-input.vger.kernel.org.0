Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B3EF321CD4
	for <lists+linux-input@lfdr.de>; Mon, 22 Feb 2021 17:26:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231238AbhBVQZB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Feb 2021 11:25:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231205AbhBVQYs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Feb 2021 11:24:48 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80873C061786
        for <linux-input@vger.kernel.org>; Mon, 22 Feb 2021 08:24:08 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id h98so14901949wrh.11
        for <linux-input@vger.kernel.org>; Mon, 22 Feb 2021 08:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=AvNXLxXsv5l0oG1qyuFDdJ4hSW0U204SG9Rcc30I1Q8=;
        b=BxUO9pxxzayH5Y9LkQxns4Z4F5KAVCKbKlC/Zjq7s7+t6hg5G3F95g4Q2aT4APhlJg
         AZPcx9tBkEQE3Y+u5pi7Ppji7Vprjo1BXcoTxlPx7o+Wa43ZjfsxH6+ce/gL5pKRHIJV
         ZB7xlLRfktSJU3fZLNJh8dtc4DsEk4tlKgA/z19e3CccqrGpvaruA9XVXfnSjX6zsi5s
         w+vUYxx0ZIDxa9Bvlyv8R46IccAbkMECk0pR/LDGAKV5T7Myggzy87RwsUAv83tcymrx
         JymkxH4vzV2i6Aupxo7+9SPTXoZIhumKhGciB+tS0zewChsylBiJ47S0pqD8QS84eZ8x
         LXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=AvNXLxXsv5l0oG1qyuFDdJ4hSW0U204SG9Rcc30I1Q8=;
        b=CfGD2qYbjBCxz2jsk7hR4/e8nm8vlPxkwVwh9sOK+EniW2QjxoVzgWyoAZjpum9fF6
         JVPifIuQekpJ3rHcgAq6tqY+GodIB3atGkj/B8dDkL2vo+FH8Pxto19/y93FtNpymxp2
         npiHh2IHO0PHjdQIWQeGr3qW5aaxvYN47ou7s7VqT/cXwNC/65Ugkgub45+ffnmlLTD2
         7UkWO3/GLY1VneoKNihvXyMGyoUqVsT1twjy7VnBL167YTQ1Wt2UoGoyBiQZZrXeJS8U
         VLKg6fCsswV4cXC6F/1MNhf90Cygs0WtkopIayvq6P+E4VsKCEUPvb9w/In95tAyAOhA
         Zufw==
X-Gm-Message-State: AOAM5321ICsOWerf3joi40tC+cGaI4rDRoLR3T7wJa8fkhgbrHZL3KNE
        a7/SuZBdvL89Rv7NinDc6jYI4Q==
X-Google-Smtp-Source: ABdhPJwhjP+RiGDRXynBrzTbGs76T1kWC1rvtchZpplYrIbqszwpU212fgxbRbkso5K7ucFZw+EnAw==
X-Received: by 2002:a5d:63ce:: with SMTP id c14mr8870541wrw.15.1614011047281;
        Mon, 22 Feb 2021 08:24:07 -0800 (PST)
Received: from dell ([91.110.221.155])
        by smtp.gmail.com with ESMTPSA id c12sm18100810wru.71.2021.02.22.08.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 08:24:06 -0800 (PST)
Date:   Mon, 22 Feb 2021 16:24:04 +0000
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
Message-ID: <20210222162404.GH376568@dell>
References: <cover.1611653995.git.cristian.ciocaltea@gmail.com>
 <20210221163602.GA297639@BV030612LT>
 <20210222090247.GA376568@dell>
 <20210222151649.GA467803@BV030612LT>
 <20210222153016.GG376568@dell>
 <20210222160821.GA468766@BV030612LT>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210222160821.GA468766@BV030612LT>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 22 Feb 2021, Cristian Ciocaltea wrote:

> On Mon, Feb 22, 2021 at 03:30:16PM +0000, Lee Jones wrote:
> > On Mon, 22 Feb 2021, Cristian Ciocaltea wrote:
> > 
> > > On Mon, Feb 22, 2021 at 09:02:47AM +0000, Lee Jones wrote:
> > > > On Sun, 21 Feb 2021, Cristian Ciocaltea wrote:
> > > > 
> > > > > Hi Lee,
> > > > > 
> > > > > I have just noticed your mfd-next tag for 5.12 doesn't include the
> > > > > support for the ATC260x PMICs.
> > > > > 
> > > > > I assumed the patchset is ready for merging.. Did I miss something?
> > > > 
> > > > The MFD driver needs another review.
> > > > 
> > > > For some reason, this didn't register on my TODO list.
> > > 
> > > You have already tagged v6 with 'Acked-for-MFD-by: Lee Jones
> > > <lee.jones@linaro.org>':
> > > https://lore.kernel.org/lkml/20210125142558.GA4903@dell/
> > > 
> > > I have submitted v7 to drop the patches that had been already picked up,
> > > as previously agreed, but otherwise there are no other changes.
> > > 
> > > That is why I didn't expect another round of review..
> > 
> > I see what's happened.  You forgot to:
> > 
> >   "apply this as-is to your sign-off block"
> > 
> > ... as requested, which made me think it needs a subsequent review.
> 
> Sorry, I somehow missed that.  Should I resend the patch series?

No, no need.  It's on my radar now.  I'll see to it when v5.12 is out.

> If yes, I assume I should also increment the revision number, even
> though there are no other changes except the addition of the
> indicated tag.

When resending, you only have to s/PATCH/RESEND/.

> > > > In general, if you don't receive a review within ~2 weeks of posting
> > > > (and the merge window is not open), you should consider it lost and
> > > > submit a [RESEND].
> > 
> > Due to the fragility of email reviews, this is still very important.
> 
> Right, thanks for the hint!

NP.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
