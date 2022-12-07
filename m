Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 426E9645083
	for <lists+linux-input@lfdr.de>; Wed,  7 Dec 2022 01:41:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbiLGAlo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Dec 2022 19:41:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbiLGAlk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Dec 2022 19:41:40 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AA452A262
        for <linux-input@vger.kernel.org>; Tue,  6 Dec 2022 16:41:39 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id j4so26340980lfk.0
        for <linux-input@vger.kernel.org>; Tue, 06 Dec 2022 16:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MLAv/CuM8O6c9GbDE3QXsAN/Y7ZvoLxL8a9LScg67T0=;
        b=PjvQd+vqIZYOa1d9KjPwwxhCF3tf/imvPdb792Ocr30Kqf26qT4gACUuhW/q2UADew
         B1slDmQAiz9yW1rSgidjqiDHDGCekzlEXKbnwN50kpHQTt1SYx53s1EAFUEg5FMbKu7p
         23Rx5NVJRj0wVtLpidj2dRwxEk8vB+wBGLGR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLAv/CuM8O6c9GbDE3QXsAN/Y7ZvoLxL8a9LScg67T0=;
        b=XJUYOkfQk92b/zHqwuokmV74Pry5d/4wy733W5gYEGlEyWX+4jh1WeWeDrnrKs6dxx
         cXCm5G7OUWP9P+wC54NurcFfmN0HqYKsIYZ1GOw2wPvpF4B+Df9LaSX7wi6zj6K66tBh
         MZQ2JCOu6QDDTq/OoNc7cKIvBEU3o0sVn0BAHIIXXuCx8qXeE6zP+IRdsihF5/BvhVQi
         EG7UFS5Huz42xpo60pHBL19bnGQtoIGb6FOh2LiIT4EfiABDMTcoJfYijmxCii3aIUz0
         RmDGHsbrZD8QcssduD/o62fhJpvENNLCly8WxsAB2iy1si8geWCR0iHzVyakxk9eSlPU
         y5Jg==
X-Gm-Message-State: ANoB5pkJ0QHRk3ueFoavMS+llGlOnFlIqVUpgMCwMqskZ8Cn9rfeK4Oq
        rX4dalB583YaP8tIbmLqS8UqP8sDba3NbVG8hUUj5g==
X-Google-Smtp-Source: AA0mqf4++SyZ/S7ef/0ZByIziGzN6gRBAaW6nAx6w6SWlr3Aq16h41TGV+f/5kGNAHydarixZ44WHH4UsNDlvfA4/Vk=
X-Received: by 2002:ac2:4838:0:b0:497:c370:470b with SMTP id
 24-20020ac24838000000b00497c370470bmr28502168lft.309.1670373697749; Tue, 06
 Dec 2022 16:41:37 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 7 Dec 2022 00:41:37 +0000
MIME-Version: 1.0
In-Reply-To: <20221204180841.2211588-4-jic23@kernel.org>
References: <20221204180841.2211588-1-jic23@kernel.org> <20221204180841.2211588-4-jic23@kernel.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 7 Dec 2022 00:41:37 +0000
Message-ID: <CAE-0n51kjGYrU8S1eYq3cVToO_ywQZE1dnsg2zgeARHkH4VLmA@mail.gmail.com>
Subject: Re: [PATCH 03/32] Input: cros-ec-keyb - switch to DEFINE_SIMPLE_DEV_PM_OPS()
 and pm_sleep_ptr()
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <jic23@kernel.org>,
        linux-input@vger.kernel.org
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Jonathan Cameron (2022-12-04 10:08:12)
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>
> SIMPLE_DEV_PM_OPS() is deprecated as it requires explicit protection
> against unused function warnings.  The new combination of pm_sleep_ptr()
> and DEFINE_SIMPLE_DEV_PM_OPS() allows the compiler to see the functions,
> thus suppressing the warning, but still allowing the unused code to be
> removed. Thus also drop the __maybe_unused markings.
>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Stephen Boyd <swboyd@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
