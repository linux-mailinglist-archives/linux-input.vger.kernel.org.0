Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F969200805
	for <lists+linux-input@lfdr.de>; Fri, 19 Jun 2020 13:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731869AbgFSLpA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Jun 2020 07:45:00 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:34453 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731501AbgFSLo6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Jun 2020 07:44:58 -0400
Received: by mail-ed1-f65.google.com with SMTP id w7so7389363edt.1
        for <linux-input@vger.kernel.org>; Fri, 19 Jun 2020 04:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n2Kf7uaC92/7di7J0/5xBie3xfR1UGAxKH6qbkHjqGA=;
        b=izNa6vnOY4C3OW6eKv2R6tyVAk6gaDX0gBH7ISCmm/eiq+W2i4NFdEZYTWRLN5G/zf
         EO0DDxW8a8xoXBe7b2mKaHmNf61yPT39QV9mXpV4BiTTiCphAUyeY/cmWgG+FT50sdk5
         MU/UfC/qwF6k8hvhcsG66UqF10j3JxKUyc5vjC1mioBCSg0BsgD+u7KtCzGCYljiovIs
         OF7S4M3xjyPGLL08QITje8/SbjhjDsuLVUFL5slG9paN1exvuwt0SNawkpojwFP6QyBE
         7am58IjSymZfbYAuG6zL8p8FE/qvATBjMku9CUnVKCPn0ByVFVHNk1TvAbJXD8HId5m4
         2Sow==
X-Gm-Message-State: AOAM533FS7liJq0pbPEWQ2TlOYR6zM6S0SeLPVcWf+VjoMRS5QJPuu30
        +fmPenU58sLcqRyxIN4VRlUW6UFf8MY=
X-Google-Smtp-Source: ABdhPJxUqw81WIHXm/wslopdH93Cri2Mjs1z7dW26nwlmbYc3tg7J2Eu3uGCvfi740vvr4vK+Fgjcg==
X-Received: by 2002:aa7:c245:: with SMTP id y5mr2907789edo.189.1592567095931;
        Fri, 19 Jun 2020 04:44:55 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id h17sm4380584edw.92.2020.06.19.04.44.55
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2020 04:44:55 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id y20so8839535wmi.2
        for <linux-input@vger.kernel.org>; Fri, 19 Jun 2020 04:44:55 -0700 (PDT)
X-Received: by 2002:a1c:3b43:: with SMTP id i64mr3478863wma.112.1592567094991;
 Fri, 19 Jun 2020 04:44:54 -0700 (PDT)
MIME-Version: 1.0
References: <CANFaMLHQwNf3GnPYAxR-ryrYmO-wVmsEHijzVHEYozUt0EzDJw@mail.gmail.com>
 <nycvar.YFH.7.76.2006190924380.13242@cbobk.fhfr.pm> <CANq1E4RK_QymZwTB_PORc20K9QaJ=Tonuj7_RJQUj-xvqdjH8g@mail.gmail.com>
 <nycvar.YFH.7.76.2006191340260.13242@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2006191340260.13242@cbobk.fhfr.pm>
From:   Daniel Morse <dmorse@speedfox.co.uk>
Date:   Fri, 19 Jun 2020 12:44:43 +0100
X-Gmail-Original-Message-ID: <CANFaMLGkbpO515c5MMKmH4MXcCKK-88qbVitQX3tizwF+iq3_g@mail.gmail.com>
Message-ID: <CANFaMLGkbpO515c5MMKmH4MXcCKK-88qbVitQX3tizwF+iq3_g@mail.gmail.com>
Subject: Re: [PATCH v3] HID: Wiimote: Treat the d-pad as an analogue stick
To:     Jiri Kosina <jikos@kernel.org>
Cc:     David Herrmann <dh.herrmann@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Does that apply to the version I attached as well as the version in
the body of the email? There isn't much I can do about the version in
the body of the email as I'm on gmail.


On Fri, 19 Jun 2020 at 12:41, Jiri Kosina <jikos@kernel.org> wrote:
>
> On Fri, 19 Jun 2020, David Herrmann wrote:
>
> > > CCing David Hermann in case he has any review comments to this.
> > >
> > > Thanks.
> >
> > Yes, all good!
> >
> > Reviewed-by: David Herrmann <dh.herrmann@gmail.com>
> >
> > (You want me to send an adjustment for `MAINTAINERS` to link to my new
> > email-address/name? Got married some time ago already, but forgot to
> > adjust the `MAINTAINERS` file.)
>
> Ah, I wasn't aware that the two of you are the same person :-) Yes, if you
> could do that, it'd be helpful.
>
> Also, Daniel, the patch is unfortunately still whitespace-corrupted and
> line-wrapper, so I can't apply it. Could you please fix that up and
> resend?
>
> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>
