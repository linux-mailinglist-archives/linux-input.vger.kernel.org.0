Return-Path: <linux-input+bounces-15758-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D66C0FECC
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 19:28:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 06D0B4E827C
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 18:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29DDE16DC28;
	Mon, 27 Oct 2025 18:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b2/vcwjW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8262829BDB8
	for <linux-input@vger.kernel.org>; Mon, 27 Oct 2025 18:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761589731; cv=none; b=ZKCYN5gxg3Jf0hSkgac+2lTxVQA0vJ0DZXEFb43Y2AsGBAiPRSjpjF2Cr2TLtw5kjfYO2DdeBXyg2ly7oteie7iFMZzY7iJM8QurIpSOP1d4UFNIVVBHhHnILGJLlRJ1pTle1E1COyJ8/jAO9T4OwCbBnyQfEBWbgtkLsiSU9vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761589731; c=relaxed/simple;
	bh=sonDuXqgAsxJf5DN2NFb1AuFadqp1pVh4AhMjUdMNxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KGzEQ/6LRKVvGIy+xzae9kwHCXiVUn0CJhF0tVLG8zmXRlj64wM0YHzd1M5r6e16qwEp0djBLUS7bkkdNucr3iOB7t6g1BZ69dywSXPxzI7WmuiIMROU0VGuO+EAUYBJqiGuy4AKZAsjBNknlA7HtANfJi2VmiHJYgbcQnluNSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b2/vcwjW; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-781206cce18so4981479b3a.0
        for <linux-input@vger.kernel.org>; Mon, 27 Oct 2025 11:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761589728; x=1762194528; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KA5mHAm9fw7lh4UOKqADEPhk08u5NxNDArJjpRV8ufQ=;
        b=b2/vcwjWwhgkQ5wY1AUwdOHzQA7OMajwYrwpXPpMOE1S1HEQsNhmudFHwFPikVWXSP
         VyC69CKJ2JCbDvhUR0CpFW0gAqBD3WplKNN8GPwqrmC2qqK2Dhx9tyL0W5QgxzuYeN+7
         Y8A3beu9rv7ouDH+69VN7sUxyCcmwXngNfv8hnK4IrN7MJZxgPXW+T2NOmNud6F8CFMn
         EOGMnVMIhk4dPvHktE21OEWiPqfLWy4pbfKejK6xdKtqRmgZwOQbT2OyeI3ME5lSCiSu
         HQmiIYQQ6OCQD6Z8iP2OhAR6Gw5MexZJ156VghV5uUp8MUlzEdbwlNLtjtclaqzbsdEu
         wylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761589728; x=1762194528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KA5mHAm9fw7lh4UOKqADEPhk08u5NxNDArJjpRV8ufQ=;
        b=cYw5rbr/d0qw6QSImWqk41QrlfsUEeV2fnUjGRXiT/30HA8KNAdidgEbxPN0LZNn5B
         JrXB/GTMCZOnthV5Ujwf7Y65+346M/KY1FsB3hwjt6mkkgcMaMHA7eGE8k6k2lQHtNr7
         j7gSJECduywRb6kUKy+2jg+oNfM1pZ92Ixv3CfA/ykCE+pSgx3vLOXmPsacOvaqVU2v1
         6YB52qEB+IKW+XQdsmsJBOHhPcjdfDpkplcGtY4IpLsuyhKLOfRU5WHMmpLHN2QIN7Xp
         a4WP7t9A7QE6A95J47b1I8bFp6qBIj88+w0jBNbFJ5ojaYDF5eERvGFNCkyDtDlE5IuF
         qKYw==
X-Forwarded-Encrypted: i=1; AJvYcCWJGYg7GJFJN4XPfmzpzpLGSsFfVL2cn7CCM0paScCFn+lx/dcGOf04JSD8LQmvvVTUyxWRRC6+1bLpig==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOjVGg02uWUXsD87sYZBPWQg35uhVBntCjySMWxf8sYaEnC69f
	x3baTc5nNERlsvv16/P8OjtLAKenVCT0AdpIYzyjk0ZbB4oRppCrkp2F
