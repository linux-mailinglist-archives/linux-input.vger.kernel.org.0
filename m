Return-Path: <linux-input+bounces-5885-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5253295F80A
	for <lists+linux-input@lfdr.de>; Mon, 26 Aug 2024 19:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 851F91C214FA
	for <lists+linux-input@lfdr.de>; Mon, 26 Aug 2024 17:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF2FD199396;
	Mon, 26 Aug 2024 17:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSUneqW/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EE11991CB;
	Mon, 26 Aug 2024 17:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724693151; cv=none; b=dlr5fJxDktNB3yRSB9Q50bolkVrQf0e0tegp+JpjWMPXA1cFpTZAcwgBk9/RhNKgE7CnVG0oMXN6weoo/myCpg+pSyvBIhz3vop/lNKPoyyKnC1gRP4BaaYbv4AyuDzYwDeU4cic4kTk7ipE7uF/Lkzk8kQBNrM17kGv6lHO+Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724693151; c=relaxed/simple;
	bh=zMx9DQpEyABpNYvNRs/EdOnvUvRhyl4vlyhO1uOi5Zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gt1DRQQ3qb+hM4qBilv1e08zjPOE+BPElTUgt6ZVHWGUW8zYB4uCk2Gw8OUe+/vV9HMHT0Ionjq3k08dFDaJKS2LOi/Nf5jQ9GNm3TMgS/+bUk58H7GiQC04/uell7WCRMSAxLs2cau/I59GXHYpN69DMfmlKND/fMS7h6PbVhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kSUneqW/; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-714287e4083so4131841b3a.2;
        Mon, 26 Aug 2024 10:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724693149; x=1725297949; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nZ6cwNGA6JD/Q8yMQgG51cdzPFq4ZNF3ohZgEXIKCD4=;
        b=kSUneqW/Zq+aOXb4XfoqJjz+pd1kya3IRutfyJCiFYCn2UTtkXtGm2/RJitVMr/BBr
         aVotmCNUwgRFXgNDEvf/xUyjdZmmFyL9rjWy32s6aIvw4HB/Ykay1DObkhejVmH9wDP9
         lCgNfg2SuPBssS1Sd6KSAf2/Ct1qyy2/bRUYC8iIJaLeXc6qzReTU0b52rAH2H4H+a2l
         TMp/d0WcNfIGIb60wMpuTr/KQ4nI08UuYQzx4Aco1XjxGXhwDUA665Z8ZdVbWuGRBu1E
         pir2e8tjEjeoP6GOj6j1PQixzakotg+6VVyfYg8SwLqnFiV+Bou7wyK2x8LGJgXSWXkt
         0HvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724693149; x=1725297949;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZ6cwNGA6JD/Q8yMQgG51cdzPFq4ZNF3ohZgEXIKCD4=;
        b=IRKDqmWa+958y3mID5+OYzIzphwQFbVbkz5wleyagPRfYG6AHoGchAooBcK79ixXnX
         HwqjefSHEOPJu0Ox3iCxkw+ZyNvUIj6LEs0jRcKXFHasW8T7Qz4GZRcNV39RJxI6i3/S
         08lwQfbYYSfV+wtMSP3eCIW9cx66jLXtutKGKNk6zxaUdrGBMiAtEQKp5us1sNeEKSeW
         qIkJ5WpKuq8js5Fv9+Nf+mE3y14N+4I1qK+CA/pk8GPUkB6z1s5ttcO1BMroMrGZNfoN
         P85hYtLZ4feFCbP2etvs8pT0N2JMWDOW9EYTbkA8SEcS5ZQASFBl+UpGaNunrT0uqTrp
         YWOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxcmnDXSSqhyvOS00tOrDh08kI8IJZqM8lIlf79IBSIvujeOe0wyVmqd2Ga24iQCSvC6eHAvUXV/XLGMug@vger.kernel.org, AJvYcCXZEzpsIyMocqTMN5F0USFXmMAwluupxlN2vTlomQ+szmtNVR9M6sXo/aWjHLFlRaPUKfFl08hVJ5Y9fg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnggfd9MLmALSapTE0jHCI2UAJD3eqhgWZBZ6GgCvIYzpRAE6l
	UZlOQ3ROz6X9qZ3KKSpuhEkq1/XwN03fHicQrThBq8wEFV95o14y
X-Google-Smtp-Source: AGHT+IFbUoJ9U+jx1tAVdojTiAkiaT4wP/hkaipngH3TzXRNWC+SXQsNo9MXNIwqll6sfrVpUmJQaw==
X-Received: by 2002:a05:6a20:c6c1:b0:1c3:b61c:57cb with SMTP id adf61e73a8af0-1cc8b63e7admr14162486637.53.1724693149286;
        Mon, 26 Aug 2024 10:25:49 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:fce4:8959:e48d:980c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855e1826sm69658605ad.122.2024.08.26.10.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 10:25:48 -0700 (PDT)
Date: Mon, 26 Aug 2024 10:25:46 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Shen Lichuan <shenlichuan@vivo.com>
Cc: mitr@volny.cz, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] Input: wistron_btns - use kmemdup_array instead of
 kmemdup for multiple allocation
Message-ID: <Zsy6mvOkn7PkrUuv@google.com>
References: <20240826045253.3503-1-shenlichuan@vivo.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826045253.3503-1-shenlichuan@vivo.com>

On Mon, Aug 26, 2024 at 12:52:53PM +0800, Shen Lichuan wrote:
> Let the kmemdup_array() take care about multiplication
> and possible overflows.
> 
> Using kmemdup_array() is more appropriate and makes the code
> easier to audit.
> 
> Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>

Applied, thank you.

-- 
Dmitry

