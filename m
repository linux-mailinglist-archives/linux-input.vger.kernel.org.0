Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 116B44565DB
	for <lists+linux-input@lfdr.de>; Thu, 18 Nov 2021 23:47:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231264AbhKRWue (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Nov 2021 17:50:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbhKRWud (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Nov 2021 17:50:33 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ABEDC06173E
        for <linux-input@vger.kernel.org>; Thu, 18 Nov 2021 14:47:33 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id o15-20020a9d410f000000b0055c942cc7a0so13599649ote.8
        for <linux-input@vger.kernel.org>; Thu, 18 Nov 2021 14:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lujsZ0IKNJaA5lx9661QkFiRqemsKwUYnfhaEJr6j9Q=;
        b=eURB1mlKTADaw1xiFWVW/aCYXRNv2ZpmcNqxZVjtSNnpKK6IVo/sZCXn9TMNYFZfD4
         oNYQjKMK++P0cWVkTW5Sa7foIfy+3J47VnKYhHuZfFq4gcIn9fg3Q0QMgLL51gGZmaU9
         di6RuRLKypg1GYyXe5JxkQInbNdW7la+Njru+iOW++lrOkCZ6SQ7aJR2T9FkarOcyTYx
         Ht6jGSOpQgOLy1sZlqCE/mH5yuC99iWMzBhincPjNz8oPmwIlz1EnpgAPSxtqOx/l5gL
         E1DRZdJkBcvo1icLFDYhcyKhAB1REZKUKC8VcEMSL2JCJzh23Lhy1Pdog2LZOdo9Pheh
         yjmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lujsZ0IKNJaA5lx9661QkFiRqemsKwUYnfhaEJr6j9Q=;
        b=uSE6C1pRIdDLHVRhhAg6ljnALzBT892wMz0OB/XNrVojzHYVGQSi8Q7Qe8IY4SEykn
         jtOCNlltDWQxDDsOj2aPpuCnsTjSwujcz8LXfhprhQzEbuDgYfrqi6bss2+SSX4VKoY4
         83TmrUpRvM4Zqk3Y3gnO4Xs7+tx5EmSb1Ov4om+e9T79U27wkf1LSLsNuN6tyIOyNmsJ
         t2PnhzHPniSQ06njyyYFiyUcHqyw152P2eiPBy08TemFYq16NSkC37w3SvL9BnSI7PpM
         GYSggNOgRsf2V+9zJR58b+dZrvEpdjKPNBEz/RQbU/sB6SmnMUO5oYqXaBGDdjfnj+af
         wrbw==
X-Gm-Message-State: AOAM532OJnB9CnqqVCwHkTLsxPoTXO/X52W/Zy26Dp6oXg/JXU7WX07C
        PFI5uKHr6kAZjztPsz7NlO9QiQjJFfZXL1Xf03RtqwgL77l3jQ==
X-Google-Smtp-Source: ABdhPJz4kH2OVTcugqn/S3qYrYQsVGaVamB9oR3h0cT9tc6hTm+QSq25T3rUJZ+u8dr3/eljhT39jN1nCjaAECVYT94=
X-Received: by 2002:a9d:a42:: with SMTP id 60mr659216otg.179.1637275652442;
 Thu, 18 Nov 2021 14:47:32 -0800 (PST)
MIME-Version: 1.0
References: <20210625113435.2539282-1-linus.walleij@linaro.org>
 <20210625113435.2539282-2-linus.walleij@linaro.org> <YPtpHg2aoGlULuQQ@google.com>
In-Reply-To: <YPtpHg2aoGlULuQQ@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 18 Nov 2021 23:47:20 +0100
Message-ID: <CACRpkdafREE31xsLHoNYciUn_+mPxoD21325LHkrObRZqFzSXA@mail.gmail.com>
Subject: Re: [PATCH 2/2] Input: zinitix - Handle proper supply names
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Nikita Travkin <nikita@trvn.ru>
Cc:     linux-input@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Michael Srba <Michael.Srba@seznam.cz>,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry, sorry for late reply!

On Sat, Jul 24, 2021 at 3:13 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Fri, Jun 25, 2021 at 01:34:35PM +0200, Linus Walleij wrote:

> > +     /*
> > +      * Some older device trees have erroneous names for the regulators,
> > +      * so check if "vddo" is present and in that case use these names
> > +      * and warn. Else use the proper supply names on the component.
> > +      */
> > +     if (IS_ENABLED(CONFIG_OF) &&
>
> Why is this check needed? The of_property_*() are stubbed out properly I
> believe. We might need to check that dev->of_node is not NULL, although
> I think of_* API handles this properly.
(...)
> > +         of_property_read_bool(dev->of_node, "vddo-supply")) {
>
> If we go with this I do not like using of_property_read_bool() as this
> is not a boolean property, but rather of_find_property().

These comments are fixed up in Nikita's respin of the series:
https://lore.kernel.org/linux-input/20211027181350.91630-4-nikita@trvn.ru/

> However maybe we should use regulator_get_optional() which will not give
> a dummy regulator? Still quite awkward, a dedicated API to see if a
> regulator is defined would be nice.

I guess the option would be to get all four regulators by name and
optional, but then we don't detect if more than 2 out of 4 are missing.
Not sure, it feels like we have less control over the supplies then.

I guess it sadly gets ugly because making mistakes in bindings is ugly
in the first place.

Yours,
Linus Walleij
