Return-Path: <linux-input+bounces-15478-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A5715BD9548
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 14:27:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D46C34FE727
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 12:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707E9313544;
	Tue, 14 Oct 2025 12:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YNCdOogh"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471D32E2EF2;
	Tue, 14 Oct 2025 12:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760444782; cv=none; b=tq14Qt2jLRpzWDaxiuSWEeQA/J1J4MfsFdJRnve4c0vsAJuP6GYzmNJbNryP4rgSYECA8QL0l2OnjqoW9gdkLKCZnNHILvARSCgGWIXEpI41KastKp7ldeoeciiCYtx0gje9ihrabsmhvjJaIDQ6nb6B4JKHOWslAtP1nHVoknk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760444782; c=relaxed/simple;
	bh=WHZIV5dZJ6HZa29LRoER+emkx1GHjsxZxvPTUvyUMgE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sazqO6mH/oTBs4eVbqPsSmM7tFzax/vzZg8VzapY7ZKHtkFFRY4PtPzQ96CDrHWv0Y6MPihsrOp+bEN0S1uknH0e6KO5k1kfCk8X5S8LD0N0iZ3xqXQ7L0saj3mvMmhr+1qfUmt8mnmBKMI1PqTPQdKCH4S/TU6MVpvyWBwRLHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YNCdOogh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34BE4C4CEE7;
	Tue, 14 Oct 2025 12:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760444781;
	bh=WHZIV5dZJ6HZa29LRoER+emkx1GHjsxZxvPTUvyUMgE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YNCdOoghwIkJokiJ7wwCNXgUgdUNYmM1LtMI5wJUWAeyxz6IDyPuvuzVyu5FtnU4/
	 3OnbN44sxhdYaM+jOPRIPA6NCjRYkglr3yE9/hT4OZumQgcxV2wyRG961oGgrMvSaA
	 dY/D3PhnLmAiuJWIWDu2pwKQpt4v8hjzAosTcwUavslt/akeS9uVttve31gB3JJKQv
	 hHbrAGJeK4+ka6cPKD3P2oZRcpy75CSfYmKafN+b3AptLipc7H9oQItrtCLOtBkPSd
	 HKYjzkBbgQ21dSU/PwlJB5+Eu+9A+xG++UKVA56yEgglH5dgl4Y/jK00Ib3Ul24Djk
	 wPX4Zo1YzXffQ==
Date: Tue, 14 Oct 2025 14:26:18 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: huangzaiyang <huangzaiyang@oppo.com>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/hid: Implement a battery status polling mechanism
 for selected input devices.
In-Reply-To: <20250624130836.5743-1-huangzaiyang@oppo.com>
Message-ID: <pp1pr2rn-7so7-orro-60o7-1o29r7n26q24@xreary.bet>
References: <20250624130836.5743-1-huangzaiyang@oppo.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Jun 2025, huangzaiyang wrote:

> Reading battery capacity and status could fail and end up with timeout
> after 5s for some input devices, for example:8BitDo SN30 Pro+ gamepad.
> Implement a battery status polling mechanism for selected input devices,
> set HID_BATTERY_QUIRK_AVOID_QUERY and HID_BATTERY_QUIRK_POLLING_QUERY
> for 8BitDo SN30 Pro+ gamepad.
> to Avoid UI freezing when reading battery capacity/status.

Thanks for the patch (and sorry for the delay, it fell in between cracks 
unfortunately). Minor nits:

> Signed-off-by: huangzaiyang <huangzaiyang@oppo.com>
> ---
>  drivers/hid/hid-input.c | 63 +++++++++++++++++++++++++++++++++++++++++
>  include/linux/hid.h     |  2 ++
>  2 files changed, 65 insertions(+)
> 
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index 9d80635a91eb..b113f5c49d03 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -341,6 +341,7 @@ static enum power_supply_property hidinput_battery_props[] = {
>  #define HID_BATTERY_QUIRK_FEATURE      (1 << 1) /* ask for feature report */
>  #define HID_BATTERY_QUIRK_IGNORE       (1 << 2) /* completely ignore the battery */
>  #define HID_BATTERY_QUIRK_AVOID_QUERY  (1 << 3) /* do not query the battery */
> +#define HID_BATTERY_QUIRK_POLLING_QUERY        (1 << 4) /* polling query the battery */
> 
>  static const struct hid_device_id hid_battery_quirks[] = {
>         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE,
> @@ -390,6 +391,16 @@ static const struct hid_device_id hid_battery_quirks[] = {
>          * set HID_BATTERY_QUIRK_IGNORE for all Elan I2C-HID devices.
>          */
>         { HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, HID_ANY_ID), HID_BATTERY_QUIRK_IGNORE },
> +       /*
> +        * Reading battery capacity and status could fail and end up
> +        * with timeout after 5s for some input devices, for example:
> +        * 8BitDo SN30 Pro+ gamepad.
> +        * set HID_BATTERY_QUIRK_AVOID_QUERY and HID_BATTERY_QUIRK_POLLING_QUERY
> +        * for 8BitDo SN30 Pro+ gamepad.
> +        * to Avoid UI freezing when reading battery capacity/status
> +        */

We are usually not putting such verbose comments here. Describing the 
quirk when defining it is sufficient, and enumerating which devices need 
the quirk in the comment feels superfluous.

> +       { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_8BITDO_SN30_PRO_PLUS),
> +         HID_BATTERY_QUIRK_AVOID_QUERY | HID_BATTERY_QUIRK_POLLING_QUERY },
>         {}
>  };
> 
> @@ -497,6 +508,33 @@ static int hidinput_get_battery_property(struct power_supply *psy,
>         return ret;
>  }
> 
> +/*
> + * hid input device battery polling handler
> + */
> +static void hidinput_battery_polling_handler(struct work_struct *work)
> +{
> +       int value;
> +       struct hid_device *dev = container_of(work, struct hid_device, battery_delayed_work.work);
> +
> +       dev->battery_status = HID_BATTERY_QUERIED;
> +       dev->battery_avoid_query = true;
> +       value = hidinput_query_battery_capacity(dev);
> +       if (value < 0) {
> +               dev->battery_status = HID_BATTERY_UNKNOWN;
> +               hid_err(dev, "cannot get battery capacity from device!\n");
> +       } else {
> +               dev->battery_capacity = value;
> +               dev->battery_avoid_query = false;
> +               dev->battery_status = HID_BATTERY_REPORTED;
> +               hid_err(dev, "get battery capacity from device:%d!\n", value);
> +       }
> +
> +       /*keep polling period same to battery_ratelimit_time*/

This comment doesn't adhere to standard kernel commeting style, please add 
spaces at the beginning and the end.

Could you please resubmit with these small things fixed?

Thanks,

-- 
Jiri Kosina
SUSE Labs


