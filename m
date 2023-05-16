Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0F21704F65
	for <lists+linux-input@lfdr.de>; Tue, 16 May 2023 15:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232376AbjEPNfX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 May 2023 09:35:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232315AbjEPNfX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 May 2023 09:35:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D329210DA
        for <linux-input@vger.kernel.org>; Tue, 16 May 2023 06:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684244078;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=45UqYriNQVtdBFesR+jleqsSy4ksjE6lhJMxVSYplvo=;
        b=Ehb1piAv6hiUFgCacAtYrNifBEZoU1lxL8Ymx7f4c0fG4wY5/I0ZN8FWFZ0g4RlW9wqjMp
        NB55vj02dtxpPc0dSbpM0vJbohaoBPHxActpS+CGGrXIdssJL1dMCRJ4i/glvKOcl5xcsF
        CG/HHvrRcKboIJC23fpO6k9387ABa7w=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463-3x4-NGBqMMOemqLtbaGMAg-1; Tue, 16 May 2023 09:34:36 -0400
X-MC-Unique: 3x4-NGBqMMOemqLtbaGMAg-1
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-ba712bb7b28so5210710276.1
        for <linux-input@vger.kernel.org>; Tue, 16 May 2023 06:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684244076; x=1686836076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45UqYriNQVtdBFesR+jleqsSy4ksjE6lhJMxVSYplvo=;
        b=fvmWttVMlyFklsGDlHV/9LkA58hjWCATnstvel5UgtDrUtkeoTjxeB9RA1fcZH445w
         2s4VwOW0by5WC7weZISXAFeIftFzs6Ll5Bg87j11jYAgICunLuhBh0SZevGag796OI1c
         +mxUBZiTQGF6xpM8tU1Ge7xVw2HzlaVlaSqB+lpdMthQmM+Os3kv0LgxAwfXhqDRrv3+
         0jDF8Cv8GIchnExliTL6+pd8XVfZI0KmXkX3BDWUMeUeYSaUozCnxlz7VNkZRTGDcrHM
         yc/oKsqwcRnGTGpxa+9+SSRffR14/JjV5oT8noySBrl2HmzPTBYguGQ6DAn4TNL3f4lI
         a9gQ==
X-Gm-Message-State: AC+VfDwZ4p0dxOhh5QIBjXwv+IQhFAUKDFgQHZakU1r0WR3bPjdzmWE9
        eFm8JaTNHp/jiYwcghJme6fCm0sk+9x/hAMSSI6BZVRH46FwCPtrjOft4hfRvvrFfWR1MNUnp3F
        lkDH96KJj1EXucpCIHOF4Uq+FsDuLNaFFTjPqg48=
X-Received: by 2002:a0d:d847:0:b0:561:b246:77df with SMTP id a68-20020a0dd847000000b00561b24677dfmr491851ywe.16.1684244075581;
        Tue, 16 May 2023 06:34:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5a8XsAcCfmDEhTwmeBSPI5gRAlk+fKBy37/4QgPjAyDxSQYLttDSUO8ua8sZeUNWVP3Ts21WU0gwhJWqir3M4=
X-Received: by 2002:a0d:d847:0:b0:561:b246:77df with SMTP id
 a68-20020a0dd847000000b00561b24677dfmr491841ywe.16.1684244075332; Tue, 16 May
 2023 06:34:35 -0700 (PDT)
MIME-Version: 1.0
References: <9b987585-0834-bb8c-3414-283c29f3f2ab@leemhuis.info>
 <bec024d5-4088-00ae-f7b5-7188868b1707@leemhuis.info> <b7717c43-74bf-b91d-d3ce-874493df602c@gmail.com>
In-Reply-To: <b7717c43-74bf-b91d-d3ce-874493df602c@gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 16 May 2023 15:34:24 +0200
Message-ID: <CAO-hwJ+At1J_yUpX2q_dJekzZ-PoTDAvxmkTk_e4Yu0Z338bEA@mail.gmail.com>
Subject: Re: [regression] Since kernel 6.3.1 logitech unify receiver not
 working properly
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Linux regressions mailing list <regressions@lists.linux.dev>,
        =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, guy.b@bluewin.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, May 16, 2023 at 3:25=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> On 5/11/23 18:58, Thorsten Leemhuis wrote:
> > Hi, Thorsten here, the Linux kernel's regression tracker.
> >
> > On 08.05.23 11:55, Linux regression tracking (Thorsten Leemhuis) wrote:
> >> Hi, Thorsten here, the Linux kernel's regression tracker.
> >>
> >> I noticed a regression report in bugzilla.kernel.org. As many (most?)
> >> kernel developers don't keep an eye on it, I decided to forward it by =
mail.
> >>
> >> Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=3D217412 :
> >
> > TWIMC: a few other users (three or four iirc) showed up in that ticket
> > and reported problems with the receiver, albeit the symptoms are not
> > exactly the same for all of them, so there might be more than one probl=
em.
> >
> > I'll try to motivate the affected users to perform a bisection. But
> > would be great if those with more knowledge about this code could
> > briefly look into the ticket, maybe the details the users shared allows
> > one of you to guess what causes this.
> >
>
> Hmm,
>
> You noted in the similar report [1] that developers involved here
> ignore this regressions. I wonder if Linus has to be hired in
> this case, and if it is the case, let's take a look and hear closely what
> he will say.

Sigh... Not answering an email is bad, but maybe you can also
understand that developers can take days off?

And it turns out that I was waiting for Bastien to chime in, but I can
access his calendar too and just found out that he was AFK for the
entire month, except for the first week, which I wasn't aware. May is
a time where people in France have a lot of public holidays and is
also the cut to use those time off or they expire.

For me, I'll also be taking time off the rest of this week, so I won't
be able to have a look at this until next week at the earliest.

Cheers,
Benjamin

>
> Thanks.
>
>
> [1]: https://lore.kernel.org/regressions/8941c5f2-3861-da68-06ca-adc68a37=
e53b@leemhuis.info/
>
> --
> An old man doll... just what I always wanted! - Clara
>

