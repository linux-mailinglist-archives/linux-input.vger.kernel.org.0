Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4D492F869B
	for <lists+linux-input@lfdr.de>; Fri, 15 Jan 2021 21:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733112AbhAOUYv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Jan 2021 15:24:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728895AbhAOUYt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Jan 2021 15:24:49 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A128EC0613C1
        for <linux-input@vger.kernel.org>; Fri, 15 Jan 2021 12:24:08 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id z1so6201744ybr.4
        for <linux-input@vger.kernel.org>; Fri, 15 Jan 2021 12:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A9RX5qj7rGFsbJXJNhBoN2LaZMygrpZRt1un2PekIsg=;
        b=Lws9KxcTbF/05kFWM5ca/fUUTv9qdz9Gq6nJSPR8gOYdAJJYISEV3k8IiV7U/ca4vK
         FKRCwkcQ5VkxJBYfvm1xiCrIdlm1TNTgMeoHtKxxNQPAVZqU1b7tUfTGWnNyHgtlOaNx
         2iAcfnRu710KgMObu7nfIPrNr9YsQeQ6S13YY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A9RX5qj7rGFsbJXJNhBoN2LaZMygrpZRt1un2PekIsg=;
        b=iXxc+3HVQjKL4H2LOuiU3Yij/tx7PAcM9OuXOyYC1WNc+PACwLs74GZMtOAhxAFH4X
         pbY9dT5ydYY5EqRcyZBTahooAtOqLOD6b2xegBARXwc0rp90dpFqEhCdEkqxzeRxz/fd
         Us1LVv4ThMwxqzwr8K7wOhb4cDiISIPvuMHFFMRamcGdCQHd9PjQ6aD8qtdmeRb+Ra4n
         bGTVmbnsF1Bqxiqm+pis3Urx05Qu7F+TTxXKp2CfkFj04PUiJ0iwK1cXv83lRGyRjwai
         WxapJIEx1KrM5F99lRaGC1I/ZGechPsvd67/WZ80Owp6AYdEFXKq/2bext5GZETRWAub
         j4Iw==
X-Gm-Message-State: AOAM533IIgl4vlnXpXYi/LQCEIG6kbE9PadS7jaJfBiaa/svoERXi8CL
        MnXy4PSorbWqlbf2bII/hmiocZre5K5Iodg68TTPUg==
X-Google-Smtp-Source: ABdhPJzbKp6kvJAB2wHiJiHdtH6OLS0uBJV8n51BolL+iPUV2rkxC1Oi3wvGezDc7Xv/goZFG8cSN0t+ZDBCl2aWpro=
X-Received: by 2002:a25:3a04:: with SMTP id h4mr20270835yba.285.1610742247860;
 Fri, 15 Jan 2021 12:24:07 -0800 (PST)
MIME-Version: 1.0
References: <20210114183010.v6.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
 <161067828422.3661239.16933057782247961610@swboyd.mtv.corp.google.com>
In-Reply-To: <161067828422.3661239.16933057782247961610@swboyd.mtv.corp.google.com>
From:   Philip Chen <philipchen@chromium.org>
Date:   Fri, 15 Jan 2021 12:23:57 -0800
Message-ID: <CA+cxXhnimCistZF6e-7Uxz7aZ2Ugm7yoBPhO9RWzCtCm65xgbg@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: input: cros-ec-keyb: Add a new property
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Simon Glass <sjg@chromium.org>, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jan 14, 2021 at 6:38 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Philip Chen (2021-01-14 18:30:30)
> > Add a new property `function-row-physmap` to the
> > device tree for the custom keyboard top row design.
> >
> > The property describes the rows/columns of the top row keys
> > from left to right.
> >
> > Signed-off-by: Philip Chen <philipchen@chromium.org>
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>
> One nit below.
>
> > diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> > index 8e50c14a9d778..a742b0777ee6d 100644
> > --- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> > +++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> > @@ -43,6 +54,18 @@ examples:
> >          keypad,num-rows = <8>;
> >          keypad,num-columns = <13>;
> >          google,needs-ghost-filter;
> > +        function-row-physmap = <
> > +                0x00020000      /* T1 */
> > +                0x03020000      /* T2 */
> > +                0x02020000      /* T3 */
> > +                0x01020000      /* T4 */
> > +                0x03040000      /* T5 */
> > +                0x02040000      /* T6 */
> > +                0x01040000      /* T7 */
> > +                0x02090000      /* T8 */
> > +                0x01090000      /* T9 */
> > +                0x00040000      /* T10 */
>
> Can we include the header file for MATRIX_KEY so we can use the macro
> here?
Sure.
