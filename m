Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC622D2061
	for <lists+linux-input@lfdr.de>; Tue,  8 Dec 2020 02:55:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727144AbgLHByX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Dec 2020 20:54:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726830AbgLHByW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Dec 2020 20:54:22 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAC20C061749
        for <linux-input@vger.kernel.org>; Mon,  7 Dec 2020 17:53:42 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id q22so12298403pfk.12
        for <linux-input@vger.kernel.org>; Mon, 07 Dec 2020 17:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rkBpHeGSEiJwnjDZ7FmUX7M2a6GgV2ASg00BO6c8FEU=;
        b=j9PZMrl8R9+IRUJZxyDSHUuB5AvHUtaIh502ieGZaYAUEB6vc41J8Hi6DPMY+ViMeu
         no8Qgw18cM/yLORJivb6dC9EgA3sxHR5SQXQF08+qX6DrWonrhdH4cXCvCcY4L7n0xpM
         IOmfFNs7a90vqybk2FJYv3h+aaoW8b1SeZ7hixrDQ1ulqyevn7N5WQLoosUmFv4QB+3o
         vtyB2MbhR4HC9PQ8rB1TfVHks2WnOcdfr09YpCr8yRZ2ZNHmL11x8zvThpomSGVXt6qE
         a3L+eGcdtk2qKMlY+U78Lg8pRZ8FvJKl9om5Qk1UqTg7QxRRL/d7ZB5nXr9YQG5VZfKW
         aaHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rkBpHeGSEiJwnjDZ7FmUX7M2a6GgV2ASg00BO6c8FEU=;
        b=iorKcmKIfTeraXjNdDz7U+ud5mok/kT2sCHbTnGFrwoI1uGWpyUlWCZbnXDK0T+DtD
         GyeW+JnYhxS5V6KTIJ11tlU8OrzPMSrQ2AREIFTIAE7ZoqfvpO+ZqzqXeRWWjIfVBWvA
         kscN5fsSrnrf+wMyhyFEEBbc/soU3udFhf2L91VK8VfwwyNuUgjWXNWk313+4ejH4lmJ
         PV8H5oh/WFg3mASV6llZRam7+qgB4BaQ+W4cx2fzVb3/SFi7qCHZjw5uEdeCsfKlY1JE
         100mW3UHHwaHMvIdfkMyexQ6/LGbF3cZ83F2tSVCK9jQq8YN+ucMTPuhD2hZlVmNA+aZ
         4QZg==
X-Gm-Message-State: AOAM53102Lrw42hJkGLVdGqmZTb8L6qMtYV6wiM0DHGj+YPks+jtvZoc
        zCRw7XOWaAKhd7C6G8afxk8uGu0Tc2Y=
X-Google-Smtp-Source: ABdhPJwl/E9DNFai3yG5U6aVvGO84ti6WXbllyDl3vaKV+FZYXyTsEHKOOgf32ppWWPIanIZukNeVQ==
X-Received: by 2002:a63:f745:: with SMTP id f5mr14746823pgk.119.1607392422146;
        Mon, 07 Dec 2020 17:53:42 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id q16sm9784915pfg.139.2020.12.07.17.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 17:53:41 -0800 (PST)
Date:   Mon, 7 Dec 2020 17:53:39 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux@simonmicro.de, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: goodix - Add upside-down quirk for Teclast X98
 Pro tablet
Message-ID: <X87co6DCMGpQR3/f@google.com>
References: <20201117004253.27A5A27EFD@localhost>
 <672ddee0a276be7d34e01c665df20d1c8ad2b7d0.camel@hadess.net>
 <51f85699a86b751869689b3776ddf8e302131e95.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51f85699a86b751869689b3776ddf8e302131e95.camel@hadess.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Bastien,

On Mon, Dec 07, 2020 at 04:13:06PM +0100, Bastien Nocera wrote:
> On Tue, 2020-11-17 at 16:05 +0100, Bastien Nocera wrote:
> > On Mon, 2020-11-16 at 19:42 -0500, Simon Beginn wrote:
> > > The touchscreen on the Teclast x98 Pro is also mounted upside-down
> > > in
> > > relation to the display orientation. I added it also to the list of
> > > those devices. Verified it works on my device - this has not been
> > > tested with more users than myself...
> > 
> > Looks good to me, thanks.
> > 
> > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> 
> Dmitry, this seems to have slipped through the cracks. Can you please
> pick it up for the next merge window?

Argh, the original patch went into spam folder because the domain
requires dmarc enforcement and Gmail is happy to oblige:

ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of linux-input-owner@vger.kernel.org
       designates 23.128.96.18 as permitted sender)
       smtp.mailfrom=linux-input-owner@vger.kernel.org;
              dmarc=fail (p=REJECT sp=REJECT dis=QUARANTINE)
	      header.from=simonmicro.de

Regardless, I need "Signed-off-by" from Simon before I can apply it.

Thanks.

-- 
Dmitry
