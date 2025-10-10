Return-Path: <linux-input+bounces-15370-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F120BCE95C
	for <lists+linux-input@lfdr.de>; Fri, 10 Oct 2025 23:10:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 02E9F4E3190
	for <lists+linux-input@lfdr.de>; Fri, 10 Oct 2025 21:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E9FF2EFDA1;
	Fri, 10 Oct 2025 21:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DxdqAXmt"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493722701C0
	for <linux-input@vger.kernel.org>; Fri, 10 Oct 2025 21:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760130588; cv=none; b=PvO054QR2ZxNncvSD3u/2LMPWxBUWYJPX1PIPP7nT+xy+jU2Frj+l7v551u8xW5DemPC7++OjCZ60SAIAKHeMDpyAezTEo+p0T5OAxsNQj3cAA6Qp3QQwGMAdrNyMkvdcks2MWH6yDFVJbGNE8cJi1gvwFnYYemb2KiSGCDU3vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760130588; c=relaxed/simple;
	bh=hgyCFWAvyhgvatIU/K0unb+MfKo3mrh42mP8FTzGTPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ABxUgF2GAegdDKwiwkS0FYcGMtdZC1Oc286rHtWG+Qi6uQbV2wywUEPoP9mAoupUsK479u70lnkr20OlEzsTT7P/bwT8tOtW6OalZz7Fg1idhfRdxypctED99H5493b2RhSJp2gzQoa4oDgeZWRzgJfbT/eJ2Ak+pYaT3Tdftb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DxdqAXmt; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3ee15b5435bso1495512f8f.0
        for <linux-input@vger.kernel.org>; Fri, 10 Oct 2025 14:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760130583; x=1760735383; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YL9Lfr4K4sqYkwAFmLjCmYw/FX8K54aol5jtmBg3r+U=;
        b=DxdqAXmtcHNMWwewyW+k1taGaAShtO0P2C+yfsjFOkZTZtpDtzkzZ5l3iGi/5DvowN
         0wvOQJnPkuUJbc6dw5huK87ykQlpIld3BkWelKRpOC9b2Gb2SV9faHety9OCu9CKHXNL
         bnHsbbpWFCh5UAXfL1YgutpOhbZEIE0okVWwlzzlCw0UPTiPlfBR8monmq7gbtf9+f+U
         lnc3g7Lm0qPbKULzR8GKxj8ABqMo3b0xjUlXRJRHdZMvI6rgsX5ycFBqIFJvJi07tOvv
         aTG9qc4FHKAMg5pI/l5OgjaMLFH0KJTagMtE+EN2oe3SZ8f83KO9ushWvmeNjrGVTM88
         /ABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760130583; x=1760735383;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YL9Lfr4K4sqYkwAFmLjCmYw/FX8K54aol5jtmBg3r+U=;
        b=OJnmZZbGkHrFPOn+J5v0ijGZpWpAyHEa3UL4VUGDGfXnFjD4BolCuFTR7Jho79XXga
         /bDpcjRwEFUwQl5DeildDdtq4GRdccuhlR7ACSISi7QDgTDJm2AGobIYHtSTlXShpjQG
         GYAJBPUzlsyWMbWLv7ycTzGtlL2R+HFlPNUvhGmKbhvZ7bbQEEwIMecUVvE6zhmDxLN4
         TVxXtVSfZ7RCA9hzZkzc3lXG5BgxrX+dlTNfkNUoJ3D2ovv0vM2OX0y6pF9Mxjd4csnv
         wRoZmRu9FhL9+jvaDlPKBkZC009Unw8qJL+5jL2dLL//aUiFIEXn1NY1AOQ4HnfismKT
         GYjw==
X-Forwarded-Encrypted: i=1; AJvYcCVkY6Mh5xYd3qWSUKhTetZ6bFBj0bpyO+d2lEqhVcf4HnmILG8VZOpmE/Gg87JeeCC4sdR5JH3LhtIQXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPvemk9Gfp+lZiH3EcEIBaUnEZ0+aN6/1No4EK/uUu3awy9cwX
	1RLdb2A6C459E+4V27O0DihrscLpLRcypChetKoy7mDI6dG85QaaLkt8
X-Gm-Gg: ASbGnctugejGPwLTRo4aNGrSWIJ1gyT4TtsRuponLwer1UDlb4BgNZ/d6GHI+iPpRSl
	9hxznWXDKXMh6V5Wrv/dRBoCh6bzXFEqM9rzsxNITgS9tesEi3cfV9AG7V4fqQPE+D0VH6HZQVj
	hGmwLnRzN1sYWHJp0NVjF3A6FSbTU3Vn0ooxKbE3MV7aA/XQNrI8Kt9weUMEtuEVzDui0L96rFO
	bpqJKWn4ddZRs5rX0lz/IhuGm/DdgVCkbLznHchOe8ZOaDmvWZyGI+NibLjTSaMR9wo1M+GSIxW
	9R6H1r4B9atx3zOkN//4G57PVohyhvxFpzQuZN9VoX5KwsA5sgaIdcUT63hgOO/XOUiBCBtxOv9
	lgzmkAiogq+8YeLZrHR59Dq80+KzS5bV/92VkU8AeH1rWAIOqnmapWRwpryZjR0/GiFNohw94az
	46JOwCIXest66iymmLa9vTka1YIZZj8rXqBF95P/Ki9eSiWZIC9JIggw==
