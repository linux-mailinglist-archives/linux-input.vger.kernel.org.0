Return-Path: <linux-input+bounces-10689-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3786CA5A385
	for <lists+linux-input@lfdr.de>; Mon, 10 Mar 2025 20:00:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1C8B188E13A
	for <lists+linux-input@lfdr.de>; Mon, 10 Mar 2025 19:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C1D189B80;
	Mon, 10 Mar 2025 19:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TqygWgja"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C3F233725;
	Mon, 10 Mar 2025 19:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741633243; cv=none; b=ISkaSyKcm4ToNqjvlKERgV/sitIAsSldnNvPmV0Qb4Id5Rn1qx6qcfYiammcCeDTkV1yEJair2zS5uWGgVSeLWj1nvEbVKL9EHiyqOJQAMf9qAiRUB6/JU8i5p/d0UUCuaPjWaeb6Ba8bbMzOToFt/IsolTh/uIXCjjruOoaIpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741633243; c=relaxed/simple;
	bh=HZGSZEWfVSEpkWtWI5iKD8y15sM7hRJmZ2tHwKV1azA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UB2+zbDCkE+UXLz6F61JocghEkg0U14jnCh6qSGd3B+4AMjrE3NXQE59ZVoiOUebUkTYEK3tk8AZzro1YVDr4U23qlnGzUYNn4BBfxWA2hjitVTQuGjuhKbw28H/BHxX6+kF1MMlJRzzFByitK6R8a9vKfPRiB7/FxnnkDUuF9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TqygWgja; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-219f8263ae0so87885175ad.0;
        Mon, 10 Mar 2025 12:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741633216; x=1742238016; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FXKPgb8I68UpmbqZ+E/s/6X/BiNlC/l1n4/YvMVkyyk=;
        b=TqygWgja8U91Nn3dl4KYDqCihDyh8+s1XPEPARl5+GOqCMXHUyjiHGuCEBZKuM3qXf
         caQHJkRvUg/CDe8TnzilPDfPVLf8lU2iZOjZn6IdkDEcQkYcEimhOCsRiRGaFWDbda/m
         hkY1IEyngzJoVpg4bQ+uV7kIUcUXyuT3LXpmwQWLKqpAwEa8glLxf6yn7e+800RBTYU9
         HcpEs9Ddl0xoiIzgWuDbw5V0F+WP1j/RubdyGDPmvNDlHNWXpOpPnfwm3kx7BZqErMtA
         bzu+7k9g8EPiFHVI8uAHAYgg7/AENgWi+EqE5mRavvobJGrAeXN3XZ6dNIIdOaR1Xwjf
         c1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741633216; x=1742238016;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FXKPgb8I68UpmbqZ+E/s/6X/BiNlC/l1n4/YvMVkyyk=;
        b=KKqmKCnhZ0CRov+iouOpHSVdnuJREayqW6Lae7MjLNzOdEllHed2txl9leKraFAyp6
         M0a7Yc9Ro2uh+G/M/CPdYMwYI7ggLN19ka/61byb2DVWMNVfU3uJdby2B+6Q+cKhUWxq
         2KeuCAjtEdLoWItBzn8DP+0aRk0GYua+phPvvhvrOpsPLyZjTyMlULjOeLh95GNBSiVK
         +RKwjMUPIgGz3zcCIFhj40juBerQOThD+TAv5ksNnFBv9rcmZUXLZhIOt7tP2m9IaHYn
         rddIKfHlb5k2j0HiVr4x3J3AjScpSDMje8F9Kb6njZ/qtTw/36j/vlvOi6+7tdMivTMg
         gwqg==
X-Forwarded-Encrypted: i=1; AJvYcCWVZ10dBiBjPzXnkqrbWzXmh0TX5iseSgYRKQpJfphi9oVhHv0AO+dw5mc2vQ8ZhYK2RqDRFiZICm7WHHva@vger.kernel.org, AJvYcCWtFcdfTDKU/EN+DQHvk1oQkjbPzivW4O5tQAMv++J+0KRBr4MpD4TKY9ztx/eeFzo79mGg739n5iV4+vQ=@vger.kernel.org, AJvYcCXeepyJX7DO8oopvz9RMgPdEsZF7TcMJ2k9ycppXuZh+gpH1V0f7mNEGwPPIOIVpPwpyokjtvrc+lVivNc=@vger.kernel.org, AJvYcCXh/2EzyyAzUaihigoJTZC4L97lA8qrhK+9osELElyzlSfdo0Pv33llTOzroTJHEUmAKRpDXZ1HmCJ0@vger.kernel.org
X-Gm-Message-State: AOJu0YwQj9KHKO4UuLw9UvGQT4/y58E3oV0BCZESQlchLG9DbBSkbrsa
	Ymq6/bhcNeNIm4aWIn97f+wBJuW98rbu1cySi7OVMxZl0nvnA+6x
