Return-Path: <linux-input+bounces-8776-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF6A9FC7B5
	for <lists+linux-input@lfdr.de>; Thu, 26 Dec 2024 03:34:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 772737A052B
	for <lists+linux-input@lfdr.de>; Thu, 26 Dec 2024 02:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42DACC133;
	Thu, 26 Dec 2024 02:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="rkGmHi/K"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F42BEED8
	for <linux-input@vger.kernel.org>; Thu, 26 Dec 2024 02:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735180483; cv=none; b=o1nBYxMV0FPyHo2uV47MY4DzZAoKUMedD3Eab4CSu0CjNxHUDhuTiuoGy04CDLzZ66jEbaTvOYcOLzQmsNCMU7GzqlTtDJAxj7ODFn05Pdv4NWj2VBNOZSPodiA3qvBMe4b0xbjxAHwQq22OrjbSVGC07HC4wXDA1v0Zqq6dm3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735180483; c=relaxed/simple;
	bh=8PzuWmXrKegnNrMigK3f5hG5Dk/XXwnPg1TyPaLgIZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BACevZjJbhDbhCM7w0v1xcS9A3FPPSK6QZayUIU21BONNfBcNot5s+z96BYp1EiUdmpIXSQyY+j4JcO4DE0Rpi3VMfkaBdDqLjZjkrL2VEwbc5+kL69aOQMY3RzDDyeqZ73dbNIwT7p5K0kgvuG5/aUlwnIWQPp8Fi5lsojfMCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=rkGmHi/K; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
