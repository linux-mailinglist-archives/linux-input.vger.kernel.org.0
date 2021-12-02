Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 660B4466659
	for <lists+linux-input@lfdr.de>; Thu,  2 Dec 2021 16:21:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347574AbhLBPZH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Dec 2021 10:25:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53119 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237545AbhLBPZH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 2 Dec 2021 10:25:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638458504;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=MXVY1jd1P/jiZwwjBkA5YOoVT9Jc+hR1K31ujw2Of2c=;
        b=QwznYlVlugVxMMSbIc5ZyZ319j005S5+orwNWauy4g9aC9LYzWt50/KRG5sSSk0mz1xbVR
        C7v6NR6gQeQBAlsKiTv/we3jzkijroyYyHFNQHUG4VGkcNn3Lyn6IImICcLdK4ARQyYgaQ
        GNkZo1cr5CqZkOffZkNYrBVXCe04poo=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-405-AZ3fY-79M5yCd5wQJW-Q-g-1; Thu, 02 Dec 2021 10:21:43 -0500
X-MC-Unique: AZ3fY-79M5yCd5wQJW-Q-g-1
Received: by mail-pj1-f72.google.com with SMTP id b8-20020a17090a10c800b001a61dff6c9dso6276pje.5
        for <linux-input@vger.kernel.org>; Thu, 02 Dec 2021 07:21:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MXVY1jd1P/jiZwwjBkA5YOoVT9Jc+hR1K31ujw2Of2c=;
        b=y7mBxSU6couZV6SgRaFzwe2kBx3InUbQ4sJJAm6nd8c9xNZdfynX47XzQ1teuhS/F3
         wiKGckf3SS2MQN0gk2GW9QvbqHk9A/yHlOVjQaLo6nUzO6GXoPcHV7aGEgaBmT7GBvI7
         /rsVIhpQlGHX24vR0gw/fjcri0dKVoahTIzzepT4kSoIHmDqymFuCY5Z8l5GGrJyfr+F
         Vl2wdFvtY9/+nx3+bVqoPqSLXZc8LAxrl7wE/ih4Fm7eEuX1ziBgdYRqU2W8QczFYzzW
         miH0CuIR5c8lCykK8sFa58PLV9a2lCXmgl53/ULpWz6ubcFWsGy2BpygOmH09rQar64i
         vTew==
X-Gm-Message-State: AOAM533lBcIxF6BX8m0DpmI9XiISqCEDSnrnRfXmlQWOTVV0CrFLMGtI
        R62bVchtq9ibw94U3fbmmmAfehvRYa9q8A2KuHKKY5MZianXefZ7nOFbMoJOMFC2GfK/Au/Vdz+
        JHOxKNGVlPnXl2V4Zj67kzlXLKf29fBfd20s9o60=
X-Received: by 2002:a63:1805:: with SMTP id y5mr9738149pgl.191.1638458502499;
        Thu, 02 Dec 2021 07:21:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrSoqQqfOh0ha3ghdguDhjqW40RH/C2mhmRMXd5OOsPh0L42Al1jCmWJ2D8QRol86doZ7CsIgvtcKgef88se8=
X-Received: by 2002:a63:1805:: with SMTP id y5mr9738130pgl.191.1638458502291;
 Thu, 02 Dec 2021 07:21:42 -0800 (PST)
MIME-Version: 1.0
References: <20211201183503.2373082-1-gregkh@linuxfoundation.org>
 <20211201183503.2373082-3-gregkh@linuxfoundation.org> <CAO-hwJJ5=SCNypQJP2V3DdjwLoo23DuMuZ8w_fejp17cytznQw@mail.gmail.com>
 <YaiRGg+gmJgcT8uA@kroah.com> <Yaiz/U9POyHfCs1M@kroah.com>
In-Reply-To: <Yaiz/U9POyHfCs1M@kroah.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 2 Dec 2021 16:21:31 +0100
Message-ID: <CAO-hwJJC1JLVYNVTXS72Z+_FduG2=zqKJjry1kcGRTFgi9AANg@mail.gmail.com>
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

On Thu, Dec 2, 2021 at 12:54 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Dec 02, 2021 at 10:25:46AM +0100, Greg Kroah-Hartman wrote:
> > On Thu, Dec 02, 2021 at 10:08:07AM +0100, Benjamin Tissoires wrote:
> > > On Wed, Dec 1, 2021 at 7:35 PM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > Many HID drivers assume that the HID device assigned to them is a USB
> > > > device as that was the only way HID devices used to be able to be
> > > > created in Linux.  However, with the additional ways that HID devices
> > > > can be created for many different bus types, that is no longer true, so
> > > > properly check that we have a USB device associated with the HID device
> > > > before allowing a driver that makes this assumption to claim it.
> > > >
> > > > Cc: Jiri Kosina <jikos@kernel.org>
> > > > Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > > > Cc: Michael Zaidman <michael.zaidman@gmail.com>
> > > > Cc: Stefan Achatz <erazor_de@users.sourceforge.net>
> > > > Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> > > > Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> > > > Cc: linux-input@vger.kernel.org
> > > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > ---
> > > > v3: add check in hid-sony based on fix from Benjamin.
> > >
> > > Sigh. This morning I realized my fix was incomplete as the error path
> > > of the GHL devices handling is not releasing the hidraw node.
> > > I have a followup patch ready that I am about to send as soon as I get
> > > the full tests run.
> > >
> > > Also, I guess we want this series to land in 5.16-rc4 or rc5 and mark
> > > it as stable, no?
> > > If so, I'll add the cc stable@vger.kernel.org marks so you don't need
> > > to keep tabs on it.
> >
> > That would be great, thanks!
> >
> > > Besides that, I tested the wacom change on an I2C screen, and it is
> > > still working as expected, so I think the wacom changes are safe.
> > > The full series is
> > > Tested-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> >
> > Wonderful.
> >
> > Note, I did just get some really odd 0-day error messages from this
> > patch series:
> >       https://lore.kernel.org/r/202112021000.3GKuE8mS-lkp@intel.com
> >       https://lore.kernel.org/r/202112020808.AZ5usuXj-lkp@intel.com
> >
> > Which looks like a dependancy issue that might have always been there.
> > I'll work on resolving that after lunch...
>
> Now sent:
>         https://lore.kernel.org/r/20211202114819.2511954-1-gregkh@linuxfoundation.org

\o/

>
> I can resend it as a v4 series that adds this to the end of the series
> if you want me to.

That's fine. I already locally scheduled the v3, this other series
above and my 2 first patches from my series that you reviewed today.
I also added the cc: stable markers (though I haven't checked exactly
which versions it applies to).

Once my automated suite is happy I'll push them to hid.git.

Thanks for your time Greg!

Cheers,
Benjamin

>
> thanks,
>
> greg k-h
>

