Return-Path: <linux-input+bounces-4624-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B591C917512
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2024 01:55:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 712A32816C8
	for <lists+linux-input@lfdr.de>; Tue, 25 Jun 2024 23:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C56917F4FE;
	Tue, 25 Jun 2024 23:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jBnHjDgU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CDC1494DE
	for <linux-input@vger.kernel.org>; Tue, 25 Jun 2024 23:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719359736; cv=none; b=REOPOJ7LbYf4fxjylvoG0NjXLiRA0FQ/qkM32dJ3uuNooMFItpqpCP2h3TNrQMsUAnGzPZWE8zem0pBHFHKaKleh+YuGLS+1DN2oFRJJdbBOwhE96rTKpgYCMp24rLzg83SjVdzLpv/cBx0H0wlB/Uzhg9WcZuRRUHf68wnRz30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719359736; c=relaxed/simple;
	bh=tCUw6OKrI3M9lq8PMs+zef2CfiXsSNbpyDJ0EVh/aGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uvoK4fHJFBGsP7vD8xHcJKxlTT3GlNTNUl1WeeKeTpKnXy2HALswsC3kmjXphJAxK6//uUUBu0IgHjeWF/f9L2Wg3wSd1hvTGCtTAnwRm6VwINd/jFIigbq3QNyuGNDTA8KCh1mkk821RwZYJ3zWJu7oK4MqSxbXhcO2gzlid+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jBnHjDgU; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5c21ba58227so404918eaf.0
        for <linux-input@vger.kernel.org>; Tue, 25 Jun 2024 16:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1719359734; x=1719964534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tR/5LidHEHdLx+7YoIA/m7Q0RMjxvdEYmf3t8jZN9s4=;
        b=jBnHjDgU0H1S99QKR5L1Z8mOGtbOfY76g918BpgNkaM2hEqQgdL58tqZyjTx4NABoq
         qlYkGH2GUyC2Vt3GFsPHoHLjBRrXHjw21UkzHN2f+ICt7HHxYYlxLgrmwrcMZkpAsgoT
         SsCeVpPnv672zykUAa2t7U79Y201q7/xHEIP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719359734; x=1719964534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tR/5LidHEHdLx+7YoIA/m7Q0RMjxvdEYmf3t8jZN9s4=;
        b=Rl7pAhBRus2SpOeMNHf7iMOyQMRTp8Lu2xiK4E1/wj9/MEKp1wa553JXyuiORCrZ7X
         IOw0U4FdxtQndoi4idY+9tuv2ATv6Z42fbtVszhi2WuQr72mpDbxXasfR0Gdhy/rBjnv
         9H2i+U6wblXz1A8Q/mQ14CA4NqpFHaPaQ+gPfcvcMnZKr29pzjWVYc+N8ZnuhsiIuCSP
         Bua8AMY/7QjKMCpAekz3Xz7RfcuvVUy4qX5cnX8CwWXgyl5EufR2vHWPuTtwNZJhdE+X
         RmWUn1vqitIbY7T8YYPVZHaPdTEJc/O43UX7CLd7TOhhRD3jcuRoa3StGOKG6VRjxZNE
         1DLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx34P5CrKfqPc0Je6D3tKv+05v1XP6HAvEo+yQqOKy/a7nJr3M5WcGlwqVLT62S7vadiF9EJV7Yee12m3X0C92qm8ol0Wcl+Z+tEU=
X-Gm-Message-State: AOJu0Yw0ao+rBJbtMdRudr3PnL1g+wdSKVET3JUuBX3vryDkewJuFZIp
	KFhTL4k5LEktPWo6QvC5muC5uZQa+jCSQOxahBBklkCM4HwntKIPvxMk6SLCJQ==
X-Google-Smtp-Source: AGHT+IFWixiWc/Xf7hhEVlmRUjiGlwO3fPZ7mbY+sLjAuI0jQ8hgAooSCb5RK6xs/Dexp/bsn8lOkQ==
X-Received: by 2002:a4a:3508:0:b0:5c1:ae36:14e with SMTP id 006d021491bc7-5c1eed5a523mr9818442eaf.6.1719359733608;
        Tue, 25 Jun 2024 16:55:33 -0700 (PDT)
Received: from google.com (syn-076-186-130-074.res.spectrum.com. [76.186.130.74])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7009c60833csm1736998a34.46.2024.06.25.16.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 16:55:33 -0700 (PDT)
Date: Tue, 25 Jun 2024 18:55:29 -0500
From: Aseda Aboagye <aaboagye@chromium.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>, Jon Xie <jon_xie@pixart.com>,
	Jay Lee <jay_lee@pixart.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn, linux-input@vger.kernel.org,
	Xiaotian Wu <wuxiaotian@loongson.cn>
Subject: Re: [PATCH v2] Input: Add driver for PixArt PS/2 touchpad
Message-ID: <ZntY8UO-VIW3reL4@google.com>
References: <20240624065359.2985060-1-zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624065359.2985060-1-zhoubinbin@loongson.cn>

Hi Binbin,

On Mon, Jun 24, 2024 at 02:53:59PM +0800, Binbin Zhou wrote:
> +
> +static void pixart_reset(struct psmouse *psmouse)
> +{
> +	ps2_command(&psmouse->ps2dev, NULL, PSMOUSE_CMD_RESET_DIS);
> +	msleep(100);
> +	psmouse_reset(psmouse);
> +}

What is the reason for the 100ms delay here? Is it to prepare the
controller for the upcoming reset? If so, could it perhaps be
defined as a macro?

Thanks,

-- 
Aseda Aboagye

