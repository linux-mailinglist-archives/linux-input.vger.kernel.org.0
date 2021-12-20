Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91BB947AB0B
	for <lists+linux-input@lfdr.de>; Mon, 20 Dec 2021 15:10:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233464AbhLTOKB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Dec 2021 09:10:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45484 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233463AbhLTOKA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Dec 2021 09:10:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640009399;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4SU/S7ImGGhUFPPtRruTF21SLhkjh6LbUDIj/NTEz5c=;
        b=V0g66EEIeU4jJP2+CJOiLhnlfdZsdrGgbVOPmQ4nmvDJ0usD8NvFIKcJWtZE0aLs2FI+ci
        jceQJwUtTj0Q9woJTz+REL3vq04xAdWY29LlFhQO/Vtqm8rljyxdjR4OBzKSEKVYXQb3Ss
        UHBpiCKJj2ZcybinbI9JGjYYg/9uxxM=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-ECJz7kSjNJKK7jfNlw_-Tg-1; Mon, 20 Dec 2021 09:09:58 -0500
X-MC-Unique: ECJz7kSjNJKK7jfNlw_-Tg-1
Received: by mail-pj1-f72.google.com with SMTP id o21-20020a17090a9f9500b001b105598e71so7226210pjp.6
        for <linux-input@vger.kernel.org>; Mon, 20 Dec 2021 06:09:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4SU/S7ImGGhUFPPtRruTF21SLhkjh6LbUDIj/NTEz5c=;
        b=NrsQx+fxHc6TzZJAKDoUhY7OCbMvu2GKrPxXlpzmUHDKslutGjrBlhDGL2vhtJrzOx
         JFaWouSMHgmVrV25wX3nlZdBsBbq0nxkecq099K9gLCj+2nt4LY2ZZThIZQdzb+10Uni
         l8Y57CtlPEZ1d6QGVz6R6IZUXbx/9nws1Tz7ztleDRa2+UTAttkk5+OoKcWip1HObAKO
         0W/3iBxaKc43ZefIY+p8EirSf3Vl5S4IOR3dOnbDNCtFwlIbGsUBhSpY7So0WibvgN3p
         zqkRGYlafmfkH8Z5ZZ/pAailtDfhEL9N6Ruz0tUydi+/GInFbmKZIuW7POvQthiql0Ww
         fmPw==
X-Gm-Message-State: AOAM533Gh5BYM5/VM0Y1wh4JUdgRsMv7YST6wFWZDECyE1+RiKWCZ+vz
        ab2OAZzctmtztDiC48puGEaXKQQ2p7zuPpBVsqickLsV4+HlGXvmIwhvPri9vJzW9IipSoiJXXy
        LIrlMrAFXk4bIXziqgkNipCKYi71lAfEiJWwHKq0=
X-Received: by 2002:a63:440b:: with SMTP id r11mr2295438pga.363.1640009396961;
        Mon, 20 Dec 2021 06:09:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5rkAwf2w09eVva9jeeoZoh76LzeD6iApghZd6M8xndWZiAYVOJ/zZCbpNG3YM3a7+VGljuYeg6Ajax/60ZmQ=
X-Received: by 2002:a63:440b:: with SMTP id r11mr2295417pga.363.1640009396682;
 Mon, 20 Dec 2021 06:09:56 -0800 (PST)
MIME-Version: 1.0
References: <e4efbf13-bd8d-0370-629b-6c80c0044b15@leemhuis.info>
 <42903605-7e8b-4e84-fcd6-1b23169b8639@redhat.com> <fc7e6040-b760-02f1-57ef-71aa4b88aea6@leemhuis.info>
 <4366861.LvFx2qVVIh@dell>
In-Reply-To: <4366861.LvFx2qVVIh@dell>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 20 Dec 2021 15:09:45 +0100
Message-ID: <CAO-hwJJxRETn3k0a_bXLMaD7rWNjWM8F9O0sv=jHtZuvJXa4aw@mail.gmail.com>
Subject: Re: FWD: Holtek mouse stopped working after kernel upgrade from
 5.15.7 to 5.15.8
To:     "Tomasz C." <tlinux@cebula.eu.org>
Cc:     "stable@vger.kernel.org" <stable@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Dec 18, 2021 at 9:39 PM Tomasz C. <tlinux@cebula.eu.org> wrote:
>
> Hello,
>
> I haven't had time to test it yet. But I see that another ArchLinux user =
has
> compiled kernel 5.15.10 with this patch and confirms that the mouse works=
.
> Details on:
> https://bugs.archlinux.org/task/73048#comment204441
>
> Is this enough for you as a test?

Yep, thanks a lot.

I have now pushed this to hid.git for-5.16/upstream-fixes with the
updated link, cc-ed stable and also added that archlinux bug.

Cheers,
Benjamin

>
> --
> Tomasz Cebula
> Dnia pi=C4=85tek, 17 grudnia 2021 09:37:11 CET Thorsten Leemhuis pisze:
>
> > Tomasz, could you give it a try please?
>
>
>

