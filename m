Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77416EE208
	for <lists+linux-input@lfdr.de>; Mon,  4 Nov 2019 15:19:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728097AbfKDOTk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Nov 2019 09:19:40 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:35241 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727861AbfKDOTk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Nov 2019 09:19:40 -0500
Received: by mail-il1-f196.google.com with SMTP id z12so2959363ilp.2;
        Mon, 04 Nov 2019 06:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lF1WE1isaBjDr+TMSOi18bgjGXsXpz2MAkSlnPFM5BM=;
        b=tp4VYwNTyrIbMsMDKBZMr0U1v1tpkzNfA6hg8iB3X4E+qmlzTt7ygvAGhuuifV84lr
         nfMseSsvQQAnAr5vgX6pUnRZz0PBQEoNcNZfYZlQDdznGJKUwoBlmcDNev/OzWnjfgoe
         Fm/zQ7VEucGrqD0wO//NWdSc+Zg6Ff+J6XfLqXnEmQD0NcJAw2rqhJ+RCNtWniSIXdhV
         OI8iJcY2x3UFci7Lgd+zT3TBTZS6OaGlaDQgAR1g7CznZksADbGM+OdrbpOsjiDZaJGd
         tXNzxQn+qVLxDQQA5k47VOji8Ih8fkPKg07AdHNITnrvjhrjJYUqgrR+sv3HLRJVX6NR
         zXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lF1WE1isaBjDr+TMSOi18bgjGXsXpz2MAkSlnPFM5BM=;
        b=JJ1PnlkacMFV5dtv6MrKxRNDEcggpQWc6obg0OtZCL/cZkpof78wlAwGyKOQuY69ZN
         z85LdcHIC+rmYJpoi0wN7BVxU/fIQdtVHtr2acWcPaM8s5ISz7i8f6Cqn1fxXgenWyWi
         q26jFqz0tz+rbGtG7NPcsC1JS64tGqHKTNkbdoLYPOmoMYnz0Chn30vHlnpnP3vl3PpL
         /iUYvWqcg/zx3MdJ4/KQAH066M6ZZQ7QOQ5SGbQPPrl6lBHhtPqzgu/a7FCPZhVUDDVc
         U9J7vxHDzOfwhnV2r/EQbAWWrH8D7TphEN5wPGXmXCQdhK2tSgnaGcNde76kPYeV+z6a
         EOSA==
X-Gm-Message-State: APjAAAUSrDmJ/VhKhwjhlkSEyL8u4Z/cHjxpJXKhO2okN+QKYmhylvWP
        DoT56FXXMnT8ZHTNaKtnaVw4oImmNE2ZQqgvEVU=
X-Google-Smtp-Source: APXvYqyrBchjwhSoha+V5PjVcj9qJMDkIexcW0zjXh+uZ5qirAamQ4EPo2ARC6NJ77ISTRwnIbbz398vQcaAwYQMY/s=
X-Received: by 2002:a05:6e02:c2c:: with SMTP id q12mr29091298ilg.205.1572877179288;
 Mon, 04 Nov 2019 06:19:39 -0800 (PST)
MIME-Version: 1.0
References: <20190302141704.32547-1-marex@denx.de> <20191101204801.16328-1-TheSven73@gmail.com>
 <20191104070116.GM57214@dtor-ws> <CAGngYiV_eP0M48Ei8K+uNWb_yW1Yi7C_E5M6O9HpJmrnxkmvyw@mail.gmail.com>
In-Reply-To: <CAGngYiV_eP0M48Ei8K+uNWb_yW1Yi7C_E5M6O9HpJmrnxkmvyw@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 4 Nov 2019 08:19:28 -0600
Message-ID: <CAHCN7xJmJH1gqnE1TBi7hEYnhg0aV8TOW8==QxXV3CEOOk560g@mail.gmail.com>
Subject: Re: [PATCH 2/2] Input: ili210x - add ILI2117 support
To:     Sven Van Asbroeck <thesven73@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Marek Vasut <marex@denx.de>, linux-input@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 4, 2019 at 7:49 AM Sven Van Asbroeck <thesven73@gmail.com> wrote:
>
> On Mon, Nov 4, 2019 at 2:01 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > Can you please tell me what device you have? Do the patches work for
> > you?
>
> I have an ILI2117A/ILI2118A.
>
> I'll try out the patches today. I'm stuck with a 4.1 vendor kernel, so
> I'll need to backport the (patched) mainline driver to 4.1 before
> I'm able to test.
>
> I wil try Marek's patch, and Dmitry's rebased patch from
> https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/log/?h=ili2xxx-touchscreen
> and let you know the results.

For what it's worth, I tried the 3-patch series from that branch on
5.4-RC5, but the ts_calibrate and ts_test_mt do not appear to receive
touch info.  They execute when I 'export
TSLIB_TSDEVICE=/dev/input/event0' but I don't get touch data.

If I do a hex-dump of /dev/event0 and it dumps data if and only if I
hold my finger on the touch screen for a while.

I'll try just doing the 1st patch to see if it it's any better.

adam
>
> If the problem with Dmitry's patch is located in ili251x_read_touch_data,
> then using a ILI2117A should work fine.
