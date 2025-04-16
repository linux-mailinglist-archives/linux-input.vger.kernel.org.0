Return-Path: <linux-input+bounces-11812-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E85A90D31
	for <lists+linux-input@lfdr.de>; Wed, 16 Apr 2025 22:39:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9F861907AB1
	for <lists+linux-input@lfdr.de>; Wed, 16 Apr 2025 20:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D09422FDE4;
	Wed, 16 Apr 2025 20:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="eDdfM/bw"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C9B149C4D;
	Wed, 16 Apr 2025 20:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744835952; cv=none; b=myJ39YSYgR3s6kzPZD/WOq+3mMc2QoMwn3sLtHw/G56bRWEE9b/ecRmjfpW2ggrmlm2JJn7XWNIDPd7hQRO7EwuretRiLNMx0G2oXQkmIB2btK8dTSqqEWXXDNDEaGrIWOSFnVrsBUoPzYPESLMjNvXxnL22wuKMO2vpm+tgGy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744835952; c=relaxed/simple;
	bh=SQnpKsVTAslP/pVBVHbskA02jCkfIjEfr6bRJYfzzIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fLtoi1EoC2G4x/peDPNq7y8ipyp2WasV0WFdytCzKaTSBWh2PeSOi2+GQKZfxTOfxt3QxG4W2g+jyqO6xoOLX7BXoNBNiHkLfhXJ2ZaEfNRe4drP2fa9OeEvcf/fuvhnFc+o+KjmIEcKTwWRJpKAWL7SAK6deWF5ygYGrLtg/2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=eDdfM/bw; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1744835947; x=1745440747; i=w_armin@gmx.de;
	bh=WfogSFU24b8xe6x+JAzbnFxBkRpVCUwlSaN3Hsz84+I=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=eDdfM/bw1SikXtTIXGjaUvDKQ+8UMajAdG5HpRce52QEj8+cQeJdBnjYzmOSgNVg
	 0twVRzCACr4UoWZWnTXurSha9UQ3RPvitS5dfTYN8oZvU7wfDW1Mbm8KQsNEdw+FW
	 6AINdSWyE/6LJHgjFOnWqjacZfgQM/r4EJ/SysDc3zTiueQoZwjXJxwqjWyUn598T
	 gNgp0AecYavuzF/oMCzwQOcgXQ8bK4jrEidPmptHmpxO0H96Pw1HPIwcQWf1+9lDg
	 EebumW536arOmWdBc1fIlcsCild6eEhXBfG3F2/BHOlMb/ehqQko8VEaxQjhKPZ63
	 FVbPhZ+O4ZLEZ4PY6Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MpUZ4-1uv0cB1jP2-00aOgs; Wed, 16
 Apr 2025 22:39:07 +0200
Message-ID: <7bb43fb5-83dd-4531-b835-77a8e937f54b@gmx.de>
Date: Wed, 16 Apr 2025 22:39:05 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Input: Add a helper for reporting a screen lock key
 sequence
To: Mario Limonciello <superm1@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..."
 <linux-input@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:AMD PMF DRIVER" <platform-driver-x86@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20250407152705.1222469-1-superm1@kernel.org>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250407152705.1222469-1-superm1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eLnQlBHdBnpKae7yqzZe6xkXXaqSh2Mcc+a5NIbrcQ3mJZU3V84
 Kb/Jq1eoT4lmr/LePfVB7R1m6Yx/1XjNRfuWJ+/+r8dBNXLRs2qIxNisuuw5Rh6YI9C57oR
 a0I20+BXPlc4dCGr9zcopnWWYjjH5mxDTXG33ZQEBMMph/sqtB/PZGhpjFUZIkNSKyon9EN
 pWkHYooakq2q1s+bzg0bw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:oqhprfp/pPA=;HKZPWWW97BGpMeR6WpS/AuBs+X3
 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

Am 07.04.25 um 17:27 schrieb Mario Limonciello:

> From: Mario Limonciello <mario.limonciello@amd.com>
>
> In the PC industry KEY_SCREENLOCK isn't used as frequently as it used
> to be. Modern versions of Windows [1], GNOME and KDE support "META" + "L=
"
> to lock the screen. Modern hardware [2] also sends this sequence of
> events for keys with a silkscreen for screen lock.
>
> Introduced a helper input_report_lock_sequence() for drivers to utilize
> if they want to send this sequence.
>
> Link: https://support.microsoft.com/en-us/windows/keyboard-shortcuts-in-=
windows-dcc61a57-8ff0-cffe-9796-cb9706c75eec [1]
> Link: https://www.logitech.com/en-us/shop/p/k860-split-ergonomic.920-009=
166 [2]
> Suggested-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/input/input.c | 20 ++++++++++++++++++++
>   include/linux/input.h |  2 ++
>   2 files changed, 22 insertions(+)
>
> diff --git a/drivers/input/input.c b/drivers/input/input.c
> index ec4346f20efdd..dfeace85c4710 100644
> --- a/drivers/input/input.c
> +++ b/drivers/input/input.c
> @@ -508,6 +508,26 @@ void input_copy_abs(struct input_dev *dst, unsigned=
 int dst_axis,
>   }
>   EXPORT_SYMBOL(input_copy_abs);
>  =20
> +/**
> + * input_report_lock_sequence - Report key combination to lock the scre=
en
> + * @dev: input device
> + *
> + * Key combination used in the PC industry since Windows 7 for locking =
display
> + * is META + L. This is also used in GNOME and KDE by default.
> + * See https://support.microsoft.com/en-us/windows/keyboard-shortcuts-i=
n-windows-dcc61a57-8ff0-cffe-9796-cb9706c75eec
> + */

Hi,

maybe it would make more sense to have the input subsystem transparently t=
ranslate between KEY_SCREENLOCK and this
special screen lock sequence. This way there would be no room for regressi=
ons as people could enable/disable this
behavior via Kconfig.

Thanks,
Armin Wolf

> +void input_report_lock_sequence(struct input_dev *dev)
> +{
> +	input_report_key(dev, KEY_LEFTMETA, 1);
> +	input_report_key(dev, KEY_L, 1);
> +	input_sync(dev);
> +	input_report_key(dev, KEY_L, 0);
> +	input_sync(dev);
> +	input_report_key(dev, KEY_LEFTMETA, 0);
> +	input_sync(dev);
> +}
> +EXPORT_SYMBOL(input_report_lock_sequence);
> +
>   /**
>    * input_grab_device - grabs device for exclusive use
>    * @handle: input handle that wants to own the device
> diff --git a/include/linux/input.h b/include/linux/input.h
> index 7d7cb0593a63e..16f7bef12f1c1 100644
> --- a/include/linux/input.h
> +++ b/include/linux/input.h
> @@ -492,6 +492,8 @@ void input_set_abs_params(struct input_dev *dev, uns=
igned int axis,
>   void input_copy_abs(struct input_dev *dst, unsigned int dst_axis,
>   		    const struct input_dev *src, unsigned int src_axis);
>  =20
> +void input_report_lock_sequence(struct input_dev *dev);
> +
>   #define INPUT_GENERATE_ABS_ACCESSORS(_suffix, _item)			\
>   static inline int input_abs_get_##_suffix(struct input_dev *dev,	\
>   					  unsigned int axis)		\

