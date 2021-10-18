Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEA0D432121
	for <lists+linux-input@lfdr.de>; Mon, 18 Oct 2021 16:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232743AbhJRPBc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Oct 2021 11:01:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232402AbhJRPBc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Oct 2021 11:01:32 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8210CC06161C;
        Mon, 18 Oct 2021 07:59:20 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id ec8so262603edb.6;
        Mon, 18 Oct 2021 07:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WehYX/BfdiEXKhaGvq/GoMSkv9C2ieI8FUBxkA42jGQ=;
        b=NAE1RUywfmSkyXk6xtlYeiVgQ3YmaOBs0NIxWLDU3LRdD+1AxGfVlacU9nwVREfJe5
         nOItl2mjVJPwbBoK4En52WbyBFQZLFiswQ8xr9n/T7U5644bUi74aB0C1Yp9+Nn7EEv+
         Q/IRUQqWZOXXr1KfU9y4ow5HG5UQCzRBJn/1MDOzQjCcvPCsR/fYklXb+WmfgKC7ZNYv
         mB8zH2HbaU+ajMx+YNFNe6OHKby8ES7fGwDbtiJH64595uT+gCNzltI8Sm6jT1RgmKQg
         yNIeKPt3ZOCAbgNrtK3HjuphOroi0U0opViW2k7iHmu3VJmPbbnEyldwELIHZkUCtVVf
         RVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WehYX/BfdiEXKhaGvq/GoMSkv9C2ieI8FUBxkA42jGQ=;
        b=eLCRmXijdUAJpBYwYm/H7WhR5oBBRZBAs0s2HBuQUBN9Tif75A+2Q0r4Nnygmrt2gq
         z2oQz/WQS1ckvgge6xj0aNS0sHojRlPgnSqB9CioEr+zETKAj9nQ7TelBIfh2F1LaoKO
         8hLZMnHDEYlt8l6tOrZKXPZpOanNAdqdi0jdNsosgDDHB4Gfik3SEgHHAee3HVutWc2s
         OUhQMvu8vVMM4pp2DX5IIrNkpCd54KmgP1TyHMgaBi/nNj6H/p/68RgytfwWy3KKp1di
         cBwYc56SJYhbS9M9VCvF6QrD4Il9cc7ncegUij0HHrmoZcPA1MigXbfVwOzR/Yhicgzd
         6zQw==
X-Gm-Message-State: AOAM533hUmnIzh9kXfdarrNRz4R9usrEGJfOd6p8j35AJxvb61HAv8C3
        t2GpGGGJIja1+yt+hmDoE129QzSM80HBavc8hZs=
X-Google-Smtp-Source: ABdhPJw7yRU3C27ninbZ6RYvsA4b+bUz9SKwE96wmHwYQ0r+IM9z4rvD5eWXVEmmLh9ZmczfrPAjwmY8KqtNY5q05uY=
X-Received: by 2002:a17:906:2887:: with SMTP id o7mr29518989ejd.425.1634569151170;
 Mon, 18 Oct 2021 07:59:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211018143324.296961-1-hdegoede@redhat.com>
In-Reply-To: <20211018143324.296961-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 18 Oct 2021 17:58:19 +0300
Message-ID: <CAHp75VePYGsioootWjSEC=VXu8tz3+tv510Otju-O=ugCX+h=Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] ASoC/pdx86/input: Introduce and use soc_intel_is_*() helpers
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 18, 2021 at 5:33 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi All,
>
> We have been open-coding x86_match_cpu() checks for enabling some
> SoC specific behavior in various places.
>
> The sound/soc/intel drivers used to also open-code this but this was
> cleaned up a while ago introducing a number of soc_intel_is_*() helpers.
>
> This series moves the definition of these helpers to a more public place
> and uses it in a couple of more places outside the sound tree.
>
> Mark, I know we are a bit late in the cycle, but if you can pick up
> patch 1/3 (assuming on one objects) for 5.16, then the rest can be

I suppose s/on one/no-one/ :-)

> applied after 5.16-rc1 is out.

What I like about this series is dropping ugly ifdeffery here and
there and consolidating it in one place.
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

P.S. Btw, since you are the maintainer of PDx86 it means either you or
Mark (whoever gives an Ack to the other one) can take at least two
patches that makes visible that the change is not just for a single
user.

> Hans de Goede (3):
>   ASoC: Intel: Move soc_intel_is_foo() helpers to a generic header
>   platform/x86: intel_int0002_vgpio: Use the new soc_intel_is_byt/cht
>     helpers
>   Input: axp20x-pek - Use new soc_intel_is_cht() helper
>
>  drivers/input/misc/axp20x-pek.c            | 26 ++-------
>  drivers/platform/x86/intel/int0002_vgpio.c | 14 +----
>  include/linux/platform_data/x86/soc.h      | 65 ++++++++++++++++++++++
>  sound/soc/intel/common/soc-intel-quirks.h  | 51 +----------------
>  4 files changed, 75 insertions(+), 81 deletions(-)
>  create mode 100644 include/linux/platform_data/x86/soc.h
>
> --
> 2.31.1
>


-- 
With Best Regards,
Andy Shevchenko
