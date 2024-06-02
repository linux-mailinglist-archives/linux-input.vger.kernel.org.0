Return-Path: <linux-input+bounces-4025-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D748D75BA
	for <lists+linux-input@lfdr.de>; Sun,  2 Jun 2024 15:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6625D1F22ADA
	for <lists+linux-input@lfdr.de>; Sun,  2 Jun 2024 13:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D431E3D387;
	Sun,  2 Jun 2024 13:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D+j5kDaJ"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D26B3D0D1
	for <linux-input@vger.kernel.org>; Sun,  2 Jun 2024 13:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717334908; cv=none; b=L3F2cgZ7v3cvEsQVerJHt3ug27SiS4KOY+gFSkPcRwROvPqOVq3DAXay6oCvuG2npcfO8w9dp4sf6FUKMJDdAZZHW9cvzO7MuIQRtT3TVUJnKO2k5EI7q+Zz42f6VKM17pXEKySDrVUZhnmI9iXxkQGSygpJgUndk1pRnH4qxwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717334908; c=relaxed/simple;
	bh=4WEGq0wnmtmqbryUA1AHkiQ/vM79/+d90mIdL3BCwXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hi2D+wbLleh32+CGLimv68YTWi/zkEQhYgCRsAVYclx2DbbQb1IkvJ9a5YSGnLTuqIJvvPtAMjz7qMTGBIcg9Dxk5HeLSqRJnHMaNRePOHJvN1/DDW8LuJmCnPzbhvscW9V2dokHCxZIUUM3wbBENNHXzg9JcFZJmo8gucjJ9Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D+j5kDaJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717334906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J2ksBBz/iMsKyhAoghBunV+ULI0bAygLRPzhwkwvJZ0=;
	b=D+j5kDaJi5FyvyTDxeLgBqmtoLil+57y0S4+sHqNEcZAERzvbK+aa/3v+9IvWKuykrHK58
	ElO0psH8gsOqKeBP8Vd9L+YNn2xMNCVfFhNLy83/C04Kk22yEq4L6qZILXQKkCoeqYPAwv
	yG+e2Rj514KQqSwWJYwzdtjbz6v08CI=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-EwPrJi3PPqS4i2E7dCFhHw-1; Sun, 02 Jun 2024 09:28:21 -0400
X-MC-Unique: EwPrJi3PPqS4i2E7dCFhHw-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-52b890339d9so1894162e87.2
        for <linux-input@vger.kernel.org>; Sun, 02 Jun 2024 06:28:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717334900; x=1717939700;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J2ksBBz/iMsKyhAoghBunV+ULI0bAygLRPzhwkwvJZ0=;
        b=EIhWJUe8jCD7ZHzPYyCWCU122sMYk8pVddi+C1woZ91JLgIY3fw3FrQsEJzHzHO3kr
         vNu/e+o9P4pE2E7UzUXTrtYbyvQw4A6kzwkzNKTsEBz9S4QcgFkKO4xTXEOCQ99lhDPA
         tJBjf8uMQIclkvdRjzG0cgyOSxAJIXozIsqGibUxS6d8lO0fZw6ui+jzF6aNl6wBiwb2
         XwC1TMWFWpf1ngjcj9fEwsCqidf5OPB1KPYzJ0X88Wu9+wPgKWLEMNacWeLHcCBriLw+
         JfYsWY5NOKmKXmWH2TVIISehwU/STkkQBJ3fP29vqZQMFqLtWr9tCTs9F01xUHq4DuD9
         eInw==
X-Forwarded-Encrypted: i=1; AJvYcCV3bAKgKrc4eWQVy265zNtgScVftiJgS3bLb1Er7ICNTckf9b9guK7r2FT8V8Of7UYprpLFSLYi+8Ov5Iw8tn+XV0Gth3IVvUXP/8A=
X-Gm-Message-State: AOJu0YyEkukG8fy9zIcNuzkaWrsyCJkbn1FXz91PMBQO+GUETe13pIwl
	SaZjHPQg1qAWK398Cyr9EjCURshhIl+mU20KVm1VZA57isyglvnUfhGod5QyLj3IawixoDnMhMD
	LlCz4xTosep+P5+u2kwX17d2Bi/m/dTD4vj4lXxjdbG6foy25GWhx84WvDwo1
