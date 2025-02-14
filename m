Return-Path: <linux-input+bounces-10056-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7586DA35FDD
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2025 15:07:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C2F57A1F80
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2025 14:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B27B8264A71;
	Fri, 14 Feb 2025 14:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="mv9X1xeH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87579265604;
	Fri, 14 Feb 2025 14:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739542044; cv=none; b=bLc7QmVE/C07aniHT3wqiAMjPv6zXGTPH0fYXedhBRLjoC1/ia3pfUgf6mhtLX7OzqdH+kR1fHZPEXKjMxeuy43UZs2aTD6q4lBUZV5mqhSWdoa9XgNpMkeeLnQt7Lx8E9RpPfIxRgaFxtNt5a2HB2kfgI4GslEtXpEIhytWR/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739542044; c=relaxed/simple;
	bh=qBGbTmxFDry4hLodx8viqkr7hSXg5gs/5jRFHGvVHRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AEZL2vVBp4YO3xCOMxfBmzCaa8mfUi8rsqUULXIOzkQGusTVAwH8uI8W6+yDhDhMkKuHJTowvPxf40K7NQd04ENeKLPB5c/EAvBj/iAbJ1UvcB0/0E5Q3viFdocchGIGpJNyQprT7RWFikp0nSNbXmLpHUbWP0TgPb53y+iQCOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=mv9X1xeH; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.116] (pd9e59260.dip0.t-ipconnect.de [217.229.146.96])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 3C4C32FC0061;
	Fri, 14 Feb 2025 15:07:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1739542038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OJTWuIHY44NBI7aj5CMpyUXofz7/LAy5BKfQL5cWm+Y=;
	b=mv9X1xeHky7cqxaCE1N2PmBEuJkUhHkK+f6xJ6yNekz3YQuzUJK2Xuf5IFo+WfRDONkvHm
	eRkQsSNw4vZzJqSiuzTqshxaNt+DS/Yc5vRtXt6JQ+7ensivIVHXNrV2UPg2tUsV1ypDNc
	vRTOAACbk1eOyD7dt6TjL8rB7qx6S7k=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <40020511-1bd6-476a-94a2-ac77a9972aaa@tuxedocomputers.com>
Date: Fri, 14 Feb 2025 15:07:17 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] Input: i8042: Swap old quirk combination with new
 quirk for severl devices
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250213160832.74484-1-wse@tuxedocomputers.com>
 <20250213160832.74484-3-wse@tuxedocomputers.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20250213160832.74484-3-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Oops typo in the header line, should I resend it?

Am 13.02.25 um 16:47 schrieb Werner Sembach:
> Some older Clevo barebones have problems like no or laggy keyboard after
> resume or boot which can be fixed with the SERIO_QUIRK_FORCENORESTORE
> quirk.
>
> While the old quirk combination did not show negative effects on these
> devices specifically, the new quirk works just as well and seems more
> stable in general.
>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/input/serio/i8042-acpipnpio.h | 40 ++++++++++-----------------
>   1 file changed, 14 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i8042-acpipnpio.h
> index a0a99f06c6685..d4ff34d36b42c 100644
> --- a/drivers/input/serio/i8042-acpipnpio.h
> +++ b/drivers/input/serio/i8042-acpipnpio.h
> @@ -1080,16 +1080,14 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
>   			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
>   			DMI_MATCH(DMI_BOARD_NAME, "AURA1501"),
>   		},
> -		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
> -					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
> +		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
>   	},
>   	{
>   		.matches = {
>   			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
>   			DMI_MATCH(DMI_BOARD_NAME, "EDUBOOK1502"),
>   		},
> -		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
> -					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
> +		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
>   	},
>   	{
>   		/* Mivvy M310 */
> @@ -1171,8 +1169,7 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
>   		.matches = {
>   			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
>   		},
> -		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
> -					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
> +		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
>   	},
>   	{
>   		.matches = {
> @@ -1205,8 +1202,7 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
>   		.matches = {
>   			DMI_MATCH(DMI_BOARD_NAME, "NH5xAx"),
>   		},
> -		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
> -					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
> +		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
>   	},
>   	{
>   		/*
> @@ -1225,8 +1221,7 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
>   		.matches = {
>   			DMI_MATCH(DMI_BOARD_NAME, "NL5xRU"),
>   		},
> -		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
> -					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
> +		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
>   	},
>   	/*
>   	 * At least one modern Clevo barebone has the touchpad connected both
> @@ -1242,17 +1237,15 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
>   		.matches = {
>   			DMI_MATCH(DMI_BOARD_NAME, "NS50MU"),
>   		},
> -		.driver_data = (void *)(SERIO_QUIRK_NOAUX | SERIO_QUIRK_NOMUX |
> -					SERIO_QUIRK_RESET_ALWAYS | SERIO_QUIRK_NOLOOP |
> -					SERIO_QUIRK_NOPNP)
> +		.driver_data = (void *)(SERIO_QUIRK_NOAUX |
> +					SERIO_QUIRK_FORCENORESTORE)
>   	},
>   	{
>   		.matches = {
>   			DMI_MATCH(DMI_BOARD_NAME, "NS50_70MU"),
>   		},
> -		.driver_data = (void *)(SERIO_QUIRK_NOAUX | SERIO_QUIRK_NOMUX |
> -					SERIO_QUIRK_RESET_ALWAYS | SERIO_QUIRK_NOLOOP |
> -					SERIO_QUIRK_NOPNP)
> +		.driver_data = (void *)(SERIO_QUIRK_NOAUX |
> +					SERIO_QUIRK_FORCENORESTORE)
>   	},
>   	{
>   		.matches = {
> @@ -1326,8 +1319,7 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
>   		.matches = {
>   			DMI_MATCH(DMI_PRODUCT_NAME, "P65_67RS"),
>   		},
> -		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
> -					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
> +		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
>   	},
>   	{
>   		/*
> @@ -1345,8 +1337,7 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
>   		.matches = {
>   			DMI_MATCH(DMI_BOARD_NAME, "PB50_70DFx,DDx"),
>   		},
> -		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
> -					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
> +		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
>   	},
>   	{
>   		.matches = {
> @@ -1370,8 +1361,7 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
>   		.matches = {
>   			DMI_MATCH(DMI_BOARD_NAME, "PCX0DX"),
>   		},
> -		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
> -					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
> +		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
>   	},
>   	/* See comment on TUXEDO InfinityBook S17 Gen6 / Clevo NS70MU above */
>   	{
> @@ -1384,15 +1374,13 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
>   		.matches = {
>   			DMI_MATCH(DMI_BOARD_NAME, "X170SM"),
>   		},
> -		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
> -					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
> +		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
>   	},
>   	{
>   		.matches = {
>   			DMI_MATCH(DMI_BOARD_NAME, "X170KM-G"),
>   		},
> -		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
> -					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
> +		.driver_data = (void *)(SERIO_QUIRK_FORCENORESTORE)
>   	},
>   	{
>   		/*

