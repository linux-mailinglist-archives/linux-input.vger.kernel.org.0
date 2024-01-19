Return-Path: <linux-input+bounces-1340-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D701C8325FF
	for <lists+linux-input@lfdr.de>; Fri, 19 Jan 2024 09:55:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E56B28572C
	for <lists+linux-input@lfdr.de>; Fri, 19 Jan 2024 08:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53B41E896;
	Fri, 19 Jan 2024 08:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JG7ZCkvQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B20F1E894
	for <linux-input@vger.kernel.org>; Fri, 19 Jan 2024 08:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705654520; cv=none; b=Hf0Swd/1J4CdL0tuOXqFMCIxpf4vc96uPZOQYCAiO/9p3iPeoNSeUnDqEWX3DqsjBLoYbGIUDf7CEPuJ5Esx0igihelURHL8JoL0/3L9U96yCJFpLAyrkQp9D6hAw1Jbi3DvmkXC57HVYqh39dG1cRY1tDYGzeKHTQ9TJW+eJqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705654520; c=relaxed/simple;
	bh=h4AD1ORubTqXtQwtXrxXxg8TkNoxWsEfZc3Kj+2pc5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TgLiInMtPswcv85Cna4Qk+WhApaAH30MCUE9fuHUfqudEn6B7vGWyZYx/u6WIFmFBA3EK1fNhSHYxLOqlNOPSMCewWqXvC5GLcyf8T9qgJyyalIkqso4jQdW31uGXijSdAFGcgiYXAGEhaCEgSTfbY8VPkXpSVeIb3TOfnXTxDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JG7ZCkvQ; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6d9af1f12d5so493042b3a.3
        for <linux-input@vger.kernel.org>; Fri, 19 Jan 2024 00:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705654518; x=1706259318; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JxMOz80BzlUbWmUD1HQnF3Yz79B2lJiEkSsR4VeOSs0=;
        b=JG7ZCkvQ55bITDzsD5CWYTvUqCaLbdWRLvCi/nXIsNjcW4jYzusabNnrtzdtnuofde
         8kiVU0wixXDWgPDH3Uv6OdFIvSrOMDKpi5rm5Yqpby9zRY4jw7kCi8HSyVeVEm0CLCKl
         CRb5bpsNsMq0SqurKJQuUiaItyzytzz7TXkeyDYILP1tDZ9BBG2YPE49nqWpDXL4mkeu
         +d0N+UquiRDw+dkYbtzE0D+kyZTDXIk3QdWcxHl6XnTFNNvC0BawTG5ZBJXZ7umLArRS
         yNu7EloMBtc3ZYXZod49f/RZdBdl7dl0J+tfUlIScGqoTPVAzjstcDXnc1o4AdrwFtEd
         k4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705654518; x=1706259318;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JxMOz80BzlUbWmUD1HQnF3Yz79B2lJiEkSsR4VeOSs0=;
        b=BqPi9KQ2KuoIohpiCIpCMsZVJ7Bm3Fq+i90VA24jHKdBNyfQromZ8rHwdeR8wZgqPk
         QyExi1XDsXNVbu8oca0jxbQTeqSxrwLyRj6PQjPvBbwAx/goaQtDkLzxwtLM/U58ABuj
         8iP4uZUJtqVObahJbBSoh88kfGQgph/ky3D65W9VrPCymCvZwRbtjBVdvb/zrHaZTVmj
         rnnJjls4ysh/Z2undeq7ntXzYDszkAL4hpa3+84GTulJOi6S6lnmpb4oTWzeUUHHXrZI
         8iBQaOQLsQVz9SzJZjenrzpPxu/Py99UzDunBplRz0U/Xp9owN8yVKeNC0INq6uS0oYD
         7xDQ==
X-Gm-Message-State: AOJu0YzKZGQYI4/AGoNbQU1RYfybznFXcjY5XC59jXMkNrFGIM639KC3
	ZegJ4RedQSWYgd8iZLut3NoU/MNFFPDK0GkkvLkaTieJAeGh48U/
X-Google-Smtp-Source: AGHT+IFmzqp10IJCb3JOj6nwfKlAJueHd8lGrKAgNns8+AEPjPwA5RzXhuBsKex9N/auvR6BG9OBQA==
X-Received: by 2002:a05:6a00:1d8b:b0:6db:c6a6:c99a with SMTP id z11-20020a056a001d8b00b006dbc6a6c99amr72272pfw.8.1705654518600;
        Fri, 19 Jan 2024 00:55:18 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:f04f:73f4:b79:a70c])
        by smtp.gmail.com with ESMTPSA id s34-20020a056a0017a200b006d9b93ca5e2sm4720264pfg.146.2024.01.19.00.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 00:55:18 -0800 (PST)
Date: Fri, 19 Jan 2024 00:55:15 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: goodix - Accept ACPI resources with gpio_count ==
 3 && gpio_int_idx == 0
Message-ID: <Zao482jXoVwFP_iy@google.com>
References: <20231223141650.10679-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231223141650.10679-1-hdegoede@redhat.com>

On Sat, Dec 23, 2023 at 03:16:50PM +0100, Hans de Goede wrote:
> Some devices list 3 Gpio resources in the ACPI resource list for
> the touchscreen:
> 
> 1. GpioInt resource pointing to the GPIO used for the interrupt
> 2. GpioIo resource pointing to the reset GPIO
> 3. GpioIo resource pointing to the GPIO used for the interrupt
> 
> Note how the third extra GpioIo resource really is a duplicate
> of the GpioInt provided info.
> 
> Ignore this extra GPIO, treating this setup the same as gpio_count == 2 &&
> gpio_int_idx == 0 fixes the touchscreen not working on the Thunderbook
> Colossus W803 rugged tablet and likely also on the CyberBook_T116K.
> 
> Reported-by: Maarten van der Schrieck
> Closes: https://gitlab.com/AdyaAdya/goodix-touchscreen-linux-driver/-/issues/22
> Suggested-by: Maarten van der Schrieck
> Tested-by: Maarten van der Schrieck
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

-- 
Dmitry

