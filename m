Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA55268C8C
	for <lists+linux-input@lfdr.de>; Mon, 14 Sep 2020 15:51:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbgINNvD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Sep 2020 09:51:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726776AbgINNuC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Sep 2020 09:50:02 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6131C061788;
        Mon, 14 Sep 2020 06:50:01 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x123so12685475pfc.7;
        Mon, 14 Sep 2020 06:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qINGFtSPWGNrqHNXnCfgs2pWvwknYld67sOTbOuVcak=;
        b=Ez0tNCcm8W9613bR67t6HRCE+7qfpUwATfnund6fwPuBwQlQkGXIjmzul3DaLYwfeb
         Evo6JD1jzaDQ2EOc6ABed9p/dh6V3Ts7qsHw1RsMOD0rnKFRUU7nNdCABRbS1MBh00FC
         bRRDIoYcJXdAjTpvojrWof9f7BnQsq4hroqfm3Pa6ODgZFqasEW0VCNocXZTY/6HliiN
         2dVSZYeiw2EQnJtzBkvpq0XN/COmtkug2u39DipSmziYxvyW8XyaOORKKO9Dox1ahaT9
         jtEjMZFXCGGiwqXBGZ7j/gvIGoFm/456QNy/NCG9ean5lCSS1pu/zbAJy35JYRnbAbvK
         0dqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qINGFtSPWGNrqHNXnCfgs2pWvwknYld67sOTbOuVcak=;
        b=hnlO18QVAz5FXslSCrdxd+9iPICQYyHV1kAkMhDV0pSjU2P4U+XtKydb36xxenznKR
         Kii8cyKCmg0Bn7uaFu94HDzYVneswi2TIJBM6bHigPUhjs8ODMAS/WaPaINf33NoKxjJ
         gUsVbcLaepJHrJAtSqXWH+pcJJARzjwSbELtmK8Y2XpOLruSnixSsfXEQsaD0BHJZIDx
         Mqno+CnT/eeOx5fYFmfbJwzFd5TMMsfUsFnUbSnGFrkmTqZiUh+b9MPhK0AQiSMdG7lE
         +AzMSsAOxNRtntO92nyUSB4C2b0JcjiAkSN05fSVUKnkoGRkRMKuh+gR3MMSdahD61Lk
         EX5g==
X-Gm-Message-State: AOAM5304RRKdH4GYHnsTm9Xo6/by33EZHaaH1Ld+U7IXVKCQA59atHHE
        FeTiiRUjncSdE6GXkWRVzf/3DAN5aL/gGWAl7zE=
X-Google-Smtp-Source: ABdhPJxe3hIIeHpn/2J/uMtRoQFCrer+CBkXfv0sNfItbc2DD0UzyJVYdKXNZpi83JeZBl9gGSZ2UKFdU5AGItVYLEE=
X-Received: by 2002:a63:d648:: with SMTP id d8mr10896689pgj.4.1600091401279;
 Mon, 14 Sep 2020 06:50:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200908151617.12199-1-jiada_wang@mentor.com>
In-Reply-To: <20200908151617.12199-1-jiada_wang@mentor.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 14 Sep 2020 16:49:43 +0300
Message-ID: <CAHp75VdD3NoesXsxk=v8ghr+wtV4XXQLyY881ob0uzvhJTa=HA@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] Input: atmel_mxt_ts - implement I2C retries
To:     Jiada Wang <jiada_wang@mentor.com>
Cc:     nick@shmanahar.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew_Gabbasov@mentor.com, Eugeniu Rosca <erosca@de.adit-jv.com>,
        Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 8, 2020 at 11:11 PM Jiada Wang <jiada_wang@mentor.com> wrote:
>
> From: Nick Dyer <nick.dyer@itdev.co.uk>
>
> Some maXTouch chips (eg mXT1386) will not respond on the first I2C request
> when they are in a sleep state. It must be retried after a delay for the
> chip to wake up.
>

Same comments as per v2.


-- 
With Best Regards,
Andy Shevchenko
