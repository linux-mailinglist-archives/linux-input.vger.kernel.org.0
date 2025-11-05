Return-Path: <linux-input+bounces-15891-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A4EC38181
	for <lists+linux-input@lfdr.de>; Wed, 05 Nov 2025 22:49:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21DD618C7216
	for <lists+linux-input@lfdr.de>; Wed,  5 Nov 2025 21:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95EF2701CC;
	Wed,  5 Nov 2025 21:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JaOVcFOO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EB226738B
	for <linux-input@vger.kernel.org>; Wed,  5 Nov 2025 21:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762379358; cv=none; b=ZjqmE8ktprLyaIJwZbgE+XAsl8t+mEwCKrKK3u2yuIgcSaaFeGO64ryjmwjtH0gdtCKJz01JdFpsXS+PtgHfIuPx+8JBD2SHHHoi6NdFMtvM6Jnqzc6m085NXYgHhxvrR0mZ6doQyRHNfFwMDwhPmrLnDcb+qJ/I4W05zAGWNO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762379358; c=relaxed/simple;
	bh=T3OpidHX2IFHWxcVVbNy5goWv2uX9ql1ENT6uZoLM6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bh69WRKr/T+cBJqmggJmIHj/HB+YLf8ZDSutub9W389BAzLbodjEhfDl5M0jNdGEo+GMUqvx/byVsxvnXNqqZrMRNCh5ybylJ5fb2iQc5XXoZo3fujz/1tweLIrFay78+fDYb3yICWTEyFmDWrHm9IyJlCzuPv7Byd9b9tejazQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JaOVcFOO; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7a59ec9bef4so453888b3a.2
        for <linux-input@vger.kernel.org>; Wed, 05 Nov 2025 13:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762379356; x=1762984156; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YkSXNAZbOjzhQnnQ/OeMxCnZIysKbvh766e3GOcQ37M=;
        b=JaOVcFOO78tJPJnwY5LL1KPH+aO0MvF1DrdvRCsJfRoKYBx7Zq9Z4Fov4OK3mOrASQ
         fE0kieSSNIpz2lyiBLw2KZnK4ybLhGxnKgz90PAvQa+P3oOUhTlKOSc7u2iCuEeXjkrE
         GzmvHcWNhW4Ea0IlFxQeIRJGBLvQOkk97M7aF1kXaYYfobf/qVnF/m5Xbe8ln/Q8V3OH
         un496YrvKcby/Tq7QWPdSmx+eBrG96Ic7Rsuh4tDOPOY7UHtI5qVge+R8rAku+L5mjJY
         O2HWthgHCoG2qOvB8AH5mJJwGPTl1x96wcyQPK6iRiihlGOaBXl2+AzVDXOm18oj+4/l
         wr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762379356; x=1762984156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YkSXNAZbOjzhQnnQ/OeMxCnZIysKbvh766e3GOcQ37M=;
        b=hHRSSJZ5tAQajU13WMhTfA0Gbe3yMWxaqm8tnnZu2PzZCD5BWMf7UCVaHk+/oX81dF
         BqPRyNxKctH6N82L4GkMqtaaaoNWF4YNDsd9RVGc++0d1IINncA/Xrig21EYQyHyeDeD
         e8ZdplYGUUKhrLJyFmpQtIA4ASwcoYfIrRFnx3rr4/qrS5uqYAq/IEw0nirC2zxVsUlB
         QfbVXjmJD2PrrvNkZmIJLGjRC2OxKTESO4r4FWulKu2ox7ecn9CR6capoNqlL+ssCUKP
         EAb6cPhebYjg3iiE2rdtvy8coU7DLIO1kLUHlkuGaaAzJq9nVKaeeVPjZ3rCr3meqWg0
         JSXg==
X-Forwarded-Encrypted: i=1; AJvYcCWgp/wFwaF1NF0iiDYyFjoJhZzi8OIP6ON0+eNzNBPH71cPB0FUMbai83Gf2kU8lnpH5Sxr/DI/q1QsfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWY+acUr8vkK/0N/XOFGTVmSPfjC4+FrbeIhgPb5yp3ldz602w
	3AnToHnoycrm8KyS+leYjOMmrwVYfsfBDxd1gX8AVRK2fByPtMxwDFYJ
