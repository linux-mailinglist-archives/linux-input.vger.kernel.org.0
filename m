Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A280E04D8
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2019 15:22:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729146AbfJVNWK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Oct 2019 09:22:10 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43953 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387598AbfJVNWK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Oct 2019 09:22:10 -0400
Received: by mail-pf1-f196.google.com with SMTP id a2so10650550pfo.10;
        Tue, 22 Oct 2019 06:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nYx2NKitaTBhkEd7A3BVsynzutbsRDInsCzGOV0d+wk=;
        b=TlyziFZT5RLehXqmdvxj1TDbM1hyj+gyvT6iZeEWyw3pVyPZfwIX0eGMY5hjnizA05
         FmtNRE/ycgUMmExPlgVmGxgk+0JhgldYV8hLWi288tPwss7VSdaWCeyJwbhK8Kp3Dqyx
         RzldWSSXx5/RPJes/EiLHAXhmtsFWC9Rygfdqw04w1J5FJhF4owDtVR6I75XLmgHbLU7
         YkEHMTfW3udCHlzo6nabzsjckrzV3A1XiKKmaFg5YkLEOjAwUrufxoaHinaSiSIqP5R6
         Zp4Tab95ppzxiDOhwBi6EZ6uSYMcoBdt/k5xCA2VGjqEZcUQ+vMlO6IBgwVthpy5iCeJ
         k4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nYx2NKitaTBhkEd7A3BVsynzutbsRDInsCzGOV0d+wk=;
        b=FcwiRm47gAhQq63JIwFaLR7kCf6it/7N0uDqfrWBz9OJNh+m78Vr37X9PwxsyLE3pU
         Rax394q8OTy4XVCcuuUFmwVb966a7y0/o1/NgMBJ04WZuosNYB/4Kqn1+2+pEaMphMbz
         dUs5x2CZYqDynxb/o0oEKmbKPQr9pWVYVeUcYliml/8Q1DsDLNXxpkbGJVn8AKUCJIO4
         NOgBMyYVOieXmt5XJnMmlRlMCXUmTXKoIx20w7vW6L71cbueUr7ZCBVLn3BbAz+kLsGS
         crSlOkDRplXqRc08wbD7N/Bhk9KSec7WgZGLHNH7LbCAf7X+U13yrzGNWW5j+68gvx79
         cBkg==
X-Gm-Message-State: APjAAAXurO3x5AsGPH4XwIWP9zWmisXxfLudrXJEbUf4HiEFDUlFCE33
        0YWgjZuOeF/X2EXuuhZVL8ewfj8anwsUucrbnzU=
X-Google-Smtp-Source: APXvYqzy3DVWpwMk3Bk3QDR4FyPhDqB1w0DKLmum9LIZMNaQK1qchKfZ4Ipxkn3Vz1nnPS77aRvLK+yeeK51Y/vk+EY=
X-Received: by 2002:a62:2643:: with SMTP id m64mr4139659pfm.232.1571750529070;
 Tue, 22 Oct 2019 06:22:09 -0700 (PDT)
MIME-Version: 1.0
References: <20191017204217.106453-1-dmitry.torokhov@gmail.com>
 <20191017204217.106453-10-dmitry.torokhov@gmail.com> <CAGngYiWq9Xw1MMh6eoFjX0rB8utusK8jNrho59BgHpwUV31e+g@mail.gmail.com>
 <20191021212710.GU35946@dtor-ws>
In-Reply-To: <20191021212710.GU35946@dtor-ws>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Tue, 22 Oct 2019 09:21:58 -0400
Message-ID: <CAGngYiXTB8xec=zZeUKdNqLEUyGnDsDk2YKsV8+q_XN_sHOeuA@mail.gmail.com>
Subject: Re: [PATCH 09/22] Input: apanel - switch to using polled mode of
 input devices
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Brian Masney <masneyb@onstation.org>,
        Enrico Weigelt <info@metux.net>, Luca Weiss <luca@z3ntu.xyz>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 21, 2019 at 5:27 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> > > +static const struct i2c_device_id apanel_id[] = {
> > > +       { "fujitsu_apanel", 0 },
> >
> > If the driver_data field of i2c_device_id is unused, would it
> > be better to match via apanel_driver.driver.of_match_table ?
>
> This is X86 driver, and the device is instantiated from
> drivers/i2c/busses/i2c-i801.c based on DMI match, so using OF is not
> really helpful here.
>

You're right of course! This driver doesn't even select/need CONFIG_OF :)
