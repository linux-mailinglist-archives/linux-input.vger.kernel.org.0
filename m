Return-Path: <linux-input+bounces-62-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0C37EC6EE
	for <lists+linux-input@lfdr.de>; Wed, 15 Nov 2023 16:14:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E89741C208E0
	for <lists+linux-input@lfdr.de>; Wed, 15 Nov 2023 15:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D2833061;
	Wed, 15 Nov 2023 15:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BABK6BTt"
X-Original-To: linux-input@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF667381A3
	for <linux-input@vger.kernel.org>; Wed, 15 Nov 2023 15:14:50 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F37319D
	for <linux-input@vger.kernel.org>; Wed, 15 Nov 2023 07:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700061288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VjkOmI2I0GDZgSZOoiwJ6/mRH4CBJ4Y9hZDkyw5qt0c=;
	b=BABK6BTtGoy5Z8pLP1v8tOePtuCqUeGK97zvwAEMgXJtK0VsNSvMOnpBb+zkye/veoHoOe
	2MJ3/PstnzTrxijOwBu4AfDY8IXigAOHhumAAfsyYekeTR7xF5MOUvIC/qZSXOAM7LjjA4
	rs84QcDS72f/v2wKcuyGH0QH8N742AY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-oeCbagA-OpSytZaIP_eyOg-1; Wed, 15 Nov 2023 10:14:46 -0500
X-MC-Unique: oeCbagA-OpSytZaIP_eyOg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9c7f0a33afbso450892966b.3
        for <linux-input@vger.kernel.org>; Wed, 15 Nov 2023 07:14:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700061285; x=1700666085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VjkOmI2I0GDZgSZOoiwJ6/mRH4CBJ4Y9hZDkyw5qt0c=;
        b=XYaCgoQISHXtc4kYdsHpMjgCekwC8ogAWa3KdyTY84H62iWPrEDo6vp4KToVXetL6n
         L8l8nmbsv59dNs4yDgHMu5mm+q/gtaJhanQ1h74iXgrJwqKUHFu4jV/bzgDFdIzQGd7H
         SoViCTapVyTJ4gfV20yB3gWdFeSjrhVvS8CyRrUWX44ioxrY2ByviT7Q8QYjO41q/CI4
         4fnEEZaSor2iHri8gmotygHJLkeaFIIBvW+3MBuiODWEOr+KLzX6eMNoKcizTg9zdHkY
         w8elrbPxcMh0pm5ft+YSZEJXFKduZJuihQFeW+exzppBBzLke0d5F/4oh89QTLzM1cRy
         ediw==
X-Gm-Message-State: AOJu0YwLzLHKiqZzmdwPfF9d55lTdb4E7Ttxn+CA5qcGPV6pOltRigP/
	LSAOKrKm1HiYB3YrJA2EW2pKncZDPlDUZ4zXNEzbnFXEtO53qR+09fRNrJogeCPBsnDDGmRLt/t
	6BOj1VfXCKk18NDGsRzfiVynKrPUklgF1kMr42BM=
X-Received: by 2002:a17:907:36c5:b0:9e7:c1cd:a4dc with SMTP id bj5-20020a17090736c500b009e7c1cda4dcmr8998347ejc.6.1700061285290;
        Wed, 15 Nov 2023 07:14:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYIqCwTu6ghWGkICTGTw9KmCBb0p2Al1kzemXlJXZapp74C6Cy3lUDyjYHnP6SLEss9RIo7JJJJsn8cAPMeRQ=
X-Received: by 2002:a17:907:36c5:b0:9e7:c1cd:a4dc with SMTP id
 bj5-20020a17090736c500b009e7c1cda4dcmr8998325ejc.6.1700061284952; Wed, 15 Nov
 2023 07:14:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <nycvar.YFH.7.76.2311012033290.29220@cbobk.fhfr.pm>
 <ZUtTpKyP0oxWhnn8@fedora> <CAO-hwJLjtjdr2gtrOWJFPZ-38YzKB8XfhDKWf_2jUPeiaP3EcA@mail.gmail.com>
 <CAO-hwJKNcwcDGEh33NZq4kSYtoxZzg9M2nzE_hVDYNFgA4g_dg@mail.gmail.com>
 <_DEF7tHL1p_ExY7GJlJvT5gRA7ZvNnVMJuURb8_WCV-0fbYXkLN2p5zHloi6wiJPNzGEjFAkq2sjbCU633_eNF_cGm0rAbmCOOIOfwe1jWo=@protonmail.com>
 <CAO-hwJ+zm=R7NwrALaLVmfPDtMNXpj0eoQgLkiS1wa6wd+hu+A@mail.gmail.com>
 <CAO-hwJKJW5jGDdaaS8eB7kcLQUvWO_1XkOzJG4HAcaRzw1cGnQ@mail.gmail.com>
 <7wmtNlKuYResf5cFQ7M2QTalzIUtw0I6ohvPcz69Jo1c8flezyIlnJu1IwAgXhJ-u0NlRL3IV7HnL0Kza6fVBqd7X7jhc-Z6QCi3oqHEvpY=@protonmail.com>
 <CAO-hwJJ+nx72_TPfxcWRPBDZdDaPrO5yMNH4Y_mj6ej651Mesw@mail.gmail.com>
 <nFHw6XePiH5p60JsbQSbssRkiuABiTiR_n5fIYFZjPgkV3ObjjZuwTC84BJ_1vXYVufPbG3UvZ1L7ODSrrGlq9CrI7BTKhsV5QeAQoakV18=@protonmail.com>
 <CAO-hwJ+jwmTE-v7FsPi3f70mB8SqUha7Ek9DtptZ0auiFpGM7w@mail.gmail.com>