X-Received: by 2002:a05:6512:5d0:b0:52a:e529:16bd with SMTP id 2adb3069b0e04-52b896cd4eamr4094232e87.58.1717334899834;
        Sun, 02 Jun 2024 06:28:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/zjsPxbm+iu1zYdjIxDs/ERNL/koIx09TmrudtPXqatg/1AluktejFl2+ZnRY/fYQWyDeMg==
X-Received: by 2002:a05:6512:5d0:b0:52a:e529:16bd with SMTP id 2adb3069b0e04-52b896cd4eamr4094220e87.58.1717334899347;
        Sun, 02 Jun 2024 06:28:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68ba90e185sm193922566b.157.2024.06.02.06.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jun 2024 06:28:18 -0700 (PDT)
Message-ID: <ac97bbf6-0ead-4e0e-8c21-239e78a0cc98@redhat.com>
Date: Sun, 2 Jun 2024 15:28:17 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/7] platform/x86: asus-tf103c-dock: Use 2-argument
 strscpy()
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Jorge Lopez <jorge.lopez2@hp.com>, Li Zetao <lizetao1@huawei.com>,
 Simon Trimmer <simont@opensource.cirrus.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 ibm-acpi-devel@lists.sourceforge.net, linux-input@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones"
 <luke@ljones.dev>, Mark Pearson <markpearson@lenovo.com>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>
References: <20240602090244.1666360-1-andy.shevchenko@gmail.com>
 <20240602090244.1666360-2-andy.shevchenko@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240602090244.1666360-2-andy.shevchenko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/2/24 10:57 AM, Andy Shevchenko wrote:
> Use 2-argument strscpy(), which is not only shorter but also provides
> an additional check that destination buffer is an array.
> 
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Thanks, the entire series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Regards,

Hans




> ---
>  drivers/platform/x86/asus-tf103c-dock.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-tf103c-dock.c b/drivers/platform/x86/asus-tf103c-dock.c
> index 8f0f87637c5f..b441d8ca72d3 100644
> --- a/drivers/platform/x86/asus-tf103c-dock.c
> +++ b/drivers/platform/x86/asus-tf103c-dock.c
> @@ -490,7 +490,7 @@ static void tf103c_dock_enable_touchpad(struct tf103c_dock_data *dock)
>  		return;
>  	}
>  
> -	strscpy(board_info.type, "elan_i2c", I2C_NAME_SIZE);
> +	strscpy(board_info.type, "elan_i2c");
>  	board_info.addr = TF103C_DOCK_TP_ADDR;
>  	board_info.dev_name = TF103C_DOCK_DEV_NAME "-tp";
>  	board_info.irq = dock->tp_irq;
> @@ -795,7 +795,7 @@ static int tf103c_dock_probe(struct i2c_client *client)
>  	 */
>  	dock->ec_client = client;
>  
> -	strscpy(board_info.type, "tf103c-dock-intr", I2C_NAME_SIZE);
> +	strscpy(board_info.type, "tf103c-dock-intr");
>  	board_info.addr = TF103C_DOCK_INTR_ADDR;
>  	board_info.dev_name = TF103C_DOCK_DEV_NAME "-intr";
>  
> @@ -803,7 +803,7 @@ static int tf103c_dock_probe(struct i2c_client *client)
>  	if (IS_ERR(dock->intr_client))
>  		return dev_err_probe(dev, PTR_ERR(dock->intr_client), "creating intr client\n");
>  
> -	strscpy(board_info.type, "tf103c-dock-kbd", I2C_NAME_SIZE);
> +	strscpy(board_info.type, "tf103c-dock-kbd");
>  	board_info.addr = TF103C_DOCK_KBD_ADDR;
>  	board_info.dev_name = TF103C_DOCK_DEV_NAME "-kbd";
>  
> @@ -846,8 +846,8 @@ static int tf103c_dock_probe(struct i2c_client *client)
>  	dock->hid->vendor = 0x0b05;  /* USB_VENDOR_ID_ASUSTEK */
>  	dock->hid->product = 0x0103; /* From TF-103-C */
>  	dock->hid->version = 0x0100; /* 1.0 */
> -	strscpy(dock->hid->name, "Asus TF103C Dock Keyboard", sizeof(dock->hid->name));
> -	strscpy(dock->hid->phys, dev_name(dev), sizeof(dock->hid->phys));
> +	strscpy(dock->hid->name, "Asus TF103C Dock Keyboard");
> +	strscpy(dock->hid->phys, dev_name(dev));
>  
>  	ret = hid_add_device(dock->hid);
>  	if (ret)


