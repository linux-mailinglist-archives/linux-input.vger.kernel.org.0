Return-Path: <linux-input+bounces-4615-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74004916B4D
	for <lists+linux-input@lfdr.de>; Tue, 25 Jun 2024 16:59:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DBAC1F28E11
	for <lists+linux-input@lfdr.de>; Tue, 25 Jun 2024 14:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E0416D4C8;
	Tue, 25 Jun 2024 14:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eOBDizG8"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAA41BC57;
	Tue, 25 Jun 2024 14:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719327566; cv=none; b=HiOgh9xgH00h+p0FRPa45DJ84fQQxEsq67ZoOKUQS01jqV+RLCj6b8ravaoJxltvOe2l7TEBSa4FKlR5+HI2qFMnAIJRpilAojATMqm5kniNkCfDI9C35rpFm4+Euy3AmPy4U+IQRxr1i9cMJEHeoQuGdvVjXNiA4bKycGJjqp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719327566; c=relaxed/simple;
	bh=Eg8R1iqjyRoMVehdH74J8U/eSf94ywvDPAMbnTZuP3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vy26Pry8rrZo5b22DmmtojBenUtIlV1t0FEgKpVp4jLU4Z1jGypMM2YvjqL56I6JIVvwaGJ0lDgCHPXvE3J9dM4RShSN2Yw7pl4IEuJtLxCU+6qCOzyUwZkoa8s9+1NjHCRr07OGrpq/8K6BStfOoDaZeLZD1YHZ0h4DCzT2sJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eOBDizG8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B61C32781;
	Tue, 25 Jun 2024 14:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719327566;
	bh=Eg8R1iqjyRoMVehdH74J8U/eSf94ywvDPAMbnTZuP3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eOBDizG81d+D1I1nw6ssfxKCVm5e96l5A/218gfLvp9liGpAzupfPcUOhbq/kMBuy
	 TcSgVYU8J0TXwW/OM32QfIbHvfeMDEIrRZwEYL5i1foRsuTB1QJWth9ApEwNm9fuOr
	 Q5U36vPYEgP1stG3z3qeWIO443F8CtFlKYDpruodWcRzHTeTYLDm8/Ary0GEMUAmJC
	 kTnR3OjCf9lM3AXEGNl9QZ21hmSMkhenzdZbAUge6yYqz0KWl0J6kh1kD/1KZJKfuP
	 z6FTr7UJRZNfZgLMAYKSQmf+9dVmXo0YhA73/Kwckmfiz1g2Ece556F8bWWcESrlVT
	 g6vG6/A+0ONzg==
Date: Tue, 25 Jun 2024 16:59:22 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: "Luke D. Jones" <luke@ljones.dev>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jikos@kernel.org
Subject: Re: [PATCH] Fixes: bda38f9a41 ("HID: asus: use hid for brightness
 control on keyboard")
Message-ID: <zmmjwgujcmzyiv72rsi2urdvighrf6enj3c4qntaqgbxrae5xw@edypjvordcng>
References: <20240624001450.969059-1-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624001450.969059-1-luke@ljones.dev>

Hi Luke,

On Jun 24 2024, Luke D. Jones wrote:
> - Fix missing braces around initializer
> - Remove unused function declaration from asus-wmi.h
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>

You are missing Reported-by: Mark Brown <broonie@kernel.org> to give
credits where it's due and also a link to the report:
Link: https://lore.kernel.org/all/ZnQ03jc-xEWam2cR@sirena.org.uk/

The subject formatting is also wrong.

> ---
>  include/linux/platform_data/x86/asus-wmi.h | 11 +----------

That's weird. That file shouldn't be touched from us (on the HID side)
without the ack from Hans or the platform x86 people.

And bda38f9a41 ("HID: asus: use hid for brightness...) doesn't have such
an ack.

This got me realize that the initial patch was incorrectly taken through
the hid tree:

in [1] Hans explicitely asked to take the patch through his tree.

So I'm going to drop your patch from the HID tree and ask you to
resubmit the entire patch as a v3 to the platform guys.

Cheers,
Benjamin


[1] https://lore.kernel.org/all/b0d8eebc-5abb-4ec0-898c-af7eedc730d9@redhat.com/

>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 96c780efa0d7..74b32e1d6735 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -162,15 +162,6 @@ static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
>  #endif
>  
>  /* To be used by both hid-asus and asus-wmi to determine which controls kbd_brightness */
> -#if IS_ENABLED(CONFIG_ASUS_WMI)
> -bool asus_use_hid_led(void);
> -#else
> -static inline bool asus_use_hid_led(void)
> -{
> -	return true;
> -}
> -#endif
> -
>  static const struct dmi_system_id asus_use_hid_led_dmi_ids[] = {
>  	{
>  		.matches = {
> @@ -202,7 +193,7 @@ static const struct dmi_system_id asus_use_hid_led_dmi_ids[] = {
>  			DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
>  		},
>  	},
> -	NULL,
> +	{ },
>  };
>  
>  #endif	/* __PLATFORM_DATA_X86_ASUS_WMI_H */
> -- 
> 2.45.2
> 

