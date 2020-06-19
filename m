Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFABB20156E
	for <lists+linux-input@lfdr.de>; Fri, 19 Jun 2020 18:23:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394593AbgFSQWK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Jun 2020 12:22:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389830AbgFSPAU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Jun 2020 11:00:20 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E28DC06174E
        for <linux-input@vger.kernel.org>; Fri, 19 Jun 2020 08:00:21 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id e3so965765qts.12
        for <linux-input@vger.kernel.org>; Fri, 19 Jun 2020 08:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6jQMgzSY4KWxzOGjk3kjhBgIuMt4xSU5jPQFL8NifHc=;
        b=NA1I1n4hgoWZjPUoWs/zcYqk6QgZ0A5f9ERRa2PobhhmbedW1kPEQ+hysyOthQ/Izk
         Y7KOZw28CAK+KQ9wicip8Q/oO6vlHkRZTgxwKHBqA9SvEXp06Kg8eV09OISWnLI1D1gR
         I8YBGDNUibAQL+tmTZOimVZy5TJqveiCuVNpalJPJjtavRh3rK1tbPVaw055oICuh7uS
         Hhw6JRpMdYWLUJMdzADViMNkxKT8Nv4EBhRM3epztxwRP8REg64Pc8eFzssgrp/HBSPV
         caFNIMXXJshD0irwwVjWo6xZxZBDikpSI0KlYqCsHwg/Jn8CrzSXf9PA0x+HL34PVOwS
         Vx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6jQMgzSY4KWxzOGjk3kjhBgIuMt4xSU5jPQFL8NifHc=;
        b=AfI9RY+rOovNOzZV0OqlDxSXwTiwii3hX2osW+OUeA7+zmB7WSuHJVrAblw4AqavKx
         a5Jr7k+f2fBW7NnCacUhkEibCSzMOn99jwc99M1Tq1SjY1iCww/xt4uVRUI6tlCcThMX
         JAK+r8lILeHTrbNy4PCP2ZvIUEOKl4CAtx7zpzCK01qaEo3px/7lX4gOmVG/mPcZVbGq
         wg7C30V8rifdBVSLAEtHFYmsicWWF41+zhJmFdOW7KQFn7QiNeoRaHgGW3uIH3JNMvnD
         6/YfVfTzj993xILyWnPBvxwIuoxJvr/605vv0kXfMRGBzB0rFy/t3lxqtxQid/2UMKSG
         DUbQ==
X-Gm-Message-State: AOAM530rSoXaiUnBhrxFqxCOuftZbgZSce79Cj5+OW9H95S2qm2S1gD0
        Iue3BYoEkBNQeqq6g35ZsCr+SrYg5FOYqslEbG24tg==
X-Google-Smtp-Source: ABdhPJyuiIvI9lfSGWYopAZkwyCivu3i+yTXcXX3GRwO6fHF2y48UEkMZVpNWApqBjfnBJMZuVA1MqCuE49RkQEUt1A=
X-Received: by 2002:ac8:357b:: with SMTP id z56mr3875082qtb.107.1592578819902;
 Fri, 19 Jun 2020 08:00:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200619145759.37941-1-david.rheinsberg@gmail.com>
In-Reply-To: <20200619145759.37941-1-david.rheinsberg@gmail.com>
From:   David Herrmann <dh.herrmann@gmail.com>
Date:   Fri, 19 Jun 2020 17:00:08 +0200
Message-ID: <CANq1E4QJkp7famiAa-HNzHcXOC=TvA13kDmQdPH38OW5JCFOZg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update uhid and hid-wiimote entry
To:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Cc:     Jiri Kosina <jikos@kernel.org>, david.rheinsberg@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi

On Fri, Jun 19, 2020 at 4:58 PM David Rheinsberg
<david.rheinsberg@gmail.com> wrote:
>
> My last name changed to "Rheinsberg", so update the maintainer entries
> and adjust the emails while at it.
>
> Signed-off-by: David Rheinsberg <david.rheinsberg@gmail.com>
> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

In case you want it from this email-address as well:

Signed-off-by: David Herrmann <dh.herrmann@gmail.com>

Thanks!
David

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 465210f17948..e1d82d8de7dc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17390,7 +17390,7 @@ F:      Documentation/admin-guide/ufs.rst
>  F:     fs/ufs/
>
>  UHID USERSPACE HID IO DRIVER
> -M:     David Herrmann <dh.herrmann@googlemail.com>
> +M:     David Rheinsberg <david.rheinsberg@gmail.com>
>  L:     linux-input@vger.kernel.org
>  S:     Maintained
>  F:     drivers/hid/uhid.c
> @@ -18334,7 +18334,7 @@ S:      Maintained
>  F:     drivers/rtc/rtc-sd3078.c
>
>  WIIMOTE HID DRIVER
> -M:     David Herrmann <dh.herrmann@googlemail.com>
> +M:     David Rheinsberg <david.rheinsberg@gmail.com>
>  L:     linux-input@vger.kernel.org
>  S:     Maintained
>  F:     drivers/hid/hid-wiimote*
> --
> 2.27.0
>
