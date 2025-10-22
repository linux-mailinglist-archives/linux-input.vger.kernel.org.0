Return-Path: <linux-input+bounces-15652-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0DDBFB9B7
	for <lists+linux-input@lfdr.de>; Wed, 22 Oct 2025 13:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A94A19A8699
	for <lists+linux-input@lfdr.de>; Wed, 22 Oct 2025 11:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2016B3321CA;
	Wed, 22 Oct 2025 11:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ypc+wR8Y"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC3833033F;
	Wed, 22 Oct 2025 11:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761132006; cv=none; b=TS7bKS7JIZBh+v0++eN2r0hUKv/uYI1yMmU3EM2ZDSvOHWfTMwdaE9aLizCscn1fVVxKt/E1AgRXwMLbrVsJKaY3mDLq4S/HkdWVtIEjbTYcvkNCAw7mz7qjtAM/oKbKFTkhf8l5H6C/+xxtUVLXlOZtVrn31tCpp32bDrfd7PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761132006; c=relaxed/simple;
	bh=QFLJzgiwGI0GRfv436TCo2ddy38C0T26XGlyB+Wxf9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VmXaLr1W+I/EgL4bjQDRL6AUQICdKb4/F8Qg+Psg/b4zIkj8R3wxKZaqpSiA30s5clz6HSIh5IIfr6WsYTNQkFhNpYKihBNTnJKimjSCmv2umh3W15OaRK4wiYhOzMVGHINZDEbuib8jkiIhIL91Qtk+QgKanlJF9k8eg66CMsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ypc+wR8Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2062BC4CEE7;
	Wed, 22 Oct 2025 11:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761132005;
	bh=QFLJzgiwGI0GRfv436TCo2ddy38C0T26XGlyB+Wxf9M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ypc+wR8YoZRvqwlPlHoT3IxBLh1iCBpuKIHylTonQtlRUlIGRlja6hSzqSJzPmXlV
	 UTFQer6722hlvTJVHfLit3H4w3Z3dwD/C5dbml6Rz0kOkaZiQFZPpSqbIsOPHXh6o+
	 WDxep+LLgpN208AZEPW4800d4Qpsdy5/JV9aj96bv3lbS+M0a3FSTJxDVDKwU7jm37
	 8BRnT+rWnJQ+I/mdQy7ikz8Ycl7JDKw+9x/ttGdsdi8+0MpeTjOaIFVYHz/KOCsrn2
	 MDEqWMVEExfhKTuP3k8IdGnQk7YfB+McucIDfo47DImLoE8TJ5nVZjcMktwpWbTGAq
	 mT7sBjeI1N/EQ==
Message-ID: <dde1e6eb-34e2-4d71-99b3-c5d8fad4940c@kernel.org>
Date: Wed, 22 Oct 2025 13:20:01 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: atkbd - skip deactivate for HONOR FMB-P's internal
 keyboard
To: Cryolitia PukNgae <cryolitia.pukngae@linux.dev>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@kernel.org, zhanjun@uniontech.com, niecheng1@uniontech.com,
 cryolitia@uniontech.com, Mingcong Bai <jeffbai@aosc.io>,
 Kexy Biscuit <kexybiscuit@aosc.io>, Mikura Kyouka <mikurakyouka@aosc.io>,
 "foad.elkhattabi" <foad.elkhattabi@gmail.com>
References: <20251022-honor-v1-1-ff894ed271a9@linux.dev>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20251022-honor-v1-1-ff894ed271a9@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 22-Oct-25 12:40 PM, Cryolitia PukNgae wrote:
> After commit 9cf6e24c9fbf17e52de9fff07f12be7565ea6d61 ("Input: atkbd -
> do not skip atkbd_deactivate() when skipping ATKBD_CMD_GETID"), HONOR
> FMB-P, aka HONOR MagicBook Pro 14 2025's internal keyboard stops
> working. Adding the atkbd_deactivate_fixup quirk fixes it.
> 
> DMI: HONOR FMB-P/FMB-P-PCB, BIOS 1.13 05/08/2025
> 
> Fixes: 9cf6e24c9fbf17e52de9fff07f12be7565ea6d61 ("Input: atkbd - do not skip atkbd_deactivate() when skipping ATKBD_CMD_GETID")
> Reported-by: Mikura Kyouka <mikurakyouka@aosc.io>
> Link: https://www.xiaohongshu.com/explore/68738d0a0000000012015a79
> Link: https://club.honor.com/cn/thread-29463529-1-1.html
> Link: https://club.honor.com/cn/thread-29490444-1-1.html
> Reported-by: foad.elkhattabi <foad.elkhattabi@gmail.com>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=220384
> Signed-off-by: Cryolitia PukNgae <cryolitia.pukngae@linux.dev>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans



> ---
>  drivers/input/keyboard/atkbd.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
> index 6c999d89ee4b..422e28ad1e8e 100644
> --- a/drivers/input/keyboard/atkbd.c
> +++ b/drivers/input/keyboard/atkbd.c
> @@ -1937,6 +1937,13 @@ static const struct dmi_system_id atkbd_dmi_quirk_table[] __initconst = {
>  		},
>  		.callback = atkbd_deactivate_fixup,
>  	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "HONOR"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "FMB-P"),
> +		},
> +		.callback = atkbd_deactivate_fixup,
> +	},
>  	{ }
>  };
>  
> 
> ---
> base-commit: 552c50713f273b494ac6c77052032a49bc9255e2
> change-id: 20251022-honor-8bc9bef8eba7
> 
> Best regards,


