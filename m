Return-Path: <linux-input+bounces-1786-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 050E684F62E
	for <lists+linux-input@lfdr.de>; Fri,  9 Feb 2024 14:47:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B3F01F21826
	for <lists+linux-input@lfdr.de>; Fri,  9 Feb 2024 13:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C1A844C9D;
	Fri,  9 Feb 2024 13:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J4Fj3sSv"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF59A3CF69
	for <linux-input@vger.kernel.org>; Fri,  9 Feb 2024 13:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707486442; cv=none; b=c+Hwaf+rKnZWZ8kqvr1/E9PZFxD9Ky2tdjJy/Jk45bAriCHZ68YxrXqr2khJdWQj5+BmJh5F1woBYbLreK4tPY/qOTU39YSc/TtQD6at+65ruL3hbHE4cseNWouUI0ZszDYmSC8yvKelnDUXH9zUhIzSUk0Hp8OfOAHxByYE2aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707486442; c=relaxed/simple;
	bh=3HmItgf5/SDrKgzjK0snflKAKRUg9K9qISr/Z6TcvE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mX2lsXjbzbm0LNtPukTf1SN3JkHPrXb40cZALSzy921S6+IoJph5YhZKAzS/aR9DZLnxagciOSmxXxmkKi0htgQ8IIKoI5vIVBTkTw5iB2DiJYTJsK6Vqtk6osgAP8fuxrlXJn66BKEJsOTpxKhiwlQl0T2b8yQIS/hM2PI6NTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J4Fj3sSv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707486438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IwmARvEIZhZPQOKjmoFZ2idrWhGKzNKeCfRkH2S/q10=;
	b=J4Fj3sSva7A+75HXrl+mAXmSgf4tKpGWN5gsQ1474Bh4BDJsm8annHVH2XfBh6+APXj6gv
	T2ReToc6m6cJjLD4a7Sj33ymuVpXtStvUPYarSE67np4yMnFfRdHvFJTsuZ5XhrFJGUxQ3
	TqPPMgn0XQ5DocqCs8CKla+8EwKdp+A=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-P_E4_AptO92tpxrpdZfSKA-1; Fri, 09 Feb 2024 08:47:15 -0500
X-MC-Unique: P_E4_AptO92tpxrpdZfSKA-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5601e5ed21aso666969a12.1
        for <linux-input@vger.kernel.org>; Fri, 09 Feb 2024 05:47:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707486434; x=1708091234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IwmARvEIZhZPQOKjmoFZ2idrWhGKzNKeCfRkH2S/q10=;
        b=tT2QWDLE8QepQ1lV52ijT6i2ZRwC31Ys64qZYuwCu0ZTQ9LILB0k3KQZX9WcQescZE
         KLVsASXm1m9K2BePSYCuRY8Ke/18NFPOcTaBmUif7C8v4L8eg4XfQv/kih649OJS2ucD
         Lvkhv876J99VpHlKavBQBEh44zu2YaX1fReaJVjP/6Nd/LfYfyPIuaFVEUAGkk9hoP+w
         7poC9vyYqb4NcWnGURT9SjqGjEbJnPC+PNYTALDiz3wOldZnp9jxiqirX+2kHiIYuIlO
         q6KraFQMR28vbPLYE/FHm+0GlTF86B9arU0OSRLvp34TBcC9IkGSKO0+QqwrY571Z3gq
         ulnA==
X-Gm-Message-State: AOJu0YzMaB5NucLuDi+Gng4yEdED44ZSN60gRlD97IOXPk2UfcCTUPVi
	3GmgtH42N8x/9q5v44oci/ikklku145B1Hgu/0NsH0Lf4aVIGGt4qNu1YNRiz75e3C+mmhkaP3S
	E/upCLFGZ6mMTm4IZ1kIEjNrRmY9ZjMPmGezBV5rCqBedgMiKWvW++TEPb3vP137N+NChqZ/tzd
	7BJhn76wzg+BAL0ElGQY7p2w90uomkg1feGSKuqQ+ulBuaVg==
