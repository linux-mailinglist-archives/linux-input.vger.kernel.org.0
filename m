Return-Path: <linux-input+bounces-15663-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7734BFDFCB
	for <lists+linux-input@lfdr.de>; Wed, 22 Oct 2025 21:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81BA03A7FAD
	for <lists+linux-input@lfdr.de>; Wed, 22 Oct 2025 19:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2BD721B9C1;
	Wed, 22 Oct 2025 19:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MSygiUh1"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C913E38FA3;
	Wed, 22 Oct 2025 19:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761160538; cv=none; b=CSkpcgB2b93MVAGSB/u3uLBe+PhgiUQ9FchC+Qb2iZV1osb7w7nIJd4X00wizVmmuTIum1n4Ye6AWxp7aNN8yeyJZE8GbqCvuT2ubIk2NriRXCSTHHheY5mJqEjIloeEo0InlGm8/kx+W4dcQmnmw2JOmkeiURwE1+iJaZePU3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761160538; c=relaxed/simple;
	bh=K1cwuC7d5MGbG5QJ3GxeB3KOwKsGVep9hVvVh+UTYVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gvuA1uNIbckLunh57n0gbxioqMBxqdk87Ezlr9z+hw/PDDqGtV/pOLBEIqL7up5bQGMaJikLxaKvkX993B3BRo0GUfQYHBGlG0o261yDgCXNUo/jCQxah59Ui9Q11/rjBD3LeuyxdW7jh2tms3NPNY59P6PiRt1iTZxzpDSv6mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MSygiUh1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43CCBC113D0;
	Wed, 22 Oct 2025 19:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761160538;
	bh=K1cwuC7d5MGbG5QJ3GxeB3KOwKsGVep9hVvVh+UTYVo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MSygiUh14ly9ROYbXi2ONrtSGTnB/JyIyy3GvqKCDbgWO/Guh9DFbbAF7F9ybOr6r
	 SALKXpLP6KftqOB1rFGd4LEMpk7EpJLqcpNCuZAfLSARqtLdIZXEMPEQxsezWtXckC
	 U3JJwO7oU1c4BJojiX1cLjtH/+nbDTnTqUwD093tGEhkxtcT5jES1n8mM63JIkOfms
	 G7tlPckQ7IoKynJ6louhLrr1ku3T1rdIe12c/OLQoRLTGP3uIjjoeEBLdRMzfDUNlK
	 yiASFTaqCmCBY6Hre2LBI+6Fzph2WvJjfjKjuiTIQUGxsuEa9ENN8TayaZ4/WpKofF
	 3UIdVUUBOyOAw==
Message-ID: <7f2a89c3-de22-43fa-b714-626f12fc52be@kernel.org>
Date: Wed, 22 Oct 2025 21:15:35 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Input: Add keycodes for electronic privacy screen
 on/off an use these in dell-wmi
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, linux-input@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20251020152331.52870-1-hansg@kernel.org>
 <wcrbaqheqhzpjcg3au2c5xshwwed5bjyvl5u5pske6ru7lggjs@yjpnfdbkogba>
 <dfda82fc-1c35-4986-929d-d27ba877aab6@kernel.org>
 <jnlyr7m3q7etnipczqp22ix2ijovvoqnxnopjyrey7mtbryu3c@x7snlzka3euz>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <jnlyr7m3q7etnipczqp22ix2ijovvoqnxnopjyrey7mtbryu3c@x7snlzka3euz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 22-Oct-25 8:40 PM, Dmitry Torokhov wrote:
