Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAD571CF737
	for <lists+linux-input@lfdr.de>; Tue, 12 May 2020 16:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729936AbgELOez (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 May 2020 10:34:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbgELOez (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 May 2020 10:34:55 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0290C061A0C
        for <linux-input@vger.kernel.org>; Tue, 12 May 2020 07:34:53 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id z5so10374867ejb.3
        for <linux-input@vger.kernel.org>; Tue, 12 May 2020 07:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=x8efoSZ+zID7F5YvSD9I7WSXaHP2yIiZZ2shhY+bRnY=;
        b=ulLrS15v6QwfRefV81yQTmVhqZgIL0xLrwjR0dUGj8wivo5HRRh7j4EAwSdGAU6AG/
         zF7eN9vN/nR8ah3E66cQCHy0hdhSE1JiRLTq/l7NtyPyPR0iH79vXUfKBfDDunu3HcAL
         K2xo8KOUWQkYgV8j9QgidnI0ts28Dmg/lYkHV8l1OdSc8XX6RFCvQl1reMh9akqx2XIX
         uYYaeeiVSj/I8HFLQukuSDwg0IgfbKoUgpQ7CO4xfKCeHim4ueFVd2AOzD2oG2KRILhd
         CQILt6j2jHAANi3WTbib77LdmyE2NTslpyoN7fVgOTXCpgDYk/dcgksdEIlWdrYEB82Q
         SmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=x8efoSZ+zID7F5YvSD9I7WSXaHP2yIiZZ2shhY+bRnY=;
        b=psIInbdMc1H7bI7fli3F6jg11UiwJgd8Q9XvUef9x+SBQAM4CApCaYON9Lv8nwtana
         yBk2LAXuJLJVSkwTsknO36r+ecv65QXzz7YUKGjvAeQq4uj9X658ZPaGugffUtFGRV9X
         5tYRZKPU5lq9H58BdJ6LS6OHKJVXASKRLh4zCWNLLsEnvbwRy4KtaiV5OXE92Oj9wZ/K
         ElrJKF0aTJ1prPAIL0uS6j3cVEAbStYCKPEMpcKr/EDRciV8H6xpx2haMQAKkq0C49I5
         4F29OsL+b0xGZXzFh2cDGGXjcav3gFVZSq/H0/8PNuXrHPmHc6OKC/YJerJ8bJhO0z3b
         WZyg==
X-Gm-Message-State: AGi0PuZ3JHcSsmT1y2OAkTk6dC5a+ZYKn3omOTk/FM11tRRrJAmMGY4+
        4No0jtz9Y9BaTtboT0y773ATncBm9OUzKIcVuqcP5g==
X-Google-Smtp-Source: APiQypLOYIenOz3HGhHW5/cKjR8xCrQX44WqwdRdgXwWCs48M/osTj1fdVlBJaEpQRIRu9snlaDcsO0HTvDUbdvD/pA=
X-Received: by 2002:a17:907:7210:: with SMTP id dr16mr17647216ejc.197.1589294090666;
 Tue, 12 May 2020 07:34:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAKF84v2gWnokoyhRe_feiWJcYOAPUcWwjaX93GkqmXqm8OzmYg@mail.gmail.com>
 <20200512052236.GB48688@koala>
In-Reply-To: <20200512052236.GB48688@koala>
From:   Siarhei Vishniakou <svv@google.com>
Date:   Tue, 12 May 2020 07:34:37 -0700
Message-ID: <CAKF84v2OZFSXZyem1ftdxP=tysw+mnuv3=8WpPtHCPuiDBr2aA@mail.gmail.com>
Subject: Re: behaviour change for keyboards introduced by "HID: generic:
 create one input report per application type"
To:     Peter Hutterer <peter.hutterer@who-t.net>
Cc:     Garfield Tan <xutan@google.com>,
        linux-input <linux-input@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jkosina@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Peter,

It's a bit of both. it seems unnatural to have a single physical
device represented by 2 devices in the system. It also seems not
efficient in terms of performance, because we are now allocating twice
the number of devices, which causes twice the configuration change
events on Android.



On Mon, May 11, 2020 at 10:22 PM Peter Hutterer
<peter.hutterer@who-t.net> wrote:
>
> Hi Siarhei,
>
> On Wed, Apr 01, 2020 at 01:02:03PM -0700, Siarhei Vishniakou wrote:
> > Hello linux-input,
> >
> > We have noticed a recent behavior change introduced by the commit:
> > https://github.com/torvalds/linux/commit/f07b3c1da92db108662f99417a212f=
c1eddc44d1
> > HID: generic: create one input report per application type.
> >
> > We have been looking into the behaviour of the Microsoft Designer
> > keyboard. Prior to these patches, the keyboard would report as a
> > single input_device to the user space. After these patches, the
> > keyboard is now split into 2 input devices: =E2=80=9CDesigner Keyboard
> > Consumer Control=E2=80=9D and =E2=80=9C"Designer Keyboard Keyboard". We=
 noticed that
> > this behavior also applies to the keyboard Dell KB216. In the Dell
> > case, it is split into 3 devices, which include =E2=80=9CConsumer Contr=
ol=E2=80=9D
> > (for some of the media keys) and =E2=80=9CSystem Control=E2=80=9D (for =
the sleep
> > button).
> >
> > In both Microsoft and Dell cases, these are pretty standard keyboards,
> > although they do contain media keys and power/sleep keys.
> >
> > Could you please confirm that this new behaviour is indeed
> > intentional, and that you wanted keyboards to be split in this
> > fashion?
>
> Is there an actual issue with the split though or just a cosmetic one? Th=
is
> is pretty standard for many keyboards (and other devices) but it shouldn'=
t
> have any negative effect on functionality.
>
> Cheers,
>    Peter
