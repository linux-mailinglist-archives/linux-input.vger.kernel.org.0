Return-Path: <linux-input+bounces-10328-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 755A4A435DA
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 07:58:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1F1B7A3979
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 06:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 927002580D7;
	Tue, 25 Feb 2025 06:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i0NaIEjx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2224F126C10;
	Tue, 25 Feb 2025 06:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740466712; cv=none; b=qNO5/7wXaNHmrPOaTY7c8QjVsztrRAQpt4jMSav9n0hXSKloxiD9xqTM1/7mrk5KK0HMy8qJKz0BVvn1UxM6//YRRIRfnTiV1c9yGGYFe9LbQ8//5yvbR4ioAGaC+jyC22CzM5xxw1By83ZxwBRMIYlEdC0fqm9MXCR9qW6jqmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740466712; c=relaxed/simple;
	bh=7n1NEXEZX1x+SAMkNZ1zmOKpOrcQM8yKNkEbs+8t+sM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QjrnYywbhbZ+QWE/J1ujHOStnPuf/spA81pvjoYrGE4E4WBSBFziCI4EoPghF6FiwpDIIDJ0RHkOXbTraMu9+KNJGn5lGQxfG8XdZmErO/uNbVRHjvrNXLOxT6VfAOfF2kA058tPgaz1GSwJQ9F9nlAuD+3KuZZ1M49GUVqOCTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i0NaIEjx; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2210d92292eso5123145ad.1;
        Mon, 24 Feb 2025 22:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740466710; x=1741071510; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJ4IIBqtZ+7dg9GjIFDDWBbqrCmJeC0sJly4M0s0wws=;
        b=i0NaIEjxUyQUzlcJ+LaAj0U11j6wuBaYYl2fLfPNwb7rHgsfSu0iFQ/vifpxxaG26O
         tOCVKDRxWl6DEniYE/9Ab8tisNh2yeWnK+hINyRClcMh5E61irHNJZOVj8HHLbG09j6g
         FFzIYHz2BuCj69txGXlCFvVlx5zgJQWD41c6t9LO69TEYYb5eiGeiO2nKFqZmF12Hg4q
         7uIfISWdnKcOA6yKf3/urcHYyiFEt+u0OBGaH/22zMm9xxvBdINcLTE5O7Xj8J1VDtq+
         YI0ZyEWk29dx4Sn87E1Xg0OHBqFSomU8XJXQjEu0GbRo0U+gmPcB8nvvElbxcMG+Zh4B
         kLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740466710; x=1741071510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJ4IIBqtZ+7dg9GjIFDDWBbqrCmJeC0sJly4M0s0wws=;
        b=MVtn4gI9vKNh9Rkcmhz+lQVhsGaF8dvwcX9Q6DA1AgniIjQlEMB9IbP8CjmluXimg/
         b4m95dClCLEgxADNpLR4BAENhmJ5oUpsZUvRx5b7zWgKz3g8rmMPs8uQVUP59Eqhw9A0
         KPtXdVp5LjZ/m6Cpt/8VFQNsvkpaR1rf2zlvSA4HDZKl5Cb2/C8xtd/gJUvPB22IYOcM
         IhBIDPsOheZ2L7xOfoBf5NRfaG3CSoxn1gA9qZvCyP+5xX7Vl4GUw/zEjdrtlTh3ebDj
         8xl1Edk9TaYk+zoWdQLBhWnIUuC042KMx4HSGQOg1L7iwqrJojQnHBcXS9U7MrOYzS9N
         VY7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTfEvDJ+Q86lWXnfPU/AlyLbuZb2iHbW4UOa41dZyEuMIbVodP053u5/eOKfAAVb8tpOhlkgWAAkSh60Js@vger.kernel.org, AJvYcCUhVwB0ZGrGMeQstVieXzsuLZt/fpBuLM+WhY8EfVzpMvJhHfMtgZuP1KOba172seoRz99rnhOzeAVD/ZQ=@vger.kernel.org, AJvYcCVW9VYfYX1uCNqmGB/1JcQkueRSYtVARf44RWyna94jELxNfvpCnis4BQlBTBIlcllTxT+r5WP14sSu@vger.kernel.org
X-Gm-Message-State: AOJu0YwoL45SJ0sahidzXbfpifUhV4+3pX++Vci3nkblufhtZpIGrQEy
	xLGAvgKspYjcjLbyHCuBZjup6XwTjWJIL3/BOcWmYImQkg3wcdi9QBG91w==
X-Gm-Gg: ASbGncso/SBNVLRJfhaCRPkKW4AUdAY6Uzd68KKLUMLgv0xRwtx9421gZ90Vkh1Ontl
	HlqCCX/lHPBfHlHXr1Ve4t4uvLlxGQXeKzZE9f3s6SdDK2r/RBW8O4G4c+hJYGCLjlFsByBdXk6
	ybOweZBbOjYvqY2MNuJ+bC1g3nTRt8fGlymZZC/vHy7m5REaeqoU1U2hZgUg0+7JOBBn40QlCSl
	R84WpFiALg12DcIWCYu8vqoPcR1ZvSeVfnfBeo5QqMM4GbV3bSiwB/QraqJsxOd8hA287fmq6Dy
	i5Tcn/2zTMQqB/dvZHo4qOpZ+2g=
X-Google-Smtp-Source: AGHT+IFxMEkF4ozJ9A9pUzGjVLBrdC+gVqGS4GB5H2EERgj00pbgpPTyNSLvVsjQ8jlzx7M3xIDcTQ==
X-Received: by 2002:a05:6a00:982:b0:731:737c:3224 with SMTP id d2e1a72fcca58-73426cab055mr25848353b3a.10.1740466710284;
        Mon, 24 Feb 2025 22:58:30 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:464c:6229:2280:227e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a6f8fc3sm786057b3a.50.2025.02.24.22.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 22:58:29 -0800 (PST)
Date: Mon, 24 Feb 2025 22:58:27 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Manuel Traut <manuel.traut@mt.com>
Cc: Markus Burri <markus.burri@mt.com>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 7/7] Input: matrix_keypad - detect change during scan
Message-ID: <Z71qEyDVz22j_CvL@google.com>
References: <20250110054906.354296-1-markus.burri@mt.com>
 <20250110054906.354296-8-markus.burri@mt.com>
 <Z7YNKl4ljWFQEa-u@mt.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7YNKl4ljWFQEa-u@mt.com>

On Wed, Feb 19, 2025 at 05:56:10PM +0100, Manuel Traut wrote:
> On Fri, Jan 10, 2025 at 06:49:06AM +0100, Markus Burri wrote:
> > For a setup where the matrix keypad is connected over a slow interface
> > (e.g. a gpio-expansion over i2c), the scan can take a longer time to read.
> > 
> > Interrupts need to be disabled during scan. And therefore changes in this
> > period are not detected.
> > To improve this situation, scan the matrix again if the row state changed
> > during interrupts disabled.
> > The rescan is repeated until no change is detected anymore.
> 
> This is a quirk for a bad hardware design. For 'good' hardware it adds
> an additional read_row_state for no need. For even slower connected
> GPIOs this will also not help much. However it is obvious that it will
> be an improvement for some designs. 
> 
> Dmitry, would it make sense to make this configurable?

What if we do not disable interrupts after the first one, but record
the last interrupt time and rescan if it arrived after work handler
started executing?

Thanks.

-- 
Dmitry

