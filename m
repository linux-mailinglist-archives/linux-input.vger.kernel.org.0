Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FD2B5E5CDB
	for <lists+linux-input@lfdr.de>; Thu, 22 Sep 2022 10:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbiIVIEv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Sep 2022 04:04:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbiIVIEt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Sep 2022 04:04:49 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23983303C5
        for <linux-input@vger.kernel.org>; Thu, 22 Sep 2022 01:04:47 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id y5so14226702wrh.3
        for <linux-input@vger.kernel.org>; Thu, 22 Sep 2022 01:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date;
        bh=lOzFH3A/Q9h5hUWWrAAtR4RiVuxnmLMm/OrvonGfKs8=;
        b=CUIhNo+NCHSj5/0/JLVfqp0/qDm7C9X6mXbV/rgs4u8Er459XJzgsNVd5yXsnWQouD
         epbt/0+yTF+iu3sxJUfrkMrhDUZzeGd5ecp9iYjOxd3nXocEVGrlINHTabKLIUVrQSCA
         sYrrN1Wb5es7PtdziHKVOGZEqEqcUOQns9YZiZQzSpZ3Url08KSlT/jAELeQKSw+QkMv
         L0flk6EWRfQu09QkBCaia/WKl0LFFe96+fToKtQoeHzl2lvBFDsyKthCm1kkBPpxEzSX
         GQrrLHP/BOvHgl8dRpxh+aBD1TfWVx7ko00NlU0JZ6OTdbKdqOzMiPkxKjUgIvoFbWdv
         Onbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=lOzFH3A/Q9h5hUWWrAAtR4RiVuxnmLMm/OrvonGfKs8=;
        b=sbcNfv/O4D8ekNiq00/aZa+PPVKB+h6lSrhpyDWV/slkhYFT/gWEcsJB9F7MywkvHn
         3exSJ4cKd9mfx6B3dFQRbia6FCRDjieM0BmkSGfyyTwyD6UadNa+8+F+pL7yLhsPQMfN
         yJ19G/BZThtqlVp3JK82aDW6t+LxJT520VkH8ZK5t9r+an0yMVDSMW3v6NC8ALiZm1qC
         vp1jbCW13iqsrBM5Pk73O/L+Womt+y8BKVXIVu1NU9WayCe/5cFZfoh49rDpzxouVcD+
         CyrkseUfcb0Gq5nn7Bkc13ygmE5/PNpUAapNCfcKznq9qawSkq6vHjnqhxwQ2yEV06Tr
         wVMw==
X-Gm-Message-State: ACrzQf03h8z98pxQVcywrZgqUmT4ui2qf3xK5SgWpR7iessH5JSSk48H
        zXFyZm3MCIqKWLLZ/EHxDtvvIQ==
X-Google-Smtp-Source: AMsMyM6omPbfLHherLBpH2pGb2uuFBvAqie7bz/p/tIHcgQ6ZCDxRGGEdXAWP9fE6G/DuRZ9BBU3tw==
X-Received: by 2002:a05:6000:81e:b0:228:a17f:92f0 with SMTP id bt30-20020a056000081e00b00228a17f92f0mr1152324wrb.31.1663833885432;
        Thu, 22 Sep 2022 01:04:45 -0700 (PDT)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id c14-20020a05600c0ace00b003b3180551c8sm5107359wmr.40.2022.09.22.01.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 01:04:44 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Huacai Chen <chenhuacai@loongson.cn>,
        Arnd Bergmann <arnd@arndb.de>,
        Huacai Chen <chenhuacai@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     loongarch@lists.linux.dev, linux-arch@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH 1/2] Input: i8042: Rename i8042-x86ia64io.h to
 i8042-acpipnpio.h
In-Reply-To: <20220917064020.1639709-1-chenhuacai@loongson.cn>
References: <20220917064020.1639709-1-chenhuacai@loongson.cn>
Date:   Thu, 22 Sep 2022 10:04:44 +0200
Message-ID: <87czbnhm1v.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Sep 17, 2022 at 14:40, Huacai Chen <chenhuacai@loongson.cn> wrote:

> Now i8042-x86ia64io.h is shared by X86 and IA64, but it can be shared
> by more platforms (such as LoongArch) with ACPI firmware on which PNP
> typed keyboard and mouse is configured in DSDT. So rename it to i8042-
> acpipnpio.h.
>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  .../input/serio/{i8042-x86ia64io.h => i8042-acpipnpio.h}    | 6 +++---
>  drivers/input/serio/i8042.h                                 | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>  rename drivers/input/serio/{i8042-x86ia64io.h => i8042-acpipnpio.h} (99%)
>
> diff --git a/drivers/input/serio/i8042-x86ia64io.h b/drivers/input/serio/i8042-acpipnpio.h
> similarity index 99%
> rename from drivers/input/serio/i8042-x86ia64io.h
> rename to drivers/input/serio/i8042-acpipnpio.h
> index 4fbec7bbecca..d14b9fb59d6c 100644
> --- a/drivers/input/serio/i8042-x86ia64io.h
> +++ b/drivers/input/serio/i8042-acpipnpio.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> -#ifndef _I8042_X86IA64IO_H
> -#define _I8042_X86IA64IO_H
> +#ifndef _I8042_ACPIPNPIO_H
> +#define _I8042_ACPIPNPIO_H
>  
>  
>  #ifdef CONFIG_X86
> @@ -1665,4 +1665,4 @@ static inline void i8042_platform_exit(void)
>  	i8042_pnp_exit();
>  }
>  
> -#endif /* _I8042_X86IA64IO_H */
> +#endif /* _I8042_ACPIPNPIO_H */
> diff --git a/drivers/input/serio/i8042.h b/drivers/input/serio/i8042.h
> index 55381783dc82..bf2592fa9a78 100644
> --- a/drivers/input/serio/i8042.h
> +++ b/drivers/input/serio/i8042.h
> @@ -20,7 +20,7 @@
>  #elif defined(CONFIG_SPARC)
>  #include "i8042-sparcio.h"
>  #elif defined(CONFIG_X86) || defined(CONFIG_IA64)
> -#include "i8042-x86ia64io.h"
> +#include "i8042-acpipnpio.h"
>  #else
>  #include "i8042-io.h"
>  #endif
> -- 
> 2.31.1
