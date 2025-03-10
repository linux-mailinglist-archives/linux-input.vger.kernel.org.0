Return-Path: <linux-input+bounces-10691-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B5BA5A3A9
	for <lists+linux-input@lfdr.de>; Mon, 10 Mar 2025 20:10:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C3EB3AD499
	for <lists+linux-input@lfdr.de>; Mon, 10 Mar 2025 19:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF450233725;
	Mon, 10 Mar 2025 19:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rb+yyCzH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450331B395F;
	Mon, 10 Mar 2025 19:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741633836; cv=none; b=WhF0u4VrOPS36ML8SQcB8pnptOkqSTcsL3WcUuEDyvtmFx3e+vPdXhSIxdc3gx0hGnyB5utEDKsys1pSBZbXFCiZ+y/1QTVd74U7Ge4dkFfQ5k1Q90IK6EHQejaP82p/WJ4IVU9PaCd2WgdLN921PNtQm+BRBkBBuwFcgbEmtR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741633836; c=relaxed/simple;
	bh=DBk/kZBw0odYTdZthQM7f2aDIlRMFe9FamwtssJayB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fx164fKQTnHaIFiL/93ST1dH7X9s13exHHhnBeHNmZHoLGxM6B2tss4BEsdBNV7uO9SkGiGK8iNZ6LSumjfXM+Uhik+qQ1f6+JryMmui9FinfYr8FCltHzWF+6rUBe20dV0q67W49d3tv9/XFWn1Cqe5qD0nx5H5P+FfTn9C/Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rb+yyCzH; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-223a7065ff8so11982505ad.0;
        Mon, 10 Mar 2025 12:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741633834; x=1742238634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XVWN+SFTID99BmAbNFLYqw3ORI4z7v5WGf9g0A9wLJw=;
        b=Rb+yyCzHbPxaOzvubMG+ViGn8njRjEFb/eXPONhysL0JJhvc33aA56Xb8vH8IdPweh
         h45AxbJDi+Dbmp25U04d9c+3CipJ8xxemJV0opiKmN1TZGcZomFyeBQTnJdHkldA+M3i
         kMEr2D0L4efBt5syW8joUBCCkxvZaSApXrTOl2pIJRS0Yt3kuNSMCuSEUYtMKVlhw3Yx
         Z+BrMcNHS+zXJ/RX1peoEFQKdovWw3A875n88ftrtj6+aQZkFXRLMfKth6pSFH5ClASM
         qiZzvnG0SmcUSOUX4MVdPBvR7PL4lWHXRqtctx4YfDKo/ks++TgSsZd3tO2YosVlizR9
         SMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741633834; x=1742238634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVWN+SFTID99BmAbNFLYqw3ORI4z7v5WGf9g0A9wLJw=;
        b=o5l2/kv08KgpphIeGuMinKpMG6CkcFJzPxy5EPSpbGpuN4wgx0GeY3UgrQyl28Vg1f
         ICchNquyAB+Kf4tJ5jecoe0ssRCg1YKenQyQkxR6axM9k47y3eziIsvfq/2rWoEBO3jS
         2fl8MzHBjzTJFMDfPt2qwuOBJ8rMh/Vi6JXJi12EbBYkjUE2LwENS03zf1Aa7GrxNFz7
         dRi92xTp3Bz6RzrFtkAvxVQYJ22mjIrBXKWkjI4bPFrj1XcTZsXJrH4+8TNzTeGYGNjc
         BwLmNDLQsb3jm1aC640+vK85JuRKe+2dK+QSgo0C2ThWMZ0/LN+5dK4hBcaHO+wvxn7X
         3JWA==
X-Forwarded-Encrypted: i=1; AJvYcCXLldzWyj1AvtAeD10VD5UAwko/HksmTBS0PuCqyXk2ib74d/0s8iJQa8N78cu2Rw0rAZc2ji/WkvqDrSE=@vger.kernel.org, AJvYcCXNublnxkfHsL5VlLK9i4jlk2mPF03UJL0/xqu+WHfkfrbifhMzzEtQP+dHqqpaO3YVBHRcCoYMm3xYMSM=@vger.kernel.org, AJvYcCXk7y7TkRj9ur1rYL6phMWJvYs5rSOvorGeiWDwUjWNPLIEhswtLARfr6HQlldcO1rkg07gW/FaPrPl@vger.kernel.org, AJvYcCXkIphTHp1+3Uwb9k1rjQRCiBp6qeR5xN31Yidt7Lc0992ECEHzjXF654BzjbaDpnr5ieES19TZxiWEb8YE@vger.kernel.org
X-Gm-Message-State: AOJu0YxeBXkfZ7dADNiFNJAPpwjLoaJzK4wMOAOA7Zv1AUAP80HZdrlv
	qEq8mDcECp4jHwp55k/jJQJnf+0NparZGVmvnaKy7FLaBh0msknU