X-Gm-Gg: ASbGnctkzprAo6QRUeFcXiniJ9cYcrVQJ1C1aAOKNC7x01YnCPuzFBC6tf1VFR8CjVb
	gMqgpNJZRJJAGzAo84fwhCIvAvQ+MBlQA6GOyFwHTQ+j7WfO62sXGhS55fTbj8L3W4BXk2vX8G8
	It1OIMY0Twhs3mZRMvaY7eRaN44Dtoaxv0cjTzrqk0c52Ka9wsfJUm7bhQ2HjPZbzK9MiutUulX
	2jnLrQvzyDR5tw/GfnX9t6UKnJo7pCJBtb8kX5gFReXm8ZddpudGJfO2mJ8VkVxaXfzrbnYsnGA
	UEUMznvAm3tAp5a6EKTfViq6eJiUbwjkk2hPRB4a5UB+
X-Google-Smtp-Source: AGHT+IG0hv9a8bhKv+2PX14sNt59LoABgcTHmCV8naHoXrUJX6yFcX0PlSBig6zd8w98qbC9yV6/Zw==
X-Received: by 2002:a17:903:2312:b0:223:5e56:a1ce with SMTP id d9443c01a7336-22593183e2bmr12534575ad.32.1741633215699;
        Mon, 10 Mar 2025 12:00:15 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:eb9f:29c2:9ede:46d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410ab45bfsm81954735ad.250.2025.03.10.12.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 12:00:15 -0700 (PDT)
Date: Mon, 10 Mar 2025 12:00:12 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Vincent Huang <vincent.huang@tw.synaptics.com>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, methanal <baclofen@tuta.io>,
	Caleb Connolly <caleb.connolly@linaro.org>
Subject: Re: [PATCH v3 4/7] Input: synaptics-rmi4 - f55: handle zero
 electrode count
Message-ID: <Z882vDOOac0kMKg9@google.com>
References: <20250308-synaptics-rmi4-v3-0-215d3e7289a2@ixit.cz>
 <20250308-synaptics-rmi4-v3-4-215d3e7289a2@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250308-synaptics-rmi4-v3-4-215d3e7289a2@ixit.cz>

On Sat, Mar 08, 2025 at 03:08:40PM +0100, David Heidelberg via B4 Relay wrote:
> From: methanal <baclofen@tuta.io>
> 
> Some third party ICs claim to support f55 but report an electrode count
> of 0. Catch this and bail out early so that we don't confuse the i2c bus
> with 0 sized reads.
> 
> Signed-off-by: methanal <baclofen@tuta.io>
> [simplify code, adjust wording]
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>  drivers/input/rmi4/rmi_f55.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/input/rmi4/rmi_f55.c b/drivers/input/rmi4/rmi_f55.c
> index 488adaca4dd00482cd1106d813b32871092c83a0..ad2ef14ae9f4e897473db43334792cc3de966d52 100644
> --- a/drivers/input/rmi4/rmi_f55.c
> +++ b/drivers/input/rmi4/rmi_f55.c
> @@ -52,6 +52,11 @@ static int rmi_f55_detect(struct rmi_function *fn)
>  
>  	f55->num_rx_electrodes = f55->qry[F55_NUM_RX_OFFSET];
>  	f55->num_tx_electrodes = f55->qry[F55_NUM_TX_OFFSET];
> +	if (!f55->num_rx_electrodes || !f55->num_tx_electrodes) {
> +		rmi_dbg(RMI_DEBUG_FN, &fn->dev,
> +			"F55 query returned no electrodes, giving up\n");
> +		return 0;

0 here means "successfully detected" and will result in F55 probe
succeeding. I expect you want -EINVAL or -ENODEV here.

Thanks.

-- 
Dmitry

