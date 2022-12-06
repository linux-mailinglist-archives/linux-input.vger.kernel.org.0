Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 141BE644FC6
	for <lists+linux-input@lfdr.de>; Wed,  7 Dec 2022 00:44:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbiLFXn7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Dec 2022 18:43:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbiLFXn6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Dec 2022 18:43:58 -0500
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A5F13FB9E
        for <linux-input@vger.kernel.org>; Tue,  6 Dec 2022 15:43:57 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-3c21d6e2f3aso168964367b3.10
        for <linux-input@vger.kernel.org>; Tue, 06 Dec 2022 15:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=58GMQ7mIr2Cbqh3Ln9PFxX6WoiPZEZVfmfYsjE/5Rf0=;
        b=BgiSOLxCkOtc3CpQE+6tCiGHHzfpLpt0PM2W/RSivPtEVWsDq4rs0jz4EI4tSYdPka
         vZeE0Ccpiz7s04kw3YwVjyV8cS4KjPm4xd6wWZOGUV1Im39oHBjtc4n8uU89liAn2WTI
         MX5OeKfQfzK3EHcomzSOFoFX45s+7UMJlkiBMvKucKc8bDbGuXuEOJqZOBLLGf5Ql8wK
         E0Ej0pKzoUE1VmgxoVJ73rfncAn7FJV3wPC4mkXz7Mm0ZVSNfTEvENTGZsOqnXCDw8kh
         HmudoNdVNGXqW6TqF8y8rD4T9EIPkdcHOkXzS3igg5G6oLG6PRS+lfkjzCioqWTHULVi
         r6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=58GMQ7mIr2Cbqh3Ln9PFxX6WoiPZEZVfmfYsjE/5Rf0=;
        b=NxYWy8mMAeL1gOIbr58wZwHQuq5otA1EjLquGKuCGEpk5h6xR9xOxjmYBDnZRk6kON
         iPT/+D6LhOL1kSoO/7m9G734cxT8EIL0aV+wuYyR36viwggHJbFGSrL/hQpl6ucuXQrX
         Ok0PNSxZvL1tG28S6MvY187vFYegn7eofixluPDFrUsO9J+I3RgzlRkvq4ZcQX9OWBLZ
         Bci2RG5PBSB7VeYrXYV9YfAfBSzyiQ61nNLgcLmcabtX3htao77So91M8YmbyqCqaFnp
         Y+rG0OQbLZckNhZybSBHYZ/GxnVeQnY4BAKe0MVkZdnnP8ucv+9ruDBzha774qQ2z9Of
         Uu1w==
X-Gm-Message-State: ANoB5pk2oEqdM+NuYpmXx+ugF63gTTG0K0PTMtBF/D+2DQUMVY2mnXVF
        aAd0IrhdWNIRs9WWc1oRPDiRz14AwVk5S37Kd9IJLA==
X-Google-Smtp-Source: AA0mqf62LA7iS40VWtMpTWzEhgpQAb7qTVnW3RvNxnETbiq0YgZdQ4Lc4DHeNYEevZRykPT2sqTZaBhRY5Fv0C0wvuo=
X-Received: by 2002:a81:b8b:0:b0:3d4:532a:753d with SMTP id
 133-20020a810b8b000000b003d4532a753dmr29342931ywl.343.1670370235063; Tue, 06
 Dec 2022 15:43:55 -0800 (PST)
MIME-Version: 1.0
References: <20221204180841.2211588-1-jic23@kernel.org> <20221204180841.2211588-19-jic23@kernel.org>
In-Reply-To: <20221204180841.2211588-19-jic23@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Dec 2022 00:43:43 +0100
Message-ID: <CACRpkdYLjtycHYbpcFj1O0cHPvd_ViY2JQLjJBLrhr_vr0gu2A@mail.gmail.com>
Subject: Re: [PATCH 18/32] Input: nomadik-ske-keypad - switch to
 DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Dec 4, 2022 at 6:56 PM Jonathan Cameron <jic23@kernel.org> wrote:

> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>
> SIMPLE_DEV_PM_OPS() is deprecated as it requires explicit protection
> against unused function warnings.  The new combination of pm_sleep_ptr()
> and DEFINE_SIMPLE_DEV_PM_OPS() allows the compiler to see the functions,
> thus suppressing the warning, but still allowing the unused code to be
> removed. Thus also drop the ifdef guards.
>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
