Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 679BF72A516
	for <lists+linux-input@lfdr.de>; Fri,  9 Jun 2023 23:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230435AbjFIVFz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Jun 2023 17:05:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbjFIVFz (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Jun 2023 17:05:55 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26F083590
        for <linux-input@vger.kernel.org>; Fri,  9 Jun 2023 14:05:54 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-565a3cdba71so20277927b3.0
        for <linux-input@vger.kernel.org>; Fri, 09 Jun 2023 14:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686344753; x=1688936753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3r39wuzTsS9xYxplRKTYr5FPCI7llaPoOWnnNkuMMsk=;
        b=oWqsFt8rrI2cTkrMOZDO63fKjzVonN2R6CRpJ4Qpv8VrEC9PwLLRdo6fvIDXzMqbWU
         MCL9JQEYMgGi1cAfDfnBxqXXRhFirceGmIh9iL60Ch2/AzS09A7x84n60XzAcXG7kkvI
         E/dL1t27A+8gqa5n2KAuJdGMzDDLbUwLnwS1Vny61JNzRWzUW4/llupUDpAAQRfdzTSI
         PdezuqxMd5C/VOccVnUEzUHKA3ylazNH9wgPNpzbtXI+5a13GmfJ+e9pKnt5zeTkpwTK
         fw70De7FHPwgvcwqrGfTv48YpBDrha1t7PB3/CxPt1N0DLI0/bwJNVhCnkwN6QtvTav7
         zX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686344753; x=1688936753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3r39wuzTsS9xYxplRKTYr5FPCI7llaPoOWnnNkuMMsk=;
        b=Y/v4pL2qz12+UgfaHdojZoy+2aNAZKI0J13ukNtbrN8+rTdIn6vTXrPGiLIAnn+JYg
         E2y/S9z740SqMtHk6l3GAiQMhE380EoupW3DYAvfU0yTO5Uh7knNvO+wN1N0U0RlC9vA
         BY8PB3BVob5u2eXWuWR9n/uUwUKAApQm6bCN5GsbTRdCw5qKQGw/SpeWk7g5JXHUhclT
         NUByjXwk3fhepqof0Bee78iU+aNqSQrkCen9mh0GCea5puRna9VmF511M7PEurDk/CXl
         n3VdvjvGASzh3xIsA4Vd7wx7cs9B5EmFGI6KgwcuigVfjzMUZbBXFWV6d5LjNkJnnoVU
         a6aA==
X-Gm-Message-State: AC+VfDzyU003EGhKCF5bNkprviYV5diJGmSCxhpOMGvOsDKw4jFZHjCh
        ZcBxMRT9pbZXEyjT+Hw19qShi11qZg+mE8dcZoaoXQ==
X-Google-Smtp-Source: ACHHUZ6zAJw3vwna8czLhvW2LNWOrVkyLLE4YwmYrh3Hvv6IxuJyqP5M/++p7ZXt9nC/2LmuHtMkYzyLbtN5tKWm40o=
X-Received: by 2002:a81:d345:0:b0:559:deed:f363 with SMTP id
 d5-20020a81d345000000b00559deedf363mr2563607ywl.2.1686344753319; Fri, 09 Jun
 2023 14:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230609202722.3634721-1-arnd@kernel.org>
In-Reply-To: <20230609202722.3634721-1-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 9 Jun 2023 23:05:40 +0200
Message-ID: <CACRpkdZhad+Hk-ES_ptx1HFoSv=L2WWcUsS5huGN25fj0nK0iA@mail.gmail.com>
Subject: Re: [PATCH] Input: ads7846 - fix pointer cast warning
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        kernel test robot <lkp@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Luca Ellero <l.ellero@asem.it>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jun 9, 2023 at 10:27=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The previous bugfix caused a warning on 64-bit builds:
>
> drivers/input/touchscreen/ads7846.c:1126:17: warning: cast to smaller int=
eger type 'u32' (aka 'unsigned int') from 'const void *' [-Wvoid-pointer-to=
-int-cast]
>
> Change the cast back to something that works on both 32-bit and 64-bit
> kernels.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202306100442.jStknDT1-lkp@i=
ntel.com/
> Fixes: 8f7913c04f6a7 ("Input: ads7846 - Fix usage of match data")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Excellent fix, thanks! Sorry for not predicting this.

Yours,
Linus Walleij
