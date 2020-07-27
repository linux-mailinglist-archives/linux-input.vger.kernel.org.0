Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3AF22E9F7
	for <lists+linux-input@lfdr.de>; Mon, 27 Jul 2020 12:25:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727990AbgG0KZL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Jul 2020 06:25:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbgG0KZL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Jul 2020 06:25:11 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14E78C061794;
        Mon, 27 Jul 2020 03:25:10 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id d4so9248632pgk.4;
        Mon, 27 Jul 2020 03:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r6P0NW/NQ7oCqQTy1c6MyZkcBa+F52tox9mNpJ0I9/Y=;
        b=YGhQg2cgSfeKYXJ0iXoUi0yrHvu6HEOUJPpfU5AJ8M5oQPVfZ/j528gsyZCqt/RIaH
         HiMwN6G5OpkC9kmXdNN5K4yC5Rd4ZIhEAwcewzcC59Mbe1DQJ2gWRFj94iwxO70Hgypj
         qiM3LIGRjvDXDu+ToTSCTUXMfiKygZUQy0olshTpYVA/DKLnBcy78pv5fFMQnh+PmbAp
         j/+nFRGindy55o8bTIQ5xqu9UUrWkQMLKA9tdnuEtdZiYl9CVyBpBtwmd9yCNO4l2fuN
         6n7wPOVfkzCJi0SRvIMkf+6vJvghdFOEPpZJooT+Tejc+S7U0IpqzJSAAPRKnEsgD7bL
         2A7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r6P0NW/NQ7oCqQTy1c6MyZkcBa+F52tox9mNpJ0I9/Y=;
        b=M8tbk6WzZDeFU5I4qTWQ2moCuhEbX1nWIpPISMnetM8eTX//lZ2QJV8g864eH0U/yz
         SXzeUYMu+eFly8KCKMZ2N3CCqeUcOT6t+rYk0SugWU2LbG48RyYFEllJQNU8dOcRClgM
         71/VeEg8aS/awtsY0BN1AJEM5JARsR+uVkP59oo+c/0wHLcwR/Bo/IHAIs15basR+Zt8
         ZWB9xUhGaeFaWQGN9f8YKHHKv57QPA+pK7TQlmOpIUBOzFCDNzfsSdhvuLErJwBqFv02
         PLA1zg1uKFjZs0VIKsYxfNbOC4f3cEvsBy0XQ92qbqmPPwNOain9AjXbm+TiPk6cC2kG
         VaQA==
X-Gm-Message-State: AOAM533JNVeanCpBUt3xnTGPkUkUAmGwcmQLL6any5SbgjIcoSOd0DJ3
        CZZL+ayHW9c/FisTyBohZFZaqo5FaE3Evt7WxhEhQW55
X-Google-Smtp-Source: ABdhPJw5Q3FsSC0MI9/UyJUYP8cXE1w0ledJ1kmEd+1mEmUhKoLmjxcDuXj17SkYLlChMWYEfk08tQR479WIqfhaLcI=
X-Received: by 2002:a63:924b:: with SMTP id s11mr18613983pgn.74.1595845509654;
 Mon, 27 Jul 2020 03:25:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200717114155.56222-1-hdegoede@redhat.com> <20200719225649.GA4341@khazad-dum.debian.net>
 <20200722054144.GQ1665100@dtor-ws> <20200727005049.GA10254@khazad-dum.debian.net>
 <f67ede61-c9d4-6abc-9b59-a5b2b615d1b6@redhat.com> <CAHp75VdvhC5HJ-BjqjDxU_Z_7_i8MV5UDN4FgWHvZfSD5=smqg@mail.gmail.com>
In-Reply-To: <CAHp75VdvhC5HJ-BjqjDxU_Z_7_i8MV5UDN4FgWHvZfSD5=smqg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 27 Jul 2020 13:24:54 +0300
Message-ID: <CAHp75VfCqHdZBTe8HB2C0whONCS2HgVgPPZNGRgypMiSwm0+DQ@mail.gmail.com>
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

On Mon, Jul 27, 2020 at 10:49 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Jul 27, 2020 at 10:45 AM Hans de Goede <hdegoede@redhat.com> wrote:
> >
> > Hi,
> >
> > On 7/27/20 2:50 AM, Henrique de Moraes Holschuh wrote:
> > > On Tue, 21 Jul 2020, Dmitry Torokhov wrote:
> > >> On Sun, Jul 19, 2020 at 07:56:49PM -0300, Henrique de Moraes Holschuh wrote:
> > >>> On Fri, 17 Jul 2020, Hans de Goede wrote:
> > >>>> This is a simple patch-series adding support for 3 new hotkeys found
> > >>>> on various new Lenovo Thinkpad models.
> > >>>
> > >>> For all three patches, pending an ack for the new keycodes by the input
> > >>> maintainers:
> > >>>
> > >>> Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
> > >>
> > >> Do you want me to merge all 3 through input tree?
> > >
> > > Hans, Daren, Andy, what do you prefer?
> >
> > Taking all this upstream through Dmitry's input tree is fine with
> > me, but this really is up to Andy and/or Daren.
>
> Fine with me.

To be clear, I assume it will go thru input tree.
If my formal tag needed, use
Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

-- 
With Best Regards,
Andy Shevchenko
