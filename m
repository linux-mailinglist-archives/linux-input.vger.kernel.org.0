Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF4841F6670
	for <lists+linux-input@lfdr.de>; Thu, 11 Jun 2020 13:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727973AbgFKLSu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 Jun 2020 07:18:50 -0400
Received: from condef-01.nifty.com ([202.248.20.66]:50869 "EHLO
        condef-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728014AbgFKLSt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 Jun 2020 07:18:49 -0400
X-Greylist: delayed 528 seconds by postgrey-1.27 at vger.kernel.org; Thu, 11 Jun 2020 07:18:48 EDT
Received: from conssluserg-06.nifty.com ([10.126.8.85])by condef-01.nifty.com with ESMTP id 05BB6OUg009306
        for <linux-input@vger.kernel.org>; Thu, 11 Jun 2020 20:06:24 +0900
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 05BB5qnx030522;
        Thu, 11 Jun 2020 20:05:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 05BB5qnx030522
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1591873553;
        bh=Z6mErzgADy1W4xnRSK8XzwQH8dT4V+lF4n/qwopigKg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=UHaD0XZbq0U4zrKKFEpMRtKpW6vlSd7zscIjTDbYzt/e8smseAR+8RkNiKfI9jaJk
         HJwGgp4CaE5gK4CjvGUBnbpG0aE7EP78T6tgC89AFwC9YNOyeD0Bz6LxncXq4eMKHB
         0fbovKNXRoUcdee61vH50vAV6uFBT5WZgYSW9KoyGJULZCxxiZ8EiYIdswEyYiyk25
         s73mQfIU2zN6+iSDc7IY/h+5WMIHbMfoIM8rrgTDs5wyBLj7F5lmkWmWzSdCmvTO/0
         qLWmYLldzal7BlZjLp37NYZ3371L94jIrhQ8d2VPxNcOXwoau1oxoke4uo4gRHrvDD
         C1W0QzPVx5P0Q==
X-Nifty-SrcIP: [209.85.222.54]
Received: by mail-ua1-f54.google.com with SMTP id 59so1956266uam.7;
        Thu, 11 Jun 2020 04:05:53 -0700 (PDT)
X-Gm-Message-State: AOAM53374xT3zkfaQ9hag9LvQ/QPIfG/Gug9oDHUi7W1WIaJfCbWPvax
        iULJwBefokHj21ab0VDU7WoMkDHP+kKaHLGZ2LI=
X-Google-Smtp-Source: ABdhPJzW2sMhVjXctonLV5znGoBTj46fBxKHnxcsDXobKRWVzaKE52M6VoTyQ1K8nTeDjHFlLA/esj2bFGctkAdAjL4=
X-Received: by 2002:ab0:156d:: with SMTP id p42mr5998538uae.121.1591873551924;
 Thu, 11 Jun 2020 04:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200609100643.1245061-1-arnd@arndb.de>
In-Reply-To: <20200609100643.1245061-1-arnd@arndb.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 11 Jun 2020 20:05:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQo-cmpwBDC0t1+tAKL+j0eYPQc3ZZjcKcqdZA06eSRPg@mail.gmail.com>
Message-ID: <CAK7LNAQo-cmpwBDC0t1+tAKL+j0eYPQc3ZZjcKcqdZA06eSRPg@mail.gmail.com>
Subject: Re: [PATCH] Input: joystick - work around "adi" module name confict
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-input@vger.kernel.org, Markus Koch <markus@notsyncing.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jun 9, 2020 at 7:07 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> Making module name conflicts a fatal error breaks sparc64
> allmodconfig:
>
> Error log:
> error: the following would cause module name conflict:
>   drivers/char/adi.ko
>   drivers/input/joystick/adi.ko
>
> Renaming one of the modules would solve the problem, but then cause other
> problems because neither of them is automatically loaded and changing
> the name is likely to break any setup that relies on manually loading
> it by name.
>
> As there is probably no sparc64 system with this kind of ancient joystick
> attached, work around it by adding a Kconfig dependency that forbids
> them from both being modules.  It is still possible to build the joystick
> driver if the sparc64 adi driver is built-in.
>
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> This should get merged through the kbuild tree together
> with the patch that turns the warning into an error, if the
> joystick maintainers are ok with the hack.

Note:
Dmitry picked up this patch.
(commit 751ad34fbad74c3ed4a9ede24764b4253d4faa84)





> ---
>  drivers/input/joystick/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/input/joystick/Kconfig b/drivers/input/joystick/Kconfig
> index 940b744639c7..6f73f02059b5 100644
> --- a/drivers/input/joystick/Kconfig
> +++ b/drivers/input/joystick/Kconfig
> @@ -45,6 +45,7 @@ config JOYSTICK_A3D
>  config JOYSTICK_ADI
>         tristate "Logitech ADI digital joysticks and gamepads"
>         select GAMEPORT
> +       depends on ADI!=m # avoid module name conflict
>         help
>           Say Y here if you have a Logitech controller using the ADI
>           protocol over the PC gameport.
> --
> 2.26.2
>


-- 
Best Regards
Masahiro Yamada
