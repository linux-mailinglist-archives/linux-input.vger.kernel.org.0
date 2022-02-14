Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C08D4B5E0C
	for <lists+linux-input@lfdr.de>; Tue, 15 Feb 2022 00:09:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbiBNXJa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Feb 2022 18:09:30 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbiBNXJ3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Feb 2022 18:09:29 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A1621AE714
        for <linux-input@vger.kernel.org>; Mon, 14 Feb 2022 15:09:21 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id e140so31545677ybh.9
        for <linux-input@vger.kernel.org>; Mon, 14 Feb 2022 15:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lkRtOUn0U8KHyzFmAKGI25lR6urpYRwASLIKSqZTje8=;
        b=K7M1AVeFEpwu2navk8yzvnzySUSvn6+2sqdRynkTbg4jGuo/jto6EHOVWdacjJn2w1
         RYu8sW6IMZJYRHlSa/PAhVVLtPh7kMuvIqiKwnRrtM1sMgxHOut+nVjRzshYjzG4Bw7E
         xNpHjBxWpxYb6hyACIocu76a2QWvyGzvutfBQRD0y0MY7On8mm123vCCOQyp9s74s4ar
         62WE00aKOrIpn9v/g38gwRm4PgUde/NbNYvwCTrR+T0RaoCk8XitDE/HxMoG+lclugC2
         K8oWW4mynqKAYLZVJ1BV5rWDjZU2Ps0mzzBscDQzXjvDqjDiHv0hK0uC0e4POkZBZIjb
         qp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lkRtOUn0U8KHyzFmAKGI25lR6urpYRwASLIKSqZTje8=;
        b=G6gZj0ZVIkfuN13GmbujDBZOxjXbIkoDyiIyyp8eBFqlzUZTpyfDMoCPfto/PaJRXP
         r0o+EMb5p67jf8p8PUQcliv02IwTuuU6TNBdTyVDTEKDZAHNJeybze3rnYRM5cgTiRvd
         x6QC7HoFjlJWTYa/qLgjauMmdKqe5PcofAYYL/Ic0TPR2P6xdUSUVxn+DIduJ0oJBqZU
         g6CYUY7QcGhHagzl9Nc1De8SID4L7OzNCWEg4QvMYTev8Nw083pWcL1UvBf+mljbArOJ
         ldjlIqxH6RWBkieT2P0G6UJ+nckz3Za4X8fPNppLwbhXXVWxrfkMQPGxTQ+F8MnCp5aS
         MtPw==
X-Gm-Message-State: AOAM530BA4fRX7CMgd5KVbcKVleBJc6ioI7oTNn3OEDFHKW2kWAOMsK3
        IHHX+ZV53QXfdrNbObp4c1V9agBJylOMRdzPuWrTdYPFB1+CqQ==
X-Google-Smtp-Source: ABdhPJy79LoO5gwhCLWyisi1qCStwavDdZga5QS+8u5l0eL3scD55d5oXMuwyOEt7N5alKHhKFeWCp0ZEYB+D3KfbwY=
X-Received: by 2002:a5b:f4b:: with SMTP id y11mr1298790ybr.634.1644880160540;
 Mon, 14 Feb 2022 15:09:20 -0800 (PST)
MIME-Version: 1.0
References: <20220213225235.812864-1-linus.walleij@linaro.org> <YgreMDuxQLKoKmo7@google.com>
In-Reply-To: <YgreMDuxQLKoKmo7@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 15 Feb 2022 00:09:09 +0100
Message-ID: <CACRpkdaw1yb4F7KriZdVPgN-bdA5_bCDu3vJv0J3pLuvb5N_xA@mail.gmail.com>
Subject: Re: [PATCH] Input: zinitix - Add BT404 compatible string
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>
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

On Mon, Feb 14, 2022 at 11:56 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> On Sun, Feb 13, 2022 at 11:52:35PM +0100, Linus Walleij wrote:
> > This driver works just fine with the BT404 version of the touchscreen
> > as well. Tested on the Samsung GT-I8160 (Codina) mobile phone.
>
> What about all other compatibles that we added to the binding document?
> Do we need to prune them or add them to the driver?

The binding document is for any operating system and any touchscreen
so we should not amend it for any Linux-related reasons such as
not having implemented the driver for them.

That said we can certainly add all of them, the only reason I added
just this one is because I can test it and make sure it works with
the driver.

It's a bit of taste, maybe it is better to add them all so people can
easier test if they also work with the driver (which I think they
will mostly do).

I'll revise the patch and add all of them.

Yours,
Linus Walleij
