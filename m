Return-Path: <linux-input+bounces-965-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5FD81D827
	for <lists+linux-input@lfdr.de>; Sun, 24 Dec 2023 09:03:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6AD1282155
	for <lists+linux-input@lfdr.de>; Sun, 24 Dec 2023 08:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A961F15CA;
	Sun, 24 Dec 2023 08:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZgrRPerJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F18615A1
	for <linux-input@vger.kernel.org>; Sun, 24 Dec 2023 08:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6d099d316a8so3013879b3a.0
        for <linux-input@vger.kernel.org>; Sun, 24 Dec 2023 00:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703405002; x=1704009802; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uCDB8yiSZqqwpytidP26pGCDGr8qafIhTITw38+hz1s=;
        b=ZgrRPerJasG0R8h6jNaSITsD4bc1UtwmQJIwYnAxjca+6En9sOsvU26t/iPhwlIKmZ
         jXEc5yMCnkP8hvHe26aCXPa54Wzk1nqJXGuOqz3xWGRr3szW5NSHZfDdQFdnAME7WyaW
         raa0lG4vmy1vPuJDWcAZrtOJVXdXFj2JvC87IYWyOUoIi2wX7MvBupL8z4m5zWppSf+6
         ig7hkCmDiBubQLI+S0G1qWP/gp2LdhImJTdP9pV/2Qv5iOimgn89GsgCUyRzR3xjTg83
         Wd3Nn0olQCf4XEy6PCLssWeTbfi9GpDhx8H45kW6RRYMJBhb7SR1FtmRcf2WdJQWxW1B
         f6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703405002; x=1704009802;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uCDB8yiSZqqwpytidP26pGCDGr8qafIhTITw38+hz1s=;
        b=Hx0f1i3Ubpo4SAMdQS1TagG5Ue7otBm7PZnMa6Ic4K9ArWyrFfv9zwDnoPJf0pfTCq
         9JCphLsrjYFiQtneWF48WTmyTyz9cBpSfdDYbV1HcVQ97kO4HGezJGHhh0FhfTulKTca
         ZuanAtY/PL7JwcHenc9CSEt3+n8LjgqozbML5CmRy06RsXSrUBhV6aYVqwG77/v16ili
         mXJ0UW1tpzDkyR+Wku8Y+aviNWoak0+vN1zOykpCIWppAeW0hceyZj7Yz5RMfjCfLQb1
         gwTl7cwre6wWGl985hlkGZhACMON69rMN8thRZxOcdNyiLDcAyqOzaT8WpyNfaGTQPC+
         hedA==
X-Gm-Message-State: AOJu0Yxlcdx/gjLNHRIbKouJrXnX53qq1ytCIPbb2H2D8cYvFd1Txkm9
	jKaHaREiOQU4JypPkN8nUjQ=
X-Google-Smtp-Source: AGHT+IEJwsqaGTdYAstBNLa4Dn5tFKnvqyrkCAW3RhVyWQX5Rmp+3Abdc1IQliU7OG+7OnZOAurIPA==
X-Received: by 2002:a05:6a20:160b:b0:195:88df:4fcf with SMTP id l11-20020a056a20160b00b0019588df4fcfmr1118365pzj.103.1703405002152;
        Sun, 24 Dec 2023 00:03:22 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:765c:936e:ea43:6046])
        by smtp.gmail.com with ESMTPSA id x3-20020aa793a3000000b006d994c0e8b6sm3003853pff.74.2023.12.24.00.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 00:03:21 -0800 (PST)
Date: Sun, 24 Dec 2023 00:03:18 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Paul Cercueil <paul@crapouillou.net>,
	Peter Hutterer <peter.hutterer@who-t.net>,
	Chris Morgan <macroalpha82@gmail.com>, linux-input@vger.kernel.org,
	svv@google.com, biswarupp@google.com, contact@artur-rojek.eu,
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH] input: uinput: Drop checks for abs_min > abs_max
Message-ID: <ZYflxnNC-72vh6De@google.com>
References: <20231218171653.141941-1-macroalpha82@gmail.com>
 <20231219235149.GA3401344@quokka>
 <f77b98bf015bf3f8716422ac70c4fd6051e66376.camel@crapouillou.net>
 <ZYJJC-ID4SyHhuuA@google.com>
 <4e902e8ff60e21a74a87887e272f6751d3837c71.camel@crapouillou.net>
 <954f6537-15d5-42db-94b5-d148d4942870@redhat.com>
 <0ac9f339380ca3acd76eff065238599f39cde039.camel@crapouillou.net>
 <63ad6de2-8f24-47c1-b00d-588c22f6877f@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63ad6de2-8f24-47c1-b00d-588c22f6877f@redhat.com>

