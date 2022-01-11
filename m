Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AA4148B92D
	for <lists+linux-input@lfdr.de>; Tue, 11 Jan 2022 22:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbiAKVGe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Jan 2022 16:06:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237067AbiAKVEc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Jan 2022 16:04:32 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B734FC061759
        for <linux-input@vger.kernel.org>; Tue, 11 Jan 2022 13:04:31 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id d3so921878lfv.13
        for <linux-input@vger.kernel.org>; Tue, 11 Jan 2022 13:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G0YuEwCZnEuKRpVHXAiy69Z0RUFspZC8cHSjq2E3Eto=;
        b=qTdZ5dTgpxUc0ZcpidxLsEDi6ERAo8DHppbBJPpYplppIMsdax7ZVx2GfuYIzFUVAF
         +tOQb43S73Rfi+LWRdO6GqUFiE2h+bbbxlz1GZgiPHkf9mKrXq9mbQGbVQjYcaHoJuHR
         zjKucDCVEsS+bhlWpbNRGdhIadDyswENHSVsfF/aA0YxmICNTWyeE97DPl2bXniIluGc
         QMRcF+gyM9f3tcJsd/10oBCG9yaHz6LkVEKNthySqWWZ37KxO3+/qCo5ka3vAc7Ifa2L
         10jO7uyi44Qf/tRw8QyQMaR0qhMT0cICAoWB4iIG/4L6U8KqmgnEIqz+2A6/Jda3r8Uo
         RKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G0YuEwCZnEuKRpVHXAiy69Z0RUFspZC8cHSjq2E3Eto=;
        b=X4kLJULWDlzb/TvCdK3BNnmS08SckXfJxv7taeg+P2/3wIpzsLfR9sXqLk1FwV5lIa
         qM+XDK9WIzse5eRsBMRkKXiNrjlZz68O8gR12CNCRLnlXgCIlIf3FyIoe7MS96GC4o3D
         UOZWg+xHA5L6PRyqhveU9qpRHvKh9XLEoPp7eIq13ywmvjv9ZI51UVtHGw6kbZss/fM3
         TEAikvyxeytzQc99yxpklJNdYwOnRIQJNHliv528GeMvGS0BMzrZ/H2vHaiXzuL75w9h
         XO63ZqMl0Znue4Oru4qF+mGnBxpncaMQUh8Ubz8xQ0IrjatE23t5/xLp//N482GagpUS
         VzxQ==
X-Gm-Message-State: AOAM53160AV0aaRslrgEOezAC26gsfeUfgMikZrNIDQ6jVPq0r7Jh108
        gdaGTdWbD8HVOplSkp5zplP5G+tSufwI2zDLoDqeqg==
X-Google-Smtp-Source: ABdhPJzeO4rualg1booOzsUS3uAdK5sSssH1EAbNZfANOukwZD7t8d8mIVQd3g6cPIbfo7bMnRfW6rPqpxrPZ15ACFc=
X-Received: by 2002:a2e:a5c9:: with SMTP id n9mr3176921ljp.220.1641935069710;
 Tue, 11 Jan 2022 13:04:29 -0800 (PST)
MIME-Version: 1.0
References: <20211217144119.2538175-1-anders.roxell@linaro.org> <20211217144119.2538175-6-anders.roxell@linaro.org>
In-Reply-To: <20211217144119.2538175-6-anders.roxell@linaro.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 11 Jan 2022 13:04:18 -0800
Message-ID: <CAKwvOdk0p98ac0yVLwLiJXndvyJw+Ufpxke2WEVrhyUOftN6=Q@mail.gmail.com>
Subject: Re: [PATCH 4.19 5/6] ARM: 8788/1: ftrace: remove old mcount support
To:     Anders Roxell <anders.roxell@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     stable@vger.kernel.org, linux-kernel@vger.kernel.org,
        woojung.huh@microchip.com, UNGLinuxDriver@microchip.com,
        davem@davemloft.net, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org, clang-built-linux@googlegroups.com,
        ulli.kroll@googlemail.com, linux@armlinux.org.uk,
        linux-arm-kernel@lists.infradead.org, amitkarwar@gmail.com,
        nishants@marvell.com, gbhat@marvell.com, huxinming820@gmail.com,
        kvalo@codeaurora.org, linux-wireless@vger.kernel.org,
        rostedt@goodmis.org, mingo@redhat.com, dmitry.torokhov@gmail.com,
        nathan@kernel.org, linux-input@vger.kernel.org,
        Stefan Agner <stefan@agner.ch>,
        Russell King <rmk+kernel@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

 On Fri, Dec 17, 2021 at 6:41 AM Anders Roxell <anders.roxell@linaro.org> wrote:
>
> From: Stefan Agner <stefan@agner.ch>
>
> commit d3c61619568c88d48eccd5e74b4f84faa1440652 upstream.
>
> Commit cafa0010cd51 ("Raise the minimum required gcc version to 4.6")
> raised the minimum GCC version to 4.6. Old mcount is only required for
> GCC versions older than 4.4.0. Hence old mcount support can be dropped
> too.

cafa0010cd51 first landed in v4.19-rc1, so that lgtm.
-- 
Thanks,
~Nick Desaulniers