X-Gm-Gg: ASbGnct1PAx0J8ECBThu3Qbduz1kIcqpiM1W6nxJAihVGV1ImzdEq6g/O5TLs3gX7E/
	zEDFsPfK0AoQsxzDkx+vOrUptD6HddchBFALrok5s7hAgbjMP4iv/kS55XNK8M6OUWb2OTsL6eP
	uf7zdIs+vNBBYptaGbT/PL2cx1KCpuCOOxV/zOo3UaWZyDdLerbB9UQUJtqF+ZKpGMrKCAAeyGc
	qMrRx2RyBZ/0eYe7mz4T6Q/eg1M3stWAlRyAShrxJUWib8KZuIzJA34gsX1oF2I0qtwfG+K0RyL
	FQVRM/JwnfGJ5wYg75ADoTEbpsTHL3H5zxAV6LogsFs0+GhtRJZU+MoW8oE3Q96SGNmVKhUlj5/
	EXDpq1c49FgKWX5I80rhWkO/4GglnoAPFOWVT1Jnl3L3X2Ei1cfDkJijt5Cf3Iy6PWqD2sVvcBj
	/PVj5BqHP/Ccp73j9UICohkduO4G5PDTBcvzNdVqgiVQ==
X-Google-Smtp-Source: AGHT+IEfxkY2DlYd44idBXTNooK+9iUwvWUJNyG06J8FehkzWiWIPxPnEv5UUZ5iB1IZqawGc7+gAg==
X-Received: by 2002:a05:6a00:1883:b0:7ab:21ca:a3be with SMTP id d2e1a72fcca58-7ae1d153f44mr6218257b3a.12.1762379356504;
        Wed, 05 Nov 2025 13:49:16 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:35dd:7def:e1d1:adfe])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7af7fd5238csm416558b3a.17.2025.11.05.13.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 13:49:16 -0800 (PST)
Date: Wed, 5 Nov 2025 13:49:13 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, linux-input@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v2] Input: cros_ec_keyb - Fix an invalid memory access
Message-ID: <qtqemibhs47cdi3rwboz6rjej7dlopyr4wwnion4nsutk2rpb4@ycb525kmsgmr>
References: <20251104070310.3212712-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104070310.3212712-1-tzungbi@kernel.org>

Hi Tzung-Bi,

On Tue, Nov 04, 2025 at 07:03:10AM +0000, Tzung-Bi Shih wrote:
> If cros_ec_keyb_register_matrix() isn't called (due to
> `buttons_switches_only`) in cros_ec_keyb_probe(), `ckdev->idev` remains
> NULL.  An invalid memory access is observed in cros_ec_keyb_process()
> when receiving an EC_MKBP_EVENT_KEY_MATRIX event in cros_ec_keyb_work()
> in such case.
> 
>   Unable to handle kernel read from unreadable memory at virtual address 0000000000000028
>   ...
>   x3 : 0000000000000000 x2 : 0000000000000000
>   x1 : 0000000000000000 x0 : 0000000000000000
>   Call trace:
>   input_event
>   cros_ec_keyb_work
>   blocking_notifier_call_chain
>   ec_irq_thread
> 
> It's still unknown about why the kernel receives such malformed event,
> in any cases, the kernel shouldn't access `ckdev->idev` and friends if
> the driver doesn't intend to initialize them.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> v2:
> - dev_info() -> dev_warn_once().
> 
> v1: https://lore.kernel.org/chrome-platform/20251104064353.3072727-1-tzungbi@kernel.org
> 
>  drivers/input/keyboard/cros_ec_keyb.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
> index f7209c8ebbcc..324c98b1cb52 100644
> --- a/drivers/input/keyboard/cros_ec_keyb.c
> +++ b/drivers/input/keyboard/cros_ec_keyb.c
> @@ -261,6 +261,11 @@ static int cros_ec_keyb_work(struct notifier_block *nb,
>  	case EC_MKBP_EVENT_KEY_MATRIX:
>  		pm_wakeup_event(ckdev->dev, 0);
>  
> +		if (!ckdev->idev) {
> +			dev_warn_once(ckdev->dev, "No key matrix\n");

Adjusted the message to "Unexpected key matrix event" and applied, thank
you.

-- 
Dmitry

