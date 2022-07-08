Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C847A56BAA3
	for <lists+linux-input@lfdr.de>; Fri,  8 Jul 2022 15:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237610AbiGHN2U (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Jul 2022 09:28:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237549AbiGHN2T (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Jul 2022 09:28:19 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64E292CC8E
        for <linux-input@vger.kernel.org>; Fri,  8 Jul 2022 06:28:17 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id dn9so32430510ejc.7
        for <linux-input@vger.kernel.org>; Fri, 08 Jul 2022 06:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=m9WVXbkDJLtZC6olxtUbRFTPOOp7yjkrqp9x2/VUb9k=;
        b=VKwkclyYjAhTg8dlqMvNrZ+3Ykn5Ytw/eFWV/vSC+1XdiSw+3CdLH1yAxoqWsIcJdQ
         NRNZprgLz8UEYnI/B15Dxc3qmxR1o2+eHgSzTsQDnqFYkX2jGwWvQ5QqU39Eqoukx8nR
         mEyH3gSH/m5jEK0VAS/M6Qa37h6/n/kFqsgcSrERKrZYkc28qJhVTvn1o1+bM37l9sxy
         L4CKxPT+SNVK5/BCz98HfMjTrdI/+cnUrGKDdDCny1BTc53CK5j1X1GlXJ1bFqLlXBBT
         B584xoudZ5gHfdnCg3YK4nRDL/Q12hxOFYI6cWQ/WlcF5K+p2lWpQ2dkuPhi7XSrCO/B
         7jZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=m9WVXbkDJLtZC6olxtUbRFTPOOp7yjkrqp9x2/VUb9k=;
        b=WWPS+FylCmNb8gegFCoIs9m8X7dOWZ0P3AHCGhMHlp8IjRAjqjJm1cy2LiBAKRhj+Y
         BAK7CUDlwfzFRVZZoei90D8pHpNk+j4TSKE7JiI/mOzZmCA+w1OxOd4ed/WIwyyhp1uh
         coBiCiEs/l4Nq4LKrz7TNi2sZ7SoUK/GWlQbeSpvDPxsecckVoOPCB0RjQDHcH/4B9vI
         hsCb4rXcAeAgdR2LkGtL9jPoqQdtL/ttqdwmRUNyYqDrSpNWbzkkW2YUSB+QQXf8lQ3U
         sBJUMd4qQIY48ACspIAOYSxY+qaoV5hd1fYyGmDGhJBekqn4M58UIg71unf9FLSEHVXy
         nrbg==
X-Gm-Message-State: AJIora8GCcSh4NmluheevIxUSZeA6v8SBag7MRsdSYyY98s9vuWRYuf2
        1LDNwCEjKeNATKeixpG82hvcCX6tBMV8XE6xny+3dw==
X-Google-Smtp-Source: AGRyM1u1PFamNCZgncPVIkAWV6ivSfJgSKEN+GTn1zW6Ogyj0JGUNmoBgwrz2oApIcZRb+y8xHcD/VigW89l9cVx8cg=
X-Received: by 2002:a17:906:739d:b0:722:e94a:24c5 with SMTP id
 f29-20020a170906739d00b00722e94a24c5mr3575057ejl.734.1657286896011; Fri, 08
 Jul 2022 06:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220708093448.42617-1-nuno.sa@analog.com> <20220708093448.42617-3-nuno.sa@analog.com>
In-Reply-To: <20220708093448.42617-3-nuno.sa@analog.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 8 Jul 2022 15:28:05 +0200
Message-ID: <CAMRc=MeqbxE_e+cLD_ouyzZKFirqmfU5fs16jp5tP=igYqALJw@mail.gmail.com>
Subject: Re: [PATCH 02/10] gpio: gpio-adp5588: drop the driver
To:     =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc:     devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Input <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jul 8, 2022 at 11:34 AM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:
>
> With commit 1c18af5f21cc
> ("input: keyboard: adp5588-keys: support gpi key events as 'gpio keys'"),
> the irchip functionality is directly supported in the input driver as
> the main goal of these pins is to be used as gpio keys. Hence, this
> driver can be removed.
>
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> ---

Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>
