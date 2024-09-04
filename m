Return-Path: <linux-input+bounces-6198-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FCA96C734
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 21:11:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9916DB21E67
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 19:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA881E203D;
	Wed,  4 Sep 2024 19:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljdX35dF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE89145359;
	Wed,  4 Sep 2024 19:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725477090; cv=none; b=oc9yRs2jSFawJFheYOc3cGZU+HM4/hhMhU//6uws4iqPYeW4PVn/lpuG/DsmC9ee22MlByPaOwwfvBsISglA3azjrOD1N0sdsRzYOposqRqHcp+miKZJnkAg1BB+yTTFT5vLvrm3Q71MlteyeGWATf5N+5KuC01xAVLU848Frj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725477090; c=relaxed/simple;
	bh=nVLYTFrsYhoX9Wc/A4xr6M0Tbr0ZX9FO5hQ7O560Cik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jgUVGTxY/+Pqpq2cbGCWMWBl72AEGm6Mr0WRO0purM99QPRjREUMnQ9pgQVLYGIv7o6L/fW4HuCqHq5fLuNUXok2PUejwaQHKcQEaHKbea9aJ7oIbmNAbqM74cHQbgD0czkHOGbmVGGh1K1CPE+QpI8LP815f/jl2AVYsS/CEBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljdX35dF; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3780c8d689aso510699f8f.0;
        Wed, 04 Sep 2024 12:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725477087; x=1726081887; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SBMsi2+q9IHReKcHw4p3y5DdZ5ZGAVl8bCzjwOlUetE=;
        b=ljdX35dFfE94lejwQ/eUlMZ3zeZKc9BRkdb/HBgGtFjBRVErINvUteIMu5tYb5cPOo
         msUUIiw31VWTPODEONCKS9C2Tpn2K9h0eXyyGUaVH22cIB/qjg1UMQmvoCVXUjiPMmXI
         7cchZUzhSuxieJgWxGG8y9XCJ8XP6i2HZRpd2CD72DPvFRKULIEJ+2CicT43/MXTNhNG
         BxvmPkeRMvmF54rPEv7z0aTLdB7t1G6F3312b1J8e/HQqHwF+da2Ljs7kcE2BUqm6XX9
         Dpk8AZdGxPbTExMaSI+eWmkggjoWSjcQBd+1/OLB3TbHkU0pM/V80i0FSDgjdgcNYPBk
         sCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725477087; x=1726081887;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SBMsi2+q9IHReKcHw4p3y5DdZ5ZGAVl8bCzjwOlUetE=;
        b=Btcz2OGQxgGvBIS7RtHJRdyERiI6wdF7l3PrBMEIA0AVYElmPfTYdbKoWpE6EEDiFU
         8pKaKq46OoJVaSeK/473tpWeZ5hJCEdKhrJ012Okl/27q4Te1tmNQQJ9o5+4omNTtADV
         JGvRJR6fVP9i3IrOlSn4xs0Ko3w8bPx3mUd0SjnRIaOUttVhG7FhVp4AehvbDD5Cb/Kn
         Jr77VsOnI8ruEFQrV5Qo22RDLvavX4GQSo8frLpgZjT7m1NK64exXeqmYEHg7XY0nlli
         IV103mUzNldcFM805MTvX3rXO6vO6bV3/6DbiCZgAwAbQ/2dN54oPZi4hjV9Z7RjJPhv
         2ARw==
X-Forwarded-Encrypted: i=1; AJvYcCWsUdg03HVAjHupCeDpkOxBzmDVvJRQJQ4Zi4mXmrIHqks/Y+RgBXAwoQhdz7ceIKCU8mEanOSrlj7RNC8+@vger.kernel.org, AJvYcCXId3xWcZKu7tmh6rN068Nzns9PdXsA4lBD7IjVOTx4DvcaVfJJxvOxQtBkUS8n8Bic2pf+qanL8MfH+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBiykAXMJNOqYsEQzU3h1/bsFPnSLbZ6kF3G6mvHNE1nkWmcJv
	hJbCay9OOk3s4zDKoVm2jwl622ujbwnv6RPQSi363tDrQvLUYKFW
X-Google-Smtp-Source: AGHT+IEXUFw4cdk5EqiRmM6kuBn67nQNcBld544mJK5jMzF3VhEkvFRk+S4ZHyyZpMrx/W//ASLcMw==
X-Received: by 2002:a05:6000:4025:b0:374:c287:929b with SMTP id ffacd0b85a97d-376dcc8b852mr4717875f8f.4.1725477087359;
        Wed, 04 Sep 2024 12:11:27 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42baa08d9f9sm237009285e9.32.2024.09.04.12.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 12:11:26 -0700 (PDT)
Message-ID: <eea881a5-d7df-4eb2-a06e-00185670f62e@gmail.com>
Date: Wed, 4 Sep 2024 21:11:25 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/22] Input: ibm-panel - use guard notation when
 acquiring spinlock
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 Ville Syrjala <syrjala@sci.fi>,
 Support Opensource <support.opensource@diasemi.com>,
 Eddie James <eajames@linux.ibm.com>, Andrey Moiseev <o2g.org.ru@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Jeff LaBundy <jeff@labundy.com>,
 linux-kernel@vger.kernel.org,
 Javier Carrasco Cruz <javier.carrasco.cruz@gmail.com>
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
 <20240904044735.1047285-1-dmitry.torokhov@gmail.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20240904044735.1047285-1-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2024 06:47, Dmitry Torokhov wrote:
> Using guard notation makes the code more compact and error handling
> more robust by ensuring that locks are released in all code paths
> when control leaves critical section.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/misc/ibm-panel.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/input/misc/ibm-panel.c b/drivers/input/misc/ibm-panel.c
> index 867ac7aa10d2..aa48f62d7ea0 100644
> --- a/drivers/input/misc/ibm-panel.c
> +++ b/drivers/input/misc/ibm-panel.c
> @@ -77,12 +77,11 @@ static void ibm_panel_process_command(struct ibm_panel *panel)
>  static int ibm_panel_i2c_slave_cb(struct i2c_client *client,
>  				  enum i2c_slave_event event, u8 *val)
>  {
> -	unsigned long flags;
>  	struct ibm_panel *panel = i2c_get_clientdata(client);
>  
>  	dev_dbg(&panel->input->dev, "event: %u data: %02x\n", event, *val);
>  
> -	spin_lock_irqsave(&panel->lock, flags);
> +	guard(spinlock_irqsave)(&panel->lock);
>  
>  	switch (event) {
>  	case I2C_SLAVE_STOP:
> @@ -114,8 +113,6 @@ static int ibm_panel_i2c_slave_cb(struct i2c_client *client,
>  		break;
>  	}
>  
> -	spin_unlock_irqrestore(&panel->lock, flags);
> -
>  	return 0;
>  }
>  

Reviewed-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