On Sat, Dec 23, 2023 at 04:16:46PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 12/23/23 16:01, Paul Cercueil wrote:
> > Hi Hans,
> > 
> > Le samedi 23 décembre 2023 à 15:29 +0100, Hans de Goede a écrit :
> >> Hi Paul,
> >>
> >> On 12/20/23 14:39, Paul Cercueil wrote:
> >>> Hi Dmitry,
> >>>
> >>> Le mardi 19 décembre 2023 à 17:53 -0800, Dmitry Torokhov a écrit :
> >>>> Hi Paul,
> >>>>
> >>>> On Wed, Dec 20, 2023 at 01:38:39AM +0100, Paul Cercueil wrote:
> >>>>> Hi Peter,
> >>>>>
> >>>>> Le mercredi 20 décembre 2023 à 09:51 +1000, Peter Hutterer a
> >>>>> écrit :
> >>>>>> On Mon, Dec 18, 2023 at 11:16:53AM -0600, Chris Morgan wrote:
> >>>>>>> From: Chris Morgan <macromorgan@hotmail.com>
> >>>>>>>
> >>>>>>> Stop checking if the minimum abs value is greater than the
> >>>>>>> maximum
> >>>>>>> abs
> >>>>>>> value. When the axis is inverted this condition is allowed.
> >>>>>>> Without
> >>>>>>> relaxing this check, it is not possible to use uinput on
> >>>>>>> devices in
> >>>>>>> userspace with an inverted axis, such as the adc-joystick
> >>>>>>> found
> >>>>>>> on
> >>>>>>> many handheld gaming devices.
> >>>>>>
> >>>>>> As mentioned in the other thread [1] a fair bit of userspace
> >>>>>> relies
> >>>>>> on
> >>>>>> that general assumption so removing it will likely cause all
> >>>>>> sorts of
> >>>>>> issues.
> >>>>>
> >>>>> There is some userspace that works with it though, so why
> >>>>> restrict
> >>>>> it
> >>>>> artificially?
> >>>>>
> >>>>> The fact that some other userspace code wouldn't work with it
> >>>>> sounds a
> >>>>> bit irrelevant. They just never encountered that min>max usage
> >>>>> before.
> >>>>>
> >>>>> And removing this check won't cause all sort of issues, why
> >>>>> would
> >>>>> it?
> >>>>> It's not like the current software actively probes min>max and
> >>>>> crash
> >>>>> badly if it doesn't return -EINVAL...
> >>>>
> >>>> It will cause weird movements because calculations expect min be
> >>>> the
> >>>> minimum, and max the maximum, and not encode left/right or
> >>>> up/down.
> >>>> Putting this into adc joystick binding was a mistake.
> >>>
> >>> I don't see why it was a mistake, it's only one of the ways to
> >>> specify
> >>> that the axis is inverted. This information is between the firmware
> >>> (DT) and the kernel, that doesn't mean the information has to be
> >>> relayed as-is to the userspace.
> >>>
> >>> Unlike what you wrote in your other answer, when talking about
> >>> input
> >>> the kernel doesn't really normalize anything - it gives you the
> >>> min/max
> >>> values, and the raw samples, not normalized samples (they don't get
> >>> translated to a pre-specified range, or even clamped).
> >>>
> >>> I don't really like the idea of having the driver tamper with the
> >>> samples, but if the specification really is that max>min, then it
> >>> would
> >>> be up to evdev/joydev (if the individual drivers are allowed
> >>> min>max)
> >>> or adc-joystick (if they are not) to process the samples.
> >>
> >> I don't see why a driver, especially a userspace driver which
> >> then injects things back into the kernel using uinput, would
> >> not take care of inverting the samples itself and then just
> >> present userspace with normalized data where min is simply 0
> >> (as result of normalization as part of inversion) and
> >> max is (original_max - original_min).
> > 
> > Yes, I totally agree.
> > 
> > What I was saying is, as Chris is only "piping" events from adc-
> > joystick into uinput, that the problem is more that evdev/joydev don't
> > handle axis inversion and provide min>max values that most of the
> > userspace (and some kernel drivers e.g. uinput) don't support.
> 
> Ah I see, that sounds like a joydev adc-joystick / driver bug
> to me then.

