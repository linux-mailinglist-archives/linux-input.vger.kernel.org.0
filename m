Return-Path: <linux-input+bounces-6702-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EDA985C04
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 14:37:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7C91287388
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 12:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6966185B5E;
	Wed, 25 Sep 2024 11:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hA0rMtdq"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9148D18594A;
	Wed, 25 Sep 2024 11:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727265264; cv=none; b=Gtf6qtj8RI1LtSPgbyqxwjSGkmLV+JoICDqDXhxq7VK307ExhR/JQbM1XE9Zbq6fWZvxsvvYO2Fa6M2vFXpJCbNHCLRM7tSvU9xEf/zE66fFBH1LucESH6Yz2THmzHoRBpHW8oaplbCZ/vCwfpWhebWccfvOQ4Jqil4ITGd5JEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727265264; c=relaxed/simple;
	bh=WPP4f3Ed9xZu5RoXhYOHB/S+JHHFmiBXycaazZ7fSXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N0JCVRUZy7c3LOg2IR3A15iNLGoqW1EkMNV/Bp7SyFmEsiaTdZiEi6454jUM7pc0VHdWcsKdHnI9FW0W4ABieNdoJ+08YkhVRLPb1SmBuvj4vdSSQOIZ25254TQEZhxRHCENVEyQB3zIODxcgBXGh9TDMUCyCZ9Ei/6VQmxqDUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hA0rMtdq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 314F3C4CEC3;
	Wed, 25 Sep 2024 11:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727265264;
	bh=WPP4f3Ed9xZu5RoXhYOHB/S+JHHFmiBXycaazZ7fSXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hA0rMtdqlEbnmqimDLGMQ2WI5UT6eus6Pci3GmDCWZ0XMa8XlZWLEFu33a+p8zwJL
	 nbW6gwTVvz+v21/jPT6RW43bYNlOpvD2YzNDsbrLKIDAToA0wYpvsaCa7KGHCSJTgH
	 tzTTQ0qEz11AnYVWe6iJ98x2j5LK2zbPkzTR4M4SuZewDBQLT+Fj1NGNMzRdULKY4P
	 c3kSFMl7m1+y6mzXXkZIp9L53MC+QyElo7lpR752P6aEGT1th6iM1BjYtncqdAvTJd
	 Xfw//OP6VgMV/Ih4nhVTwmH3jMo4+idmDwjjr47YIp22PQ++jihoYVfzMEFv6VzLdO
	 we+WjDEcOo1PA==
Date: Wed, 25 Sep 2024 13:54:20 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] HID: i2c-hid: introduce re-power-on quirk
Message-ID: <2xb4vqlt2gdrmioyx7tjaw2vfw55pmhvz54q7f2ldrkikzzxge@737bp5ms6gwc>
References: <20240925100303.9112-1-alex.vinarskis@gmail.com>
 <20240925100303.9112-2-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925100303.9112-2-alex.vinarskis@gmail.com>

On Sep 25 2024, Aleksandrs Vinarskis wrote:
> It appears some keyboards from vendor 'QTEC' will not work properly until
> suspend & resume.
> 
> Empirically narrowed down to solution of re-sending power on command
> _after_ initialization was completed before the end of initial probing.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>  drivers/hid/i2c-hid/i2c-hid-core.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index 632eaf9e11a6..087ca2474176 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -50,6 +50,7 @@
>  #define I2C_HID_QUIRK_BAD_INPUT_SIZE		BIT(3)
>  #define I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET	BIT(4)
>  #define I2C_HID_QUIRK_NO_SLEEP_ON_SUSPEND	BIT(5)
> +#define I2C_HID_QUIRK_RE_POWER_ON		BIT(6)
>  
>  /* Command opcodes */
>  #define I2C_HID_OPCODE_RESET			0x01
> @@ -1048,7 +1049,11 @@ static int i2c_hid_core_register_hid(struct i2c_hid *ihid)
>  		return ret;
>  	}
>  
> -	return 0;
> +	/* At least some QTEC devices need this after initialization */
> +	if (ihid->quirks & I2C_HID_QUIRK_RE_POWER_ON)
> +		ret = i2c_hid_set_power(ihid, I2C_HID_PWR_ON);

I'd rather not have this in i2c-hid-core.c, TBH.

We do have a nice split separation of i2c-hid which allows to add vendor
specific i2c-hid-of drivers. We currently have 2 (goodix and elan) and a
third wouldn't be much of an issue.

I'm not really happy of this admittely simple solution in this patch
because:
- what if QTEC "fixes" that behavior in the future?
- what if you actually need to enable/disable regulators like goodix and
  elan do

So to me, a better solution would be to create a i2c-hid-of-qtec.c,
assign a new compatible for this keyboard, and try to fix up the initial
powerup in .power_up in that particular driver. This way, we can extend
the driver for the regulators, and we can also fix this issue while being
sure we do not touch at anything else.

Anyway, glad to see the bringup of the new arm based XPS-13 taking
shape!

Cheers,
Benjamin


> +
> +	return ret;
>  }
>  
>  static int i2c_hid_core_probe_panel_follower(struct i2c_hid *ihid)
> -- 
> 2.43.0
> 

