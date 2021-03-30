Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D03F34E5F8
	for <lists+linux-input@lfdr.de>; Tue, 30 Mar 2021 13:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231370AbhC3LB0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Mar 2021 07:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231529AbhC3LA7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Mar 2021 07:00:59 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 970D7C061574
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 04:00:59 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id 19so13823291ilj.2
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 04:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dowhile0-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e/LuPJKZwCUcXGUS3HICodRy3rwvii3kC6RPpgPFOZQ=;
        b=kacRIccQK4wvnJfuZSglUwanH16+AtQxlf/MwXycAk8ynqewXoo0EJuBMCes1lbFA0
         +MrbkA9r1+NFqFgzTTkxzBIZ9d1K7tQbktbt7vlOTgb/fcCP8FPABTRYDmpu225d5MtX
         k3vICT9E0j5ajh/+E0rEIT3DxhH2/OKBYH70gmPkvTc2Nbcm7wwXalgU3NmHf8ZHm9Zi
         KURpxFMhJ7VC/SLwY8q1JWjwbyloG+mTQJRu+12+1RVtc+yLok00SjsLjhTZKyviu0/0
         K2s/9Z8olRqi08E5RjltxhI70zwElmyi7R8abXM7SPPYjgbHNn7h4CYlljplFMjRHMSw
         d6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e/LuPJKZwCUcXGUS3HICodRy3rwvii3kC6RPpgPFOZQ=;
        b=qHvBvwUig9eeXpTcVzkDEovRiMN4m1fRFZckdxRTQBGHtOS8UB+0xTzqzIOybZhE/T
         YL0jwGE7meIu/82ujCDNYHseuHzWlgje41ELd6PoXAyOIIosF6cSRqlMcGDaImD9SZbr
         6UsfP5WUuG96S7fMdszO4JRri6S/U9+YRblrZkL0LuGa8PUSBwyMlODO9H/485kBLIsC
         7v826OzaZg/I42uBDIU0SR+QSv8AMU9NtQ/fimGs/P7slrKL3iHtN64XZ8/CaTNoGPXS
         etTbWQUp+Tt612/MqK6Ld8bJH7bFkleR9XaM78747RsD7CR/nFcpVI434RUiio/O2qr3
         2Xsg==
X-Gm-Message-State: AOAM533hvcnHuKyYLHR+s+tLkzSYjr9WIrSIdnz52EUMyeV7h7SZ2Yo6
        3sPHGIPy1owrdSlN4GBeD6y93G9dLfxK+GDEQLKzqwGicDC/Qtqs
X-Google-Smtp-Source: ABdhPJz039ByRWamfiadjI6Cn75ghLOYD4B7VPF3qX2JFmZMRRsSLOFk8o5tLIPxaxgJjhfEsVScK1WYhxomMjP4Km8=
X-Received: by 2002:a05:6e02:12cc:: with SMTP id i12mr25592982ilm.10.1617102059117;
 Tue, 30 Mar 2021 04:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210330085424.2244653-1-linus.walleij@linaro.org> <20210330085424.2244653-7-linus.walleij@linaro.org>
In-Reply-To: <20210330085424.2244653-7-linus.walleij@linaro.org>
From:   Javier Martinez Canillas <javier@dowhile0.org>
Date:   Tue, 30 Mar 2021 13:00:48 +0200
Message-ID: <CABxcv=nLvyCmtKr14Mj=38zdX6P3y5-MNqqLM48+CPMt3hKLrw@mail.gmail.com>
Subject: Re: [PATCH 6/7] Input: cyttsp - Set abs params for ABS_MT_TOUCH_MAJOR
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Ferruh Yigit <fery@cypress.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 30, 2021 at 10:54 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> The driver is certainly reporting pressure in
> cyttsp_report_tchdata() with
> input_report_abs(input, ABS_MT_TOUCH_MAJOR, tch->z);
> so we should also advertise this capability.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Reviewed-by: Javier Martinez Canillas <javier@dowhile0.org>
