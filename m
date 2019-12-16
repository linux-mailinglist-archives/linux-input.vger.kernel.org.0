Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B30D71209F3
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2019 16:41:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728389AbfLPPlZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Dec 2019 10:41:25 -0500
Received: from mail-lj1-f174.google.com ([209.85.208.174]:44875 "EHLO
        mail-lj1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728376AbfLPPlZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Dec 2019 10:41:25 -0500
Received: by mail-lj1-f174.google.com with SMTP id c19so7280414lji.11
        for <linux-input@vger.kernel.org>; Mon, 16 Dec 2019 07:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jILdx6rEeSHMXnXSofQJg45qWIXl6TrDvH5i1O6pkP4=;
        b=a3SOoYp6Dl/+X2xch69dKGUTq6iB+3CH+gPaZJCiKtIqPmnaZUbb8detNplsrk3YRR
         Njnm+RYYYyUyBpDMv0oyPjCK0NH6pBf1vMVjGNxayrMnDk7WrGNdm1vT/2fQaH6v5VCB
         aBGFn+x1DUNIJ4kkFzH2puoV8XTnFbFltUncqICqaHObSoHavFvhnEcSBiCkwPbl/LD3
         zvP7wFSOMuzlbXEpm+LNHZbDtZO1cWhjChgKbVBZ4IE+Hnaqe1zakZdYtRx17qZXwbkC
         3K1Km4b6XI/EytXU3bKE+4fpxySNEp64ikgfGIrjfFZAoE34LRrTcg+BQu7aRj89xVr3
         +6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jILdx6rEeSHMXnXSofQJg45qWIXl6TrDvH5i1O6pkP4=;
        b=sMgAHFfiRK8QzuomkR/IawTWpLn5yiATVyx1+9E+f797K8WAvGP6QuXEViic8fQNXJ
         cnMncXu+ZU1DruYMJihBQtnhOvutOMm4bB/dn6FqYnWRKWIoG74vofdZhq8fgISa20Yr
         AnCWggdkPTdSEoDQdwzT1tO4HtJW7M7bUOoJ0fs1eLP36dBTCUuNuMiVPqUe+N31pu5+
         89vyCVSCNNhHlQIgNMAKpv6psLxJPTPvrT+6mjZe8WE2OqTdxiawZUsQ7jBPVoJTq4jL
         pVkDBR7sWK2g9dANPlBUf2RgUhCBjLRO//5HfggdwRpySgo3mRHH9XY40QHzVfK3a6yN
         TiDw==
X-Gm-Message-State: APjAAAX5K1o3PqnI360UHvUt2WqkAGzQ2XBxmk/YPm5cYMV4uQZrr70g
        qH/dKNQQriTlNNNKjGuLYv0YovLYNssyJmVQjN4=
X-Google-Smtp-Source: APXvYqyTDQudJQ0NAN7Tz8+bXsIZ25suyLnc0cgVJ+So0auhiM7sC54ntjtefXa5/HYPU5JFUtcHuBxRTpAgYbrHTxQ=
X-Received: by 2002:a2e:99c3:: with SMTP id l3mr20174945ljj.250.1576510882987;
 Mon, 16 Dec 2019 07:41:22 -0800 (PST)
MIME-Version: 1.0
References: <1576438494.7054.3@auth.smtp.1and1.fr> <895e66cf60a022a01701d03d8b873321aebcc30a.camel@archlinux.org>
 <1576458752.26677.0@auth.smtp.1and1.fr> <92d802d928be1ce6c4c64394ee5775f56806d064.camel@archlinux.org>
In-Reply-To: <92d802d928be1ce6c4c64394ee5775f56806d064.camel@archlinux.org>
From:   Benjamin Tissoires <benjamin.tissoires@gmail.com>
Date:   Mon, 16 Dec 2019 16:41:11 +0100
Message-ID: <CAN+gG=HP2gW3TTeAapb5p5DfVY3QKFmprFw3NZgJTA9Xi1V3xg@mail.gmail.com>
Subject: Re: hid-logitech-hidpp / hid-logitech-dj driver hiding inputs and
 breaking Logitech G700s buttons
To:     =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>
Cc:     Hamza Attak <hamza@attak.fr>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>,
        linux-input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Dec 16, 2019 at 2:48 AM Filipe La=C3=ADns <lains@archlinux.org> wro=
te:
>
> On Mon, 2019-12-16 at 01:12 +0000, Hamza Attak wrote:
> > Hi Filipe,
> >
> > I'm on the latest 5.4.3 from kernel from kernel.org git repository. Onl=
y
> > a few security options are tweaked in the kconfig.
> > For your information, I am also facing the same issue on untouched
> > Ubuntu
> > built kernels,
> >
> > I never followed linux-input before and don't know how active was the
> > code
> > taking care of the G700s, but do you think there might have been a
> > regression
> > since you say that it was a fixed issue?
> >
> > Unfortunately, I didn't keep track on when it happened, ie after a
> > kernel
> > upgrade or if it was always there and I only noticed after trying the
> > mouse
> > wirelessly.
> >
> > Thanks,
> > Hamza ATTAK.
> >
>
> Okay. Do the logs show anything interesting?
>
> I don't have the mouse but I think Benjamin does. Let's see if he knows
> what's going on.

Hmm, I just gave a test on the G700 (not s) that I have, and  in both
cases (wired or not), I can see the incoming button events *when they
are mapped to something meaningful*.

FYI, 0xC531 wireless receiver has been added in v5.4, so that is when
you must have seen your problem appearing.

So:
- have you mapped any special buttons/macros to those buttons (G6-G10)?
- can we get the output of hid-recorder[1] so see what the mouse
actually sends (both in wired or wireless mode)?

Cheers,
Benjamin

[1] https://gitlab.freedesktop.org/libevdev/hid-tools
