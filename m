Return-Path: <linux-input+bounces-10521-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D5EA4DDBE
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 13:21:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D151188E162
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 12:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB3D20299D;
	Tue,  4 Mar 2025 12:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="jX2mLK6j"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E701FF7B3;
	Tue,  4 Mar 2025 12:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741090869; cv=none; b=cqw1+hz9jppkwox0UtqcW6tWG7FaHVlrXPp6VX89cmrCtT9Y0+2hfOnHZYG9IQ4cyEHwUamhLwVhXzr9Jakw7pste8bDzdyJW7bxJTzuyitL38WrV5ba8OO0R0LPBTGaqD43biJKsBdidYA6xvWE0IFOWA3+IWSlsWTxZGjhc8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741090869; c=relaxed/simple;
	bh=uEprj7Yzgmgwe7aYrri3WNyQ6X7vA9xx5S0SDLtU1Eo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ruvwm69AiCcRMZtIpgnoMLDpwWlCimQ8RNPITMVh16Yf92yj0SllsZDxtE4TfCq1LafCc68vhQv91Q3r5leEkZX5G0q4zOYlDgQBCJZmZt9bpKxNGSDY5zpLQKzQTunEbjYG5AxAmItMKY1LChczVpktmKl9BUbhAGJITc965U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=jX2mLK6j; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.116] (pd9e59f4f.dip0.t-ipconnect.de [217.229.159.79])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 1DC5B2FC0048;
	Tue,  4 Mar 2025 13:14:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1741090467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sYDP12qxdvjjIqG0Hhy9mHxxVCe1CtZgL0i4zrmnYaw=;
	b=jX2mLK6jtYJVeVvp7RO24O2Cr/suIAQ+rQWI1p3uM19B303WrXWG1qN8VsZjV69NW9G4k4
	j+DL3D4t89bl1LDG2JpGjSGGxlf0+yP1U5DpMy16ysP48E+KEq2s3OSM7zB/DyA36IVAF7
	4iKldeJ/szXA7W6Szr8+7MPi4ALDX48=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <df09a3f9-6131-435a-ad68-4cea71237e42@tuxedocomputers.com>
Date: Tue, 4 Mar 2025 13:14:26 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Disable touchpad on firmware level while not in use
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250211133950.422232-1-wse@tuxedocomputers.com>
 <20250211133950.422232-2-wse@tuxedocomputers.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20250211133950.422232-2-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Am 11.02.25 um 14:39 schrieb Werner Sembach:
> Using the new on_hid_hw_open and on_hid_hw_close functions to disable the
> touchpad on firmware level while not being in use.
>
> This safes some battery and triggers touchpad-disabled-leds hardwired to
> the touchpads firmware, that exist for example on some TongFang barebones.
>
> For a lengthy discussion with all the details see
> https://gitlab.freedesktop.org/libinput/libinput/-/issues/558

Any comments if this is a good idea or not?

Best regards,

Werner

> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/hid/hid-multitouch.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index 82900857bfd87..7289c04f47f17 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -1884,6 +1884,16 @@ static void mt_remove(struct hid_device *hdev)
>   	hid_hw_stop(hdev);
>   }
>   
> +static void mt_on_hid_hw_open(struct hid_device *hdev)
> +{
> +	mt_set_modes(hdev, HID_LATENCY_NORMAL, TOUCHPAD_REPORT_ALL);
> +}
> +
> +static void mt_on_hid_hw_close(struct hid_device *hdev)
> +{
> +	mt_set_modes(hdev, HID_LATENCY_HIGH, TOUCHPAD_REPORT_NONE);
> +}
> +
>   /*
>    * This list contains only:
>    * - VID/PID of products not working with the default multitouch handling
> @@ -2351,5 +2361,7 @@ static struct hid_driver mt_driver = {
>   	.suspend = pm_ptr(mt_suspend),
>   	.reset_resume = pm_ptr(mt_reset_resume),
>   	.resume = pm_ptr(mt_resume),
> +	.on_hid_hw_open = mt_on_hid_hw_open,
> +	.on_hid_hw_close = mt_on_hid_hw_close,
>   };
>   module_hid_driver(mt_driver);

