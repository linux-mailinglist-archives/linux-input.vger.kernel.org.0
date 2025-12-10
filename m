Return-Path: <linux-input+bounces-16521-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0799CCB1EB1
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 05:41:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E49B301B2E2
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 04:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E52302156;
	Wed, 10 Dec 2025 04:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3LtonPF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293AF13959D
	for <linux-input@vger.kernel.org>; Wed, 10 Dec 2025 04:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765341659; cv=none; b=fbNMSjNqxwBj0H7UqDrlOhvMhgjDngmBxpjEDq9WbsIC61hao4v7DifIJAmsF8Y9UvFVLEG8NsmwvpVqx5AilOd5THX6V9yxMp03KCCnYTBMMCkFYbdupRB0HZ6wYlERfQBkRlDg+IlAtlTZlohDO4eqU+mXWATHZB71fw/r2Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765341659; c=relaxed/simple;
	bh=UEb+Um//Pm0bjMP+ZKyco+iZ//oYpZeuCk3k7Wl9Llw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h9OGIWNu8nVdS867mkecoqzpKwCVq39HWR4RhKpbU4zmwwCzazyrBv+MGJ45RH8xFdwJUgu202ThDh6t/Xagh4+qUWcAN7BB64wZj8JTHEfF1fp/5SLYaoaGjycQ8eHsI52vgDhATCexZlEGoYt8wTvtJG3JrkCtvNXk6MrZGos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3LtonPF; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-299d40b0845so101766445ad.3
        for <linux-input@vger.kernel.org>; Tue, 09 Dec 2025 20:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765341657; x=1765946457; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uby50kMfOF3sIrvqM4zL9wyiF7T878kqTyY1aG3DrgQ=;
        b=c3LtonPFZn4VpfAw3TSZKfGR3LVIX9gb6u/AKW1yCPq0aeqQzRSQBJKxxUzkvrISJ/
         eF95UmjBlXH3j+R3O06srkbDBaVsCH2bvJM46y4/3K2AhIoCyGYl2+jxTYOdCs60HNmx
         oI+lCXbUWNSGIyCcKWEFCU00gAGWxX7+VzEQPudpDdFXCbe1V2wYdVDS8vT4Ed31kpSZ
         coBjh86F4r20+C5s1zgD2NVI122uHIzpUQNiL3e7rT7hs3zV9BH9XePLGhV4iwtX8aiN
         WxiVyXtqM01HT6/0GUvpqJiZW9C6Mnx2+CIpdQPPw6bNSvsPYqbkZ5/dAc11u0a67ipp
         bKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765341657; x=1765946457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uby50kMfOF3sIrvqM4zL9wyiF7T878kqTyY1aG3DrgQ=;
        b=buFa195Vp0XL+Er1WYgAtUwSOZwZTQg4wtkL16Ef3CYoV1hpxGqEv3/XlMm7uG3pER
         OPhmCrIylAyvgcH2Xk8G/MtvUIyjv9DApF0A4g8Ti1zIFgaQm1Y0txY5o2qy0NGsKwUu
         reH25CcC7N4YRUCIsDlPRy1RSnJlgH9ZItpH3x2hmTGgPK9xmmBhsEInEr5nvc3X7jaf
         saUWQ232nsr0zklG4UYZaEJp/P5JcsIwxsxiqM851pH/oY5xmbi/QiO6P2brWZJIuVlP
         T9KBlYvtnNWpXRcVfGgXnTS5YaMYDfVmobIxOhFcIAhYoCs0w/F/qA866qiDHG6OfB23
         fyfQ==
X-Gm-Message-State: AOJu0YzygMHundUEEiV7RC6qRPaKuhDwPnvP90ndb8M1/M9LIgGVM4d1
	o8bwEZ2PzhEIfN/+KciSA1ePQvs2gAv7Mqr97U6VhVOqA4lrcebUboPX
