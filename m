Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDDBF3CFC37
	for <lists+linux-input@lfdr.de>; Tue, 20 Jul 2021 16:27:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235417AbhGTNqj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Jul 2021 09:46:39 -0400
Received: from relais.etsmtl.ca ([142.137.1.25]:56026 "EHLO relais.etsmtl.ca"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240185AbhGTNkc (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Jul 2021 09:40:32 -0400
Content-Type: text/plain; charset="UTF-8"
DKIM-Signature: v=1; a=rsa-sha256; d=etsmtl.ca; s=bbb; c=relaxed/relaxed;
        t=1626789908; h=from:subject:to:date:ad-hoc;
        bh=Ti8VMwTnau/0gPD3F0uPBp+HLvEsNygOmxCXc80DV8w=;
        b=hoQzXJWVHSSgCYYocqih1O2YzrMbP44BMJfWS56o0ACZz0tvYzWPCCzbUc9l8syflNWwFPRXWG+
        Dw6/z0m/M6LrX2BpmUHI9lCiuxR6OD5jEuAhH+S3GwBWJFfBlxTI73XS5p+KZe4ZtNNMn+MCc2oty
        qIL3cqV4Gjl5vINkmto=
X-Gm-Message-State: AOAM532NH1o0TqD1etc/FZeDvXfSA3wfP5zvhrQ6C/yaLBW4vozxQmIL
        X9jjY5bGiboOteEXAjsDVDZAraB+LQVPBnajsMo=
X-Google-Smtp-Source: ABdhPJyOIPCCSakz74aqMeIxRKIz8LeoETELoxXVX2n/1m6j06de5tSpRgw5plwgYJiTTYyydNETCF7yx7UMZmCVxGE=
X-Received: by 2002:ac5:c956:: with SMTP id s22mr20465068vkm.2.1626789907129;
 Tue, 20 Jul 2021 07:05:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210604161023.1498582-1-pascal.giard@etsmtl.ca>
 <nycvar.YFH.7.76.2106151053340.18969@cbobk.fhfr.pm> <CAJNNDmnnZYPEWJiEq6Th1wp1Oc3yyXhjPef+abWL+cTT-uEFiw@mail.gmail.com>
 <nycvar.YFH.7.76.2107152143060.8253@cbobk.fhfr.pm> <CAO-hwJKb9vy-jGvN9ChBOn14EdrGcJVSQeSRPFFNJr=G9ocfLA@mail.gmail.com>
In-Reply-To: <CAO-hwJKb9vy-jGvN9ChBOn14EdrGcJVSQeSRPFFNJr=G9ocfLA@mail.gmail.com>
From:   Pascal Giard <pascal.giard@etsmtl.ca>
Date:   Tue, 20 Jul 2021 10:04:55 -0400
X-Gmail-Original-Message-ID: <CAJNNDm=w3wec1uO+4MRV0Fcn0W2oPK=CHtaVYWHENhmYGJuuzg@mail.gmail.com>
Message-ID: <CAJNNDm=w3wec1uO+4MRV0Fcn0W2oPK=CHtaVYWHENhmYGJuuzg@mail.gmail.com>
Subject: Re: [PATCH] HID: sony: fix freeze when inserting ghlive ps3/wii dongles
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
CC:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca>
X-Originating-IP: [142.137.250.50]
X-ClientProxiedBy: FacteurA.ad.etsmtl.ca (10.162.28.14) To
 FacteurB.ad.etsmtl.ca (10.162.28.15)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jul 20, 2021 at 4:18 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On Thu, Jul 15, 2021 at 9:44 PM Jiri Kosina <jikos@kernel.org> wrote:
> >
> > On Tue, 13 Jul 2021, Pascal Giard wrote:
> >
> > > We (Daniel and myself) have a patch that we want to submit that will add
> > > support for the PS4 version of the Guitar Hero Live dongle ;-) IIUC our
> > > patch should be against dtor/master and not Linus' tree.
> > >
> > > However, we see that dtor/master is still behind, it does not include
> > > the fix. Is there something I need to do? Do I just have to be
> > > patient?
> >
> > Just base the patch on Linus' tree, submit the patch to Dmitry and
> > indicate that it's based on more recent upstream than his master. He will
> > manage :)
>
> FWIW, if the patch in question is
> https://patchwork.kernel.org/project/linux-input/patch/20210715195720.169385-1-daniel.nguyen.1@ens.etsmtl.ca/
> then this patch is not destinated to Dmitry, but the HID tree like the
> current one :)

Hi Benjamin,

Yes, we figured since then. I was confused between both trees
(dtor/input and hid/hid), and following a brief discussion with Dmitry
on IRC, that confusion was resolved.
Bottom line: in case of doubt, remember to go back to
./scripts/get_maintainer.pl.

That lead to the submission of the patch you linked to above, applied
against hid/hid.

Sorry, I should have replied to clear this up earlier.

Best regards,

-Pascal
