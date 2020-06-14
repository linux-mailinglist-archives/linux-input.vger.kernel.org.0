Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 301281F8814
	for <lists+linux-input@lfdr.de>; Sun, 14 Jun 2020 11:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbgFNJ14 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 14 Jun 2020 05:27:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725265AbgFNJ1z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 14 Jun 2020 05:27:55 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2CAAC03E969;
        Sun, 14 Jun 2020 02:27:55 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id s88so5763260pjb.5;
        Sun, 14 Jun 2020 02:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lUhVNgMNBvLuhdDecLJTYJjP1POR5VFuzoz3PWt0le8=;
        b=TUy+QXvXeae7GFe0vxOs9GdhXkWBMRIwEBMfm9hsC+nteuz4EU3Zh3garNhl+/URl9
         Se6npddwZirvj8b5fHp/1ateoUpnJBgnmFZbDwRDEVZ+uWRM7cKCNueGUGCaydmIhwmR
         YrjH2KDK/q6Fk8SVlms8KQV9KUHWpYkvv8zZrd2kb33FS5AoX4C2FemwLCU5RSC2/xvX
         ZzkoJZ+Dn8S2k+lama944RWnrT/fd0w6swlS4ufph0RQovf0kemGJCi/bD59pVzkJYCy
         GqGIFL2zj4gJjwLThkg0hoeR5EgHmP2TqoSrDYpgIakVIVg67ZxOcrClXpj1e7ljurqd
         LIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lUhVNgMNBvLuhdDecLJTYJjP1POR5VFuzoz3PWt0le8=;
        b=jqcF1kefE0QFkonxA11BeBvy9ku+oDleS7VJWo3IpvMSaE6I75YH+7s1J+/9GNydJo
         8c0/0pipgMbzhqYglbjolgZVcdkM2J/+A1W0rN8x+pAc7yTqQEeWychH4Pn3T8a3je4l
         j83uRmF3rJrb/0CW2/12WymDuf/D4/9pPgypYlyKBiVPRWQxKikt8J240+qqNznrFffx
         8x+cTGkyTSBSaoDOWpYTkx9C7XcgqY10qH7V/lh7pD/13GaX+CpFwrDLv4jTBPiNctvW
         2UvnhjJKKiAt5CzjFNpElemPilr+qKMrqt/GbzMA9QRTx8cbv1+9HtjBQ0KRCi46vWyy
         sBHg==
X-Gm-Message-State: AOAM533Jgz7O2kldoxCLSbSARGcskKzqMkwhqC94b8qUPsaxzGcqZFAp
        T3ACtqjOGUew+aaa8hbxoio9ILxej9SMkbOAH4M=
X-Google-Smtp-Source: ABdhPJwKTTsWDfZbGYxTeCV5+JEMpSW1omIM1ULCCqN9ZPaclDUPdmv4B323Cu7Np5rOaeOkBXj9DF+PgUMXpmGYa48=
X-Received: by 2002:a17:90a:220f:: with SMTP id c15mr7131529pje.129.1592126875196;
 Sun, 14 Jun 2020 02:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200614055604.67969-1-navid.emamdoost@gmail.com>
In-Reply-To: <20200614055604.67969-1-navid.emamdoost@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 14 Jun 2020 12:27:38 +0300
Message-ID: <CAHp75VcuRvaQwcTP0+Y+QJTvjoEzYTvV40coUxnsZPfWnwcNMg@mail.gmail.com>
Subject: Re: [PATCH] Input: bma150: fix ref count leak in bma150_open
To:     Navid Emamdoost <navid.emamdoost@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Bakker <xc-racer2@live.ca>,
        =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Navid Emamdoost <emamd001@umn.edu>, wu000273@umn.edu,
        Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Jun 14, 2020 at 8:58 AM Navid Emamdoost
<navid.emamdoost@gmail.com> wrote:
>
> in bma150_open, pm_runtime_get_sync is called which
> increments the counter even in case of failure, leading to incorrect
> ref count. In case of failure, decrement the ref count before returning.

...

>         error = pm_runtime_get_sync(&bma150->client->dev);
>         if (error < 0 && error != -ENOSYS)
> -               return error;
> +               goto out;

So, what will happen in case of -ENOSYS?

...

> +       pm_runtime_put(&bma150->client->dev);

Slightly better to use _put_noidle(). (More consistency with error path)

-- 
With Best Regards,
Andy Shevchenko
