Return-Path: <linux-input+bounces-11930-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A555A974A9
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 20:50:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 563E4178B97
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 18:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59F0B2980BC;
	Tue, 22 Apr 2025 18:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="BceQbUt0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049F6A59;
	Tue, 22 Apr 2025 18:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745347833; cv=none; b=q5jjhb2iKsKLZKTFxSzeEru3ncN2jXYKJ2fP3h7hQG9qa8VWZAQdH/znPZo+yElNN3l2x2FqD0D9SqcNe6nDVZ7DYDtM5M4KsTjc8rVP3txVi5chRACaSotM3QS1k+GGKYAnl6rjFQtJiGHGbbhLouQwC/m5i3G+mQSvEh4IQ3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745347833; c=relaxed/simple;
	bh=zKlzKZjbOdQRPRKOnfbxNUKBPSaOUIqoTGBUYjltnnY=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=m0n3wmr3k2pIdNTW0bCQyahmKggbkyx1RLHvmJyiORqRzIIRAkqQxcjoAh6bNQkzzSVFYMKA42wRz6aBsQ3n4Gb2neClBTZBcFV3zBZgoP7RHVBV4X0D5p8d+WHu/I7alF84kHFuZxtfK8HICIolGy0/vamnHhKG0H+GqhxofIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=BceQbUt0; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=Rrkv3xlDH9Gfv6Gfacf5pb0yxXpnGBOffjrig/Aszjo=; b=BceQbUt0v4Lq11cPL/ZdGnBuJ8
	8CefPezSS+1jeZ+WpkGGj3E8K1kzpwzEvEy4I70aKswBlSThDJTEJpmxIY/IJQvm2cVI5HWQRSy2b
	xP06hZYsVfH/LxmL8HeZTNFYYVjhpv4pSvgM/v/n70W977RQlnglObFvA2lkuJCdk9DI=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:47600 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1u7IhP-0003B5-9K; Tue, 22 Apr 2025 14:50:27 -0400
Date: Tue, 22 Apr 2025 14:50:26 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Maximilian Weigand <mweigand@mweigand.net>,
 Alistair Francis <alistair@alistair23.me>, Mikael Gonella-Bolduc
 <mgonellabolduc@dimonoff.com>, stable@vger.kernel.org, Hugo Villeneuve
 <hvilleneuve@dimonoff.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <20250422145026.517153d645441bc5f51eae93@hugovil.com>
In-Reply-To: <20250422184324.3181215-1-hugo@hugovil.com>
References: <20250422184324.3181215-1-hugo@hugovil.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	*  0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
	*      blocklist
	*      [URIs: hugovil.com]
	*  0.1 URIBL_CSS Contains an URL's NS IP listed in the Spamhaus CSS
	*      blocklist
	*      [URIs: hugovil.com]
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -2.3 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH] Input: cyttsp5 - fix power control issue on wakeup
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

On Tue, 22 Apr 2025 14:43:24 -0400
Hugo Villeneuve <hugo@hugovil.com> wrote:

> From: Mikael Gonella-Bolduc <mgonellabolduc@dimonoff.com>
> 
> The power control function ignores the "on" argument when setting the
> report ID, and thus is always sending HID_POWER_SLEEP. This causes a
> problem when trying to wakeup.
> 
> Fix by sending the state variable, which contains the proper HID_POWER_ON or
> HID_POWER_SLEEP based on the "on" argument.
> 
> Fixes: 3c98b8dbdced ("Input: cyttsp5 - implement proper sleep and wakeup procedures")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>

I inadvertently removed Mikael SOB tag, I can re-add it if a V2 is
needed.

Hugo.


> ---
>  drivers/input/touchscreen/cyttsp5.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/cyttsp5.c b/drivers/input/touchscreen/cyttsp5.c
> index eafe5a9b89648..86edcacb4ab3e 100644
> --- a/drivers/input/touchscreen/cyttsp5.c
> +++ b/drivers/input/touchscreen/cyttsp5.c
> @@ -580,7 +580,7 @@ static int cyttsp5_power_control(struct cyttsp5 *ts, bool on)
>  	int rc;
>  
>  	SET_CMD_REPORT_TYPE(cmd[0], 0);
> -	SET_CMD_REPORT_ID(cmd[0], HID_POWER_SLEEP);
> +	SET_CMD_REPORT_ID(cmd[0], state);
>  	SET_CMD_OPCODE(cmd[1], HID_CMD_SET_POWER);
>  
>  	rc = cyttsp5_write(ts, HID_COMMAND_REG, cmd, sizeof(cmd));
> 
> base-commit: 7adf8b1afc14832de099f9e178f08f91dc0dd6d0
> -- 
> 2.39.5
> 
> 


-- 
Hugo Villeneuve

