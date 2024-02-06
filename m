Return-Path: <linux-input+bounces-1707-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4868A84B913
	for <lists+linux-input@lfdr.de>; Tue,  6 Feb 2024 16:16:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F422F28EF1A
	for <lists+linux-input@lfdr.de>; Tue,  6 Feb 2024 15:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513281384B2;
	Tue,  6 Feb 2024 15:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZJHi6JaW"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAEC1384A2
	for <linux-input@vger.kernel.org>; Tue,  6 Feb 2024 15:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707232279; cv=none; b=B6/a8oFcZHAlabL8zbiBi0pTJXHhrRen/Et2Sap7X8nXru8tZ6/CXvh/vzAeSAjgmza6KytQ2HI8+DbMwcL8D2Bge7bM6+mF9bWDn8U7+2h8Gl4GNLmPabsv7X0gC2M5STasicjmkUbGwiRLa+O9Kvl7Q8bZaUfS+CNcWHX0Bhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707232279; c=relaxed/simple;
	bh=PI0FMU2BqU+4+ZHEreipuBwsg4G6RdFlhvZlFp3kev8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KJ/0vh1DWai00+FspfahPSh/AtRyG4YadwhMc+gutnZfSGjyGEXmUEsAlBHlneJIYHFg9zhAdNQiiYyEWqyolbaShU5oCV9E5elQYlpLiL6Ybv/yOuiz3g8EvUnVqV7lAQHu+cwpsuKSx0H/PZpTSMKubv1XUzc/SfY/eJJV/08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZJHi6JaW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707232276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tK9LatwWcl7dnGbsGss6OMEHdel5Aop5MvHIEuIAHOM=;
	b=ZJHi6JaWRVXdQIbUkQO4Vbu75F0sXCJftyRTG1ZbXj1U2BIt/Q4Q2s01s0pTE7xfldJRrL
	rzvT+ydD1RpxuesVDmJ/rK0QNN0M4eaSAi8s2Kj06iHkxKREttgikVmYZWIlXJVV+twY1T
	wa5WonWMWtMv5ZPLZoAi0QAbMosxfm4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-r5pzzbjsMfyt46_2GA_wkQ-1; Tue, 06 Feb 2024 10:11:12 -0500
X-MC-Unique: r5pzzbjsMfyt46_2GA_wkQ-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-56064e3e00aso1094201a12.1
        for <linux-input@vger.kernel.org>; Tue, 06 Feb 2024 07:11:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707232270; x=1707837070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tK9LatwWcl7dnGbsGss6OMEHdel5Aop5MvHIEuIAHOM=;
        b=c+lAp1nCexbpI8O4USxvIojy8OCo8Ms/wCh0yR6CgVQleDfDT0yM8CGgZ+OYqdIZxL
         uBO7jrPNXrz8rKUnSEfV3bu7hq72LXB2d4EkG5QGNrVHiClox3aQD+igKeFCbSd0VyHX
         gXLthvy9ZY3cWL27O49Bs0IuFXD59sU9683hYG4VAHek8eCFQd7EsxR+574nayXepM96
         s0FQKphD06eiNqRKUmVPy13zTNHCDTQSBWQpxFk04l+baGZvLlvQENRGsGXG9S/cpkWL
         uCXD4gV67KAWeB7PSqRv3snEa07o/8lQrtsh9wV16qWz6Z2/kFroaIelxb7a19rxgSiz
         brTA==
X-Gm-Message-State: AOJu0YxNihHJHtk4IY8GNDWZiPgrn/bKU0fNr8eTdZintrFFOb/Rp/cm
	yhK541ahKuVrPXZrAuIyZkvI5AGfzPWkt/HMOP1+WP6dHldZfxFufTxkAAUkPV7NVXEduMveocJ
	g+9c2pw7n3+mbc7+TLCDiY+9Fm6KhahcA0hl0JLDgy17ijE+PCCbRnJoe7oHDgxrCwoZ4YsVnG0
	D5kh0e1ttNmu5Osne3s6jKdKWvAGp3dCeGHCi45+TjVy+nIg==
X-Received: by 2002:a05:6402:1847:b0:55f:f73c:9e3c with SMTP id v7-20020a056402184700b0055ff73c9e3cmr1759190edy.28.1707232270425;
        Tue, 06 Feb 2024 07:11:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKrApSNx3Dr3Rnzlmy3FJ6pCYUW1qYTyMSytN57S86lwkFRYBv1iOLQkwD7T6Il7xkY6Kp4OlkTFRCdGBSil8=
