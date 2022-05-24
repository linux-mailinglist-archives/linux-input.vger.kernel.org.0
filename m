Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 987B6532A00
	for <lists+linux-input@lfdr.de>; Tue, 24 May 2022 14:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236172AbiEXMI5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 May 2022 08:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237179AbiEXMI4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 May 2022 08:08:56 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B96836CA86
        for <linux-input@vger.kernel.org>; Tue, 24 May 2022 05:08:54 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id o80so30531020ybg.1
        for <linux-input@vger.kernel.org>; Tue, 24 May 2022 05:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7Rv9jSjobu4ecwCe4SY+uyEkNKXxnSwqT2FnY7ruh/A=;
        b=S3naJZdTQRqK3tOQA7UkOYlULBdxnBHkVsh86OeZ/wYxhgPdBYyiRpettPzxiag2Dj
         p92Cx/XhKiGx6zrEgJn4JgigyXLXuEKHaoylHqDGT4gNvFs35t/+pM9CKfq4uNRorffJ
         xzHygGMzBYRPA6mICxnp7jc5pPvWP0eYD9inPtdzYX9A+YKKGBSpkrQ1/EcTLGT6rT/S
         BoU+ezoVi5WA41eByXi3lqFGjolDl5VAt91jnUjm6n0Pktin5ZZbfshIEtv96YIGy/ei
         cdZobvrp/rCdKDCgXqDYcTLSEyV2IpO/U9uXEdbPSB6llgIa0urxMpprIK9hSFDxb6Lf
         YeZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7Rv9jSjobu4ecwCe4SY+uyEkNKXxnSwqT2FnY7ruh/A=;
        b=ZPOHggqu3gA1i1YkRaoG6XBxkUQ1tXZEm0WeJ/Auw3r8MVXntY0QEuUw3gu4Z6HMqN
         0ib7TZ1lFGH2XMhcKAiqpFKtEtha2AO3/ij/urGPlIEF8VGNq7MCsDnfhnNCZSFV8e2H
         pKG1y5De1olF8P9STx6qqYHvKPWnwEgCreVL+vPKWDeuBHblbCXIcXCynqTzhF7GUZeI
         mWb6ZbFfnaQwGgGFP8zZ5YIVtjvbobLuLHT0HJNuTQLrJ1w5UGXSbVUxjuIR9EuMmIT0
         kNkPkJoT+fNcNhDeDcCJVtWX7k/QUxn1UYCh1wD7V3u+YxAU2BtOBA5lZzs72bRv6n66
         2F9Q==
X-Gm-Message-State: AOAM531Q93gAdkEDrUc0f86kuVRv39JQ8g/SSO5t8UJYOZvXYFnqb0UC
        jOslV9l3kXBBUNu9CAiT7nrmfzCdNZrCuBwTCncS1ZmYqCw=
X-Google-Smtp-Source: ABdhPJy4SRmRzjWEzG27OK5rV1vMmhhDK7hUMtQHiKgHAoNziYbQJQMUEHLcjr1ibcyD12wVn5ryXx95z6gkr+/RzbM=
X-Received: by 2002:a25:e78a:0:b0:64d:672b:af3c with SMTP id
 e132-20020a25e78a000000b0064d672baf3cmr26884435ybh.369.1653394133969; Tue, 24
 May 2022 05:08:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220410120059.2583849-1-linus.walleij@linaro.org>
In-Reply-To: <20220410120059.2583849-1-linus.walleij@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 24 May 2022 14:08:43 +0200
Message-ID: <CACRpkdYsdhLRGVQGk2FrnarY1LC1-aaNB4AUsEV3vm68LYC=mw@mail.gmail.com>
Subject: Re: [PATCH 1/5] Input: zinitix - Helper dev variable in probe()
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Nikita Travkin <nikita@trvn.ru>,
        Michael Srba <Michael.Srba@seznam.cz>
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

On Sun, Apr 10, 2022 at 2:03 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> Create a helper variable struct device *dev in probe() to
> make the code more compact and easier to read.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Anything needed with this patch set?

I'd be fine if we just merge the cleanups (patches 1-3) as a base
to begin with.

Sorry for pushing, I know there may be much to do.

Yours,
Linus Walleij