In-Reply-To: <CAO-hwJ+jwmTE-v7FsPi3f70mB8SqUha7Ek9DtptZ0auiFpGM7w@mail.gmail.com>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Wed, 15 Nov 2023 16:14:32 +0100
Message-ID: <CAO-hwJJoCp0_kxf_HHN9n9EWy9YDSY4rP8ysYNrNg2xTUYtKEQ@mail.gmail.com>
Subject: Re: Requesting your attention and expertise regarding a Tablet/Kernel issue
To: David Revoy <davidrevoy@protonmail.com>
Cc: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
	Eric GOUYER <folays@gmail.com>, Illia Ostapyshyn <ostapyshyn@sra.uni-hannover.de>, jkosina@suse.cz, 
	jason.gerecke@wacom.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Tue, Nov 14, 2023 at 3:35=E2=80=AFPM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
[...]
> > > Could you please once again attach the hid-recorder of the Pro 24
> > > while doing the following sequence:
> > > - touch with the tip of the stylus the tablet
> > > - while touching, press the upper button (the problematic one)
> > > - still while touching, release the button
> > > - remove the stylus
> >
> > Sure, you'll find the action (repeated three times) recorded here [2]
>
> Thanks a lot. However, I realized this morning 2 issues (sorry):
> - you made the recording while the HID-BPF program was attached, which
> is now obvious that anyone would do that. But the program sometimes
> discards events, so I am not sure now if sometimes the device is not
> sending the spurious events, or if the filter was acting correctly.
> (Note to self, next time, while in the testing phase, do not blindly
> discard the events, but remap them to an ignored report)
> - that device is really "interesting" in how it behaves with the
> eraser mode emulation: when you press the second button while touching
> the pen, we get a spurious release of the touch event... And this
> leads me to think that I'm not sure about all of the transitions we
> can have with buttons :(
>
> TL;DR: there is still work to do for me and for you if you still agree
> to send me more traces.
>

I managed to refine the bpf filter. Assuming I am correct in what I
understand from the device, of course.
Also this time I made sure the original events are still around but
unprocessed by the input layer :)

So it would be nice if you could try the artifacts of job 51600738[4].
Again, download them (udev-hid-bpf_0.1.0-4-g5ab02ec.tar.xz), unpack,
sudo ./install --verbose, then unplug/replug the artist Pro 24.

Then, I'll need the following sequence (ideally repeated twice or
three times, given that your last record show a slight difference in
the first and second attempt):

- outside of the proximity of the sensor, press the upper button
- approach the stylus to the surface keeping the upper button pressed
- touch the surface with the tip while holding the upper button pressed
- release the upper button while keeping the tip pressed (like previously)
- press once again the upper button while keeping the tip touching the
surface (like previously)
- lift of the pen, keeping the upper button pressed, and still in
range of the sensor
- remove the pen from the proximity of the sensor entirely (move away
20 cm or so), while still keeping the upper button pressed

It's actually longer to describe than to execute :)

> >
> > > you could also give a test of the artifacts of job 51469284[3].
> > >
> > > The points to check are:
> > > - if you right click while touching the surface, do you still get onl=
y
> > > a right click or some weird glitches in addition to it?
> > > - if you right click while not touching (hovering), no glitches?
> >
> > I tested. It's a bit hard to tell if it causes glitches or if the
> > behavior is normal or not. I'm not using the right-click this way.
> > I always use it in "hover mode". With artifact or without, the
> > behavior is while the tip is pressed, the right-click quickly
> > 'disapear' but it is probably normal because I test on contextual
> > menu and clicking somewhere else makes this type of menu disapear.
>
> AFAICT you used the artifacts from job 51469284. Which is good. But as
> I mentioned above, the tablet is sending a spurious event I haven't
> anticipated, which results in a left click (well release/click) from
> the host point of view. And that very well explains the disappearance
> of the right-click menu.

I think I managed to remove the spurious release/click with the latest
udev-hid-bpf pipeline.

>
> >
> > I hope this will help,
>
> It does, but there are glitches that I'd like to fix. I need to iron
> out the bpf filter for those use cases. I rewrote the tests today to
> take those into account (assuming I understand the HW enough) and I
> think they are better now.
>
> But I would also totally understand that you had enough debugging and
> you would rather focus on using the tablets, instead of debugging
> them. In which case, someone else from the community might help me.
>
> Cheers,
> Benjamin
>
>
> > Cheers,
> >
> > David
> >
> > [1] https://www.davidrevoy.com/article1002/how-a-kernel-developer-made-=
my-styluses-work-again
> > [2] https://www.peppercarrot.com/extras/mailing-list/hid-records/XPPEN-=
Artist-24-Pro/XPPEN-Artist-24-Pro_pen_tip-contact-and-action-press-release-=
upper-stylus-button-x3.txt
> >

Cheers,
Benjamin

[4] https://gitlab.freedesktop.org/libevdev/udev-hid-bpf/-/jobs/51600738