X-Gm-Gg: ASbGncuo7gSpUf+DpzwqPuoBuxyM1WiiDMDAM23cwlfzafrOOR3NP1S9FTNP7R4IuQ3
	Bo8907OFegS5UflLCwwccXZwpa9XApaiirpv4mbobHnn/qb3YNoWfEep5mVypodKhZegpjuKdyv
	OUCFNoQCbR/SsayseG0qL91wN95Cwo41GuvHpjHnZXu0niO3O8MFV57vE4D8bUvFpcpkhgtUtl+
	RmkPt117QnPxLZPa5Zdl4Jab3kzzijeJpcGSyGHOhtZQKFXuUb1gps0RQoAJ+Frvcv0HyyiZpOJ
	Y44Z2VpOWaH5rUYkrKQ8L7YfgYEcNacHod1foCSxK4D6EIS9VuAF0SyUPxT0ZDIZOPKsJAmzyX5
	4LQ5Y3z/Xo8DEXEW8aWBUeOoPYCaJw3GyIoGHh4s/dmdAiybdXmnDHWg1ZPwDpdmNnYmwSDkMMt
	oI2wvcH7Za4HoxJE1R/NVHtgNbnzfUKl/LHld26sISG6AEJn+xZESG
X-Google-Smtp-Source: AGHT+IENwAUsJ/s7bl0LcpXSQ+18il49/uHtdiDPbHYi/5wurUfmmxGJ90zEdCrpp2ByAgRva1UfOQ==
X-Received: by 2002:a05:7023:b0b:b0:11c:b397:2657 with SMTP id a92af1059eb24-11f2969792bmr895812c88.22.1765341657338;
        Tue, 09 Dec 2025 20:40:57 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:205a:5a0a:c468:f44f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76e2eefsm81337463c88.6.2025.12.09.20.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 20:40:56 -0800 (PST)
Date: Tue, 9 Dec 2025 20:40:54 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Minseong Kim <ii4gsp@gmail.com>, Mike Rapoport <rppt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH] input: synaptics_i2c - cancel delayed work before
 freeing device
Message-ID: <xeski4dr32zbxvupofis5azlq2s6fwtnuya7f3kjfz5t7c2wnq@jbvlajechlrd>
References: <20251210032027.11700-1-ii4gsp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210032027.11700-1-ii4gsp@gmail.com>

Hi Minseong,

On Wed, Dec 10, 2025 at 12:20:27PM +0900, Minseong Kim wrote:
> synaptics_i2c_irq() schedules touch->dwork via mod_delayed_work().
> The delayed work performs I2C transactions and may still be running
> (or get queued) when the device is removed.
> 
> synaptics_i2c_remove() currently frees 'touch' without canceling
> touch->dwork. If removal happens while the work is pending/running,
> the work handler may dereference freed memory, leading to a potential
> use-after-free.
> 
> Cancel the delayed work synchronously before unregistering/freeing
> the device.
> 
> Fixes: eef3e4cab72e Input: add driver for Synaptics I2C touchpad
> Reported-by: Minseong Kim <ii4gsp@gmail.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Minseong Kim <ii4gsp@gmail.com>
> ---
>  drivers/input/mouse/synaptics_i2c.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/input/mouse/synaptics_i2c.c b/drivers/input/mouse/synaptics_i2c.c
> index a0d707e47d93..fe30bf9aea3a 100644
> --- a/drivers/input/mouse/synaptics_i2c.c
> +++ b/drivers/input/mouse/synaptics_i2c.c
> @@ -593,6 +593,8 @@ static void synaptics_i2c_remove(struct i2c_client *client)
>  	if (!polling_req)
>  		free_irq(client->irq, touch);
>  
> +	cancel_delayed_work_sync(&touch->dwork);
> +

The call to cancel_delayed_work_sync() happens in the close() handler
for the device. I see that in resume we restart the polling without
checking if the device is opened, so if we want to fix it we should add
the checks there.

However support for the PXA board using in the device with this touch
controller (eXeda) was removed a while ago. Mike, you're one of the
authors, any objections to simply removing the driver? 

Thanks.

-- 
Dmitry

