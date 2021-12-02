Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28D7746689D
	for <lists+linux-input@lfdr.de>; Thu,  2 Dec 2021 17:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359457AbhLBQwI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Dec 2021 11:52:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31156 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1359444AbhLBQwF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 2 Dec 2021 11:52:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638463723;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=nWYMvmHi1IetsBgWf1lP6BikYoWmyQ1Zpnr1brTeF0E=;
        b=fe573YQ+EDGHjzyeF07TkZxqN8JdLrXROmDK8vDYUC1YZXmUB9DPH0rbFRDp6faRQ7/2XG
        QMCVYKN0kx2ww29ZMeq8eJoOGgUsMqJoCj2oA73FIY5wLQuMShP0ftwR5xsr05hpARGccK
        2h7pgjuRpmeKjcsoiyC0n8ZNMIvv+hM=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-Fd93KZ78M4yU_tSZtm0jaQ-1; Thu, 02 Dec 2021 11:47:38 -0500
X-MC-Unique: Fd93KZ78M4yU_tSZtm0jaQ-1
Received: by mail-pj1-f72.google.com with SMTP id bf17-20020a17090b0b1100b001a634dbd737so2315657pjb.9
        for <linux-input@vger.kernel.org>; Thu, 02 Dec 2021 08:47:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nWYMvmHi1IetsBgWf1lP6BikYoWmyQ1Zpnr1brTeF0E=;
        b=32RCsjrfAmGBa23ZtxnwS9mSMs9PJ9G1wpECXnpLhp1WthKjHKMIOcYX4hwh2+C5IJ
         SDyYE6yAR/G9Tds3di5l/F45D+jhznoptbbrTOJUNkvOsyeRRKU/nn8tctnT2nxQEZtt
         ZZ9b8QVVHP1DFrdGCceYg1tmmrONjdE77JAdhOmvjjUu4aSUHATUhZZ5oiXKSb6bRoW+
         VPeiXo3LfuPrtjMaR67VcAfDbS/DQKlSTC3RIuir8exPzGZebAQmFhsf8FjT+HqIngTs
         1ZT/MT6mtjLplJeY1sYWjk8aI+INLthrDCJuK46yuDuUMdh2qvajrnhBYa0nAi1RBRDR
         CnOA==
X-Gm-Message-State: AOAM531zdjWHFm9II3Y+u77iS9lGBmnhnyytv+BtiVfG6qSGM6J86+If
        S/SmtikQnHqiYQ+WAIgQihhNMGEvKMvY5q6xI2lolZLE38q3cosiE9KlNYwAWp7VnA2d4WBJ/yB
        UbYj7y/MNOtzseZS1tWUw1KrEMVtk7qLrfsHN/Io=
X-Received: by 2002:a17:903:1c7:b0:141:e630:130c with SMTP id e7-20020a17090301c700b00141e630130cmr16423270plh.80.1638463656607;
        Thu, 02 Dec 2021 08:47:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylj6I1e0tyNlmszcQF1L+TKeQBO8xXs2S2Wpark0m/HZ2aVsgJOLfHiesuoEowFq6o+VRA9QagBX+klTU19lY=
X-Received: by 2002:a17:903:1c7:b0:141:e630:130c with SMTP id
 e7-20020a17090301c700b00141e630130cmr16423240plh.80.1638463656360; Thu, 02
 Dec 2021 08:47:36 -0800 (PST)
MIME-Version: 1.0
References: <20211201183503.2373082-1-gregkh@linuxfoundation.org>
 <20211201183503.2373082-3-gregkh@linuxfoundation.org> <CAO-hwJJ5=SCNypQJP2V3DdjwLoo23DuMuZ8w_fejp17cytznQw@mail.gmail.com>
 <YaiRGg+gmJgcT8uA@kroah.com> <Yaiz/U9POyHfCs1M@kroah.com> <CAO-hwJJC1JLVYNVTXS72Z+_FduG2=zqKJjry1kcGRTFgi9AANg@mail.gmail.com>
In-Reply-To: <CAO-hwJJC1JLVYNVTXS72Z+_FduG2=zqKJjry1kcGRTFgi9AANg@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 2 Dec 2021 17:47:25 +0100
Message-ID: <CAO-hwJ+bpm5c3LKDWFPndiccap3R_59sPa7wg2xmVkTJdNsfpQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] HID: check for valid USB device for many HID drivers
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Michael Zaidman <michael.zaidman@gmail.com>,
        Stefan Achatz <erazor_de@users.sourceforge.net>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Dec 2, 2021 at 4:21 PM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On Thu, Dec 2, 2021 at 12:54 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Dec 02, 2021 at 10:25:46AM +0100, Greg Kroah-Hartman wrote:
> > > On Thu, Dec 02, 2021 at 10:08:07AM +0100, Benjamin Tissoires wrote:
> > > > On Wed, Dec 1, 2021 at 7:35 PM Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > Many HID drivers assume that the HID device assigned to them is a USB
> > > > > device as that was the only way HID devices used to be able to be
> > > > > created in Linux.  However, with the additional ways that HID devices
> > > > > can be created for many different bus types, that is no longer true, so
> > > > > properly check that we have a USB device associated with the HID device
> > > > > before allowing a driver that makes this assumption to claim it.
> > > > >
> > > > > Cc: Jiri Kosina <jikos@kernel.org>
> > > > > Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > > > > Cc: Michael Zaidman <michael.zaidman@gmail.com>
> > > > > Cc: Stefan Achatz <erazor_de@users.sourceforge.net>
> > > > > Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> > > > > Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> > > > > Cc: linux-input@vger.kernel.org
> > > > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > > ---
> > > > > v3: add check in hid-sony based on fix from Benjamin.
> > > >
> > > > Sigh. This morning I realized my fix was incomplete as the error path
> > > > of the GHL devices handling is not releasing the hidraw node.
> > > > I have a followup patch ready that I am about to send as soon as I get
> > > > the full tests run.
> > > >
> > > > Also, I guess we want this series to land in 5.16-rc4 or rc5 and mark
> > > > it as stable, no?
> > > > If so, I'll add the cc stable@vger.kernel.org marks so you don't need
> > > > to keep tabs on it.
> > >
> > > That would be great, thanks!
> > >
> > > > Besides that, I tested the wacom change on an I2C screen, and it is
> > > > still working as expected, so I think the wacom changes are safe.
> > > > The full series is
> > > > Tested-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > >
> > > Wonderful.
> > >
> > > Note, I did just get some really odd 0-day error messages from this
> > > patch series:
> > >       https://lore.kernel.org/r/202112021000.3GKuE8mS-lkp@intel.com
> > >       https://lore.kernel.org/r/202112020808.AZ5usuXj-lkp@intel.com
> > >
> > > Which looks like a dependancy issue that might have always been there.
> > > I'll work on resolving that after lunch...
> >
> > Now sent:
> >         https://lore.kernel.org/r/20211202114819.2511954-1-gregkh@linuxfoundation.org
>
> \o/
>
> >
> > I can resend it as a v4 series that adds this to the end of the series
> > if you want me to.
>
> That's fine. I already locally scheduled the v3, this other series
> above and my 2 first patches from my series that you reviewed today.
> I also added the cc: stable markers (though I haven't checked exactly
> which versions it applies to).
>
> Once my automated suite is happy I'll push them to hid.git.
>
> Thanks for your time Greg!
>

Series is applied to hid.git branch for-5.16/upstream-fixes

Cheers,
Benjamin

