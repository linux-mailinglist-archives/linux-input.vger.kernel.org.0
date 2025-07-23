Return-Path: <linux-input+bounces-13671-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 259FEB0F78D
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 17:58:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BA141C80846
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 15:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E9B1E3DFE;
	Wed, 23 Jul 2025 15:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="FZ61ulp1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226BF3BB48;
	Wed, 23 Jul 2025 15:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753286273; cv=none; b=XxdernSMtSiY+/M7zjz18CMh+s7eeDiCK6Ad+JGBeWu9pBf1B7RGtwBNZmUbp/wElXwt4wpoKmQwtJ+FlNcY+1yL1MI7TRL4IZhQBpqIWJ/71i7Rrfk+AWu++6aYgMd3Gs+lTxftbCCNA28wfedWwiPgcyY2Epf12DiKIPaYckU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753286273; c=relaxed/simple;
	bh=axfy8vvsoLiMCW2rfQhexTDgQwDa4u9NASIoGU6WatE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uAenCE/kNu+5JrT+ruJWfrDx4Ho74X6SnwLg0nG7rfJBEMJoROBuUAlbjpcxTG1IUg9dds/QnyruXVJcV3jpZQUF1agTSy2XUom3QNfnWDuJUg5PH/t/ImSg/djXc/WxqcLPFDKc0WPhrDfepcMncuShVEqI9QgmZPLseIo9plU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=FZ61ulp1; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 473351FB58;
	Wed, 23 Jul 2025 17:57:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1753286261;
	bh=GGQiiaNQmQtWEKfnk1CajfS6xfLXVxvjK3LAkDlRIYk=; h=From:To:Subject;
	b=FZ61ulp1jnxgutiV9XX95ONOAgmWth2DjzsVMeI5l8UsquXm7b4EZTPDC0Z2t0C5Q
	 DDUgSHFCJvzeY0yKqLLimylRUWZyJbqYHyJH8sC8pE8szl4VH4K9AYMSciOL3tI1K6
	 qXoKHib841jhVf4R7rYQoxte3RSmGNCoBwFnitCqMCp4D4RQFj/ialSRm1Hc19jnKY
	 3XiBuMUEY1EP6ir/ESHvoO41LA/9rHDo4jyJrxnP46bjZFlQhccxe1GvB4El4h2A6/
	 mplJvsBtZEs68Haqy1UwfkAwThl7bYkmCgDZrV33F4Hc04r2jILATsQL476xtih0Y9
	 YhWrQQXm6BHEQ==
Date: Wed, 23 Jul 2025 17:57:28 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Joe Hung =?utf-8?B?KOa0qumKmOmZvSk=?= <joe_hung@ilitek.com>
Cc: "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
	"francesco.dolcini@toradex.com" <francesco.dolcini@toradex.com>,
	"emanuele.ghidoli@toradex.com" <emanuele.ghidoli@toradex.com>,
	linux-input <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Luca Hsu =?utf-8?B?KOW+kOWYiemNiik=?= <luca_hsu@ilitek.com>
Subject: Re: [PATCH] input: ilitek_ts_i2c: report key event for palm
Message-ID: <20250723155728.GA61254@francesco-nb>
References: <b372a99d01c14d1690afba4ceedd0936@ilitek.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b372a99d01c14d1690afba4ceedd0936@ilitek.com>

On Mon, Jul 14, 2025 at 09:51:42AM +0000, Joe Hung (洪銘陽) wrote:
> From ec0d80214fee6acc0b38f33ad0b6b487098963bc Mon Sep 17 00:00:00 2001
> From: Joe Hong <joe_hung@ilitek.com>
> Date: Mon, 14 Jul 2025 17:20:11 +0800
> Subject: [PATCH] input: ilitek_ts_i2c: report key event for palm

something wrong on this headers, check your setup

> Add support for reporting user-defined key event while getting palm event.
> 
> Signed-off-by: Joe Hong <joe_hung@ilitek.com>
> ---
>  drivers/input/touchscreen/ilitek_ts_i2c.c | 42 +++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/ilitek_ts_i2c.c b/drivers/input/touchscreen/ilitek_ts_i2c.c
> index 0dd632724a00..fdcb4ab66fbb 100644
> --- a/drivers/input/touchscreen/ilitek_ts_i2c.c
> +++ b/drivers/input/touchscreen/ilitek_ts_i2c.c
> @@ -39,8 +39,13 @@
>  #define ILITEK_TP_I2C_REPORT_ID				0x48
>  
>  #define REPORT_COUNT_ADDRESS				61
> +#define ALGO_MODE_ADDRESS				62
>  #define ILITEK_SUPPORT_MAX_POINT			40
>  
> +static uint palm_key;
> +module_param(palm_key, uint, 0664);
> +MODULE_PARM_DESC(palm_key, "Set palm key code when palm is detected");

I do not think that putting some kind of configuration in a kernel
module param is an option

Francesco


