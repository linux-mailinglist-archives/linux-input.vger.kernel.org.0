Return-Path: <linux-input+bounces-12018-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17604A9DDE9
	for <lists+linux-input@lfdr.de>; Sun, 27 Apr 2025 01:45:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F1A192204A
	for <lists+linux-input@lfdr.de>; Sat, 26 Apr 2025 23:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAFC920012C;
	Sat, 26 Apr 2025 23:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o8tI9OZ1"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B131F91C5;
	Sat, 26 Apr 2025 23:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745711097; cv=none; b=Nu4DlLTC0SxNvHsc3hUPhdlWYT4MeYEPbFjc5EIwqYsjJZ/kANLTO+QDKI0yazOcxkjPyUF3Ze2dyV3mG5sYOB3rKkl0ZuP4OxwiNPtjo5OWY75Si4fxBCS1Nv2IXXpOuzpEouaDVYu6hO4xSY+8mrNlEDQoUqqfRGgazYw0+co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745711097; c=relaxed/simple;
	bh=Z+x5OL3loGNtZxv+I+o8XuUEcM5SymU6va2mq7wvSAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hWaI10mnVBlQd0Cxi/Sm3HE0/+SrwH3DoTZrA5SSoP0+ezWLpWqiBvMhDhB5TKo34c7C6lmry1yW6BbWvq/AIqvoZfVlnpxgxNxsLK9glM5pxlX+OefGuo2qnuGb0ROxWGxaa1AP+X5eTvMjsNMcNbVJrQHZ5tye/Ew79WIqQWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o8tI9OZ1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C8CAC4CEE2;
	Sat, 26 Apr 2025 23:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745711096;
	bh=Z+x5OL3loGNtZxv+I+o8XuUEcM5SymU6va2mq7wvSAA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o8tI9OZ1KhAIL0v4EmPtqmAFUod1FNjZtZnIhwio+J9mPL/bDiPhRE4tMQWDsLNRy
	 MqfOc3pBiFXwEpURZridf6eUsrGlTq2CoYkBb57S9dpXUVr/bn8GR4ysuPf/C5crji
	 5Aix0gkkqb3+hTRw2Np7fp0Dze0Ya/xL3Ee3SB+Nw8NYNvPsD3QS9FT+mwuNB8Oz/v
	 5KLk7BJ58OYYuzzq5QzmP1i1T+DPArC2dOWD7ol0ijI522ibyvN9YEssAGsHoduhb8
	 0sf7WiUIkJrsVzgdZF3FJqRUN1MEdJ19AFvg0+0tfoNa9xTYcwcfhdJWufpI4COesZ
	 fTgy1vXXjZTVg==
Message-ID: <db4dfc85-ce8b-4922-9558-670c3bb6eff2@kernel.org>
Date: Sat, 26 Apr 2025 18:44:54 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] Input: Add a Kconfig to emulate KEY_SCREENLOCK
 with META + L
To: Pavel Machek <pavel@ucw.cz>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..."
 <linux-input@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:AMD PMF DRIVER" <platform-driver-x86@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>, Armin Wolf <W_Armin@gmx.de>
References: <20250425162949.2021325-1-superm1@kernel.org>
 <aAyWFI+o/kU9hDVs@duo.ucw.cz>
 <b4bc07aa-e4b5-4a2a-a4ad-91c1e5071f00@kernel.org>
 <aA0o2SWGtd/iMYM2@duo.ucw.cz>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <aA0o2SWGtd/iMYM2@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/26/25 13:41, Pavel Machek wrote:
> Hi!
> 
>>>> In the PC industry KEY_SCREENLOCK isn't used as frequently as it used
>>>> to be. Modern versions of Windows [1], GNOME and KDE support "META" + "L"
>>>> to lock the screen. Modern hardware [2] also sends this sequence of
>>>> events for keys with a silkscreen for screen lock.
>>>>
>>>> Introduced a new Kconfig option that will change KEY_SCREENLOCK when
>>>> emitted by driver to META + L.
>>>
>>> Fix gnome and kde, do not break kernel...
>>
>> I'm sorry; fix them to do what exactly?  Switch to KEY_SCREENLOCK?
>>
>> That's going to break modern hardware lockscreen keys.  They've all
>> obviously moved to META+L because that's what hardware today uses.
> 
> Gnome / KDE should accept either META+L _or_ KEY_SCREENLOCK to do the
> screen locking, no?
> 

This was actually the first path I looked down before I even started the 
kernel patch direction for this problem.

GNOME doesn't support assigning more than one shortcut key for an action.