X-Received: by 2002:a05:6402:517:b0:560:29aa:f4a5 with SMTP id m23-20020a056402051700b0056029aaf4a5mr1401246edv.37.1707486433621;
        Fri, 09 Feb 2024 05:47:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGR4vrl9U/Yacba+K62VnRR6jooxsQpEgckvW25ZStns4uBZxGVER2gkBBMynby28SfG21VXWKU/dlvgObF2+Y=
X-Received: by 2002:a05:6402:517:b0:560:29aa:f4a5 with SMTP id
 m23-20020a056402051700b0056029aaf4a5mr1401230edv.37.1707486433152; Fri, 09
 Feb 2024 05:47:13 -0800 (PST)
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
 <CAO-hwJJKmFFt2YkenJ0RxsH_nFCu1oPGMvgbF4Tz0CsyKGZB2A@mail.gmail.com>
 <CAEQPD4SZCFf5vj+Dyji9UzOg7M+3GPMRgTesUb2d9w8_Gm9XZg@mail.gmail.com>
 <CAO-hwJLpkDnENL_TkCqp9B4+NaWdVAo6SwkqBEPQyoZ70T0kvA@mail.gmail.com> <CAEQPD4QEG8K7HtVaZe3g_P0=ppSeY=FH=fRbswQsV6JBpZe0DA@mail.gmail.com>
In-Reply-To: <CAEQPD4QEG8K7HtVaZe3g_P0=ppSeY=FH=fRbswQsV6JBpZe0DA@mail.gmail.com>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Fri, 9 Feb 2024 14:47:01 +0100
Message-ID: <CAO-hwJLQ5rh+kOrOL8XH67WBUjjtVxrXUqFXo29zGSxTvQ6Ovw@mail.gmail.com>
Subject: Re: Suspected bug in hid-microsoft.c
To: Taco Jerkface <tacodog311@gmail.com>
Cc: "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[Adding back the linux-input ML]

On Wed, Feb 7, 2024 at 6:34=E2=80=AFAM Taco Jerkface <tacodog311@gmail.com>=
 wrote:
>
> On Tue, Feb 6, 2024 at 8:11=E2=80=AFAM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> >
> > On Tue, Feb 6, 2024 at 6:25=E2=80=AFAM Taco Jerkface <tacodog311@gmail.=
com> wrote:
> > >
> > > Thanks!
> > >
> > > > 1. (easiest) tune your udev rule to also give user access to the
> > > > hidraw subsystem on this device. SDL should be able to read it
> > > > directly, and handle it properly, but this won't solve for future
> > > > users
> > >
> > > This udev rule does in fact "fix" the problem
> > >
> > > KERNELS=3D=3D"*:045E:0B22.*", MODE=3D"0666"
> >
> > Right :)
> >
> > Well you could restrict it further by using the recommendations from SD=
L:
> > https://github.com/libsdl-org/SDL/blob/main/src/hidapi/udev/69-hid.rule=
s
> >
> > # HIDAPI/hidraw
> > KERNEL=3D=3D"hidraw*", ATTRS{idVendor}=3D=3D"045E", ATTRS{idProduct}=3D=
=3D"0B22",
> > TAG+=3D"uaccess"
> >
> > (not entirely sure about the capitals in vendor/product)
>
> I tried that and couldn't get it to work.  My (incomplete)
> understanding is that the rule needs to match the fields from "udevadm
> info --name=3D/dev/hidraw1 --attribute-walk" which looks like this.  The
> "KERNELS" line was the best I could find with both the vendor and
> product fields.  I wildcarded the 0005 because it changed when I
> reconnected.

Yeah, so I vaguely remember that some properties are inherited from
the parents, and VendorID and ProductID might be inherited. And given
that this is a BLE device and that it's then using uhid, those
properties are not set.

TL;DR: seems like you got the correct match. You should probably use
TAG+=3D"uaccess" instead of MODE=3D"0666" to restrict the opening of the
device from the current user of the current session only.

