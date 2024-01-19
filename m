Return-Path: <linux-input+bounces-1324-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D97C832485
	for <lists+linux-input@lfdr.de>; Fri, 19 Jan 2024 07:16:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04C92286E04
	for <lists+linux-input@lfdr.de>; Fri, 19 Jan 2024 06:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E246A4C85;
	Fri, 19 Jan 2024 06:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="LrAChoW7"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F624A3C;
	Fri, 19 Jan 2024 06:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705645011; cv=none; b=ic1lVD+d7WqjeD5hQ3zHYT9a31sgQi6mqXkU6MlgREYthqcMxxfLW5yKc2huNsXCEcGjDiGNvbA6YLALOoSnmhL6lkRWmPOGa2PKopnn3YVUuuscsX+tlliP9qWzM2PfdX/x6Lg2YiCRWna23ohmtiJgO6cijjf39NQ2rwZiR8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705645011; c=relaxed/simple;
	bh=SYwO7jqsBNO6Nten41bVPwTuEiaKYsEwrvmOTRn34lw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fhDVR0WNwViWPfxFIZ7T48W2Yx1qZiEjrEkW/vI58LL9JKOXM3JOaa1Vqhd6WASyvSU/aCr/ztK3oeNuxQQuSLIbaHqDuBH2p9IgHXNyYOxJB2xlXtWTShuJX1NoeQu7qUfi47P5dAv1XpmYdP4OhbYmDUgvkyTA2LM3evSfOTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=LrAChoW7; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
Received: from [192.168.0.24] (71-212-26-68.tukw.qwest.net [71.212.26.68])
	by endrift.com (Postfix) with ESMTPSA id 146E1A264;
	Thu, 18 Jan 2024 22:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1705645002; bh=SYwO7jqsBNO6Nten41bVPwTuEiaKYsEwrvmOTRn34lw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LrAChoW7m8P2igWaaKdmRWM4yHplN9Yu1MCk8SrNlm+xPxWgqdsVpsW6/aO6XuBV9
	 3R56JrgSdEI7Vz3FF+otiysaQUuLqkS4esKTH7s21K5LNdekpjaGN+TzBx0FgcsN4V
	 s4l3FnyLfEF30sM15qS2fJcKCgmdj9ZG1jjZCQWbfw2DPngx5k9z4SfhWSGkUyTMaB
	 YUcHJ+RyiL2yYEBdcXZyCN+7VJQiMYT4a05h7QgWg30EgTjWB2W25FLZddbKtVTM8f
	 B6M8HFmIEYxTLgbJQW8dn0elMhxpApEeZ5EJ5Jq9sH/ur85XGnKQE2fw0Z5hdqdQVr
	 1JIL9AuMiexAA==
Message-ID: <da6f1483-1ae2-40b5-9c1e-684321e12288@endrift.com>
Date: Thu, 18 Jan 2024 22:16:43 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: xpad - add Lenovo Legion Go controllers
To: Brenton Simpson <appsforartists@google.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>
Cc: Cameron Gutman <aicommander@gmail.com>,
 Erica Taylor <rickytaylor26@gmail.com>,
 Ismael Ferreras Morezuelas <swyterzone@gmail.com>,
 Jonathan Frederick <doublej472@gmail.com>,
 Matthias Benkmann <matthias.benkmann@gmail.com>,
 Matthias Berndt <matthias_berndt@gmx.de>, nate@yocom.org,
 Sam Lantinga <slouken@libsdl.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, trivial@kernel.org
References: <CAAL3-=88exVfuL1Y-kvPNbsU+d-UTfDLFViWVObFLtbC4xueeA@mail.gmail.com>
 <20240118183546.418064-1-appsforartists@google.com>
Content-Language: en-US
From: Vicki Pfau <vi@endrift.com>
In-Reply-To: <20240118183546.418064-1-appsforartists@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Brenton,

On 1/18/24 10:35, Brenton Simpson wrote:
> The Lenovo Legion Go is a handheld gaming system, similar to a Steam Deck.
> It has a gamepad (including rear paddles), 3 gyroscopes, a trackpad,
> volume buttons, a power button, and 2 LED ring lights.
> 
> The Legion Go firmware presents these controls as a USB hub with various
> devices attached.  In its default state, the gamepad is presented as an
> Xbox controller connected to this hub.  (By holding a combination of
> buttons, it can be changed to use the older DirectInput API.)
> 
> This patch teaches the existing Xbox controller module `xpad` to bind to
> the controller in the Legion Go, which enables support for the:
> 
> - directional pad,
> - analog sticks (including clicks),
> - X, Y, A, B,
> - start and select (or menu and capture),
> - shoulder buttons, and
> - rumble.
> 
> The trackpad, touchscreen, volume controls, and power button are already
> supported via existing kernel modules.  Two of the face buttons, the
> gyroscopes, rear paddles, and LEDs are not.
> 
> After this patch lands, the Legion Go will be mostly functional in Linux,
> out-of-the-box.  The various components of the USB hub can be synthesized
> into a single logical controller (including the additional buttons) in
> userspace with [Handheld Daemon](https://github.com/hhd-dev/hhd), which
> makes the Go fully functional.
> 
> Signed-off-by: Brenton Simpson <appsforartists@google.com>
> ---
>   drivers/input/joystick/xpad.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index f5c21565bb3c..ecfcea8740a0 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -127,6 +127,7 @@ static const struct xpad_device {
>   	u8 mapping;
>   	u8 xtype;
>   } xpad_device[] = {
> +	{ 0x17ef, 0x6182, "Lenovo Legion Controller for Windows", 0, XTYPE_XBOX360 },
>   	{ 0x0079, 0x18d4, "GPD Win 2 X-Box Controller", 0, XTYPE_XBOX360 },
>   	{ 0x03eb, 0xff01, "Wooting One (Legacy)", 0, XTYPE_XBOX360 },
>   	{ 0x03eb, 0xff02, "Wooting Two (Legacy)", 0, XTYPE_XBOX360 },

Please keep the items in this list sorted.

 > @@ -459,6 +460,7 @@ static const signed short xpad_btn_paddles[] = {
>   
>   static const struct usb_device_id xpad_table[] = {
>   	{ USB_INTERFACE_INFO('X', 'B', 0) },	/* Xbox USB-IF not-approved class */
> +	XPAD_XBOX360_VENDOR(0x17ef),		/* Lenovo */
>   	XPAD_XBOX360_VENDOR(0x0079),		/* GPD Win 2 controller */
>   	XPAD_XBOX360_VENDOR(0x03eb),		/* Wooting Keyboards (Legacy) */
>   	XPAD_XBOXONE_VENDOR(0x03f0),		/* HP HyperX Xbox One controllers */

Ditto here.

Dmitry will sometimes take patches and fix the sorting after they're 
submitted so you might not to resubmit, but for future reference, this 
list is intended to be sorted.

Vicki