X-Gm-Gg: ASbGncvbCH+hCCImt++/VJ2WdpjYFvkLrgBd4nCSilMOkUH1phTPMklRRMYVWoIR7DU
	yUTtsX+ojjnsKvB1G3wlrhU1x7AKZoiJINcYaiM5BFhWBC+bBhn71V1Wboirc8dOJJ/eDX2iehN
	6Bh88Ylqxu45oqeFtShw4iKn+sSu6JuK6KvU3yTIwNeoEt3eJa2IjocPxD7r9yFg1RsQR5fuWVY
	AYNNPpLLlfhTfb0fUVpIvwlrrjg8ICVms89QrEq9TSSM1xOMJOEYMpcIQ0h01/oJLOpd5ba19y7
	+9PBPZZd0+FNKH+XCYfut65H9R0kGAyfnoRZY5sikKsgFwVAQ9VlF0KOiSdFM5u2knJSgTW/saX
	5yoElvhCK9i0rxvr376ujs4Nz5+nK/UNXmrETNOWFe/+Pph7OVy41m79QNhGmDmNEAZfHQ9jI2f
	87/cQ+b9cIviwFbzRjnjTbjGCloE6j5A7bhD4nF/ece2oPpeAwUyNB
X-Google-Smtp-Source: AGHT+IHLup+YriOoIS8yjrq5yhEMxwaINslljuBakxkZIXoQZAW1kHan1dlFghqfEmr8r8ZwZv+0Hg==
X-Received: by 2002:a05:6a20:b70f:b0:33d:7c17:deb4 with SMTP id adf61e73a8af0-344deae63admr386851637.18.1761589727653;
        Mon, 27 Oct 2025 11:28:47 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a7b0:9cae:9e24:af62])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b7128885524sm7898970a12.19.2025.10.27.11.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 11:28:47 -0700 (PDT)
Date: Mon, 27 Oct 2025 11:28:45 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 0/2] Input: Add keycodes for electronic privacy screen
 on/off an use these in dell-wmi
Message-ID: <crylhfmrrhev2xfokzj4elu76spbj5pa7nq2z7x3kvc4qfer3e@rnkcyfja53bh>
References: <20251020152331.52870-1-hansg@kernel.org>
 <wcrbaqheqhzpjcg3au2c5xshwwed5bjyvl5u5pske6ru7lggjs@yjpnfdbkogba>
 <dfda82fc-1c35-4986-929d-d27ba877aab6@kernel.org>
 <jnlyr7m3q7etnipczqp22ix2ijovvoqnxnopjyrey7mtbryu3c@x7snlzka3euz>
 <7f2a89c3-de22-43fa-b714-626f12fc52be@kernel.org>
 <3df27pbmdhv3x5zsfdnyttkliqdetunxwhc5e6yfbqhcbz4e45@l7ddhswxl4tk>
 <12502962-3d1e-44b0-b280-d2bae20dd1ee@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12502962-3d1e-44b0-b280-d2bae20dd1ee@kernel.org>

