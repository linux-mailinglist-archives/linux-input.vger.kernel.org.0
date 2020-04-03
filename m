Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92ED619D9E0
	for <lists+linux-input@lfdr.de>; Fri,  3 Apr 2020 17:15:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404125AbgDCPPT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Apr 2020 11:15:19 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:27188 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728060AbgDCPPT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 3 Apr 2020 11:15:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585926918;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SRb6CsmI17uMNzLCPreryxqmrirK+0qj0zIO/GeumII=;
        b=QWtXPAyiSMWjzvCiw3dgOe2gmdlR09/0AhGafeMNmrpQyt7h+R04S5gq7fzbPGtUkP6bkE
        IxxSsHJOVehKTMb8Bm+Sic88pY6piGCwNOr4sZU9kk3rlq864fnXW7lfxS8QGePevMUD7m
        gKp5q2K7pHYDWLE2FeVP/DgbUmyQGMk=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-z4TyO4SEMB6lTZGPEOo2Sw-1; Fri, 03 Apr 2020 11:15:16 -0400
X-MC-Unique: z4TyO4SEMB6lTZGPEOo2Sw-1
Received: by mail-qk1-f199.google.com with SMTP id d80so6623516qke.7
        for <linux-input@vger.kernel.org>; Fri, 03 Apr 2020 08:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SRb6CsmI17uMNzLCPreryxqmrirK+0qj0zIO/GeumII=;
        b=SE8jy17CszT7wdLXAQ5a2PtgHHpwVcvI3yXwf+EOgKEMK+lqTz+KwWrmsq/f5kDgc3
         Qnh/JPAEJGtZnMu+xlexsSjMkHO+Z2mXx7uk3olERQNUb4miVJITs9fc56A+KVMd5lnD
         3TRyCCNzbRCN7wGDA1cVzJwVxcLzCYEqhlyWqQd+U6VETJa0PvbgagPH6NrMsqArPUwH
         EfkjQfZ2lHHt1VFHwn1bK3uG6AsKcCzix9SVjxJitmt2pn0NdWu4rLDpTxdlhqUi5HtP
         71/TIdgfE1H1MFELucsgcnJOq+iJItLwFjcTVIMUD/vplPwdw2vkGCtJ+SNwcAuoX27W
         P5rA==
X-Gm-Message-State: AGi0PuZ72g3/mpjvF5Z/SC/VX3uA9v04xLVrDo5pmM2ODf5GE1rwf2Gf
        9sYIyOR7vzRMXXiaD3pfchKL0hsdzD/9UW8NbzMVQdd30dwUA66/lJ71vaKSpdcolwDpIVJvDGj
        iNYEcaG8Vm4wgPoJvbj5hGSNAVGjKpVTAA51xVok=
X-Received: by 2002:a37:4852:: with SMTP id v79mr8867483qka.459.1585926916383;
        Fri, 03 Apr 2020 08:15:16 -0700 (PDT)
X-Google-Smtp-Source: APiQypJUV2d7K2It0zrkL8C79HBnt1r3tN9WNQmjeddv/tPrQG2xyyWE8oxqPtbZqLWgqoyz+1oPB7uh1dY7LeRDiKI=
X-Received: by 2002:a37:4852:: with SMTP id v79mr8867461qka.459.1585926916112;
 Fri, 03 Apr 2020 08:15:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200112235009.4074405-1-lains@archlinux.org> <nycvar.YFH.7.76.2004031531190.19713@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2004031531190.19713@cbobk.fhfr.pm>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 3 Apr 2020 17:15:04 +0200
Message-ID: <CAO-hwJJwBUqSMj_E71YBYEfqY7hCsvgqexFvPyU5dnyCyLxtcg@mail.gmail.com>
Subject: Re: [PATCH v2] HID: logitech: drop outdated references to unifying receivers
To:     Jiri Kosina <jikos@kernel.org>
Cc:     =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Apr 3, 2020 at 3:31 PM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Sun, 12 Jan 2020, Filipe La=C3=ADns wrote:
>
> > The hid-logitech-{dj,hidpp} were originally developed for unifying
> > receivers but since then they have evolved and now support other types
> > of receivers and devices. This patch adjusts the original descriptions
> > with this in mind.
>
> Benjamin, I guess you are fine with this change ... ?

Yes, work for me.

[Sorry for being unresponsive for a while, got a bunch of things on my
plate right now :( ]

Cheers,
Benjamin

>
> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>