> On Wed, Oct 22, 2025 at 08:24:46PM +0200, Hans de Goede wrote:
>> Hi Dmitry,
>>
>> On 22-Oct-25 7:54 PM, Dmitry Torokhov wrote:
>>> Hi Hans,
>>>
>>> On Mon, Oct 20, 2025 at 05:23:29PM +0200, Hans de Goede wrote:
>>>> Hi All,
>>>>
>>>> Here is a patch series for adding support for the electronic privacy screen
>>>> on/off events send on e.g. Dell Latitude 7300 models.
>>>>
>>>> On these laptops the firmware does not allow querying the presence nor
>>>> the status of the eprivacy screen at boot. This makes it impossible to
>>>> implement the drm connector eprivacy properties API (1) since drm objects
>>>> do not allow adding new properties after creation and the presence of
>>>> the eprivacy cannot be detected at boot.
>>>>
>>>> So instead this series adds 2 evdev keycodes for eprivacy screen on + off
>>>> and modifies the dell-wmi driver to use these, so that we can still
>>>> propagate these events to userspace for e.g. a DE to show an OSD.
>>>>
>>>> Dmitry, can we get your ack for the addition of the 2 new keycodes?
>>>> I think it will be easiest if Ilpo merges the entire series through
>>>> the pdx86 tree with your ack for the keycodes.
>>>
>>> Yes, that should be fine, although I wonder if this is best modeled as a
>>> pair of keys or a single switch? I know we have touchpad on/off but I
>>> wonder if it was the best option... Probably more convenient at some
>>> point if it was done through the atkbd.
>>
>> EV_SW has the same problem as the drm property API. The mere presence
>> of advertising a new SW_PRIVACY_SCREEN capability on an /dev/input/event#
>> node would convey to userspace that there is an eprivacy-screen and we
>> also would need to know the initial state (on/off) for using an EV_SW
>> for this and we know neither presence nor status before hand (1).
> 
> How is this different form presence of KEY_PRIVACY_SCREEN_ON/OFF? They
> also imply that there is a privacy screen.

I've never seen userspace change behavior depending on which keycodes
are advertised as possibly being send by a device.

Typically userspace does not care of the initial state of keys (it
assumes they all start unpressed), where as for switches the initial
state matters and we cannot query the initial state here.

> If we really do not know if there is functionality present or not maybe
> you can register a 2nd input device for the privacy switch upon
> receiving the first event for it?

Yes that is one of the hacks which we use for SW_TABLET_MODE, but
I do really see this as a hack and I would like to avoid this if
possible.

>> The real issue is that the firmware does not tell us if there is
>> an eprivacy screen. As mentioned the first time we find out is when
>> the eprivacy screen gets toggled on or off.
>>
>> We are having similar issues with SW_TABLET_MODE which userspace
>> uses to e.g. show / not show an on screen keyboard when a text
>> entry field is focussed. So the mere presence of SW_TABLET_MODE
>> can influence userspace without ever sending any events and we
>> have all kind of special handling in various foo-laptop and
>> intel-vbtn, etc. drivers for this, which I would like to avoid
>> here.
> 
> Probably have a similar solution: delay registration of corresponding
> input device until you know the existence/state?

Right that is already done in some cases. What complicates things
wrt SW_TABLET_MODE is that we would like to have it present as soon
as the driver probes so that a 2-in-1 which is booted in tablet mode
behaves correctly from the start. Most of the firmware APIs for
SW_TABLET_MODE support getting the initial state, but their implementation
can be unreliable. So we only fallback to the delayed registration
for known unreliable models, which requires quirks...

This is getting a bit offtopic but it does show why I'm not in
favor of using EV_SW style input-devices when there is no reliable
initial state.

>> So having ON / OFF EV_KEY events which we only generate when
>> there is an actual eprivacy on/off event are by far the most KISS
>> and fool proof solution.
> 
> This assumes you assign special meaning to it (i.e. pretend that it is
> not really there until you see events).

As I see it there are 2 cases:

1. We can query the presence and status of the eprivacy screen at
boot, this would map nicely to a SW_EPRIVACY_SCREEN, but we already
have the drm properties API for this and this was put in DRM because
this ties the privacy screen to a specific output which is useful
to know.

2. The first thing we findout / hear about an eprivacy screen is
a eprivacy on/off hotkey press. Notice the "hotkey" there iow
this event gets send as the result of a key-press event.

For 2. I think that just modelling this as the key events which
these also happen to actually be is much simpler then dynamically
registering a second input device on the first such a key press

and I also think that the userspace side will be simpler with
just key-press events rather then having to deal with the dynamic
second device registration + reading an EV_SW .

Regards,

Hans




