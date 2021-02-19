Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 745BE31FF01
	for <lists+linux-input@lfdr.de>; Fri, 19 Feb 2021 19:56:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229862AbhBSSzC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Feb 2021 13:55:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbhBSSzB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Feb 2021 13:55:01 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AECFC061786;
        Fri, 19 Feb 2021 10:54:21 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id cx11so2092096pjb.4;
        Fri, 19 Feb 2021 10:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=a+41YRbSFzDZao2tp+3iHIh4EoYU6eQKRVaEr2sAmnQ=;
        b=TbTKtUuA3ET4Twe/V+AK9n/JpKdx5d+g5GfJLB/0+JRbGvuWNXTtS+ita16i2+wtrC
         jfLCe1xN0y6adBtHMePRGV6lB5tSm1u0BSMbDy7shu3hTjflMDJcnNT2MrimRK97bL7u
         NG99Bn0wuTbVwJoMQWrK7HoAin0LA0KhzdlD5zRb5BsZ+5N972qYes1ri8S8paQ0hJKr
         Cf/JqLKpv/vhzpCOjVdxPwJTuCWHD2YJ38APRkBP48/goGHpGVnX+KVpqGV7wqBTawPJ
         72rIqL10ug4lzf9wlhz6RXach7OLWtaaGQPI6OpQJWD3uTsKhwHjrygPU2GMzAZPV3oH
         z8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=a+41YRbSFzDZao2tp+3iHIh4EoYU6eQKRVaEr2sAmnQ=;
        b=an5RU0BYHvxzMrSNfzBDh9XGBCDDPBx2vbq3tkU0DOzhCGz8FJdKCROz7xYIHxuBVz
         aPgfyjelcnYdieHteuzuETYRxGmgAy/tUU3Z99WVywAOcvD9Z20Gmj941GMB9XbLTMQ4
         7teFWvVRQGI6ddNat5szb+SnAliw9jXMlDXauT8rINk9i6525NbPd4oiJP/IqCrHphNY
         gO3SV1QLCRsdXwvdTnpjALaiJclSdDXrWl6f5G65tnZIc4jv0eGE7xm+BY1GR3FoC2Y7
         sMp7k5XDEi0ddYxdYIfVmhJTnraWDebOxFo+pGXy+3T+3mNVUFzswB2vyfbrr7hYDMNb
         yURQ==
X-Gm-Message-State: AOAM531P1f9gfmjZLxSuOvg+1R9KkdVztbuCwcFTxgUMABuvTfz17L3R
        CJnJxi530SQPlmn3G8SQz3Gnf/nIbRA=
X-Google-Smtp-Source: ABdhPJxDPncVehyuKQeCQGkDb0C5q6KmbJ18G9TAEA/s3id0M+lY18mdgQXWJ6nvySdEYJG6B6SPNA==
X-Received: by 2002:a17:902:ba92:b029:e3:8358:34c5 with SMTP id k18-20020a170902ba92b02900e3835834c5mr10708873pls.9.1613760860620;
        Fri, 19 Feb 2021 10:54:20 -0800 (PST)
Received: from google.com ([2620:15c:202:201:7d43:dae1:3b24:51b7])
        by smtp.gmail.com with ESMTPSA id 74sm10429950pfw.53.2021.02.19.10.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 10:54:19 -0800 (PST)
Date:   Fri, 19 Feb 2021 10:54:16 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Stephen Kitt <steve@sk2.org>, linux-input@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Input: joydev - prevent potential read overflow in ioctl
Message-ID: <YDAJWC11RW9Wa3K8@google.com>
References: <YCyzR8WvFRw4HWw6@mwanda>
 <YC8t2EHKRSF7DwmF@google.com>
 <20210219083215.GS2087@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210219083215.GS2087@kadam>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Feb 19, 2021 at 11:32:15AM +0300, Dan Carpenter wrote:
> On Thu, Feb 18, 2021 at 07:17:44PM -0800, Dmitry Torokhov wrote:
> > Hi Dan,
> > 
> > On Wed, Feb 17, 2021 at 09:10:15AM +0300, Dan Carpenter wrote:
> > > The problem here is that "len" might be less than "joydev->nabs" so the
> > > loops which verfy abspam[i] and keypam[] might read beyond the buffer.
> > > 
> > > Fixes: 999b874f4aa3 ("Input: joydev - validate axis/button maps before clobbering current ones")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > Thank you for the patch.
> > 
> > > ---
> > >  drivers/input/joydev.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/input/joydev.c b/drivers/input/joydev.c
> > > index a2b5fbba2d3b..750f4513fe20 100644
> > > --- a/drivers/input/joydev.c
> > > +++ b/drivers/input/joydev.c
> > > @@ -456,7 +456,7 @@ static int joydev_handle_JSIOCSAXMAP(struct joydev *joydev,
> > >  	if (IS_ERR(abspam))
> > >  		return PTR_ERR(abspam);
> > >  
> > > -	for (i = 0; i < joydev->nabs; i++) {
> > > +	for (i = 0; i < len && i < joydev->nabs; i++) {
> > >  		if (abspam[i] > ABS_MAX) {
> > >  			retval = -EINVAL;
> > >  			goto out;
> > > @@ -487,7 +487,7 @@ static int joydev_handle_JSIOCSBTNMAP(struct joydev *joydev,
> > >  	if (IS_ERR(keypam))
> > >  		return PTR_ERR(keypam);
> > >  
> > > -	for (i = 0; i < joydev->nkey; i++) {
> > > +	for (i = 0; i < (len / 2) && i < joydev->nkey; i++) {
> > 
> > 
> > I think we also need to make sure that len is even. Do you mind if I add
> > the check at the top of the function to return -EINVAL if it is odd?
> 
> Yes.  You are right.
> 
> Btw, thank you for fixing my patches, but feel free to just ask me to
> resend if that's easier for you.

It is not really fixing your patch, rather addressing another issue
while we are there. Some might even say it could have been a separate
patch.

Anyway, for small fixups like this I feel it's less noise on the lists
without extra resubmissions, that is why I often do them on my side.

Thanks!

-- 
Dmitry
