Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3D462E4F2
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2019 21:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbfE2TE3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 May 2019 15:04:29 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:41917 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725990AbfE2TE3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 May 2019 15:04:29 -0400
Received: by mail-lf1-f66.google.com with SMTP id 136so2987949lfa.8
        for <linux-input@vger.kernel.org>; Wed, 29 May 2019 12:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2pKuHW7e7Bq114V2mDcQ+xit9PWt9cdLU+EoCQu+jQc=;
        b=BKkwu/YvQ9QiOYxcvqzSjbI/JwCrva5j7DwcDwFWyMX26/WdlHlc1fdToAzBrA/P72
         b47NlxSCLZ2utp5X94N21ESyd35j3wuEfTIe4k5z2PGWitmhfJlqni4ve4VgodLBeZcQ
         RB6kOzo1dMK3iZNnvwI2FtvAFKvlJeDIZnInphzdftyusT7C9okQpmEaF1Foae2a/EL0
         o6MqiPpkRYaxAK432nKUMKXW2UbrkdK8+e+BUpb0ZgJZZxJ4Jq8l8YmpZOT1r9u3+Cek
         mcQPCJJoIS8ryCOJIzrtA2Mv6RQ0G2Z/IhIwkSqaIpthbRbIwlEjYGmFVh/fanzRatws
         fk/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2pKuHW7e7Bq114V2mDcQ+xit9PWt9cdLU+EoCQu+jQc=;
        b=UcnrLMI/hUb18kaJtYSJg3Xh7l9z1ewfb49dWipFqtZaH5OCXRPzErKrfTSuJG1H8/
         3FtSLuqIEh6d/xPtsi4xMMKaCG/H5iGxWIfBx9dDj8lgA0nHrxiU3RwkYd60RQ34ftxQ
         /N8DbEI2frJrIwHflC1rnERfLEMr/BbVWSknUsA0X3F47XU09ExzghUwUTG9OUUhR6u8
         F3YvPXDU3TXDErCY346gpEKswOnvu/L9Cw/MEKZ0PPvKHNoySNBbTAjDsx7t6XvFYLis
         l0YMhcqqYb5qdYBWC5fQtQHNRsMy961S+HvtChIe1gB58ZNvDgp8VGLNkAyLgVTeas7H
         7kpA==
X-Gm-Message-State: APjAAAUtbJXS15Q+CPcBltumWruWuxilCpGlryh5xvws7EJ0fnl2Y1Oe
        xef0G8Ek5UKOZJPTFyr8fQM00w8BgGeDIwu4010=
X-Google-Smtp-Source: APXvYqz4lSi3Upm4MIvY6xFkxNbo5wLqo/Wb/k+CtcnHTfF3jqmk919VujQ+fUs2a3w5LejLWH4VMdmA3prapeYPspc=
X-Received: by 2002:ac2:4213:: with SMTP id y19mr15290327lfh.66.1559156667374;
 Wed, 29 May 2019 12:04:27 -0700 (PDT)
MIME-Version: 1.0
References: <1557527479-9242-1-git-send-email-aaron.skomra@wacom.com>
 <nycvar.YFH.7.76.1905171358160.1962@cbobk.fhfr.pm> <CAO-hwJKB-64px0vZc9b5SCxoGWbe+_2uaa=9N6_HXowa2yLv6w@mail.gmail.com>
 <nycvar.YFH.7.76.1905171456440.1962@cbobk.fhfr.pm> <CAO-hwJLfKEVnrAARy44sULkdxQ4snXGbE9+3pE=pb6M=uXRSpQ@mail.gmail.com>
 <CANRwn3TF9q2ENq-ARFpOsC0ZP-J6vRCy3bQB30XXqQyxz_ro1A@mail.gmail.com> <CAO-hwJJ3Hv7mWRagap7tG76orv37dKMPZteBPzWqu4NEaR9C_Q@mail.gmail.com>
In-Reply-To: <CAO-hwJJ3Hv7mWRagap7tG76orv37dKMPZteBPzWqu4NEaR9C_Q@mail.gmail.com>
From:   Aaron Armstrong Skomra <skomra@gmail.com>
Date:   Wed, 29 May 2019 12:04:15 -0700
Message-ID: <CAEoswT1Y-5Xjp0X7QGDWmc_ncgmd=mAuHyxV=j8mB2dj-cKZDA@mail.gmail.com>
Subject: Re: [PATCH 0/4] Intuos Pro 2nd Gen Small
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jason Gerecke <killertofu@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Ping Cheng <pinglinux@gmail.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Aaron Armstrong Skomra <aaron.skomra@wacom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 17, 2019 at 9:24 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On Fri, May 17, 2019 at 6:15 PM Jason Gerecke <killertofu@gmail.com> wrot=
e:
> >
> > On Fri, May 17, 2019 at 6:13 AM Benjamin Tissoires
> > <benjamin.tissoires@redhat.com> wrote:
> > >
> > > On Fri, May 17, 2019 at 2:57 PM Jiri Kosina <jikos@kernel.org> wrote:
> > > >
> > > > On Fri, 17 May 2019, Benjamin Tissoires wrote:
> > > >
> > > > > On Fri, May 17, 2019 at 1:58 PM Jiri Kosina <jikos@kernel.org> wr=
ote:
> > > > > >
> > > > > > On Fri, 10 May 2019, Aaron Armstrong Skomra wrote:
> > > > > >
> > > > > > > Add support for the Inutos Pro 2nd Generation Small.
> > > > > > >
> > > > > > > This patch set is based on top of Jason's two existing patch
> > > > > > > sets sent Apr 24th and May 7th.
> > > > > >
> > > > > > I don't think I've seen those two sets ... ?
> > > > >
> > > > > I have them in my inbox at least. And it seemed you were not Cc-e=
d on them.
> > > > > https://patchwork.kernel.org/project/linux-input/list/?series=3D1=
10743
> > > > > https://patchwork.kernel.org/project/linux-input/list/?series=3D1=
14835
> > > > >
> > > > > Sorry, I am catching up with fires everywhere, so didn't have muc=
h
> > > > > time to apply patches.
> > > > >
> > > > > The first series looks good and can go in for-5.1/upstream-fixes =
I
> > > > > guess. I *think* the second series is fine too but I didn't have =
much
> > > > > dedicated brainpower to process it yet.
> > > > >
> > > > > Jiri, do you have time today to take care of those or should I tr=
y to
> > > > > get a little bit of time later today?
> > > >
> > > > If you have looked at them already and even have them in your inbox=
, it'd
> > > > be nice if you could process it.
> > > >
> > >
> > > K, I will.
> > >
> > > Cheers,
> > > Benjamin
> >
> > My apologies, Jiri. I've recently replaced my development workstation
> > and was apparently missing you on the mailrc alias I use for kernel
> > patches.
> >
>
> Ok, both series from Jason are now pushed to for-5.2/fixes.
> I don't think I=C4=BAl have the time to work on Aaron's series tonight.
>
Hi Jiri,

Benjamin seems to have a lot on his plate. Do you think you
could take a look at this patch set?

Best,
Aaron
>
> Cheers,
> Benjamin
