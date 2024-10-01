Return-Path: <linux-input+bounces-6976-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CE198C0EF
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 16:59:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 082661F22C58
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 14:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 490B21C8FC1;
	Tue,  1 Oct 2024 14:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RIV3pJIJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40851C7B64;
	Tue,  1 Oct 2024 14:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727794771; cv=none; b=saxECyo1h6qAZ1HV8FVGwwdU+TRu7h+iEXdDUkCTjo33I5mbbhgqAyeajIi2CermutgkoHjz+ZJH7TMIuecBkLRRtmtyf6L7s7KLNW68RiHq6pAw8yhAaYBi9zOZ302C3tnnjyLZeoWaQIlt0lsQ7eHJqfU6srlBpJ3aad9H/6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727794771; c=relaxed/simple;
	bh=oX+ZoVYR1UZ3QIYpImxL6FfA9F7kvzaFziIrP/eyB3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UI+ke0uSopjVgT1KP8uLnclQghCjWm6lHO0CTQpx5rnMkndTmgWlhXs+Y3m9mtA92bLh6M8cq5JwoTxVu650AnIWoWmiRgJxCXi0SxC5xWe99zTG3SllsB9okDMocveK5x681k2QL1km0wCHIp8+18dvuwuDfl482d0dAUa/fso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RIV3pJIJ; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7198cb6bb02so4172774b3a.3;
        Tue, 01 Oct 2024 07:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727794769; x=1728399569; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o5l0E+4hxhFOsv13SPLc7kqgr9gH7QPF5GIhtAbQx9U=;
        b=RIV3pJIJfWqR4Rg5OPqy46CZBnK0MmSVGZJK2SA8P0URVZgw3q0FD+Z4D3/EtuACyn
         UHMkppcrvL1c6hdb4w+3/GJJHO63yDNprJqFDTE0m5irYYAmWMbJ8xK2aIqepNqy7DX4
         bnyyy18RyhXXZqnjVd4K8qQUPZLiZ3AXpnOFXpmiNCXL3+4U6TR47euA+6M+Z9L8xzlh
         V5krvnEd+iworUr0vSdZ4ErdiB+lor3fLVO6R1Hy25j+ajK8AWXo3iNI/kw1xRiSfSLp
         Zcoj4cBQqDeCJVgFIslzjMleWWYKeZYAhudHrtakOarjHMNWeX8sINcVNnNlZX3CLSxr
         eHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727794769; x=1728399569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5l0E+4hxhFOsv13SPLc7kqgr9gH7QPF5GIhtAbQx9U=;
        b=nTgp0Tj1QgyI9CLKJrfxelI2adSATWpJuXrS33De000yxaUk/bSEFmBnwomq3gdnqK
         RtN0FPi72yIu0RNW/LYULmjdFI6fpYbc2NfAnhHQKk5MNZQ0UgcIMUDbEnj32Tej1YLF
         rmVzBMsTkV7eJvD0mAdJqn9IfNeriGyDA92V/NR7cXuCjCL0Bacti4hcrr+lB9REnESX
         srQFJFRGs2TbeYwQNB8Avq47Y3npHwmElRtHrngQLITilagAjabMRQr1JNp6Jm7Ox4Oh
         F+jS0w9KcPrX6vfvThKJG+L5CqWQo6sT1ri/E7ZnvVmkY8Oj0PNR+reIeP7ZQ1IkYWzu
         vmAA==
X-Forwarded-Encrypted: i=1; AJvYcCV1gU8KL4rJaLGbS7uG7P0l7rNQyvGTJyIjwaLUSslf/mlz1rWsp78LT/DKGG+Yz8iFmf3yUkS/VzEN@vger.kernel.org, AJvYcCWkVzbsvGu0n/F679lI3l58/9GeyZZnUeCCZJ+gFDvYwmBEGtEG/WnAkHEH5H2494b8xUs5+469FiVqfnk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZCtkHhnUIcyp9fxBfQ4QLuNqM5r0x6JaZ4M+nNdbiem1NY6s2
	acdggUo6yvU2ntFULev+KVTe2ZEDOtlJbUdJLjeNrr9JGb84H5eRV1wFnEC7
X-Google-Smtp-Source: AGHT+IEI0IEK9o+qRiTIAC9UPt2r8AkfVozCbfogrFUvEKChmzJ4fjapSQLdI63HKciRhtFp6iZxlA==
X-Received: by 2002:a05:6a20:b598:b0:1d4:e66c:2a05 with SMTP id adf61e73a8af0-1d5db0cc696mr92489637.7.1727794769189;
        Tue, 01 Oct 2024 07:59:29 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:70a4:8eee:1d3f:e71d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b264b63d9sm8125186b3a.52.2024.10.01.07.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 07:59:28 -0700 (PDT)
Date: Tue, 1 Oct 2024 07:59:26 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Nuno Sa <nuno.sa@analog.com>
Cc: Mike Frysinger <vapier@gentoo.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 06/13] Input: adp5589-keys: add support for fw properties
Message-ID: <ZvwOTox14Za3XJE3@google.com>
References: <20241001-b4-dev-adp5589-fw-conversion-v1-0-fca0149dfc47@analog.com>
 <20241001-b4-dev-adp5589-fw-conversion-v1-6-fca0149dfc47@analog.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001-b4-dev-adp5589-fw-conversion-v1-6-fca0149dfc47@analog.com>

On Tue, Oct 01, 2024 at 03:41:37PM +0200, Nuno Sa wrote:
> +
> +	switch (cfg) {
> +	case PIN_CONFIG_BIAS_PULL_UP:
> +		fallthrough;
> +	case PIN_CONFIG_BIAS_PULL_DOWN:
> +		fallthrough;
> +	case PIN_CONFIG_BIAS_DISABLE:
> +		return adp5589_gpio_set_bias(kpad, pin, cfg);

I don't think you need to use "fallhrough" here, saying:

	case PIN_CONFIG_BIAS_PULL_UP:
	case PIN_CONFIG_BIAS_PULL_DOWN:
	case PIN_CONFIG_BIAS_DISABLE:
		return adp5589_gpio_set_bias(kpad, pin, cfg);

should not result in any warnings.

Thanks.

-- 
Dmitry