Received: from [192.168.0.22] (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id DC1D0A037;
	Wed, 25 Dec 2024 18:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1735179956; bh=8PzuWmXrKegnNrMigK3f5hG5Dk/XXwnPg1TyPaLgIZk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rkGmHi/KjWQszpwdjFbNC+1vP2euobma98v1Uc9z8ItTN4S+p+Y4r9YmQgEiKmGO/
	 Q48N9naxe96jaKMuRsw7pBzlWUl6Wtg6pKQNKcic0xKCvAU3OPwBfzOQevrbxGLuNd
	 jGG+2CUnE3gtu0MNGRfLYddDWJk1tNfEKK6okDPunu/o2BAj1kanbPAJw9eBNu1HPQ
	 J7SwSBKDLIoiAazN6OsY15R6TdtJWrFciKyMjiM5hsW281LWF6XIYOVo6N0yFV02wA
	 8FyVbdogKieISLqcgWGw4is9Qrk3fOdJMdhExzf6dQZ8WTQSoRDElr3bUO0Kh2Faz4
	 iix+VkfFybtGg==
Message-ID: <2f88805c-7f4e-48a6-bcda-29a15879825b@endrift.com>
Date: Wed, 25 Dec 2024 18:25:54 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: hid-steam: Fix Lizard Mode disabling
To: Eugeny Shcheglov <eugenyshcheglov@gmail.com>, jikos@kernel.org
Cc: bentiss@kernel.org, linux-input@vger.kernel.org
References: <20241225155507.30288-1-eugenyshcheglov@gmail.com>
Content-Language: en-US
From: Vicki Pfau <vi@endrift.com>
In-Reply-To: <20241225155507.30288-1-eugenyshcheglov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This is, in theory, an opinionated change about how desktop, gamepad, and lizard modes should interact. Whether or not that opinion is broadly applicable is somewhat questionable. In practice, it doesn't actually do all it promises to do.

On 12/25/24 7:55 AM, Eugeny Shcheglov wrote:
> Disable Lizard Mode by setting the lizard_mode option.
> Set lizard_mode to 0 to disable switching between Desktop and Gamepad
> using the Options button, and use Gamepad input.

Switching between gamepad and desktop modes is already blocked when lizard_mode is disabled. See line 1053 in steam_mode_switch_cb. The work is scheduled sure, but it doesn't do anything when it triggers.

> 
> Signed-off-by: Eugeny Shcheglov <eugenyshcheglov@gmail.com>
> ---
>  drivers/hid/hid-steam.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
> index 6439913372a8..c64f716c9c14 100644
> --- a/drivers/hid/hid-steam.c
> +++ b/drivers/hid/hid-steam.c
> @@ -10,7 +10,7 @@
>   * This controller has a builtin emulation of mouse and keyboard: the right pad
>   * can be used as a mouse, the shoulder buttons are mouse buttons, A and B
>   * buttons are ENTER and ESCAPE, and so on. This is implemented as additional
> - * HID interfaces.
> + * HID interfaces. Joystick input is blocked when Lizard Mode is active.

This is conflating desktop and lizard modes, which have not been treated the same before. I don't think this is desirable. Lizard mode is a hardware mode, wherein mouse and gamepad input is sent, but desktop mode is a software mode where lizard mode is enabled and gamepad input is ignored. Making them the same is not desirable. That said, I do not see you actually implementing this later in the patch.

>   *
>   * This is known as the "lizard mode", because apparently lizards like to use
>   * the computer from the coach, without a proper mouse and keyboard.
> @@ -555,9 +555,6 @@ static int steam_play_effect(struct input_dev *dev, void *data,
>  
>  static void steam_set_lizard_mode(struct steam_device *steam, bool enable)
>  {
> -	if (steam->gamepad_mode)
> -		enable = false;
> -
>  	if (enable) {
>  		mutex_lock(&steam->report_mutex);
>  		/* enable esc, enter, cursors */
> @@ -566,6 +563,7 @@ static void steam_set_lizard_mode(struct steam_device *steam, bool enable)
>  		steam_send_report_byte(steam, ID_LOAD_DEFAULT_SETTINGS);
>  		mutex_unlock(&steam->report_mutex);
>  	} else {
> +		steam->gamepad_mode = true;
>  		mutex_lock(&steam->report_mutex);
>  		/* disable esc, enter, cursor */
>  		steam_send_report_byte(steam, ID_CLEAR_DIGITAL_MAPPINGS);

The purpose of this appears to be just to make the lizard mode setting override the gamepad mode setting instead of vice versa, which I suppose is fine, though I'd need to double check how this interacts with the hidraw being opened. However, you aren't canceling the work in the process, which you should probably do if you want to make this change as such.

> @@ -1590,12 +1588,14 @@ static void steam_do_deck_input_event(struct steam_device *steam,
>  	b13 = data[13];
>  	b14 = data[14];
>  
> -	if (!(b9 & BIT(6)) && steam->did_mode_switch) {
> -		steam->did_mode_switch = false;
> -		cancel_delayed_work_sync(&steam->mode_switch);
> -	} else if (!steam->client_opened && (b9 & BIT(6)) && !steam->did_mode_switch) {
> -		steam->did_mode_switch = true;
> -		schedule_delayed_work(&steam->mode_switch, 45 * HZ / 100);
> +	if (lizard_mode) {
> +		if (!(b9 & BIT(6)) && steam->did_mode_switch) {
> +			steam->did_mode_switch = false;
> +			cancel_delayed_work_sync(&steam->mode_switch);
> +		} else if (!steam->client_opened && (b9 & BIT(6)) && !steam->did_mode_switch) {
> +			steam->did_mode_switch = true;
> +			schedule_delayed_work(&steam->mode_switch, 45 * HZ / 100);
> +		}

This is in theory superfluous per my comment on steam_mode_switch_cb. It also introduces a theoretical bug whereby it won't cancel the work if lizard mode is disabled while Options is held, as per the previous comment.

>  	}
>  
>  	if (!steam->gamepad_mode)

All in all, this patch doesn't actually "fix" anything. It makes an opinionated change about lizard mode toggling, which is probably ok but not actually a "fix" per se, and does some peripheral stuff handling the scheduled work around it that is a minor but not really functional change nor fix. Further, the changes it makes are also incomplete and introduce a minor bug. Ironically, prior to this change it wouldn't even really be considered a bug, but the minor changes introduce semantics about how the work scheduling should be handled that aren't actually respected in the patch itself.

Vicki

