Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65E024CE7EF
	for <lists+linux-input@lfdr.de>; Sun,  6 Mar 2022 01:33:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231350AbiCFAeB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Mar 2022 19:34:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbiCFAeA (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 5 Mar 2022 19:34:00 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD92E4A907
        for <linux-input@vger.kernel.org>; Sat,  5 Mar 2022 16:33:09 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id g26so24131101ybj.10
        for <linux-input@vger.kernel.org>; Sat, 05 Mar 2022 16:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=14bhHr2Oz18mK9MX8HsxUdT3wXs21teZRhs9HgCDyWQ=;
        b=MxeBnTULG7xLPMM53Myaj+W5I0HYO2zU3EyxNc096QpRbZAO63uBFK2NWUAS9ybv3J
         d5qbpuhE5buMKLODW0Sd8feEvaMTQg6Ehwpv4PKRtBCRXOlwmdHZwKvycU3/Oi77+wpq
         YEslgl4ySJbJpE+x8B5oCYP+bsQEqBxqUUKynoN8RNDtNOIXhK6wFIxL3v98dtshprFT
         y3jtCyZ3DsEe029Vy+JVquEbzRYVovfcZpWJWcRYPpn1tTMXUUoNDiXf3kjRH0LTgVL6
         nvoLC71fDdtAXPpE+soCGd4/630SxeNCft+67PEfwrzeR12NizkmjpiiDLFlD4i9fGaC
         hzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=14bhHr2Oz18mK9MX8HsxUdT3wXs21teZRhs9HgCDyWQ=;
        b=r4YeW2bfigsPsx4S8JKcfJdsShuvw5OwsIYzMeU/VeiIaI3HJReMrHc3EZ7xiVqCDH
         37zlAhSRlKBJXfNfIAeWEXPppy2GK6vz2dr1G1BWZDaii+7uJnYplK+aldsDSZnrW7TP
         Gf0pbfcTKeMb0ml12FNc9GjWqV6hW4jOWXKBd+yvu6nZ0UNHr5CgKLzyknAZYdee3+i9
         VjduqHRmzTc3VP1umh2I+XRoAju+BNh3EfxlNwjV+95UPRffDDFn+A1P6/i9Ki1ErT/U
         mTZDBw7JipjWnmtBSVZXensr5WgKmQBa5a+dtAg4Ht/+ULd2VNSljfkdfPvRbKbM4Zwp
         6uxw==
X-Gm-Message-State: AOAM532dejyApDvd4OcAsfzb8bAD5v/zEVd3Rh+gi7NW1UgkzlQSDoHD
        nTU4s5tCkuiWKoOjNROpxp0yFZM2DETA8y4MZWOSrg==
X-Google-Smtp-Source: ABdhPJy1WFWkQCwo+U67VHLywFfGWJriZBc3RcEIOQw7wof1bl/AjHqoFjid/5jE51r6CYyhxSjBSpHwIN5E1I6tw30=
X-Received: by 2002:a25:ad87:0:b0:628:7be1:f10e with SMTP id
 z7-20020a25ad87000000b006287be1f10emr3750083ybi.514.1646526788935; Sat, 05
 Mar 2022 16:33:08 -0800 (PST)
MIME-Version: 1.0
References: <20220228233017.2270599-1-linus.walleij@linaro.org> <YiLHyOQw/Zp+IQ4+@google.com>
In-Reply-To: <YiLHyOQw/Zp+IQ4+@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 6 Mar 2022 01:32:57 +0100
Message-ID: <CACRpkdZpESVJ4EE9g1DP__o1ZdMT=-mFM=36DLQ5L_BW8DVZVQ@mail.gmail.com>
Subject: Re: [PATCH v3] Input: zinitix - Do not report shadow fingers
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Michael Srba <Michael.Srba@seznam.cz>,
        Nikita Travkin <nikita@trvn.ru>,
        Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Sat, Mar 5, 2022 at 3:15 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> I actually liked that we iterated over individual contacts here. I took
> the liberty to rearrange your patch a bit, could you please tell me if
> the version below looks OK to you?

Looks good and works good, gave it a spin on the hardware to make
sure!
Tested-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
