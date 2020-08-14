Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BECFD244ECC
	for <lists+linux-input@lfdr.de>; Fri, 14 Aug 2020 21:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728162AbgHNTWv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Aug 2020 15:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728137AbgHNTWu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Aug 2020 15:22:50 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EA10C061386
        for <linux-input@vger.kernel.org>; Fri, 14 Aug 2020 12:22:50 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id o23so11078045ejr.1
        for <linux-input@vger.kernel.org>; Fri, 14 Aug 2020 12:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gh/neF9ziJj56PStHE/QUZcQmekSoXrkmgunMbnXSWg=;
        b=nsEdusixWGWlqqcRwywxuEcnS0tRoDLUZ5AHp1gy4TV6NF4nPagOWT2h656wgfLODg
         duAPjQ237NbgC/fxEmuEbnPx2xPn/BpCCaKavmn0akmuPquJgdZvYiyrua4MY+g3eQW9
         TgsTdAyoD3Ifs0tuNk8n6z0uL+4msbqxuTVzCABiJfXTLm0IWrK7qzfln3p0iz3rL97V
         L71AVTtHP8h6QhfIaYwh/6WSvmA8szEmbdFBnVykMukugE7Rop7nMJqLeEtjiG52MRh5
         gY64O7S08lc/qMuIYBW/j79Fj52HP/BSAroHBmF2cUR95qpT8pOMrrSYigygRC8CTKgo
         bmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gh/neF9ziJj56PStHE/QUZcQmekSoXrkmgunMbnXSWg=;
        b=TMPkxAyW9hRfJSqCLuQQByBG32Bo3plKJ38GCHDtxN1r9Q82OjMQ8d6cNDii3Xop4M
         m4YPJfUb7rRDYUKU3MmRFaLPp7JI7U4vHeIeec9HDQR/JFGOVyA6X/Z9DCA3xm7O6V9Y
         AJhoj2pR0dzNpUo0V5BtSDofiN6DST36KBSOAu3rIoSqAOZWBMdIxfTMyiBlRHOOW7Pr
         m5bWTtI1XVB2L4ygtEoS7SlDzi/R1J/g7C1NtX/lujkDT95BfW8e18Fn1DwhCD7gyjh7
         NoWS16bGlNOn1mhEcgRUNK+BdXYplyBbBKxARm8FUK1lQdijWC/0OfyGX4TfEnkzykid
         Bgwg==
X-Gm-Message-State: AOAM532d63S2fHWJrZ6EDkFI7fNqLR3NgL2GFtHqF4jft75tGRIw/tT6
        vYTXqHj6nJnaw6LsV0xG/GUEBO6J0dehkOuBEGFsuXrcfljLpBne
X-Google-Smtp-Source: ABdhPJw7uK+zbS7upvoYuMM2rqJ8bAKQKnzwdI8tLocljcFEMVvlLLlyo7HoKL67aDpo1nVSQ/nJ72jMN6nXFZS8UEI=
X-Received: by 2002:a17:906:4994:: with SMTP id p20mr3575441eju.299.1597432968735;
 Fri, 14 Aug 2020 12:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAHQZ30ANTeM-pgdYZ4AbgxsnevBJnJgKZ1Kg+Uy8oSXZUvz=og@mail.gmail.com>
 <20200813012125.GV1665100@dtor-ws>
In-Reply-To: <20200813012125.GV1665100@dtor-ws>
From:   Raul Rangel <rrangel@google.com>
Date:   Fri, 14 Aug 2020 13:22:37 -0600
Message-ID: <CAHQZ30D5irdR+cSiksXAtDDi58-qCpHSv=-OXyPqOydH8mgpeQ@mail.gmail.com>
Subject: Re: PS/2 + i8042 intermixing commands
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "S, Shirish" <Shirish.S@amd.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Thanks for clarifying Dmitry. I'll get a patch pushed up next week.

On Wed, Aug 12, 2020 at 7:21 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Thu, Aug 06, 2020 at 09:28:41AM -0600, Raul Rangel wrote:
> > >
> > > <- atkbd_event_work->atkbd_set_leds
> > > [KB recv data: 0xed] # CMD 10
> > > <- Wait, where is the data?
> > >
> > > <- Continuation of i8042_port_close?
> > > [KB recv cmd: 0x60] # CMD #14
> > > [KB recv data: 0x43]
> > > [KB eaten by STATE_WRITE_CMD_BYTE: 0x43]
> > > [KB set CTR_RAM(0x00)=0x43 (old:0x41)]
> > > [AUX IRQ enable]
> > >
> > > <- Here is the data!
> > > [KB recv data: 0x00] # CMD 10 (data)
> > > [KB Unsupported i8042 data 0x00]
> > > [KB recv data: 0x00] <- Did the host retry?
> > > [KB Unsupported i8042 data 0x00]
> > >
> > > <- atkbd_event_work->atkbd_set_repeat_rate
> > > [KB recv data: 0xf3] # CMD #11
> > > [KB recv data: 0x00]
> > > [KB eaten by STATE_SETREP: 0x00]
> > >
> > > [KB recv cmd: 0xd4] # CMD #15
> > > [KB recv data: 0xf2]
> > > [STATE_SEND_TO_MOUSE: 0xf2]
> >
> > As you can see CMD #10 starts between #13 and #14, and then completes
> > after #14. Is this expected behavior?
> >
> > I'm not quite sure if #13 and #14 are coming from i8042_port_close. I
> > don't have a function trace available, but it seems to fit.
> >
> > I found this comment:
> > /*
> >  * Writers to AUX and KBD ports as well as users issuing i8042_command
> >  * directly should acquire i8042_mutex (by means of calling
> >  * i8042_lock_chip() and i8042_unlock_ship() helpers) to ensure that
> >  * they do not disturb each other (unfortunately in many i8042
> >  * implementations write to one of the ports will immediately abort
> >  * command that is being processed by another port).
> >  */
> > static DEFINE_MUTEX(i8042_mutex);
> >
> > Does that not mean that i8042_port_close, i8042_enable_kbd_port,
> > i8042_enable_aux_port, + any other function that calls i8042_command
> > should be taking the lock before calling i8042_command?
>
> Yeah, I think this is right. When I added the mutex it was because 2
> deices were clashing with each other and I did not consider that closing
> port in the i8042 driver itself may also disturb in-flight command.
>
> Thanks.
>
> --
> Dmitry
