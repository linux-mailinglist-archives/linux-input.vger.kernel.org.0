Return-Path: <linux-input+bounces-15669-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE9CC0181F
	for <lists+linux-input@lfdr.de>; Thu, 23 Oct 2025 15:44:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DF623A2679
	for <lists+linux-input@lfdr.de>; Thu, 23 Oct 2025 13:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C9830595D;
	Thu, 23 Oct 2025 13:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tR9tO8aL"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5DA2D3EDB;
	Thu, 23 Oct 2025 13:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761226928; cv=none; b=Pw3uxKDxytrWDb/K8WH3GVMNIJoscM4939XfQQvl3IxQcMve7qvuNcmtqy3szqRGWb4NjS/QVr17miHdw5Q2shU6PSm9Hm2qYqROCDE/vqgaoNesVo4TdrwBam5dNza5iUEcXw5vFE6ZHPKQk0rZNjj+Kdx22bX6K28c/jq3vbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761226928; c=relaxed/simple;
	bh=KumRqOpKz2CtJhR5kxIVNflf67DcNxohF4aB18PbEx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lt9K1VbcqZJPYeDcF3pxWOVBIixZkVTZbnHUxeXuaK2br0oL2SMwpWIBix5Vo2gVWnLpJ2Wf34KZ0UYfexMEa3ADOEb0g7mi5ikiLVyTPxG8S9smjhPSrahcgF8Rr7drEBcVfKBouTweX8H0719VqM3l+9ciy/6UW5W3H0SOW7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tR9tO8aL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E785C4CEE7;
	Thu, 23 Oct 2025 13:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761226927;
	bh=KumRqOpKz2CtJhR5kxIVNflf67DcNxohF4aB18PbEx8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tR9tO8aLFr/S9wpkLGPzaMhSYyzzWbJw8wLq4LyVumKe3K9dDGn75l/Wf8t8PNMIs
	 Swq7o3vVo+3bo9fCvYMlPn+Jfj+QrSxs5mA3pFfrBQPJiAISDKHPtAgMG9+hw2XtvP
	 z7lF63z0++NjogGird66dCx11mPViUOy56aQ+x0kAkR6fK01YBdTgc//mnzSo6AQgB
	 4sLUKWaTlXub7Iqi7udcODBMEhZxosU9YPnaaAw0X46QIrpEHJf9Bmti6GV2YzSMou
	 L+Y2gCfSI1m9l96WZwCTc/5iO03yT9pcHoopJ9hXn9fe2stQveQtB2hUQAhtQ5NqKp
	 8iuFpkUhKn+6w==
Message-ID: <12502962-3d1e-44b0-b280-d2bae20dd1ee@kernel.org>
Date: Thu, 23 Oct 2025 15:42:04 +0200
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
 <7f2a89c3-de22-43fa-b714-626f12fc52be@kernel.org>
 <3df27pbmdhv3x5zsfdnyttkliqdetunxwhc5e6yfbqhcbz4e45@l7ddhswxl4tk>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <3df27pbmdhv3x5zsfdnyttkliqdetunxwhc5e6yfbqhcbz4e45@l7ddhswxl4tk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 22-Oct-25 10:24 PM, Dmitry Torokhov wrote:
