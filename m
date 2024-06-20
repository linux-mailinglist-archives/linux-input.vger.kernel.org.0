Return-Path: <linux-input+bounces-4495-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C9C910A35
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 17:42:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D545A2825E0
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 15:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 075E51B0104;
	Thu, 20 Jun 2024 15:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dkPvyY4T"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D6E1E51E;
	Thu, 20 Jun 2024 15:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718898160; cv=none; b=XCE8KGH5ZskbD83PUKGHDgbpfAv/ARv+CPkuwEfLhJ48NL5qefhN8YPjbmenmSKCIrZlDQfecHkaPpLzif5m1+AxxKzJoYeVfB7RpLufzEXfBjZnDHNmUhO/0/hNTrVqtDa8IvRanqa7XPi4m7g3fldHbarS5zIqyMEwUVgnXlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718898160; c=relaxed/simple;
	bh=kfe4B5jV/9NSh1rK+lsYDgNAGNsHJAd5proacfFFmvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TJ87bPhMn/D3AuiVelQDRE3UukARqKU9ui8MCFjIMwTAlo5ssANl0e89cHoXPnj+ZF/QD1aXBF4HlMnhY6Dnzrwmx0P6lBnkzyd+LnR3p5ypUW/sAwelxaqEajUxkMkPrJsugc1d+c1LQbSVS6TZsJy+td7d+3C/nE0YQbLFGQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dkPvyY4T; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-70df2135426so715606a12.2;
        Thu, 20 Jun 2024 08:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718898159; x=1719502959; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4ygOijMwQj4RvlxsjHJZqT1HfHPexAo9x8mXgAR6tGk=;
        b=dkPvyY4TWq3mhSRp6NZPcio25BAV3c2JAnqJUgXyc6PrGhb1Jp+2IUFnEzRPPOA6f6
         VRv3iHGjcKse8MlXbMzUglyYjq5hgtMgkuMmjj4zbdQV2BJopfji85UcqSIXhZdn+cCi
         PoxEUTpJgZPVM7OIRHuF8Pw1Pn6nZPn3KIPa/zPoU6D8mOLLoJ/VTo4K8CywiJhMp7NF
         yIATVRggKoZkgADu9JvHXDhapDHyQsE7PIixzY8kWPMPjPx4qw4g2+g7wLqFhIsJNU/B
         U+aCgBqIpBHqsbC9lINDE9tA68vZ/6XdZ/g+8tO1Hww1px9IFbHax5Xut4PrlnPaaEV2
         VMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718898159; x=1719502959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ygOijMwQj4RvlxsjHJZqT1HfHPexAo9x8mXgAR6tGk=;
        b=ez/wh3kVCkwIzQPRfMB/JPcTEHeH4uJv2owzMv9XYgiKq2+BAviN+mpHhCtrTRLM1u
         GNOWiQLBNjFXs3cALNRSovpaaboLyYcn+tlq2CmzY+M9CVfwbumV6ov+zzwwaQlAv5Oj
         TBBuvhHZkaEFjgFJevKSVEBmMWHbNLBQTyvFEbMAhhtHISETIpNExovykYspNfvXiTyU
         XxA7DqCM2Hv53IZU7ToAraNt0Z6zG3TUqYO+X0z6+QWWb4emR/qKVDI8Mp9LKOF4ub45
         CPMvt3b9mCXSRgbTbNflkSpit9M/c5/TaO0Ld5DSs7bopMP+45ou2udSx09zkVBy6DXB
         qAAw==
X-Forwarded-Encrypted: i=1; AJvYcCUBZCJYZBMa9GBAceBCyWUF7FhNmYBaN0zuhi3s0aEACocl9qp2RUkabe8xUIBvuWtBkx+1owzwPn8NZHBL8+ewOayzVnxNnBLmCIFz
X-Gm-Message-State: AOJu0YzHRfNMhfcB53Un1em9LKLkpeyXxj+wEDmcuVz/Q8rhcRxMxjwy
	n0BhAT2CwPPv41LtstYNCpxnQzZyeyVTzhTZ64pCeitG11WCWCbdsydW3A==
X-Google-Smtp-Source: AGHT+IGgTPkJv+cypyDxLOVHWGctGnq3mNwdLo0LkRYjtUGphx08ykpHTsCGkqsL6pEwfUXgz/UYsg==
X-Received: by 2002:a17:90a:df07:b0:2c1:ebc4:4f1f with SMTP id 98e67ed59e1d1-2c7b5d56b91mr5461405a91.33.1718898158566;
        Thu, 20 Jun 2024 08:42:38 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:36d9:2b1f:59f:8e9e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c7e55dcdffsm1847997a91.33.2024.06.20.08.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 08:42:38 -0700 (PDT)
Date: Thu, 20 Jun 2024 08:42:36 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] Input: ads7846 - Use spi_device_id table
Message-ID: <ZnRN7LXAc3lujLFX@google.com>
References: <20240619122703.2081476-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619122703.2081476-1-alexander.stein@ew.tq-group.com>

On Wed, Jun 19, 2024 at 02:27:02PM +0200, Alexander Stein wrote:
> As the driver supports more devices over time the single MODULE_ALIAS
> is complete and raises several warnings:
> SPI driver ads7846 has no spi_device_id for ti,tsc2046
> SPI driver ads7846 has no spi_device_id for ti,ads7843
> SPI driver ads7846 has no spi_device_id for ti,ads7845
> SPI driver ads7846 has no spi_device_id for ti,ads7873
> 
> Fix this by adding a spi_device_id table and removing the manual
> MODULE_ALIAS.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thank you.

-- 
Dmitry

