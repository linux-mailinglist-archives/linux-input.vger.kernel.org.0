Return-Path: <linux-input+bounces-16873-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB51D03E4D
	for <lists+linux-input@lfdr.de>; Thu, 08 Jan 2026 16:35:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 83DE630BB0C6
	for <lists+linux-input@lfdr.de>; Thu,  8 Jan 2026 15:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19184410D16;
	Thu,  8 Jan 2026 10:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="usCgKFl5"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46852225402;
	Thu,  8 Jan 2026 10:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767869408; cv=none; b=bI6Ma0deQoifljGM02Kdh9i83reNucAI2m4cqeSqO2OsAe28LwVf+hgeSFJm39QzTk8S9Sx7HWdnFkizStA62ql4vjJSkYcnDz1XGuXisLYIsIQyfDho+V2CTGz1HscIe/NVfNJbm8e04osGJ5s/022KZvHUqMRFJOLbicodlxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767869408; c=relaxed/simple;
	bh=J3iFiBpJ4MgKicn470iJM8chZLbSii7yJkIc1bWG2e0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GK46VZa3kIPdBtmZ1V+F57PVlJy/zUmf7id305vb+hPBqONCwh3VcUO312vHu41QJWV2H3ViT2OK2QH16VujHYJ6if+9HPUi/qtvrIPi277rIw4Bm0yfMLbrWwKpL6TsbhZqsmQVaKdgnONELOeNj5YUB2PD6UB71W08zqBYN6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=usCgKFl5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 746B0C116C6;
	Thu,  8 Jan 2026 10:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767869407;
	bh=J3iFiBpJ4MgKicn470iJM8chZLbSii7yJkIc1bWG2e0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=usCgKFl5kg8zlRJFt2DtLBv5AtWjrBNWxhCbANoXoV0dieV8IAVcmgO4ZSVct4KRu
	 NNBwxgrBeAlXmeAAkUXlojV8lC6pPKuD1XCqkBlkmGxzDbJt8gFRxjBpE2zqZKpxnt
	 CLbET5n7TY+SOpdplLNx+Qw06IMgYQI2zCI9kUlNN+Rei53g6QbK1s/ryJsHEeC8cM
	 UUhuOjm1ZmvJPiaSVnR6DQStVjirvW/UEg+3WRFjcPUPmJ3xqLNu2kpAKubYZOno85
	 U2LTqrlzuQlLJ4olT6oZPXmuH64M9v/Ria2Y+zuaZbWrrrQUKswB5J1D3RZCklQvIK
	 Akv1QTsSxFVoQ==
Date: Thu, 8 Jan 2026 11:50:02 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: Tomasz =?utf-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
Cc: dmitry.torokhov@gmail.com, corbet@lwn.net, jikos@kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	vi@endrift.com, linux-kernel@altimeter.info, peter.hutterer@who-t.net
Subject: Re: [RFC PATCH 4/6] Input: Assign EV_BTN event to HID Joysticks
Message-ID: <2vycv2ka2vnuemvkqh4wnrl6iwdbta5c6wkywpbg3p5oecdecr@n7fjhfjvjwuo>
References: <20260104213132.163904-1-tomasz.pakula.oficjalny@gmail.com>
 <20260104213132.163904-5-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260104213132.163904-5-tomasz.pakula.oficjalny@gmail.com>

On Jan 04 2026, Tomasz Pakuła wrote:
> Joysticks will now fire EV_BTN for every of their buttons, even buttons
> that were previously ignored because they were cut off by KEY_MAX. This
> in turns enables joysticks to finally report buttons above 80 which was
> the previous limitation.
> 
> Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
> ---
>  drivers/hid/hid-input.c | 27 +++++++++++++++++++++------
>  include/linux/input.h   |  2 ++
>  2 files changed, 23 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index 900a6fc9813e..1c11077b1577 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -760,11 +760,15 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
>  		case HID_GD_MOUSE:
>  		case HID_GD_POINTER:  code += BTN_MOUSE; break;
>  		case HID_GD_JOYSTICK:
> -				if (code <= 0xf)
> -					code += BTN_JOYSTICK;
> -				else
> -					code += BTN_TRIGGER_HAPPY - 0x10;
> -				break;
> +			if (input->button_count >= INPUT_MAX_BUTTONS)
> +				goto ignore;
> +
> +			code += BTN_JOYSTICK;
> +			if (code > BTN_DEAD)
> +				code += BTN_TRIGGER_HAPPY - BTN_DEAD - 1;
> +			if (code > KEY_MAX)
> +				code = KEY_RESERVED;
> +			break;
>  		case HID_GD_GAMEPAD:
>  				if (code <= 0xf)
>  					code += BTN_GAMEPAD;
> @@ -1379,7 +1383,6 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
>  	}
>  
>  	set_bit(usage->type, input->evbit);
> -
>  	/*
>  	 * This part is *really* controversial:
>  	 * - HID aims at being generic so we should do our best to export
> @@ -1390,12 +1393,18 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
>  	 *   *_MISC+N to overwrite a legitimate even, which confuses userspace
>  	 *   (for instance ABS_MISC + 7 is ABS_MT_SLOT, which has a different
>  	 *   processing)
> +	 * - Joysticks can have arbitrary number of buttons without defined
> +	 *   usages. Buttons that extend beyond KEY_MAX are assigned to
> +	 *   KEY_RESERVED thus deduplication must be disabled for them.
>  	 *
>  	 * If devices still want to use this (at their own risk), they will
>  	 * have to use the quirk HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE, but
>  	 * the default should be a reliable mapping.
>  	 */
>  	while (usage->code <= max && test_and_set_bit(usage->code, bit)) {
> +		if (field->application == HID_GD_JOYSTICK && usage->code == KEY_RESERVED)
> +			break;
> +
>  		if (device->quirks & HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE) {
>  			usage->code = find_next_zero_bit(bit,
>  							 max + 1,
> @@ -1455,6 +1464,12 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
>  	if (usage->type == EV_KEY) {
>  		set_bit(EV_MSC, input->evbit);
>  		set_bit(MSC_SCAN, input->mscbit);
> +
> +		if (field->application == HID_GD_JOYSTICK &&
> +		    (usage->hid & HID_USAGE_PAGE) == HID_UP_BUTTON) {

Too bad we only set up the button ranges for joysticks, when we could do
this for all HID devices with a button usage page.

It also makes the code hard to follow because we now enable this at the
different place than the other mappings.

Cheers,
Benjamin

> +			set_bit(EV_BTN, input->evbit);
> +			++input->button_count;
> +		}
>  	}
>  
>  	return;
> diff --git a/include/linux/input.h b/include/linux/input.h
> index f6389de4a4d1..7f39c663fa85 100644
> --- a/include/linux/input.h
> +++ b/include/linux/input.h
> @@ -214,6 +214,8 @@ struct input_dev {
>  };
>  #define to_input_dev(d) container_of(d, struct input_dev, dev)
>  
> +#define INPUT_MAX_BUTTONS 2048 /* A sane limit of supported device buttons */
> +
>  /*
>   * Verify that we are in sync with input_device_id mod_devicetable.h #defines
>   */
> -- 
> 2.52.0
> 

