Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80DDBD3B7F
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2019 10:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727462AbfJKIqL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Oct 2019 04:46:11 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39928 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726397AbfJKIqK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Oct 2019 04:46:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1570783569;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eYPIO03shV+P+sxqA/4qvsSAkBuzvgJfmGU8SjoHytI=;
        b=DBNkO9w9QpqMl/7livEscTr3SgPUoXCgusnTentfbH0dWA3CKcdxpRjOz/48sDRDtx4zim
        qtKopq9qudh5gV8JsU/mP9VP2faJHVcbJJzRba7+/B7wQ4yhmVdXv5lmxKQHDweL92MJLS
        0n49oml5gK7XimImWdjvd0GWtGpoB3g=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-CpIzYSxXOZmCtElvPp46Jg-1; Fri, 11 Oct 2019 04:46:06 -0400
Received: by mail-qk1-f199.google.com with SMTP id z128so8244456qke.8
        for <linux-input@vger.kernel.org>; Fri, 11 Oct 2019 01:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+VRAZ7diPNl4wX1L2Hk0ypm69MfBO+1cdDDHrGu25L0=;
        b=bxPgex2piuC+AooRZT6DcyN5OndUDufd29CUPdkYIFza2S1lBUC/h6Wdnl1Kmvvk96
         tbZ7LaXNd2HjPqCnng68A6s6OlQB4K4VNnYBHz7h39mbGOJSMnnmC6OWffbsYDJjWOTS
         oZzf8SXjbhgFjE4FpGHkkZE/KDnAqp2J8k/Gy0RJk4Kv7+Zljn7wHuRquFv5SLPBcQHh
         cSi9KiXKzzu9kdPPB0PZSUuW0vfXbLkpwXIu47iZAFnwz3qL62dMZEYdjAnv6jUPk0go
         EJemalE1k8fGWeZ8UHLG9/1O1taXsp8Cwu9CRx5V/7MIDT0AllG7p6V8x44TV6pyon78
         acLw==
X-Gm-Message-State: APjAAAW1pdMoGZb70A0wXY5RmYrDcIZgK1csaDAhGOZDM+1kR485XQj/
        CyproGant+m9BsmNwMDYjordnhlm5w8gHIwxpvMr+pClGKQyfjinEIVKO5k7NJ6NU8be/G0HuOG
        AaMneRzgrwKwHnSSOohrO0+fDvawTjOoegQkMhys=
X-Received: by 2002:ac8:550d:: with SMTP id j13mr15381831qtq.260.1570783565911;
        Fri, 11 Oct 2019 01:46:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxjtfvRG7GFheWo+CweicVfgOPfA0SeN5cp01ikB+VpMf9Zv2sGIFkWi4UJb2ggtweD1FESl/PfyDKU859NFQ4=
X-Received: by 2002:ac8:550d:: with SMTP id j13mr15381812qtq.260.1570783565674;
 Fri, 11 Oct 2019 01:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <jCmT1QOunDmSu59iO1T1xj2-WfFeGhMn_i5knEWTCoph9VH1oxjpYf3Q6CWH7BRrq1NTVYBsAVJcIgu8azAEmFZJA8PzLfH3bHBcWNbFqeY=@protonmail.com>
 <CAO-hwJ+AMmNUOhas+vq6K4sRcCspyJuAefKO8oomAH4=CDHoJw@mail.gmail.com>
In-Reply-To: <CAO-hwJ+AMmNUOhas+vq6K4sRcCspyJuAefKO8oomAH4=CDHoJw@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 11 Oct 2019 10:45:54 +0200
Message-ID: <CAO-hwJLAwodSXpz-_T0nGqnjHY3cVAu9GYjvp8SW8grTXX+VYg@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] HID: logitech: Add feature 0x0001: FeatureSet
To:     Mazin Rezk <mnrzk@protonmail.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>
X-MC-Unique: CpIzYSxXOZmCtElvPp46Jg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 11, 2019 at 10:33 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On Fri, Oct 11, 2019 at 2:57 AM Mazin Rezk <mnrzk@protonmail.com> wrote:
> >
> > On Saturday, October 5, 2019 9:04 PM, Mazin Rezk <mnrzk@protonmail.com>=
 wrote:
> >
> > > This patch adds support for the 0x0001 (FeatureSet) feature. This fea=
ture
> > > is used to look up the feature ID of a feature index on a device and =
list
> > > the total count of features on the device.
> > >
> > > I also added the hidpp20_get_features function which iterates through=
 all
> > > feature indexes on the device and stores a map of them in features an
> > > hidpp_device struct. This function runs when an HID++ 2.0 device is p=
robed.
> >
> > Changes in the version:
> >  - Renamed hidpp20_featureset_get_feature to
> >    hidpp20_featureset_get_feature_id.
> >
> >  - Re-ordered hidpp20_featureset_get_count and
> >    hidpp20_featureset_get_feature_id based on their command IDs.
> >
> >  - Made feature_count initialize to 0 before running hidpp20_get_featur=
es.
>
> I still need to decide whether or not we need to take this one. We
> historically did not do this to mimic the Windows driver at the time.
> However, the driver is full of quirks that could be detected instead
> of hardcoded thanks to this functions. So we might want to switch to
> auto-detection of those quirks so we can keep 'quirks' for actual
> defects that can't be auto-detected.
>
> But, if we want to go this route, we need to actually make use of it.
> So this patch should be part of a series where we use it, not added by
> its own.
>
> Can you drop it from the series?
> And maybe possibly work on a cleanup of some of the auto detection,
> like the HIDPP_QUIRK_HI_RES_SCROLL_X2121 which you can easily test?
> But this would need to happen in a second series, once this one gets
> merged in.

While reviewing 4/4, I realized why you need this one.
See my comments in 4/4, I still believe the case is not strong enough
to spend some time to enable the feature for barely no gain.

Cheers,
Benjamin

