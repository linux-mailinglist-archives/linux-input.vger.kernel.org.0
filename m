Return-Path: <linux-input+bounces-15293-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C78CBC1A35
	for <lists+linux-input@lfdr.de>; Tue, 07 Oct 2025 16:06:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 86A8C34F81B
	for <lists+linux-input@lfdr.de>; Tue,  7 Oct 2025 14:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36FDF2DC76B;
	Tue,  7 Oct 2025 14:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gMDDoGEl"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2982D9EF0;
	Tue,  7 Oct 2025 14:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759845973; cv=none; b=QGWpAlUhhuN9s9n2rIgl6l2nsVJaikXXgnMAB1S3S7ogWsuWP8JXGaG0J7MO2nysUqVLQzluPlo2zOSeqzpGbO+syNN9E+MF3CcFAvxS7SoPyAjgvI3QaPCQf3myq0+UAfhjEqVeOtkNadNMTAFq/0tJJCbVaxuZ2LGQv//nAEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759845973; c=relaxed/simple;
	bh=f9/XdWc2gdvf9dcNLZMzDgJHYiw7rNBIO9depuTpaEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l1vaxObTOAu85jXm0njgl8kVJwMmzdrRSD96DH8awHfMZdt5vjt3ibqlEcpCqflbxxqsFcl72HQ5qHD+XOaPlb5APeopZcVpxqRcb6a1M99zzSmdsweL9b6zHk9fFlAh4P5d6OJTrxii42pV4hclJ7z8kB/PbX8iCWOH3I4neUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gMDDoGEl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 640B2C4CEF1;
	Tue,  7 Oct 2025 14:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759845972;
	bh=f9/XdWc2gdvf9dcNLZMzDgJHYiw7rNBIO9depuTpaEg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gMDDoGElph6Dt4IoBa1mTzRis0+FfJqdzfcuq9sSq4fnIF7GmTeZNx3GrGFSEHfVA
	 /pI+vX+cvLWJqVdPSDWvY3mbzKcoBVAFytgCbMoKzSMNu705OdpXaYlDulJRxgO4Kv
	 2XWRDeR0an2l3IraMQAtEeb4P1DU2ZLDenaexG4VViQKAMfJtH3RlKT2f8Eu2kc1pz
	 g+tpOX+uNZkiefDk3EAhSReDqwkxgOc8bcvlS/80AcMytUo3zY8PZWXE58R9+pRuUB
	 ODCQgAoY97GbbzPqzLpl9Bvtpdd5tnAiPsMR9+78A+B/Hw1e9tdeDSdH40T9vVCp9m
	 6tkpOtBso4fTw==
Message-ID: <0596944a-4c34-467c-ba3f-e2bbb10081f1@kernel.org>
Date: Tue, 7 Oct 2025 16:06:08 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] input: goodix: Remove setting of RST pin to input
To: Martyn Welch <martyn.welch@collabora.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: kernel@collabora.com, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251007102305.445515-1-martyn.welch@collabora.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20251007102305.445515-1-martyn.welch@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Martyn,

On 7-Oct-25 12:23, Martyn Welch wrote:
> The reset line is being set to input on non-ACPI devices apparently to
> save power. This isn't being done on ACPI devices as it's been found
> that some ACPI devices don't have a pull-up resistor fitted. This can
> also be the case for non-ACPI devices, resulting in:
> 
> [  941.672207] Goodix-TS 1-0014: Error reading 10 bytes from 0x814e: -110
> [  942.696168] Goodix-TS 1-0014: Error reading 10 bytes from 0x814e: -110
> [  945.832208] Goodix-TS 1-0014: Error reading 10 bytes from 0x814e: -110
> 
> This behaviour appears to have been initially introduced in ec6e1b4082d9.
> This doesn't seem to be based on information in either the GT911 or GT9271
> datasheets cited as sources of information for this change. Thus it seems
> likely that it is based on functionality in the Android driver which it
> also lists. This behaviour may be viable in very specific instances where
> the hardware is known to have a pull-up fitted, but seems unwise in the
> upstream kernel where such hardware requirements can't be guaranteed.
> 
> Remove this over optimisation to improve reliability on non-ACPI
> devices.
> 
> Signed-off-by: Martyn Welch <martyn.welch@collabora.com>

I have no objection against this simplification of the code, but the reset
pin will still be set to input mode when requested after this change,
see the use of gpiod_rst_flags in the driver.

For v2 it would be best to drop gpiod_rst_flags and directly pass
GPIOD_ASIS when requesting the reset pin.

Note for ACPI we want GPIOD_ASIS because there the driver only resets
the chip if it is non-responsive since typically it has already been
reset by the BIOS.

For non ACPI goodix_reset() will immediately call:

	gpiod_direction_output(ts->gpiod_rst, 0)

followed by a msleep(20) so there using GPIOD_ASIS does not matter
as the direction + value will get set immediately after requesting it.

Regards,

Hans



> 
> ---
>  drivers/input/touchscreen/goodix.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> index 252dcae039f8..e7ef744011ad 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -796,17 +796,6 @@ int goodix_reset_no_int_sync(struct goodix_ts_data *ts)
>  
>  	usleep_range(6000, 10000);		/* T4: > 5ms */
>  
> -	/*
> -	 * Put the reset pin back in to input / high-impedance mode to save
> -	 * power. Only do this in the non ACPI case since some ACPI boards
> -	 * don't have a pull-up, so there the reset pin must stay active-high.
> -	 */
> -	if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_GPIO) {
> -		error = gpiod_direction_input(ts->gpiod_rst);
> -		if (error)
> -			goto error;
> -	}
> -
>  	return 0;
>  
>  error:


