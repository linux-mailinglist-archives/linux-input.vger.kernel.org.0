Return-Path: <linux-input+bounces-13549-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D291CB059F5
	for <lists+linux-input@lfdr.de>; Tue, 15 Jul 2025 14:27:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB4664A40FE
	for <lists+linux-input@lfdr.de>; Tue, 15 Jul 2025 12:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA9D2DC359;
	Tue, 15 Jul 2025 12:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cd30PVfI"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBB1219E8;
	Tue, 15 Jul 2025 12:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752582429; cv=none; b=suwcvznywXgX9fxVI7ZzCveFkXmsywtjDvPKhOJPNR5hykGS7ddYQn6Q3FSEOYCRLarJj5l09KlGKOJngUkaIH7BdL9GI0r8+oo6FktuJaDCNxbeQG5RNmB/prGa9Nfl/+W3ovYWDTSL3liP7iBCFOlqa6Tr/k9cV92rAZaByGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752582429; c=relaxed/simple;
	bh=E9Digcbp9QkNx59WZDLuezaTlEp5gtp+wN8borN97ek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=skj/FwAYKRZUjACkXE7j2ojg5UwomwhE18LnSCuDoielSy6DHlZapTmO+fqxloc89BbqZu3AXIud6TVVZeX9m3ECJaXXzh69eXcGy9XwhDnuK2gRdW+NyCHRj8dYKOsVqSf/7wtc8RGfxrxfwxmC1I0t8hvjPf6HeT+hIZP8TDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cd30PVfI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF02C4CEE3;
	Tue, 15 Jul 2025 12:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752582429;
	bh=E9Digcbp9QkNx59WZDLuezaTlEp5gtp+wN8borN97ek=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Cd30PVfILcYix/MpbWwidYWt6kcd+a15MwK2Q6PiHqta4kBtuHGiKMU1AcgyLbdUn
	 fronVZgvar4sh0b/l38IPhK88+JGhDbQHla6fMd88KR8SsyVtLMRdlFrrLDQ9tGjMo
	 ExjR/uydjzILiDOJ5I4wwKfwraj/6VgAwJA+oi8WIynPQ4SPop4CPZwhJ84NhwUUdR
	 IIirFaVcWxPkOC2GnAFkvJwafFbfnuxiVJOdlSB5bTVgMZRC04jVIhF6cD5wpH5gB1
	 vBKTgpjSmyKpRZhi3tw3oocHqzt15NPZUWc+18p2HBgcdpJGmgCDV2BRJV1EosLMyd
	 r5piNDLz0v1bA==
Message-ID: <e39cf267-0784-4b56-a989-349e84487bbf@kernel.org>
Date: Tue, 15 Jul 2025 14:27:05 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] platform/x86: asus-wmi: map more keys on
 ExpertBook B9
To: Anton Khirnov <anton@khirnov.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones"
 <luke@ljones.dev>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250714150756.21197-1-anton@khirnov.net>
 <20250714150756.21197-3-anton@khirnov.net>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250714150756.21197-3-anton@khirnov.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14-Jul-25 5:07 PM, Anton Khirnov wrote:
> * there is a dedicated "noise cancel" key in top row, between mic mute
>   and PrintScreen; it sends 0xCA when pressed by itself (mapped to F13),
>   0xCB with Fn (mapped to F14)
> * Fn+f sends 0x9D; it is not documented in the manual, but some web
>   search results mention "asus intelligent performance"; mapped to FN_F
> * Fn+space sends 0x5B; it is not documented or mentioned anywhere I
>   could find; mapped to FN_SPACE
> 
> Signed-off-by: Anton Khirnov <anton@khirnov.net>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans



> ---
>  drivers/platform/x86/asus-nb-wmi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index f84c3d03c1de..9d2fd7bc3ce1 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -582,6 +582,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
>  	{ KE_KEY, 0x55, { KEY_CALC } },
>  	{ KE_IGNORE, 0x57, },  /* Battery mode */
>  	{ KE_IGNORE, 0x58, },  /* AC mode */
> +	{ KE_KEY, 0x5B, { KEY_FN_SPACE } },
>  	{ KE_KEY, 0x5C, { KEY_F15 } },  /* Power Gear key */
>  	{ KE_KEY, 0x5D, { KEY_WLAN } }, /* Wireless console Toggle */
>  	{ KE_KEY, 0x5E, { KEY_WLAN } }, /* Wireless console Enable */
> @@ -618,6 +619,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
>  	{ KE_KEY, 0x93, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + TV + DVI */
>  	{ KE_KEY, 0x95, { KEY_MEDIA } },
>  	{ KE_KEY, 0x99, { KEY_PHONE } }, /* Conflicts with fan mode switch */
> +	{ KE_KEY, 0X9D, { KEY_FN_F } },
>  	{ KE_KEY, 0xA0, { KEY_SWITCHVIDEOMODE } }, /* SDSP HDMI only */
>  	{ KE_KEY, 0xA1, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + HDMI */
>  	{ KE_KEY, 0xA2, { KEY_SWITCHVIDEOMODE } }, /* SDSP CRT + HDMI */
> @@ -632,6 +634,8 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
>  	{ KE_IGNORE, 0xC0, }, /* External display connect/disconnect notification */
>  	{ KE_KEY, 0xC4, { KEY_KBDILLUMUP } },
>  	{ KE_KEY, 0xC5, { KEY_KBDILLUMDOWN } },
> +	{ KE_KEY, 0xCA, { KEY_F13 } }, /* Noise cancelling on Expertbook B9 */
> +	{ KE_KEY, 0xCB, { KEY_F14 } }, /* Fn+noise-cancel */
>  	{ KE_IGNORE, 0xC6, },  /* Ambient Light Sensor notification */
>  	{ KE_IGNORE, 0xCF, },	/* AC mode */
>  	{ KE_KEY, 0xFA, { KEY_PROG2 } },           /* Lid flip action */