>
>   looking at device
> '/devices/virtual/misc/uhid/0005:045E:0B22.0005/hidraw/hidraw1':
>    KERNEL=3D=3D"hidraw1"
>    SUBSYSTEM=3D=3D"hidraw"
>    DRIVER=3D=3D""
>    ATTR{power/control}=3D=3D"auto"
>    ATTR{power/runtime_active_time}=3D=3D"0"
>    ATTR{power/runtime_status}=3D=3D"unsupported"
>    ATTR{power/runtime_suspended_time}=3D=3D"0"
>
>  looking at parent device '/devices/virtual/misc/uhid/0005:045E:0B22.0005=
':
>    KERNELS=3D=3D"0005:045E:0B22.0005"
>    SUBSYSTEMS=3D=3D"hid"
>    DRIVERS=3D=3D"microsoft"
>    ATTRS{country}=3D=3D"00"
>    ATTRS{power/control}=3D=3D"auto"
>    ATTRS{power/runtime_active_time}=3D=3D"0"
>    ATTRS{power/runtime_status}=3D=3D"unsupported"
>    ATTRS{power/runtime_suspended_time}=3D=3D"0"
>
>  looking at parent device '/devices/virtual/misc/uhid':
>    KERNELS=3D=3D"uhid"
>    SUBSYSTEMS=3D=3D"misc"
>    DRIVERS=3D=3D""
>    ATTRS{power/control}=3D=3D"auto"
>    ATTRS{power/runtime_active_time}=3D=3D"0"
>
> >
> >
> > >
> > >
> > > > 2. (no kernel compilation required) we can try to fix the report
> > > > descriptor of the device through HID-BPF. Assuming you have
> > > > CONFIG_HID_BPF enabled in your kernel, we can relatively easily cha=
nge
> > > > the way the device is exported/handled by the kernel, to make it
> > > > useful hopefully
> > > > 3. (hardest IMO as you'll have to recompile your kernel for the tes=
ts)
> > > > we can try to tune hid-microsoft.c to properly export these buttons
> > > >
> > > > For 2 and 3, I'll need some events from your device with hid-record=
er.
> > > > You only gave me the report descriptor, but no events which are har=
d
> > > > to deduce based on the long report descriptor.
> > >
> > > With the udev rule, I attached the hid-recorder output when pressing
> > > the paddles.  I see the 01 02 04 08 showing up at the end of the line=
.
> >
> > Thanks for that. And as you can see, they are using the "Assign
> > Selection" usage, which is... new to me :)
> >
> > >
> > >
> > > > Also for 2 and 3 we need to have a BTN_* button code to use, and I
> > > > don't know which ones should be used from the top of my head. HID-B=
PF
> > > > would be easiest to use as we can let the user decide of it, while
> > > > we'll need to have a more formal usage in case we fix hid-microsoft=
.
> > >
> > > When connected with USB, evemu-record shows button names
> > > "BTN_TRIGGER_HAPPY5" "BTN_TRIGGER_HAPPY6" "BTN_TRIGGER_HAPPY7"
> > > "BTN_TRIGGER_HAPPY8".  I assume these are the button codes we can use=
?
> > >
> > > ################################
> > > #      Waiting for events      #
> > > ################################
> > > E: 0.000001 0001 02c4 0001      # EV_KEY / BTN_TRIGGER_HAPPY5   1
> > > E: 0.000001 0000 0000 0000      # ------------ SYN_REPORT (0) -------=
--- +0ms
> > > E: 0.143950 0001 02c4 0000      # EV_KEY / BTN_TRIGGER_HAPPY5   0
> > > E: 0.143950 0000 0000 0000      # ------------ SYN_REPORT (0) -------=
--- +143ms
> > > E: 6.543984 0001 02c5 0001      # EV_KEY / BTN_TRIGGER_HAPPY6   1
> > > E: 6.543984 0000 0000 0000      # ------------ SYN_REPORT (0) -------=
--- +6400ms
> > > E: 6.615981 0001 02c5 0000      # EV_KEY / BTN_TRIGGER_HAPPY6   0
> > > E: 6.615981 0000 0000 0000      # ------------ SYN_REPORT (0) -------=
--- +72ms
> > > E: 7.520034 0001 02c6 0001      # EV_KEY / BTN_TRIGGER_HAPPY7   1
> > > E: 7.520034 0000 0000 0000      # ------------ SYN_REPORT (0) -------=
--- +905ms
> > > E: 7.648127 0001 02c6 0000      # EV_KEY / BTN_TRIGGER_HAPPY7   0
> > > E: 7.648127 0000 0000 0000      # ------------ SYN_REPORT (0) -------=
--- +128ms
> > > E: 8.344035 0001 02c7 0001      # EV_KEY / BTN_TRIGGER_HAPPY8   1
> > > E: 8.344035 0000 0000 0000      # ------------ SYN_REPORT (0) -------=
--- +696ms
> > > E: 8.480049 0001 02c7 0000      # EV_KEY / BTN_TRIGGER_HAPPY8   0
> > > E: 8.480049 0000 0000 0000      # ------------ SYN_REPORT (0) -------=
--- +136ms
> > >
> >
> > Good point. Then we can easily tweak the device to use those BTN_* inst=
ead
> >
> > >
> > > >
> > > > For 1, maybe SDL (or Steam) already ships some udev rules, and
> > > > submitting a fix there would make things working for everybody.
> > > >
> > > > Anyway, depending on how much you want this to be fixed and what yo=
u
> > > > can do (is CONFIG_HID_BPF enabled in your distro? and can you
> > > > recompile a kernel module?) we can figure out the next step.
> > >
> > > Yes HID-BPF is configured in my kernel:
> > >
> > > cat /proc/config.gz | gunzip
> > > #
> > > # HID-BPF support
> > > #
> > > CONFIG_HID_BPF=3Dy
> > > # end of HID-BPF support
> >
> > Even better, it'll be way easier for the tests :)
> >
> > I've opened a new MR with your device fix:
> > https://gitlab.freedesktop.org/libevdev/udev-hid-bpf/-/merge_requests/3=
2
> >
> > You should be able to head to the last job in latest pipeline (in the
> > pipeline tab) and download the artifact:
> > https://gitlab.freedesktop.org/libevdev/udev-hid-bpf/-/jobs/54687597/ar=
tifacts/browse
> >
> > Then unpack and run `sudo ./install --verbose`.
> >
> > Then reconnect the device over Bluetooth, and see in evemu-record that
> > the paddles are now reporting BTN_TRIGGER_HAPPY[5-8].
> >
>
> Thanks.  This does indeed work (with my udev rule still active).