joydev/mousedev/evdev are simply consumers of events coming from the
drivers that handle hardware. Even though they reside in the kernel,
they still consumers of events, much like userspace is, and they operate
under the same assumption that if min and max are specified then max is
not less than min.

We always had HW drivers invert the axis to match our coordinate system
(for absolute coordinates 0,0 is in the lower left corner, for relative
right and up are positive and left and down are negative). You can see
that in psmouse (psmouse_report_standard_motion) and synaptics drivers,
one of the earliest in the kernel.

The rest of the stack operates under this assumption.

> 
> >> Note that this is exactly what is being done for touchscreens,
> >> where having the touchscreen mounted e.g. upside-down is
> >> a long standing issue and this is thus also a long solved issue,
> >> see: drivers/input/touchscreen.c which contains generic
> >> code for parsing device-properties including swapped / inverted
> >> axis as well as generic code for reporting the position to the
> >> input core, where the helpers from drivers/input/touchscreen.c
> >> take care of the swap + invert including normalization when
> >> doing inversion.
> >>
> >> Specifically this contains in touchscreen_parse_properties() :
> >>
> >>         prop->max_x = input_abs_get_max(input, axis_x);
> >>         prop->max_y = input_abs_get_max(input, axis_y);
> >>
> >>         if (prop->invert_x) {
> >>                 absinfo = &input->absinfo[axis_x];
> >>                 absinfo->maximum -= absinfo->minimum;
> >>                 absinfo->minimum = 0;
> >>         }
> >>
> >>         if (prop->invert_y) {
> >>                 absinfo = &input->absinfo[axis_y];
> >>                 absinfo->maximum -= absinfo->minimum;
> >>                 absinfo->minimum = 0;
> >>         }
> >>
> >> and then when reporting touches:
> >>
> >> void touchscreen_report_pos(struct input_dev *input,
> >>                             const struct touchscreen_properties
> >> *prop,
> >>                             unsigned int x, unsigned int y,
> >>                             bool multitouch)
> >> {
> >>         if (prop->invert_x)
> >>                 x = prop->max_x - x;
> >>
> >>         if (prop->invert_y)
> >>                 y = prop->max_y - y;
> >>
> >>         if (prop->swap_x_y)
> >>                 swap(x, y);
> >>
> >>         input_report_abs(input, multitouch ? ABS_MT_POSITION_X :
> >> ABS_X, x);
> >>         input_report_abs(input, multitouch ? ABS_MT_POSITION_Y :
> >> ABS_Y, y);
> >> }
> >>
> >> One of the tasks of a driver / the kernel is to provide some
> >> level of hardware abstraction to isolate userspace from
> >> hw details. IMHO taking care of the axis-inversion for userspace
> >> with something like the above is part of the kernels' HAL task.
> > 
> > Totally agree, but this is not done anywhere, is it? evdev seems to
> > just pass the hardware values alongside some basic meta-data (min/max
> > values, fuzz etc.), it does not tamper with the data. Should evdev
> > handle axis inversion? Should it be in adc-joystick (and every other
> > driver that needs that) instead?
> 
> For touchcreens we have chosen to have a set of generic helpers
> and then make using those helpers the responsibility of the driver.
> 
> Part of the reason for doing this is because some touchscreen drivers
> already were doing axis inversion inside the driver triggering on
> things like e.g. DMI matches, or maybe custom pre standardization
> device properties, etc.
> 
> So the decision was made to add a set of helpers and convert drivers
> one by one. Where drivers can e.g. still set prop->invert_x manually,
> but then they also need to take care of the min/max adjustments
> manually (min is typically 0 for touchscreens though).
> 
> I expect that there will also be enough existing special handling
> in the joystick code that piece-meal conversion using helpers
> is likely best.

Not only touchscreens and joysticks. As I mentioned, PS/2 mice have
their reported relative Y motion inverted since forever, touchpads like
Synaptics or Elan invert Y axis as well, and so on.

> 
> With that said having axis inversion support in the evdev core
> does sound interesting, but that means also storing the max-value
> inside the core for abs axis and this will likely be a big
> change / lots of work.

evdev is not the only consumer, so if anything it should be in the input
core, but there are enough quirks that I think touchscreen helpers are
the best, at least for now.

Thanks.

-- 
Dmitry