X-Gm-Gg: ASbGncvKHXCGfX/BUJxQ8s0w986h4T8Beouy9teMwEKea/waqKY+Rfnnnvv0+RU8EBk
	fNf6sJwFzMm/EwDqdhiWy9WEvbwqENrwu1xVAV0DKgSjK6ejFL7xBzsBkudJdFAGLH971Dvor5j
	xBhwA/cmk1jQ9MwHFotYss0yCNz+PiehZepuRFshzXox7ZHyD3yoA9PONXqqoNRGJEov0cLbRPA
	rHal/V7klcqGn1sv0cv8/fZvj/uJrjyOC8hj/f66LrwsiqWrJs1xZc0vxrOrAnT8+nO+mZmtLGv
	XO+XxuSrNyk67BFqI/CWSiIQcfH8cWfTTjAnFm1ztFfo
X-Google-Smtp-Source: AGHT+IF+ZrgtiTtPoBLyTJnqVUSquMP/+lN5Pwz5HSsKTThsvLoBcjrUzpd566OoTHqNysD54SmIxg==
X-Received: by 2002:a05:6a00:190a:b0:736:31cf:2590 with SMTP id d2e1a72fcca58-736aaaad27fmr21102717b3a.16.1741633834473;
        Mon, 10 Mar 2025 12:10:34 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:eb9f:29c2:9ede:46d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af28c0339cesm6841209a12.46.2025.03.10.12.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 12:10:34 -0700 (PDT)
Date: Mon, 10 Mar 2025 12:10:31 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Vincent Huang <vincent.huang@tw.synaptics.com>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Caleb Connolly <caleb.connolly@linaro.org>,
	methanal <baclofen@tuta.io>
Subject: Re: [PATCH v3 2/7] Input: synaptics-rmi4 - handle duplicate/unknown
 PDT entries
Message-ID: <Z885Jw0K6d2h_2pl@google.com>
References: <20250308-synaptics-rmi4-v3-0-215d3e7289a2@ixit.cz>
 <20250308-synaptics-rmi4-v3-2-215d3e7289a2@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250308-synaptics-rmi4-v3-2-215d3e7289a2@ixit.cz>

Hi David,

On Sat, Mar 08, 2025 at 03:08:38PM +0100, David Heidelberg via B4 Relay wrote:
> From: Caleb Connolly <caleb.connolly@linaro.org>
> 
> Some third party rmi4-compatible ICs don't expose their PDT entries
> very well. Add a few checks to skip duplicate entries as well as entries
> for unsupported functions.
> 
> This is required to support some phones with third party displays.
> 
> Validated on a stock OnePlus 6T (original parts):
> manufacturer: Synaptics, product: S3706B, fw id: 2852315
> 
> Co-developed-by: methanal <baclofen@tuta.io>
> Signed-off-by: methanal <baclofen@tuta.io>
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/input/rmi4/rmi_driver.c | 47 +++++++++++++++++++++++++++++++++++------
>  drivers/input/rmi4/rmi_driver.h |  6 ++++++
>  2 files changed, 47 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/input/rmi4/rmi_driver.c b/drivers/input/rmi4/rmi_driver.c
> index 2168b6cd7167334d44553c9c566f870a4e034179..51c23a407b2731d5b6eaefe9cae6288f97316e34 100644
> --- a/drivers/input/rmi4/rmi_driver.c
> +++ b/drivers/input/rmi4/rmi_driver.c
> @@ -493,12 +493,44 @@ static void rmi_driver_copy_pdt_to_fd(const struct pdt_entry *pdt,
>  	fd->function_version = pdt->function_version;
>  }
>  
> +static bool rmi_pdt_entry_is_valid(struct rmi_device *rmi_dev,
> +				   struct pdt_scan_state *state, u8 fn)
> +{
> +	unsigned int i;
> +
> +	switch (fn) {
> +	case 0x01:
> +	case 0x03:
> +	case 0x11:
> +	case 0x12:
> +	case 0x30:
> +	case 0x34:
> +	case 0x3a:
> +	case 0x54:
> +	case 0x55:

This mean that we need to update this code any time there is new
function introduced. I'd rather we did not do that. The driver should be
able to handle unknown functions.

> +		break;
> +
> +	default:
> +		rmi_dbg(RMI_DEBUG_CORE, &rmi_dev->dev,
> +			"PDT has unknown function number %#02x\n", fn);
> +		return false;
> +	}
> +
> +	for (i = 0; i < state->pdt_count; i++) {
> +		if (state->pdts[i] == fn)
> +			return false;
> +	}
> +
> +	state->pdts[state->pdt_count++] = fn;

Duplicate detection could be handled thorough a bitmap.

Thanks.

-- 
Dmitry

