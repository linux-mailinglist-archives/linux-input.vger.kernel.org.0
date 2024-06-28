Return-Path: <linux-input+bounces-4714-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EE091C8F0
	for <lists+linux-input@lfdr.de>; Sat, 29 Jun 2024 00:09:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A36451C22C45
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 22:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F99880046;
	Fri, 28 Jun 2024 22:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mNtZziXz"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E107FBC3;
	Fri, 28 Jun 2024 22:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719612586; cv=none; b=TFlUjr9c/jJdlXYhGkeRahM2lEMzAVrmqNB2PGsSPMVxCtJJRGALirdyowRuqMgd7RZYnRctQ9BDCalqG7VVhq4AZa7xgRSMIQjKcL1tdgB0/4LYCUri3qJfeWtR3vTiOsUSBNQYygjWqEKCuw9sptX8RH7sAw/tjpUM2A5P1xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719612586; c=relaxed/simple;
	bh=ZqOoAZCju1bnsFqWW9u+ByxJw132pnN+RULxSJPPKK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vp2TfjIMx3IAfwDmVep3WFuKQ1sz8MxvISqy0GQYzq6hK1z2l1C64Hm4+AgQ85FsP3qVDfATGYT/pJcDqTjRETOjIT/zJdG+GaoTBQ3haUOIJAnNFFcWSmVGwk+QTVY4xw44EEej1wdSW43CSiQ8c5KzeXQ7/0i54/xJNBB+uTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mNtZziXz; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-37613975e20so4425205ab.2;
        Fri, 28 Jun 2024 15:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719612585; x=1720217385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UQXNvdsZJ+A7BYWMkT+035uTNFax01gJqws1+kbJRz8=;
        b=mNtZziXzaZmyjE/oGFlKwlYJXnLi3WkDrTgd214aQs0RWbyhfSsOl0VkAEVSlzk5qt
         TFeRkDAroA/1q1+3PfvalimTOsTPFkJO8dUqSAiwnw+8UmMVOUTpKrZgMc6SJbjPjrEq
         vPy9ojSH12uDadupzH93P1OTozdxEN2TDegug4TtnUUwmJ2PlZXABTtTVMcBWVTjMpGM
         C+1HH7aScTvhUMjEJEf6XzGvK5mJ7kD4XxTu7EcuXt00QDPgakOvX4oWebvmhJUhAukd
         MzdnIm+xWe8Hy5E6RdtF+TMaImkPIVBI6JwBWiyg4RFv1/goJutMwDn1TrpxJrS9VNwG
         +7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719612585; x=1720217385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQXNvdsZJ+A7BYWMkT+035uTNFax01gJqws1+kbJRz8=;
        b=f74VKyBdrVeK3SLwsCRddVGVLUZjGCZYIUZaIcxrMIQjt8IIF0gwjiVAAO4qiDDkQF
         gwvD7buRC5wDmUou+VXkPtkz4oSnBkD3STEBr8sJFHM3jf4P55CgjtM2laqMyTNo1PQI
         caeJOoUO+f6ay8UKJedmFeKf386s30hF894ZCTvRedKBZcQvs2MvzKvxaOoOEw80p/kl
         8+u8fM5r9c7uBjk7YNX/jym0DUekk9IQ3uOcjLuXbv7ZO2/uFYwRD9BIKMBPQ3eZljzY
         JGR0/Egd5V4lXHH3CZvJoLHl7Ln0pwW0EBfSpnq2Z+fMOa5x3xiKkjzmQkevkSvjUb6f
         hS1w==
X-Forwarded-Encrypted: i=1; AJvYcCV13NhjA7j+HMt47ILS41ZV0EQmSYxAv7yX8MF6C6V8GHnAgS3nJNETGxf2hLZq3Ofu6iJ2N0Mh5zDRcNMFeAdt5A7wvEQkSzHVVqOP
X-Gm-Message-State: AOJu0YzQLCfzr+MkwaGg6pZjeIy+bdMsrmyi4GH6uAXUAefvE1Sn49hh
	h0cT7HAw0VcwVJ4eAwsAFUMcYaCcGBFsEfIShUpYJcdK8AI1LUGU
X-Google-Smtp-Source: AGHT+IEeAz2L8j1OqXHF967XCk3dgJbrG6mjXrYWNR/rbBHJ07URdNuyRfgJRE+7TbzEMqu9xmBT3Q==
X-Received: by 2002:a05:6e02:b27:b0:375:c296:bf90 with SMTP id e9e14a558f8ab-3763f5ab3e4mr253193615ab.7.1719612584769;
        Fri, 28 Jun 2024 15:09:44 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:9c98:1988:ce15:c0ac])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-708044ad3besm2118314b3a.169.2024.06.28.15.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 15:09:44 -0700 (PDT)
Date: Fri, 28 Jun 2024 15:09:42 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: goodix_berlin - use __free() cleanup in SPI
 transport
Message-ID: <Zn80pjK3Rv87Pt6P@google.com>
References: <Zmk1SGwVt3rIbbMU@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zmk1SGwVt3rIbbMU@google.com>

On Tue, Jun 11, 2024 at 10:42:32PM -0700, Dmitry Torokhov wrote:
> Switch the driver to use __free(kfree) cleanup facility instead of
> freeing memory by hand.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Applied since there were no objections.

Thanks.

-- 
Dmitry

