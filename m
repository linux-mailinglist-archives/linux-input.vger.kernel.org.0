Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 623437907D3
	for <lists+linux-input@lfdr.de>; Sat,  2 Sep 2023 14:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233448AbjIBMgW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 2 Sep 2023 08:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232331AbjIBMgV (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 2 Sep 2023 08:36:21 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DFAB10E4
        for <linux-input@vger.kernel.org>; Sat,  2 Sep 2023 05:36:18 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-55b78bf0423so354603a12.0
        for <linux-input@vger.kernel.org>; Sat, 02 Sep 2023 05:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693658178; x=1694262978; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ff1EF+REprO4LHaL62AYjvodoxlE3qLUS2PFpiCsR68=;
        b=eJjU0YaE7c6XC9GFT/JA7UvUkSwCLlKBtMAwwkDe5TwNog3w6A+yKgfOWm4kCYY+pZ
         wcr5zV01A8ABUD9AvDI+YJ05oyaUQGdw4kXfdoyuiGRaF6gs6uncaXRBNhQwEpacJPm2
         LCQ6RwwwQN3fDZVMO4RNlxBj8OWuaZUZbSqJOrwyL5f1a3nPH10iaIbRA3vApUjievDE
         PBBZqybKqHjebPwVewlJJa3YiRAMhh3aOMlaKNvEuhvhUbbFQoyi6Tyxd/cVwVON+PpV
         LrXFoNETlAQisp67Fk/VHdhh0kpGkBu65TRCVzwVRoaB8+o3yU6WPK3uF06xURAZlRnf
         jHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693658178; x=1694262978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ff1EF+REprO4LHaL62AYjvodoxlE3qLUS2PFpiCsR68=;
        b=W1FMpfXuaDhvBcWTHRycQ6eI9KMez28Hs1lbYxX6PALQdCgQUc3PoBvuDy3ZzCWZAd
         WnV8x4sbfzE8p6QiC/T/yRhuVDCkbfQZh7LjLy6uzHl/YBva1+FYV7y/GKh5yxhq9PfW
         9POA05dwgzTh2roDf25rzmUgqH8i13qB7cpPPYYhtfrtoChgiBKKOucUlIYBlwxNjKx6
         3pAjjKJjrM1gw5UutQHD7qQwS0FpMbDVsrU71Z6kFbKWpAXJzoFd9/Pe1YKbf8Mr3Knv
         wS+/L6ndKHb0B8pcmP34GuIqzM18pqDz5ou2PoQX4obVJkuOTjtM9CSxZPANKbRfgsx5
         dv9Q==
X-Gm-Message-State: AOJu0YyTT+kSnGQOV14HcuBeJOqSiNMav2IQjXdSfvd5QECCSO6G/3CV
        qBn4k+1AbZq89AUZ3iLsUxlRliyog/+eIuVaCdpvG/ZiNDCg/g==
X-Google-Smtp-Source: AGHT+IFHqmBL54s2uNeJXx1Epg1giL7xvHmxedJ4Bq0g6Km4oxpt7hAnCd0xgrsyfbMEOsbACuHA2KGXWOU5VEvrERw=
X-Received: by 2002:a17:902:d505:b0:1c0:bf60:ba4f with SMTP id
 b5-20020a170902d50500b001c0bf60ba4fmr6205034plg.4.1693658177826; Sat, 02 Sep
 2023 05:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <27ZF1I9PL9SUH.27UHPHBWRZ1LC@homearch.localdomain>
 <20230720233150.57164-2-tinozzo123@gmail.com> <38NABT0Q0GDC0.32EJOTLAGT0T2@homearch.localdomain>
 <CAKst+mAnPmLLCCdJWQdz2d=dUZmuUHNxT_+rs+R_Z7981hS7xA@mail.gmail.com> <2XDNP3MKLE5L5.3MQT6EJ99UJBR@homearch.localdomain>
In-Reply-To: <2XDNP3MKLE5L5.3MQT6EJ99UJBR@homearch.localdomain>
From:   Martino Fontana <tinozzo123@gmail.com>
Date:   Sat, 2 Sep 2023 14:36:06 +0200
Message-ID: <CAKst+mBUwqMQcY3bAT=rTSMJrmXAzQizL6OWXUkUi8hjmb=12Q@mail.gmail.com>
Subject: Re: [PATCH v2] HID: nintendo: reinitialize USB Pro Controller after
 resuming from suspend
To:     Silvan Jegen <s.jegen@gmail.com>
Cc:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi

Is this patch (alongside "cleanup LED code") expected to land for Linux 6.6?
I'm asking because I can't find the patch in `for-next`.
https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/log/?h=for-next
(Since it's my first patch here, I don't know if it's supposed to be seen
there.)

Cheers

On Sun, 23 Jul 2023 at 20:58, Silvan Jegen <s.jegen@gmail.com> wrote:
>
> Heyho
>
> Martino Fontana <tinozzo123@gmail.com> wrote:
> > It is my first patch on the Linux kernel, so I just did kinda what I
> > would do on GitHub (amend and force push).
> > What should I do here in case of trivial adjustments?
>
> I would leave it as is and only respin this one if either there are more
> comments on the old version or if the maintainer tells you to.
>
> BTW, just as a heads-up: posting an email reply at the top of the quoted
> email (aka "top-posting") is frowned upon in the Linux mailing lists. See
>
> https://people.kernel.org/tglx/
>
> for some pointers regarding netiquette.
>
> Cheers,
> Silvan