X-Received: by 2002:a05:6402:1847:b0:55f:f73c:9e3c with SMTP id
 v7-20020a056402184700b0055ff73c9e3cmr1759173edy.28.1707232270067; Tue, 06 Feb
 2024 07:11:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEQPD4S1zyUMUyJbOb8i5a+URsLCrGMKPKD47es8OgCoKKwRQg@mail.gmail.com>
 <CAEQPD4T+C_RaP_z96XRXj1teGiDMZu1MsPn8hAQ5FhSoaajZaA@mail.gmail.com>
 <CAEQPD4RSFJN5TvU2vwHL=w1TkMzxD+v1=jxyyNzZDMyPane=BQ@mail.gmail.com>
 <CAO-hwJ+OFxRqoL4RYaKMR_PfmpBJuyWUGcDXRrp7jWuYfT=CyQ@mail.gmail.com>
 <CAEQPD4TNkGn-xjLqNiNb5c2Hc9P-4Hpeq-92tBSPJiJ=4-dsZw@mail.gmail.com>
 <CAEQPD4TBPsh0At4Eqmox++AiGes3q16O5qva6KNQMwzmRPySOQ@mail.gmail.com>
 <CAO-hwJJKmFFt2YkenJ0RxsH_nFCu1oPGMvgbF4Tz0CsyKGZB2A@mail.gmail.com> <CAEQPD4SZCFf5vj+Dyji9UzOg7M+3GPMRgTesUb2d9w8_Gm9XZg@mail.gmail.com>
In-Reply-To: <CAEQPD4SZCFf5vj+Dyji9UzOg7M+3GPMRgTesUb2d9w8_Gm9XZg@mail.gmail.com>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Tue, 6 Feb 2024 16:10:57 +0100
Message-ID: <CAO-hwJLpkDnENL_TkCqp9B4+NaWdVAo6SwkqBEPQyoZ70T0kvA@mail.gmail.com>
Subject: Re: Suspected bug in hid-microsoft.c
To: Taco Jerkface <tacodog311@gmail.com>
Cc: Siarhei Vishniakou <svv@google.com>, linux-input@vger.kernel.org, jikos@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 6, 2024 at 6:25=E2=80=AFAM Taco Jerkface <tacodog311@gmail.com>=
 wrote:
>
> Thanks!
>
> > 1. (easiest) tune your udev rule to also give user access to the
> > hidraw subsystem on this device. SDL should be able to read it
> > directly, and handle it properly, but this won't solve for future
> > users
>
> This udev rule does in fact "fix" the problem
>
> KERNELS=3D=3D"*:045E:0B22.*", MODE=3D"0666"

Right :)

Well you could restrict it further by using the recommendations from SDL:
https://github.com/libsdl-org/SDL/blob/main/src/hidapi/udev/69-hid.rules

# HIDAPI/hidraw
KERNEL=3D=3D"hidraw*", ATTRS{idVendor}=3D=3D"045E", ATTRS{idProduct}=3D=3D"=
0B22",
TAG+=3D"uaccess"

(not entirely sure about the capitals in vendor/product)