\o/

>
> > I'd then be curious about 2 things:
> > - are the paddle now reporting the same events over USB and Bluetooth?
> > (is there no inversions between the BTN_TRIGGER*?, and are all the
> > buttons correctly handled?)
>
> The button reports are nearly identical now, though Bluetooth outputs
> more information.

\o/

>
> This is paddle1, paddl2, paddle3, paddle4 pressed in that order each way.
>
> USB:
> E: 0.000001 0001 02c4 0001      # EV_KEY / BTN_TRIGGER_HAPPY5   1
> E: 0.000001 0000 0000 0000      # ------------ SYN_REPORT (0) ---------- =
+0ms
> E: 0.080031 0001 02c4 0000      # EV_KEY / BTN_TRIGGER_HAPPY5   0
> E: 0.080031 0000 0000 0000      # ------------ SYN_REPORT (0) ---------- =
+80ms
> E: 1.520025 0001 02c5 0001      # EV_KEY / BTN_TRIGGER_HAPPY6   1
> E: 1.520025 0000 0000 0000      # ------------ SYN_REPORT (0) ---------- =
+1440ms
> E: 1.631883 0001 02c5 0000      # EV_KEY / BTN_TRIGGER_HAPPY6   0
> E: 1.631883 0000 0000 0000      # ------------ SYN_REPORT (0) ---------- =
+111ms
> E: 2.183887 0001 02c6 0001      # EV_KEY / BTN_TRIGGER_HAPPY7   1
> E: 2.183887 0000 0000 0000      # ------------ SYN_REPORT (0) ---------- =
+552ms
> E: 2.295985 0001 02c6 0000      # EV_KEY / BTN_TRIGGER_HAPPY7   0
> E: 2.295985 0000 0000 0000      # ------------ SYN_REPORT (0) ---------- =
+112ms
> E: 2.800031 0001 02c7 0001      # EV_KEY / BTN_TRIGGER_HAPPY8   1
> E: 2.800031 0000 0000 0000      # ------------ SYN_REPORT (0) ---------- =
+505ms
> E: 2.879964 0001 02c7 0000      # EV_KEY / BTN_TRIGGER_HAPPY8   0
> E: 2.879964 0000 0000 0000      # ------------ SYN_REPORT (0) ---------- =
+79ms
>
> Bluetooth:
> E: 0.000001 0004 0004 589845    # EV_MSC / MSC_SCAN             589845
> E: 0.000001 0001 02c4 0001      # EV_KEY / BTN_TRIGGER_HAPPY5   1
> E: 0.000001 0000 0000 0000      # ------------ SYN_REPORT (0) ---------- =
+0ms
> E: 0.033496 0004 0004 589845    # EV_MSC / MSC_SCAN             589845
> E: 0.033496 0001 02c4 0000      # EV_KEY / BTN_TRIGGER_HAPPY5   0
> E: 0.033496 0000 0000 0000      # ------------ SYN_REPORT (0) ---------- =
+33ms
> E: 1.726818 0004 0004 589846    # EV_MSC / MSC_SCAN             589846
> E: 1.726818 0001 02c5 0001      # EV_KEY / BTN_TRIGGER_HAPPY6   1
> E: 1.726818 0000 0000 0000      # ------------ SYN_REPORT (0) ---------- =
+1693ms
> E: 1.843421 0004 0004 589846    # EV_MSC / MSC_SCAN             589846
> E: 1.843421 0001 02c5 0000      # EV_KEY / BTN_TRIGGER_HAPPY6   0
> E: 1.843421 0000 0000 0000      # ------------ SYN_REPORT (0) ---------- =
+117ms
> E: 2.736883 0004 0004 589847    # EV_MSC / MSC_SCAN             589847
> E: 2.736883 0001 02c6 0001      # EV_KEY / BTN_TRIGGER_HAPPY7   1
> E: 2.736883 0000 0000 0000      # ------------ SYN_REPORT (0) ---------- =
+893ms
> E: 2.826849 0004 0004 589847    # EV_MSC / MSC_SCAN             589847
> E: 2.826849 0001 02c6 0000      # EV_KEY / BTN_TRIGGER_HAPPY7   0
> E: 2.826849 0000 0000 0000      # ------------ SYN_REPORT (0) ---------- =
+90ms
> E: 3.300247 0004 0004 589848    # EV_MSC / MSC_SCAN             589848
> E: 3.300247 0001 02c7 0001      # EV_KEY / BTN_TRIGGER_HAPPY8   1
> E: 3.300247 0000 0000 0000      # ------------ SYN_REPORT (0) ---------- =
+474ms
> E: 3.373377 0004 0004 589848    # EV_MSC / MSC_SCAN             589848
> E: 3.373377 0001 02c7 0000      # EV_KEY / BTN_TRIGGER_HAPPY8   0
> E: 3.373377 0000 0000 0000      # ------------ SYN_REPORT (0) ---------- =
+73ms
>
> Also via USB, evemu recognizes the controller as "Microsoft X-Box One
> Elite 2 pad".  With Bluetooth it's seen as "Xbox Wireless Controller".
> This happens with or without your merge request.

