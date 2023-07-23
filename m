Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1424E75E43F
	for <lists+linux-input@lfdr.de>; Sun, 23 Jul 2023 20:58:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjGWS6G (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 23 Jul 2023 14:58:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjGWS6F (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 23 Jul 2023 14:58:05 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D320BF3
        for <linux-input@vger.kernel.org>; Sun, 23 Jul 2023 11:58:03 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9939fbb7191so767880966b.0
        for <linux-input@vger.kernel.org>; Sun, 23 Jul 2023 11:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690138682; x=1690743482;
        h=user-agent:message-id:in-reply-to:references:from:subject:cc:to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=O9Iw62QkqU1proJeh+wz//sHyRfBgf79RluOn1k1h1o=;
        b=JeUUW74dBQ5xFT2xYyffwydEfFnDahZxBwuL/6MpC9hb93Hx+o0bHU6nor93FQ+m9f
         klPgO/4evxapCwqZ8bIY1gQjvBAo7mPAUrLHzxsc4AED/NL0QWwVtgOxNCHBoFLkMVhm
         yPS/DQ+TXM6H4RdrsqHQJc2NZcUo4yBMgCA7zn5g3D2OFGfAappUQthUntYRJLjyLzpp
         nryTuLP2cE4Mxyg6oNmT040qqfSTr73BA/zvmWCdANR7Xify6mxIUEnDiy3y1N9uYviW
         CNJHocIZIwycMISzgud9PEwEQgXpADJo3bihAySLQDkgVg4/fHbV9FgsgNlt+cGid95M
         cuoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690138682; x=1690743482;
        h=user-agent:message-id:in-reply-to:references:from:subject:cc:to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O9Iw62QkqU1proJeh+wz//sHyRfBgf79RluOn1k1h1o=;
        b=CwRhwvW4BKWO7UOy+ujTQCAc2sW1zbSXFwLUSDOPGcJIDb9GSsdyR2fvugx5aBVpHP
         8Yi9LdgpAG8lfpRrDqOufHE5RiOKviWsxVcC5/FoNWpUg2geexy8BOXzoRz7+pFc2E11
         wihKhWfmnaWSodR+uehGXK6Vgt6U6IMHKoABd73NTS8eFmAj5sNMJGs33ow6491/goxp
         1QyTftzvqSghQrFBPQv52jqA5inNcsm9Lxs25TAFAcG4NcEeRS3LSJQfOcref2ma3kpC
         jra3KJaTGhLC9u04cTpQs43spjqZh7QxNGjZ4RilsRj7N/dDVQq+HkZymhMda7hXzEVy
         HHiQ==
X-Gm-Message-State: ABy/qLbXrB0lzb2sl27Dp/F7Ypw9xDirTuqqLzUDnSeWIBZexJa7N8F1
        CkHUte0Ec4POCqDaNUgmW2Q=
X-Google-Smtp-Source: APBJJlE/R22CCX501vVKRF6g6I8S6jjADVwdiYcod6gNcffaKDlVJt2nlTiXY3ZmWMq90Ch225LLAQ==
X-Received: by 2002:a17:906:3107:b0:997:e836:6bb with SMTP id 7-20020a170906310700b00997e83606bbmr8144355ejx.14.1690138682068;
        Sun, 23 Jul 2023 11:58:02 -0700 (PDT)
Received: from localhost ([2a02:169:1e9:0:8f4d:9ee2:cc35:c67b])
        by smtp.gmail.com with ESMTPSA id u19-20020a170906c41300b009737b8d47b6sm5432697ejz.203.2023.07.23.11.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 11:58:01 -0700 (PDT)
Date:   Sun, 23 Jul 2023 20:58:00 +0200
To:     Martino Fontana <tinozzo123@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH v2] HID: nintendo: reinitialize USB Pro Controller after resuming from suspend
From:   "Silvan Jegen" <s.jegen@gmail.com>
References: <27ZF1I9PL9SUH.27UHPHBWRZ1LC@homearch.localdomain> <20230720233150.57164-2-tinozzo123@gmail.com> <38NABT0Q0GDC0.32EJOTLAGT0T2@homearch.localdomain> <CAKst+mAnPmLLCCdJWQdz2d=dUZmuUHNxT_+rs+R_Z7981hS7xA@mail.gmail.com>
In-Reply-To: <CAKst+mAnPmLLCCdJWQdz2d=dUZmuUHNxT_+rs+R_Z7981hS7xA@mail.gmail.com>
Message-Id: <2XDNP3MKLE5L5.3MQT6EJ99UJBR@homearch.localdomain>
User-Agent: mblaze/1.2-21-g48dd346 (2023-07-08)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Heyho

Martino Fontana <tinozzo123@gmail.com> wrote:
> It is my first patch on the Linux kernel, so I just did kinda what I
> would do on GitHub (amend and force push).
> What should I do here in case of trivial adjustments?

I would leave it as is and only respin this one if either there are more
comments on the old version or if the maintainer tells you to.

BTW, just as a heads-up: posting an email reply at the top of the quoted
email (aka "top-posting") is frowned upon in the Linux mailing lists. See

https://people.kernel.org/tglx/

for some pointers regarding netiquette.

Cheers,
Silvan