>
>
> > 2. (no kernel compilation required) we can try to fix the report
> > descriptor of the device through HID-BPF. Assuming you have
> > CONFIG_HID_BPF enabled in your kernel, we can relatively easily change
> > the way the device is exported/handled by the kernel, to make it
> > useful hopefully
> > 3. (hardest IMO as you'll have to recompile your kernel for the tests)
> > we can try to tune hid-microsoft.c to properly export these buttons
> >
> > For 2 and 3, I'll need some events from your device with hid-recorder.
> > You only gave me the report descriptor, but no events which are hard
> > to deduce based on the long report descriptor.
>
> With the udev rule, I attached the hid-recorder output when pressing
> the paddles.  I see the 01 02 04 08 showing up at the end of the line.

Thanks for that. And as you can see, they are using the "Assign
Selection" usage, which is... new to me :)

>
>
> > Also for 2 and 3 we need to have a BTN_* button code to use, and I
> > don't know which ones should be used from the top of my head. HID-BPF
> > would be easiest to use as we can let the user decide of it, while
> > we'll need to have a more formal usage in case we fix hid-microsoft.
>
> When connected with USB, evemu-record shows button names
> "BTN_TRIGGER_HAPPY5" "BTN_TRIGGER_HAPPY6" "BTN_TRIGGER_HAPPY7"
> "BTN_TRIGGER_HAPPY8".  I assume these are the button codes we can use?
>
> ################################
> #      Waiting for events      #
> ################################
> E: 0.000001 0001 02c4 0001      # EV_KEY / BTN_TRIGGER_HAPPY5   1
> E: 0.000001 0000 0000 0000      # ------------ SYN_REPORT (0) ---------- =
+0ms
> E: 0.143950 0001 02c4 0000      # EV_KEY / BTN_TRIGGER_HAPPY5   0
> E: 0.143950 0000 0000 0000      # ------------ SYN_REPORT (0) ---------- =
+143ms
> E: 6.543984 0001 02c5 0001      # EV_KEY / BTN_TRIGGER_HAPPY6   1
> E: 6.543984 0000 0000 0000      # ------------ SYN_REPORT (0) ---------- =
+6400ms
> E: 6.615981 0001 02c5 0000      # EV_KEY / BTN_TRIGGER_HAPPY6   0
> E: 6.615981 0000 0000 0000      # ------------ SYN_REPORT (0) ---------- =
+72ms
> E: 7.520034 0001 02c6 0001      # EV_KEY / BTN_TRIGGER_HAPPY7   1
> E: 7.520034 0000 0000 0000      # ------------ SYN_REPORT (0) ---------- =
+905ms
> E: 7.648127 0001 02c6 0000      # EV_KEY / BTN_TRIGGER_HAPPY7   0
> E: 7.648127 0000 0000 0000      # ------------ SYN_REPORT (0) ---------- =
+128ms
> E: 8.344035 0001 02c7 0001      # EV_KEY / BTN_TRIGGER_HAPPY8   1
> E: 8.344035 0000 0000 0000      # ------------ SYN_REPORT (0) ---------- =
+696ms
> E: 8.480049 0001 02c7 0000      # EV_KEY / BTN_TRIGGER_HAPPY8   0
> E: 8.480049 0000 0000 0000      # ------------ SYN_REPORT (0) ---------- =
+136ms
>

Good point. Then we can easily tweak the device to use those BTN_* instead

>
> >
> > For 1, maybe SDL (or Steam) already ships some udev rules, and
> > submitting a fix there would make things working for everybody.
> >
> > Anyway, depending on how much you want this to be fixed and what you
> > can do (is CONFIG_HID_BPF enabled in your distro? and can you
> > recompile a kernel module?) we can figure out the next step.
>
> Yes HID-BPF is configured in my kernel:
>
> cat /proc/config.gz | gunzip
> #
> # HID-BPF support
> #
> CONFIG_HID_BPF=3Dy
> # end of HID-BPF support

Even better, it'll be way easier for the tests :)

I've opened a new MR with your device fix:
https://gitlab.freedesktop.org/libevdev/udev-hid-bpf/-/merge_requests/32

You should be able to head to the last job in latest pipeline (in the
pipeline tab) and download the artifact:
https://gitlab.freedesktop.org/libevdev/udev-hid-bpf/-/jobs/54687597/artifa=
cts/browse

Then unpack and run `sudo ./install --verbose`.

Then reconnect the device over Bluetooth, and see in evemu-record that
the paddles are now reporting BTN_TRIGGER_HAPPY[5-8].

I'd then be curious about 2 things:
- are the paddle now reporting the same events over USB and Bluetooth?
(is there no inversions between the BTN_TRIGGER*?, and are all the
buttons correctly handled?)
- does this mess up with SDL over hidraw (so keeping your udev rule in plac=
e)

>
> I've never recompiled a module before, but I've compiled lots of other
> stuff before.  How hard can it be?
>

Technically it's not hard, I'm sure there is a proper Arch howto
available. But it's painful because you'll have to maintain &
recompile your kernel until your fix gets in the standard kernel of
your distribution (archlinux if I'm not wrong).

But the good point is that with HID-BPF that pain is relieved:  I can
provide you with the binary, you can check it if you like (the loader
is in rust and the bpf itself is C), and then once installed you can
forget about it.

Cheers,
Benjamin


