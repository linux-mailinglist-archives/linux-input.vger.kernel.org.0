Return-Path: <linux-input+bounces-15660-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8142ABFDD04
	for <lists+linux-input@lfdr.de>; Wed, 22 Oct 2025 20:25:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F26EB18C7F44
	for <lists+linux-input@lfdr.de>; Wed, 22 Oct 2025 18:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD0033DECE;
	Wed, 22 Oct 2025 18:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRaDBV7B"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F02E337B99;
	Wed, 22 Oct 2025 18:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761157490; cv=none; b=gQXDTUULbpVl6FBBxobqabGokhbbYjHFj+d4bs8slMyMora9W7gjoy1h5udmkzzBYluXYgfhYBGjgJLQDhGaL67YjwzylgpR4qCame53kVvJtnJoYfHEm7bM16iRT1eyQRTtqMWp1Gyu7o9dj1gAIqB/hMTg3f11n4CErAw6nv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761157490; c=relaxed/simple;
	bh=YMgy1Ds7gABIkmFt4M2UjitqThoC0UBB0eMJyuzg/JI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gwz0RvLrRiKlSZXL6PZ9qK9tYSAOpXeaKItC8EhsRUQ3SSKxphe40bYp1auwF7bdRVzHbmFt6Ymr6eG2EzEJR43PAq5f0r4ERH3Amn9hucNIpZhdy9ewmFuC2TTIiyvNRdn93q4xDbLV5qxWPqntu+r6Z8Y2kkDTDqhAKHNau1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRaDBV7B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA5ACC4CEF7;
	Wed, 22 Oct 2025 18:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761157490;
	bh=YMgy1Ds7gABIkmFt4M2UjitqThoC0UBB0eMJyuzg/JI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NRaDBV7BSlQ+fb8qMnzn4JSE4ZnZSEptP1ucoFNGo7DmpoRxw6QNWJC8Vi4HLO0lI
	 VDA4SkqmXclAw21G6vrF8jU5M5PBJstHQBFfQ/P63KWhGIcgOXAqijxdg5Bk6PsrEA
	 X6v9XjjhnwEGXdGsx2NX+EM4RtpQsGzdQfmm46uhyLuBIAXLs9BdbyMIQKceKUEFh3
	 rPwv9eJutN5UbrU5h/aQgnRnghyWAN7ehZkGkrSOUPT8BSxncBonkY4u6MYfb3oAb8
	 +0lXXwDRdSq4gfO19ukhtudJ/ybcHk2uU1/Cgj+NvsbaItvfIYXDVOLC1v/XCTfC2w
	 OmHInGidXFexg==
Message-ID: <dfda82fc-1c35-4986-929d-d27ba877aab6@kernel.org>
Date: Wed, 22 Oct 2025 20:24:46 +0200
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
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <wcrbaqheqhzpjcg3au2c5xshwwed5bjyvl5u5pske6ru7lggjs@yjpnfdbkogba>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 22-Oct-25 7:54 PM, Dmitry Torokhov wrote:
> Hi Hans,
> 
> On Mon, Oct 20, 2025 at 05:23:29PM +0200, Hans de Goede wrote:
>> Hi All,
>>
>> Here is a patch series for adding support for the electronic privacy screen
>> on/off events send on e.g. Dell Latitude 7300 models.
>>
>> On these laptops the firmware does not allow querying the presence nor
>> the status of the eprivacy screen at boot. This makes it impossible to
>> implement the drm connector eprivacy properties API (1) since drm objects
>> do not allow adding new properties after creation and the presence of
>> the eprivacy cannot be detected at boot.
>>
>> So instead this series adds 2 evdev keycodes for eprivacy screen on + off
>> and modifies the dell-wmi driver to use these, so that we can still
>> propagate these events to userspace for e.g. a DE to show an OSD.
>>
>> Dmitry, can we get your ack for the addition of the 2 new keycodes?
>> I think it will be easiest if Ilpo merges the entire series through
>> the pdx86 tree with your ack for the keycodes.
> 
> Yes, that should be fine, although I wonder if this is best modeled as a
> pair of keys or a single switch? I know we have touchpad on/off but I
> wonder if it was the best option... Probably more convenient at some
> point if it was done through the atkbd.

EV_SW has the same problem as the drm property API. The mere presence
of advertising a new SW_PRIVACY_SCREEN capability on an /dev/input/event#
node would convey to userspace that there is an eprivacy-screen and we
also would need to know the initial state (on/off) for using an EV_SW
for this and we know neither presence nor status before hand (1).

The real issue is that the firmware does not tell us if there is
an eprivacy screen. As mentioned the first time we find out is when
the eprivacy screen gets toggled on or off.

We are having similar issues with SW_TABLET_MODE which userspace
uses to e.g. show / not show an on screen keyboard when a text
entry field is focussed. So the mere presence of SW_TABLET_MODE
can influence userspace without ever sending any events and we
have all kind of special handling in various foo-laptop and
intel-vbtn, etc. drivers for this, which I would like to avoid
here.

So having ON / OFF EV_KEY events which we only generate when
there is an actual eprivacy on/off event are by far the most KISS
and fool proof solution.

Regards,

Hans