This is expected and also kind of normal. We are not connecting
through the same transport, so one should at least have the "wireless"
in it. Rest is just how the device itself has those strings stored, so
we should probably just say it's fine.

>
> USB
>
> > evemu-record
> Available devices:
> /dev/input/event17:     Microsoft X-Box One Elite 2 pad
>
> Bluetooth
>
> > evemu-record
> Available devices:
> /dev/input/event16:     Xbox Wireless Controller
>
>
> > - does this mess up with SDL over hidraw (so keeping your udev rule in =
place)
>
> SDL seems to recognize the controller as 'Xbox One Elite 2 Controller'
> over both USB and Bluetooth.  Though the ProductID is "000b" with USB
> and "220b" via bluetooth.  Also, SDL, recognized the "hat" via USB,
> but sees them as 4 more buttons through BT.  I'm using
> Grumbel/sdl-jstest.git to test.  This happens with or without your MR.

Is this hat difference an issue? If so we can try to fix it, again,
and if not we can then leave it as it is.

>
> USB:
> Joystick Name:     'Xbox One Elite 2 Controller'
> Joystick GUID:     030010f85e040000000b000011050000
> Joystick Number:    0
> Number of Axes:     6
> Number of Buttons: 15
> Number of Hats:     1
> Number of Balls:    0
> GameControllerConfig:
>  Name:    'Xbox One Elite 2 Controller'
>  Mapping: '030010f85e040000000b000011050000,Xbox One Elite 2
> Controller,a:b0,b:b1,x:b2,y:b3,back:b6,guide:b8,start:b7,leftstick:b9,rig=
htstick:b10,leftshoulder:b4,rightshould
> er:b5,dpup:h0.1,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,paddle1:b11,paddle2:=
b13,paddle3:b12,paddle4:b14,leftx:a0,lefty:a1,rightx:a3,righty:a4,lefttrigg=
er:a2,righttrigger:a5,crc:
> f810,platform:Linux'
>
> Bluetooth:
> Joystick Name:     'Xbox One Elite 2 Controller'
> Joystick GUID:     030018dc5e040000220b000000006800
> Joystick Number:    0
> Number of Axes:     6
> Number of Buttons: 19
> Number of Hats:     0
> Number of Balls:    0
> GameControllerConfig:
>  Name:    'Xbox One Elite 2 Controller'
>  Mapping: '030018dc5e040000220b000000006800,*,a:b0,b:b1,back:b4,dpdown:b1=
2,dpleft:b13,dpright:b14,dpup:b11,guide:b5,leftshoulder:b9,leftstick:b7,lef=
ttrigger:a4,leftx:a0,left
> y:a1,rightshoulder:b10,rightstick:b8,righttrigger:a5,rightx:a2,righty:a3,=
start:b6,x:b2,y:b3,paddle1:b15,paddle2:b17,paddle3:b16,paddle4:b18,crc:dc18=
,platform:Linux'
>
>
> Otherwise, no issues, Steam recognizes all buttons including paddles
> correctly (with or without your MR).  But it also names the controller
> "Xbox One Elite 2 Controller" via USB and "Xbox One Controller" when
> using Bluetooth.  This doesn't seem to have any effect on registering
> the paddles correctly though.

\o/

>
>
> >
> > >
> > > I've never recompiled a module before, but I've compiled lots of othe=
r
> > > stuff before.  How hard can it be?
> > >
> >
> > Technically it's not hard, I'm sure there is a proper Arch howto
> > available. But it's painful because you'll have to maintain &
> > recompile your kernel until your fix gets in the standard kernel of
> > your distribution (archlinux if I'm not wrong).
> >
> > But the good point is that with HID-BPF that pain is relieved:  I can
> > provide you with the binary, you can check it if you like (the loader
> > is in rust and the bpf itself is C), and then once installed you can
> > forget about it.
>
> Let's try it!

Well the more I think of it, the more I think we'll stick to the current st=
ate:
- SDL is actually fixed by the udev rule (they just prefer talk over hidraw=
)
- for evemu users, we have a bpf filter that works. I'll eventually
merge those in the kernel so they are automatically shipped.

So I don't really see the point of fixing a driver for the sake of
fixing it and just losing both of our time.

Thanks a lot for the quick testing.

Cheers,
Benjamin