> On Wed, Oct 22, 2025 at 09:15:35PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 22-Oct-25 8:40 PM, Dmitry Torokhov wrote:
>>> On Wed, Oct 22, 2025 at 08:24:46PM +0200, Hans de Goede wrote:
>>>> Hi Dmitry,
>>>>
>>>> On 22-Oct-25 7:54 PM, Dmitry Torokhov wrote:
>>>>> Hi Hans,
>>>>>
>>>>> On Mon, Oct 20, 2025 at 05:23:29PM +0200, Hans de Goede wrote:
>>>>>> Hi All,
>>>>>>
>>>>>> Here is a patch series for adding support for the electronic privacy screen
>>>>>> on/off events send on e.g. Dell Latitude 7300 models.
>>>>>>
>>>>>> On these laptops the firmware does not allow querying the presence nor
>>>>>> the status of the eprivacy screen at boot. This makes it impossible to
>>>>>> implement the drm connector eprivacy properties API (1) since drm objects
>>>>>> do not allow adding new properties after creation and the presence of
>>>>>> the eprivacy cannot be detected at boot.
>>>>>>
>>>>>> So instead this series adds 2 evdev keycodes for eprivacy screen on + off
>>>>>> and modifies the dell-wmi driver to use these, so that we can still
>>>>>> propagate these events to userspace for e.g. a DE to show an OSD.
>>>>>>
>>>>>> Dmitry, can we get your ack for the addition of the 2 new keycodes?
>>>>>> I think it will be easiest if Ilpo merges the entire series through
>>>>>> the pdx86 tree with your ack for the keycodes.
>>>>>
>>>>> Yes, that should be fine, although I wonder if this is best modeled as a
>>>>> pair of keys or a single switch? I know we have touchpad on/off but I
>>>>> wonder if it was the best option... Probably more convenient at some
>>>>> point if it was done through the atkbd.
>>>>
>>>> EV_SW has the same problem as the drm property API. The mere presence
>>>> of advertising a new SW_PRIVACY_SCREEN capability on an /dev/input/event#
>>>> node would convey to userspace that there is an eprivacy-screen and we
>>>> also would need to know the initial state (on/off) for using an EV_SW
>>>> for this and we know neither presence nor status before hand (1).
>>>
>>> How is this different form presence of KEY_PRIVACY_SCREEN_ON/OFF? They
>>> also imply that there is a privacy screen.
>>
>> I've never seen userspace change behavior depending on which keycodes
>> are advertised as possibly being send by a device.
> 
> On Chrome OS we are trying to go by what peripherals report, but I can
> see that it might not work for a generic Linux distro.
> 
>>
>> Typically userspace does not care of the initial state of keys (it
>> assumes they all start unpressed), where as for switches the initial
>> state matters and we cannot query the initial state here.
>>
>>> If we really do not know if there is functionality present or not maybe
>>> you can register a 2nd input device for the privacy switch upon
>>> receiving the first event for it?
>>
>> Yes that is one of the hacks which we use for SW_TABLET_MODE, but
>> I do really see this as a hack and I would like to avoid this if
>> possible.
>>
>>>> The real issue is that the firmware does not tell us if there is
>>>> an eprivacy screen. As mentioned the first time we find out is when
>>>> the eprivacy screen gets toggled on or off.
>>>>
>>>> We are having similar issues with SW_TABLET_MODE which userspace
>>>> uses to e.g. show / not show an on screen keyboard when a text
>>>> entry field is focussed. So the mere presence of SW_TABLET_MODE
>>>> can influence userspace without ever sending any events and we
>>>> have all kind of special handling in various foo-laptop and
>>>> intel-vbtn, etc. drivers for this, which I would like to avoid
>>>> here.
>>>
>>> Probably have a similar solution: delay registration of corresponding
>>> input device until you know the existence/state?
>>
>> Right that is already done in some cases. What complicates things
>> wrt SW_TABLET_MODE is that we would like to have it present as soon
>> as the driver probes so that a 2-in-1 which is booted in tablet mode
>> behaves correctly from the start. Most of the firmware APIs for
>> SW_TABLET_MODE support getting the initial state, but their implementation
>> can be unreliable. So we only fallback to the delayed registration
>> for known unreliable models, which requires quirks...
>>
>> This is getting a bit offtopic but it does show why I'm not in
>> favor of using EV_SW style input-devices when there is no reliable
>> initial state.
>>
>>>> So having ON / OFF EV_KEY events which we only generate when
>>>> there is an actual eprivacy on/off event are by far the most KISS
>>>> and fool proof solution.
>>>
>>> This assumes you assign special meaning to it (i.e. pretend that it is
>>> not really there until you see events).
>>
>> As I see it there are 2 cases:
>>
>> 1. We can query the presence and status of the eprivacy screen at
>> boot, this would map nicely to a SW_EPRIVACY_SCREEN, but we already
>> have the drm properties API for this and this was put in DRM because
>> this ties the privacy screen to a specific output which is useful
>> to know.
>>
>> 2. The first thing we findout / hear about an eprivacy screen is
>> a eprivacy on/off hotkey press. Notice the "hotkey" there iow
>> this event gets send as the result of a key-press event.
>>
>> For 2. I think that just modelling this as the key events which
>> these also happen to actually be is much simpler then dynamically
>> registering a second input device on the first such a key press
>>
>> and I also think that the userspace side will be simpler with
>> just key-press events rather then having to deal with the dynamic
>> second device registration + reading an EV_SW .
> 
> OK, I agree that if you have a reliable way of querying the state you
> can simply go with the DRM properties solution.
> 
> Since this keys are in effect notification only, not something that
> userspace needs to actively handle, I don't suppose you can add another
> state to the DRM privacy-screen hw-state: "unknown" and update it when  
> the state becomes known?

That would break existing userspace consumers of the API and this is
not just about not being able to query the initial state it is also
about not being able to query if there the eprivacy screen option is
installed at all. The presence of the drm-properties currently lets
to userspace that there is an eprivacy screen present and e.g. will
make gnome-control-center show a toggle to turn it on/off IIRC.

Regards,

Hans



