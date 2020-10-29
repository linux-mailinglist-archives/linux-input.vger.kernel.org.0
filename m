Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E699129F157
	for <lists+linux-input@lfdr.de>; Thu, 29 Oct 2020 17:25:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725784AbgJ2QZg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Oct 2020 12:25:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725764AbgJ2QZg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Oct 2020 12:25:36 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFBC4C0613D2;
        Thu, 29 Oct 2020 09:25:35 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id k9so1072782pgt.9;
        Thu, 29 Oct 2020 09:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3Sus15uWA6w8qigrNG43zUpD+rV5kcttYLaM0yd967o=;
        b=KrN1BkAHZbSipbqNIWGbwhF4zxjgjhsy08N+pJi+hZbbDtFU4nn9kK3GIv5gQR/ULO
         y4dDXNJ21GgknMb3nO+FugCWOB8D0ylkEjjXywgzygZsVinzFWx8lekm4WbYHxhEejlL
         m9B7b+nPxt/aFX6d9fYNt1s7Teynf+bB7tCY8OuxdS8tCy66l9/ztA9UxzawfqqEcqxd
         xRJRWGUHXHdw3zvfzWf9w3sNVg38qWJLvLvt0keighGwSae2Ot6U40yhSnxV0liES50N
         UbmY+BwT6SKkodEL9Ig/8JMGAaVTThM8AK3uao8aiTPcXOfx/R4ayTeNaLZUMWTYwQ2J
         wGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3Sus15uWA6w8qigrNG43zUpD+rV5kcttYLaM0yd967o=;
        b=Tmloj5KrKQUSGi/GfYWPCFLF6cmtFsr+k96e3eL2Q4ObbWW66ShHTfEv/ex9/bc0+O
         prdo2800+GK6bDutqX/ZY+eJ7zbIxFTphd4iwxgl5vI8hamg4Bs2X/5NNQoXmdVNdGmT
         SDgcSSGvEn7ZupBunTySsBxy78VdardO77CT6yO5aU4l3+mPusQF5YEnZColycS5GcLO
         kAAL57RKDB7h3A65COQ8hdeU4DqMtjCJ6XcIN1yTf9rHhA/NqVqDxKYA6BsuvmwzJFet
         tHEQGqs9EqI1Nrm/y2jbIO2NVyHYx2hxlvqrjq6Vz99SDgiRnuTUTtTuV7mLcNdXpFLa
         fH5A==
X-Gm-Message-State: AOAM530u9oydzWv8gVNVKjempF/qzzfOLEu/rdb4SOLyu7F0epZpp6jF
        T4XPiD6Y3lcOwnQpg/1GVjQ=
X-Google-Smtp-Source: ABdhPJykD7pCjW9SNhGlSP9mIjxhvJzD4H32iRjUBNl/l0hRhQG2Ij7TwRjSS9Nl/UWc68JBSAspbg==
X-Received: by 2002:a17:90a:1188:: with SMTP id e8mr566544pja.61.1603988735197;
        Thu, 29 Oct 2020 09:25:35 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id x7sm3534070pfr.61.2020.10.29.09.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 09:25:34 -0700 (PDT)
Date:   Thu, 29 Oct 2020 09:25:31 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        Nick Dyer <nick@shmanahar.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/2] Input: atmel_mxt_ts: Convert bindings to YAML and
 extend
Message-ID: <20201029162531.GB2547185@dtor-ws>
References: <20201028101711.696423-1-linus.walleij@linaro.org>
 <20201028180059.GA2547185@dtor-ws>
 <CACRpkdaieExkEyjE=+GbQTVKsk21ifH9mm+q4vengqgbQ=Jd_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaieExkEyjE=+GbQTVKsk21ifH9mm+q4vengqgbQ=Jd_A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Oct 29, 2020 at 02:47:36PM +0100, Linus Walleij wrote:
> On Wed, Oct 28, 2020 at 7:01 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> > On Wed, Oct 28, 2020 at 11:17:10AM +0100, Linus Walleij wrote:
> 
> > > This converts the Armel MXT touchscreen bindings to YAML
> > > format and extends them with the following two properties:
> > >
> > > - vdda-supply: the optional analog supply voltage
> > > - vdd-supply: the optional digital supply voltage
> > >
> > > I also explained about the reset-gpios property that this
> > > better be flagged as active high (0) despite actually
> > > being active low, because all current device trees and
> > > drivers assume that this is the case and will actively
> > > drive the line low to assert RESET.
> >
> > I wonder if we should fix that in driver and in DTs instead of doing
> > this cludge...
> 
> Unfortunately I think there are deployed systems with flashed-in
> system descriptions depending on this bug in the system
> description already.
> 
> I am not thinking about device trees now, but instead ACPI
> chromebooks, that have their reset line flagged as whatever
> ACPI or DT-to-ACPI use to indicate an active high line.
> Despite being active low.

The only ARM Chromebook that exposed reset line to the kernel was RK3288
Asus Chromebook "Minnie". DTS specifies correct polarity (active low),
but uses different binding (atmel,reset-gpios) from the driver found
upstream (I have never reconciled Atmel driver we ship with Chromebooks
with the upstream one). DT there is also part of the kernel, not flashed
separately.

x86 Chromebooks do not export reset line or regulators to the kernel but
rather handle power up/down sequence in firmware (either at boot or
exposing ACPI power control methods that kernel invokes form ACPI power
domain code).

> 
> I could fix all the in-tree devicetrees and do it the natural way
> (I have certainly done so before) and then add a quirk if used
> with ACPI. But it's really risky. I'm afraid of regressions here.

Unless there are unofficial firmwares that rework power handling on some
x86 Chromebooks and we want to support them I'd rather we did not quirk.

Thanks.

-- 
Dmitry
