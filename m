Return-Path: <linux-input+bounces-15453-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6B9BD8634
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 11:18:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A219E1923579
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 09:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2085B271473;
	Tue, 14 Oct 2025 09:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j3DR+sa1"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC75025D546;
	Tue, 14 Oct 2025 09:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760433516; cv=none; b=f5UbiPszWDJluPW/gjsyKOAQBMoZGPwk9xBNldZR2DbGArbpU260Y3MvfmPJf6fLjfraf3oUv5U/EvPSgaYXBo/C92NR9kJUyfIuWWBjOMpyUAG2vjNhK5I9JHZSrelKU7ab/Mby5IrcMqwW0rrHlx5tkAIziXYEG3D7aAdZRds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760433516; c=relaxed/simple;
	bh=wxJPkikuFfGHOuRJanJul4c3Ue8RTPBKYkHQql/b1vU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OMz16BgPDOebbvajxVWB5Dyrey/OGIo/y/ZFX7m4d+svHVkuv0VOMeZyYMcOeDqVXwf0L726A0oqLnsZiK/3rLYthm/lCo/VYB45ZnWNjDCQ5IKtnNVcU+ZCt/NxZoeCExetj3qSvLSjCdzje7E6WSkFyd4/47QG8VDZpE9Hjh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j3DR+sa1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE99FC4CEE7;
	Tue, 14 Oct 2025 09:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760433515;
	bh=wxJPkikuFfGHOuRJanJul4c3Ue8RTPBKYkHQql/b1vU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=j3DR+sa11unP5yeEO7s3VK585A5sd00VQoHhNKUamBA0W1lqLAWb2zEqZ+Cwn/U9v
	 NAp8AGnRyRe+Dly4AC1ePfYhEH15CPr0oWTjNSDbsns3QAlRwSEcCGBJuR4+2IWhvV
	 HMY+TgbhF9oFT23y6kGWtNU2QuxkZMh5cEXNheZKPPYUzk1A4539eF7ZZVzYLZCsa1
	 SbGothdqYBa3fVR/8fSw9+mwIIRbqOf1sl5uffo4aK4qL36FQJLlH2PNUImpWukmY+
	 sY++jaJd/QX4r0CCzGYqm5yVxHAvXK0e8nNi4xdzHMkWGk60Z8jUPwDSkVNYdMq7JJ
	 EQclvUr3pX5wQ==
Date: Tue, 14 Oct 2025 11:18:32 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: "Leo L. Schwab" <ewhac@ewhac.org>
cc: Hans de Goede <hansg@kernel.org>, Kate Hsuan <hpa@redhat.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] HID: lg-g15 - Add support for Logitech G13.
In-Reply-To: <20250917230550.1160621-1-ewhac@ewhac.org>
Message-ID: <36553po4-qr86-rsn4-7534-6q197q92r6sr@xreary.bet>
References: <20250917230550.1160621-1-ewhac@ewhac.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 17 Sep 2025, Leo L. Schwab wrote:

> The Logitech G13 is a gaming keypad with general-purpose macro keys,
> four LED-backlit macro preset keys, five "menu" keys, backlight toggle
> key, an analog thumbstick, RGB LED backlight, and a monochrome LCD
> display.
> 
> Support input event generation for all keys and the thumbstick, and
> expose all LEDs.
> 
> Signed-off-by: Leo L. Schwab <ewhac@ewhac.org>
> Reviewed-by: Hans de Goede <hansg@kernel.org>
> Tested-by: Kate Hsuan <hpa@redhat.com>
> ---
> Changes in v6:
>   - Alter interaction between `brightness` and `brightness_hw_changed`
>     for the backlight as advised by Hans de Goede <hansg@kernel.org>.
>   - On probe, query device for current state of HW backlight toggle;
>     track in `backlight_disabled` and update sysfs.
>   - Ensure non-backlight LED brightnesses report either 0 or 1.
> Changes in v5:
>   - None; resend v4 due to bounced email submission.
> Changes in v4:
>   - Minor changes recommended by Hans de Goede <hansg@kernel.org>.
> Changes in v3:
>   - Re-revise commit message.
>   - Conditionally compile the section depending on
>     CONFIG_LEDS_BRIGHTNESS_HW_CHANGED correctly this time.
>   - Use led-class-multicolor facilities for the RGB backlight.
>   - Changes recommended by Kate Hsuan <hpa@redhat.com>:
>     - Use guard(mutex) construct.
>     - Fix numerous style nits.
> Changes in v2:
>   - Add `#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED` bracket around new
>     code segment dependent on that feature (fixes test robot build
>     error).
>   - Use `guard(mutex)` construct in new code (existing code left
>     unmodified).
>   - Commit message revised.

Applied to hid.git#for-6.19/logitech, thanks.

-- 
Jiri Kosina
SUSE Labs


