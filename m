Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D0D667947F
	for <lists+linux-input@lfdr.de>; Tue, 24 Jan 2023 10:48:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233471AbjAXJr7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Jan 2023 04:47:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233590AbjAXJrz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Jan 2023 04:47:55 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84EB212587
        for <linux-input@vger.kernel.org>; Tue, 24 Jan 2023 01:47:50 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id iv8-20020a05600c548800b003db04a0a46bso782913wmb.0
        for <linux-input@vger.kernel.org>; Tue, 24 Jan 2023 01:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LQWReM02pk5ikJk5yBcPaS3tkIFvok/z2z0JtHvtopU=;
        b=qoyzSERFmFhyIyP6/heaKAHeE6FAy2+gEtxAebubzUKyJZRM3MM0NDPU/KfZGTx8ie
         BKfX4RGrNbCCa1MuFdpjUnbg4j4uOAbv3N2sm6KwWEaRE8P9BCwSp3iV6+wbUAwXZxYl
         Qb42xKL1IcUHQ+H5BUaYZD3FcLF1HRxwsJTTGSFDlIRT4HolpezC0+3s4dyK7xGpBqI3
         dVX5KrC5kb8koemtnwdrrbdGCyr1J9e8ESrI+v7oppxZnktRgVImp8BkTC6TS8UHMOlW
         ugPVYiVyTOdU+RcpOXVXsS2Xuk+7v+1stsaafH3K10nu4oonpyBJhPWYuuNFi03lUBGF
         SJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LQWReM02pk5ikJk5yBcPaS3tkIFvok/z2z0JtHvtopU=;
        b=vc4BXP51enhRxcpMYf36NXJPBmjM7ZQwQc0etYoj+EUNjQ9+lQCmbiZ8tiLhDZ3FJ1
         N5SDqjH7ocpaRIlZa9HHgjAlUnCDv/iRU3PI9OT4Op3nT+Zakvyg0J78SFeKd5Q76WlA
         ELrGKz3Ua96UywPaud4P01OZq8rr1WKfH6CuUZG0ZRKW1m6Hk3AnDlkM4uCq6Vu/5rqm
         ZB9ZUqN3f//in5Yotd7uok5s5QqU7zdAqPwGU32i7qVh8munhzWOQPIqxnKY1fHdo58D
         tZtkg9i0fzMloVkNZyvoq48eEGBsvV54ws03Lj305oMFNvfpyBi4vc5MnPTM/akGlRoh
         xHww==
X-Gm-Message-State: AFqh2kqct/7CTFo5tjTgZFs/lJ5nuO492L6mmy/Qm2NclmG7LHtdlQfk
        9B4p5ISK5rpIrIc+qvuGUDnUJg==
X-Google-Smtp-Source: AMrXdXttI4ZJMWNbKF3dyf600VKGQhEjUfDrJ+febMWIRS9se2X2zpB56FswpqF3fUDGqYKOFkqjVQ==
X-Received: by 2002:a05:600c:35c1:b0:3d3:5319:b6d3 with SMTP id r1-20020a05600c35c100b003d35319b6d3mr27066611wmq.38.1674553669041;
        Tue, 24 Jan 2023 01:47:49 -0800 (PST)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id o25-20020a1c7519000000b003daf6e3bc2fsm1631899wmc.1.2023.01.24.01.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 01:47:48 -0800 (PST)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Sebastian Reichel <sre@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] input: cpcap-pwrbutton: remove initial kernel-doc notation
In-Reply-To: <20230113063831.16469-1-rdunlap@infradead.org>
References: <20230113063831.16469-1-rdunlap@infradead.org>
Date:   Tue, 24 Jan 2023 10:47:47 +0100
Message-ID: <875ycw2ri4.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jan 12, 2023 at 22:38, Randy Dunlap <rdunlap@infradead.org> wrote:

> Change the beginning "/**" in the file to "/*" since it is not a
> kernel-doc comment. This prevents a kernel-doc warning:
>
> drivers/input/misc/cpcap-pwrbutton.c:2: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * CPCAP Power Button Input Driver
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: linux-input@vger.kernel.org

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  drivers/input/misc/cpcap-pwrbutton.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff -- a/drivers/input/misc/cpcap-pwrbutton.c b/drivers/input/misc/cpcap-pwrbutton.c
> --- a/drivers/input/misc/cpcap-pwrbutton.c
> +++ b/drivers/input/misc/cpcap-pwrbutton.c
> @@ -1,4 +1,4 @@
> -/**
> +/*
>   * CPCAP Power Button Input Driver
>   *
>   * Copyright (C) 2017 Sebastian Reichel <sre@kernel.org>
