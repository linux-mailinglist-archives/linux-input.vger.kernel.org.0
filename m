Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2308622E6E9
	for <lists+linux-input@lfdr.de>; Mon, 27 Jul 2020 09:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgG0HuA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Jul 2020 03:50:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbgG0HuA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Jul 2020 03:50:00 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00805C0619D2;
        Mon, 27 Jul 2020 00:49:58 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id k71so8798103pje.0;
        Mon, 27 Jul 2020 00:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HhIDh5Hx27FTVnTfWMP3UANCkbwxny8/a15rEFriMYg=;
        b=qSKI9QTIVnlWHPnZx/oZulFmEZuP+u00joILTApKVVfP8s8yOV9YqDxlWAUO5yHFRZ
         +GS4TjL2cTBKGeoTyNVVBx1rnsHKcPP0+cHUOMhMsjBjoC4Fp0St0V6WOdKcHWE3a7qY
         uBuoUliduYJmBTAK5v4zBrqqhFQl9sD9/AAWfSRvwNPOxyUS8btYqgX4mjC84N2qLcaA
         AGn7/vABnbyl3VYcHiBYvEwUWuv8YJXVoaPeEXT7L5npeTKE9SRyUmOSV8t9X66GNovS
         ThzJhhTB2NqIDsg3ULQ7+1AV9S1UOREuUFckafPO97cbrkHJwl/HhP1AkxRHz5x4hXOI
         2JaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HhIDh5Hx27FTVnTfWMP3UANCkbwxny8/a15rEFriMYg=;
        b=mG04y1v7f55elE7Br1wzKu+uY7M9EurmetBZMsIPaPeXuWfAgUFSrS1jkD/sRh7XKG
         IchU4agWjIGTDJzV6Nav0cLQY/0D/fBdOqeZcc/liK8relTpJaIN+zV/KnjtNK3Att1r
         aYCINdELA7i0t04ULn9r34DmQdWYRxwejo5nIyvjYhyDk75abuGWv2IgDfygMznxUeS6
         dkYC/EGL+0W9VcUbRXbr3NLmbSciGiLQhdHL9wvBA1UHqDer/55S2CN4DwpqYdjmv67T
         zvF/Hc+/U4FibwI7CI/5wpxuoE5250PStZf7sWhVBcuzL7STQaDAFrz82hYUhE0FLyOQ
         33Zg==
X-Gm-Message-State: AOAM530JHKQAHZIokwweT/BGycAU/pz2hMzp75YC9BrAR6KHPvFiEOqc
        ezKdDDogz2V2lCrp9f1IDq6BECR6RdapYPklubM=
X-Google-Smtp-Source: ABdhPJyPnB6FMtVB5Q9bd2CIaxCVWPVOup1tHBVKZLnpG1UbzQLvIgKLF9H89TgmFXZDcF6RR6t7SbG6MhniZDPpst8=
X-Received: by 2002:a17:90a:8985:: with SMTP id v5mr2061101pjn.181.1595836198458;
 Mon, 27 Jul 2020 00:49:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200717114155.56222-1-hdegoede@redhat.com> <20200719225649.GA4341@khazad-dum.debian.net>
 <20200722054144.GQ1665100@dtor-ws> <20200727005049.GA10254@khazad-dum.debian.net>
 <f67ede61-c9d4-6abc-9b59-a5b2b615d1b6@redhat.com>
In-Reply-To: <f67ede61-c9d4-6abc-9b59-a5b2b615d1b6@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 27 Jul 2020 10:49:42 +0300
Message-ID: <CAHp75VdvhC5HJ-BjqjDxU_Z_7_i8MV5UDN4FgWHvZfSD5=smqg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add 3 new keycodes and use them for 3 new hotkeys on
 new Lenovo Thinkpads
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Darren Hart <dvhart@infradead.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andy@infradead.org>,
        linux-input <linux-input@vger.kernel.org>,
        Marco Trevisan <marco.trevisan@canonical.com>,
        Mark Pearson <mpearson@lenovo.com>,
        Christian Kellner <ckellner@redhat.com>,
        Benjamin Berg <bberg@redhat.com>,
        Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jul 27, 2020 at 10:45 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 7/27/20 2:50 AM, Henrique de Moraes Holschuh wrote:
> > On Tue, 21 Jul 2020, Dmitry Torokhov wrote:
> >> On Sun, Jul 19, 2020 at 07:56:49PM -0300, Henrique de Moraes Holschuh wrote:
> >>> On Fri, 17 Jul 2020, Hans de Goede wrote:
> >>>> This is a simple patch-series adding support for 3 new hotkeys found
> >>>> on various new Lenovo Thinkpad models.
> >>>
> >>> For all three patches, pending an ack for the new keycodes by the input
> >>> maintainers:
> >>>
> >>> Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
> >>
> >> Do you want me to merge all 3 through input tree?
> >
> > Hans, Daren, Andy, what do you prefer?
>
> Taking all this upstream through Dmitry's input tree is fine with
> me, but this really is up to Andy and/or Daren.

Fine with me.

-- 
With Best Regards,
Andy Shevchenko
