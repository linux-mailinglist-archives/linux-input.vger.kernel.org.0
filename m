Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA3135ABAE
	for <lists+linux-input@lfdr.de>; Sat, 10 Apr 2021 09:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbhDJHcz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 10 Apr 2021 03:32:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhDJHcy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 10 Apr 2021 03:32:54 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9046C061762
        for <linux-input@vger.kernel.org>; Sat, 10 Apr 2021 00:32:40 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id g10so3816085plt.8
        for <linux-input@vger.kernel.org>; Sat, 10 Apr 2021 00:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=H5e+D/Aya1Nb4tAUyfRh/ao1QanG8vwsn1N5nVbWkhk=;
        b=bsmIUAsfPD558p3ZRLb9eWoTxLjgQ3GsIXfVDRDsqM+mkLOg6tCEKUQmuqwG9kbH+T
         Wj8Mutj3zYy+l5h78y9H7ezqF3c5wInlmsMRmsvvHl7AcSh7sNwz9N2jK+8OrCFPkFY0
         wnI5Rl7waWDt2RzCA6cfnleKaBXJnijToiF+lq24+s2uegcDSNutAtde+LKM4skRWz25
         ZGJNovRfOjLMzLlJo3G9UVBHiX5qqcbyZtOgQxu5Mpgygr9f6PxDiSwC7xO/CIn9J2qY
         4FVeLXt5jJtjsDCnhm9fjIKi9yC3dkPWIRYpwQ127rTvlhTKaQ17B7LaUVNLDKR2hmMa
         K+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H5e+D/Aya1Nb4tAUyfRh/ao1QanG8vwsn1N5nVbWkhk=;
        b=nNV3NP4yVpky7cWOm5cX5dKu6zRxEGuNDa3pH8+Rhr6xkRGlhJQXDbnV3+Q5Xiawwi
         /OcqVm3p2gLXkbL2Cq/8TQHnvbouCDCvJHq5rSM0N5RWPWjFidCixG0pwts26fDtCfD/
         KInHQqY9ApZexKmtG63YBDeI2INiWxQgX/hTELlJ9SmDXCA8eEsvfusGUDHXNY1WXhHO
         erMbT52kQe65Y/NJskywylFFNisJxzNcLvRiTRTk+Ukd/thDfg5bPAAWs8IoYIrX1N4v
         l+kDl8SWYdd5EAStg/WLeZJdA6g2JPLrzbCEcWmJYJTBOF95OACib5kTndCUafbKNlLa
         ih6w==
X-Gm-Message-State: AOAM5330V0+RZSdLj7stz55CI7Z9aOvCaPpK2N2MeEhWt8wsTMzhOU6d
        vCcu6JHO/BOdOP5trcQCY+U=
X-Google-Smtp-Source: ABdhPJwv1MXj0N4TSvo0lo8BxdjtvjFwnUG9ZWwDYQeHIFaEbqXB0VeDw9TPJlD2ao+dld9lBS7v1A==
X-Received: by 2002:a17:90b:3846:: with SMTP id nl6mr17621528pjb.48.1618039960306;
        Sat, 10 Apr 2021 00:32:40 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:c9de:23b9:54df:4a55])
        by smtp.gmail.com with ESMTPSA id k20sm3869359pfa.34.2021.04.10.00.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 00:32:39 -0700 (PDT)
Date:   Sat, 10 Apr 2021 00:32:37 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Javier Martinez Canillas <javier@dowhile0.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 5/8 v3] Input: cyttsp - Reduce reset pulse timings
Message-ID: <YHFUlUdNLGSpPR7x@google.com>
References: <20210408131153.3446138-1-linus.walleij@linaro.org>
 <20210408131153.3446138-6-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408131153.3446138-6-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 08, 2021 at 03:11:50PM +0200, Linus Walleij wrote:
> The data sheet for CY8CTMA340 specifies that the reset pulse
> shall be at least 1 ms. Specify 1-2 ms with usleep_range()
> to cut some slack for the scheduler.
> 
> Curiously the datasheet does not specify how long we have to
> wait after a hard reset until the chip is up, but I have found
> a vendor tree (Samsung GT-S7710) that has code for this touch
> screen and there this is set to 5 ms so I use this with
> the same 1 ms fuzz.
> 
> Reviewed-by: Javier Martinez Canillas <javier@dowhile0.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied, thank you.

-- 
Dmitry