On Thu, Oct 23, 2025 at 03:42:04PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 22-Oct-25 10:24 PM, Dmitry Torokhov wrote:
> > On Wed, Oct 22, 2025 at 09:15:35PM +0200, Hans de Goede wrote:
> >> Hi,
> >>
> >> On 22-Oct-25 8:40 PM, Dmitry Torokhov wrote:
> >>> On Wed, Oct 22, 2025 at 08:24:46PM +0200, Hans de Goede wrote:
> >>>> Hi Dmitry,
> >>>>
> >>>> On 22-Oct-25 7:54 PM, Dmitry Torokhov wrote:
> >>>>> Hi Hans,
> >>>>>
> >>>>> On Mon, Oct 20, 2025 at 05:23:29PM +0200, Hans de Goede wrote:
> >>>>>> Hi All,
> >>>>>>
> >>>>>> Here is a patch series for adding support for the electronic privacy screen
> >>>>>> on/off events send on e.g. Dell Latitude 7300 models.
> >>>>>>
> >>>>>> On these laptops the firmware does not allow querying the presence nor
> >>>>>> the status of the eprivacy screen at boot. This makes it impossible to
> >>>>>> implement the drm connector eprivacy properties API (1) since drm objects
> >>>>>> do not allow adding new properties after creation and the presence of
> >>>>>> the eprivacy cannot be detected at boot.
> >>>>>>
> >>>>>> So instead this series adds 2 evdev keycodes for eprivacy screen on + off
> >>>>>> and modifies the dell-wmi driver to use these, so that we can still
> >>>>>> propagate these events to userspace for e.g. a DE to show an OSD.
> >>>>>>
> >>>>>> Dmitry, can we get your ack for the addition of the 2 new keycodes?
> >>>>>> I think it will be easiest if Ilpo merges the entire series through
> >>>>>> the pdx86 tree with your ack for the keycodes.
> >>>>>
> >>>>> Yes, that should be fine, although I wonder if this is best modeled as a
> >>>>> pair of keys or a single switch? I know we have touchpad on/off but I
> >>>>> wonder if it was the best option... Probably more convenient at some
> >>>>> point if it was done through the atkbd.
> >>>>
> >>>> EV_SW has the same problem as the drm property API. The mere presence
> >>>> of advertising a new SW_PRIVACY_SCREEN capability on an /dev/input/event#
> >>>> node would convey to userspace that there is an eprivacy-screen and we
> >>>> also would need to know the initial state (on/off) for using an EV_SW
> >>>> for this and we know neither presence nor status before hand (1).
> >>>
> >>> How is this different form presence of KEY_PRIVACY_SCREEN_ON/OFF? They
> >>> also imply that there is a privacy screen.
> >>
> >> I've never seen userspace change behavior depending on which keycodes
> >> are advertised as possibly being send by a device.
> > 
> > On Chrome OS we are trying to go by what peripherals report, but I can
> > see that it might not work for a generic Linux distro.
> > 
> >>
> >> Typically userspace does not care of the initial state of keys (it
> >> assumes they all start unpressed), where as for switches the initial
> >> state matters and we cannot query the initial state here.
> >>
> >>> If we really do not know if there is functionality present or not maybe
> >>> you can register a 2nd input device for the privacy switch upon
> >>> receiving the first event for it?
> >>
> >> Yes that is one of the hacks which we use for SW_TABLET_MODE, but
> >> I do really see this as a hack and I would like to avoid this if
> >> possible.
> >>
> >>>> The real issue is that the firmware does not tell us if there is
> >>>> an eprivacy screen. As mentioned the first time we find out is when
> >>>> the eprivacy screen gets toggled on or off.
> >>>>
> >>>> We are having similar issues with SW_TABLET_MODE which userspace
> >>>> uses to e.g. show / not show an on screen keyboard when a text
> >>>> entry field is focussed. So the mere presence of SW_TABLET_MODE
> >>>> can influence userspace without ever sending any events and we
> >>>> have all kind of special handling in various foo-laptop and
> >>>> intel-vbtn, etc. drivers for this, which I would like to avoid
> >>>> here.
> >>>
> >>> Probably have a similar solution: delay registration of corresponding
> >>> input device until you know the existence/state?
> >>
> >> Right that is already done in some cases. What complicates things
> >> wrt SW_TABLET_MODE is that we would like to have it present as soon
> >> as the driver probes so that a 2-in-1 which is booted in tablet mode
> >> behaves correctly from the start. Most of the firmware APIs for
> >> SW_TABLET_MODE support getting the initial state, but their implementation
> >> can be unreliable. So we only fallback to the delayed registration
> >> for known unreliable models, which requires quirks...
> >>
> >> This is getting a bit offtopic but it does show why I'm not in
> >> favor of using EV_SW style input-devices when there is no reliable
> >> initial state.
> >>
> >>>> So having ON / OFF EV_KEY events which we only generate when
> >>>> there is an actual eprivacy on/off event are by far the most KISS
> >>>> and fool proof solution.
> >>>
> >>> This assumes you assign special meaning to it (i.e. pretend that it is
> >>> not really there until you see events).
> >>
> >> As I see it there are 2 cases:
> >>
> >> 1. We can query the presence and status of the eprivacy screen at
> >> boot, this would map nicely to a SW_EPRIVACY_SCREEN, but we already
> >> have the drm properties API for this and this was put in DRM because
> >> this ties the privacy screen to a specific output which is useful
> >> to know.
> >>
> >> 2. The first thing we findout / hear about an eprivacy screen is
> >> a eprivacy on/off hotkey press. Notice the "hotkey" there iow
> >> this event gets send as the result of a key-press event.
> >>
> >> For 2. I think that just modelling this as the key events which
> >> these also happen to actually be is much simpler then dynamically
> >> registering a second input device on the first such a key press
> >>
> >> and I also think that the userspace side will be simpler with
> >> just key-press events rather then having to deal with the dynamic
> >> second device registration + reading an EV_SW .
> > 
> > OK, I agree that if you have a reliable way of querying the state you
> > can simply go with the DRM properties solution.
> > 
> > Since this keys are in effect notification only, not something that
> > userspace needs to actively handle, I don't suppose you can add another
> > state to the DRM privacy-screen hw-state: "unknown" and update it when  
> > the state becomes known?
> 
> That would break existing userspace consumers of the API and this is
> not just about not being able to query the initial state it is also
> about not being able to query if there the eprivacy screen option is
> installed at all. The presence of the drm-properties currently lets
> to userspace that there is an eprivacy screen present and e.g. will
> make gnome-control-center show a toggle to turn it on/off IIRC.

OK, fair enough. Let's merge it. I just acked the patch adding the new
keycodes, feel free to merge through the platform tree.

Thanks.

-- 
Dmitry