X-Google-Smtp-Source: AGHT+IGO8jgeWqNOOxRgUfgzCS0O4EYngbpmbTcHl8ghsaUEWelooW8Epj+R+0pCYLOszI7amA9a+w==
X-Received: by 2002:a05:6000:2509:b0:3ee:147a:9df with SMTP id ffacd0b85a97d-4266e7df9d1mr8719807f8f.39.1760130583273;
        Fri, 10 Oct 2025 14:09:43 -0700 (PDT)
Received: from ARSENIURE.localdomain (lfbn-tou-1-1184-225.w90-76.abo.wanadoo.fr. [90.76.241.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e13b6sm5870804f8f.44.2025.10.10.14.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 14:09:42 -0700 (PDT)
Date: Fri, 10 Oct 2025 23:09:39 +0200
From: Lucas GISSOT <lucas.gissot.pro@gmail.com>
To: Jonathan Denose <jdenose@google.com>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Angela Czubak <aczubak@google.com>,
	Sean O'Brien <seobrien@google.com>
Subject: Re: [PATCH v3 04/11] HID: haptic: introduce hid_haptic_device
Message-ID: <aOl2E75q9L1rCyzd@ARSENIURE.localdomain>
References: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
 <20250818-support-forcepads-v3-4-e4f9ab0add84@google.com>
 <2b377001-7ee8-449c-b107-1c0164fa54f0@leemhuis.info>
 <3184c648-661b-4cf4-b7cf-bd44c381611d@infradead.org>
 <1cd7fb11-0569-4032-905c-f887f3e0dd4c@leemhuis.info>
 <f2243a9b-e032-416b-aef8-958198ff3955@infradead.org>
 <CAMCVhVOm5xzN6pkX5cKMSHrMqvdCD_14+XuunAuJLENgLO1NqA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMCVhVOm5xzN6pkX5cKMSHrMqvdCD_14+XuunAuJLENgLO1NqA@mail.gmail.com>

Hi,
I applied Randy's patch and built with CONFIG_HID_MULTITOUCH=m and
CONFIG_HID_HAPTIC=m, it builts; but there is an ld error on hid_haptic_*
functions as soon as CONFIG_HID_MULTITOUCH is changed to yes.

Is this .config not something desired, and then HID_HAPTIC should not be
a tristate (if I understood correctly), or is there another problem?

Thanks,

Lucas

On Fri, Oct 10, 2025 at 03:30:05PM -0500, Jonathan Denose wrote:
> Hi all,
> 
> Thanks for looking into this.
> 
> On Fri, Oct 10, 2025 at 1:55 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > Hi,
> >
> > I think I found it... see below.
> >
> >
> > On 10/9/25 11:48 PM, Thorsten Leemhuis wrote:
> > > [Top-Posting for easier consumption]
> > >
> > > Mainly writing this mail to bring Lucas GISSOT in here, who reported the
> > > same error yesterday here:
> > > https://lore.kernel.org/all/aOgvA8Jiofcnk2xb@ARSENIURE.localdomain/
> > >
> > > Lucas there suggested:
> > > """but it seems to me that the #if IS_ENABLED(CONFIG_HID_HAPTIC) in
> > > hid-haptic.h should be replaced by IS_BUILTIN(CONFIG_HID_HAPTIC) and
> > > Kconfig updated."""
> > >
> > > And Randy: Thx for the closer investigation! It explains some of the
> > > "that feels odd, am I holding this wrong" feeling I had when reporting this.
> > >
> > > Ciao, Thorsten
> > >
> > > On 10/10/25 06:50, Randy Dunlap wrote:
> > >> On 10/9/25 7:43 AM, Thorsten Leemhuis wrote:
> > >>> On 8/19/25 01:08, Jonathan Denose wrote:
> > >>>> From: Angela Czubak <aczubak@google.com>
> > >>>>
> > >>>> Define a new structure that contains simple haptic device configuration
> > >>>> as well as current state.
> > >>>> Add functions that recognize auto trigger and manual trigger reports
> > >>>> as well as save their addresses.Hi,
> > >>>> Verify that the pressure unit is either grams or newtons.
> > >>>> Mark the input device as a haptic touchpad if the unit is correct and
> > >>>> the reports are found.
> > >>>>  [...]
> > >>>> +config HID_HAPTIC
> > >>>> +  tristate "Haptic touchpad support"
> > >>>> +  default n
> > >>>> +  help
> > >>>> +  Support for touchpads with force sensors and haptic actuators instead of a
> > >>>> +  traditional button.
> > >>>> +  Adds extra parsing and FF device for the hid multitouch driver.
> > >>>> +  It can be used for Elan 2703 haptic touchpad.
> > >>>> +
> > >>>> +  If unsure, say N.
> > >>>> +
> > >>>>  menu "Special HID drivers"
> > >>>
> > >>> I suspect this change is related to a build error I ran into today:
> > >>>
> > >>>   MODPOST Module.symvers
> > >>> ERROR: modpost: "hid_haptic_init" [drivers/hid/hid-multitouch.ko] undefined!
> > >>> ERROR: modpost: "hid_haptic_pressure_increase" [drivers/hid/hid-multitouch.ko] undefined!
> > >>> ERROR: modpost: "hid_haptic_check_pressure_unit" [drivers/hid/hid-multitouch.ko] undefined!
> > >>> ERROR: modpost: "hid_haptic_input_configured" [drivers/hid/hid-multitouch.ko] undefined!
> > >>> ERROR: modpost: "hid_haptic_input_mapping" [drivers/hid/hid-multitouch.ko] undefined!
> > >>> ERROR: modpost: "hid_haptic_feature_mapping" [drivers/hid/hid-multitouch.ko] undefined!
> > >>> ERROR: modpost: "hid_haptic_pressure_reset" [drivers/hid/hid-multitouch.ko] undefined!
> > >>> make[3]: *** [/home/thl/var/linux.dev/scripts/Makefile.modpost:147: Module.symvers] Error 1
> > >>>
> > >>> The config where this occurred had this:
> > >>>
> > >>> CONFIG_HID=y
> > >>> CONFIG_HID_MULTITOUCH=m
> > >>> CONFIG_HID_HAPTIC=m
> > >>>
> > >>> Changing the latter to "CONFIG_HID_HAPTIC=y" fixed the problem for me.
> > >>
> > >> Sure, but that's just covering up the problem.
> > >>> First, I get this build error:
> > >>
> > >> ERROR: modpost: missing MODULE_LICENSE() in drivers/hid/hid-haptic.o
> > >> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-haptic.o
> > >>
> >
> > ISTM that tristate is incompatible with this newly added Makefile
> > line:
> >
> > +hid-$(CONFIG_HID_HAPTIC)       += hid-haptic.o
> >
> > hid-* lists files that should be builtin, not loadable modules.
> > These should all be hid-y.  AFAIK, hid-m is not useful.
> > (A maintainer can correct me as needed.)
> >
> > So adding a MODULE_LICENSE() and MODULE_DESCRIPTION() to
> > hid-haptic.c and changing drivers/hid/Makefile to use
> > obj-$(CONFIG_HID_HAPTIC_        += hid-haptic.o
> >
> > fixes the build errors for me.
> >
> > Angela, Jonathan D., is there any reason that
> > hid-haptic needs to be builtin instead of a loadable
> > module?  It's no problem for hid-multitouch.ko to call
> > into hid-haptic.ko (both as loadable modules) as long as
> > hid-haptic.ko is loaded first.
> >
> As long as hid-multitouch.ko is able to call into hid-haptic.ko I
> don't see any issues, but is there a way to enforce that when
> CONFIG_HID_HAPTIC is enabled, hid-haptic.ko will be loaded before
> hid-multitouch.ko?
> >
> > Thanks.
> >
> > ~Randy
> > ---
> > ---
> >  drivers/hid/hid-haptic.c |    3 +++
> >  1 file changed, 3 insertions(+)
> >
> > --- linux.orig/drivers/hid/hid-haptic.c
> > +++ linux/drivers/hid/hid-haptic.c
> > @@ -10,6 +10,9 @@
> >
> >  #include "hid-haptic.h"
> >
> > +MODULE_DESCRIPTION("HID haptic touchpad support");
> > +MODULE_LICENSE("GPL");
> > +
> >  void hid_haptic_feature_mapping(struct hid_device *hdev,
> >                                 struct hid_haptic_device *haptic,
> >                                 struct hid_field *field, struct hid_usage *usage)
> > ---
> >  drivers/hid/Makefile |    3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > --- linux.orig/drivers/hid/Makefile
> > +++ linux/drivers/hid/Makefile
> > @@ -4,7 +4,8 @@
> >  #
> >  hid-y                  := hid-core.o hid-input.o hid-quirks.o
> >  hid-$(CONFIG_DEBUG_FS)         += hid-debug.o
> > -hid-$(CONFIG_HID_HAPTIC)       += hid-haptic.o
> > +
> > +obj-$(CONFIG_HID_HAPTIC)       += hid-haptic.o
> >
> >  obj-$(CONFIG_HID_BPF)          += bpf/
> >
> >
> --
> Jonathan

