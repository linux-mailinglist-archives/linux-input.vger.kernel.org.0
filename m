Return-Path: <linux-input+bounces-7795-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FB69B750A
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 08:07:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 75413B245B7
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 07:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F423114E2C0;
	Thu, 31 Oct 2024 07:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XnWcrZ4T"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF7F14EC46;
	Thu, 31 Oct 2024 07:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730358384; cv=none; b=bexkR0r6G1EVF8t6THtwKvF80OFggroqKgtk/tk11l3FdEvFPGEkaZFhSJunTRoTicIxnOGwf5R8SZaq8pQwe1nbiHMbQ+5YwoKHdBnhUDB212h8/hlCyTf/BY3nZqCdDcHcIbKevAXY2+ms9A7Ipb6RmNdP2pswsJclDIjkcxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730358384; c=relaxed/simple;
	bh=WVh0Nlf1V6976Dw5UI1yrKIiR6XvS7QUbd/H1sNnOG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iOlkzF9wijgLQu6ArYz6A7NZnU8FujmLgTzN2qvQIpjKnjtK9bsr4cua9LViBhX1rcL6/OqLlUNwT/IQS3Mi6EPo2R6LaEN2mWxpVrSkN0GvMKZW/oLBAhmYaiGf9SG5fZOOXJbrPoNRjHKZXtq4y4wBEdwE7CiGVhglWuuHDGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XnWcrZ4T; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71ec997ad06so451596b3a.3;
        Thu, 31 Oct 2024 00:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730358382; x=1730963182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DJLfnZmOtEngFbuMjXVkbmcsP/JNWafj+2zyMqVDyrk=;
        b=XnWcrZ4TdYFCl8UAXrYsBw3XqJomvXDAA5h2p1uaOCQ/mzM+GWwxVbya08bnGZ8JeA
         WWYSzPJ+21BEMww7ppXR05hp8QHd3lxFiOWZXFg5OUneGpv1DUXmqSZgy/mkHZxY0SlY
         QCuIg1NBJnAdDLwR5IOxEoPBIzE1v+ThqthlMAJwHFJ9/C6fUkLplGVH7nMPpL+CBOLg
         x7mvXsUJiAg5G5jvR55tV58h/LzluZulyKlZ9dVE1gu/cC+RVNQpsluhz66S6augj6Nk
         Z8EXOU2kKKHvKAL/d90/SPZb7neERmzRxNasE/tNQGJEzz2W0Fg6JwdLZONW6Jm+T8rl
         dw0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730358382; x=1730963182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJLfnZmOtEngFbuMjXVkbmcsP/JNWafj+2zyMqVDyrk=;
        b=DELxEpBdpQJumqPn68c+f/eX7DZzv1cLwTHIcexc60pLp8nsyVQV3ZT6uVo/7yLoGQ
         FXpgugmBLXAppuRC0juoZ3QApfsHVByc6Q3Jp2+nspW/lzfIpnzTV71NcCnK1VvybavD
         ojdbTMbBv2aQAiSHGFRrET8ho9zYTTUlh3xWjpG1uaX/CWZQduco+5Zn+x323sYVpdKd
         NmlDFevGNm4UsIVnYrULu4nfiS63bgaOt/MIT6df6jskFLBf50LkTtJKelfLAfPobdIe
         1Lz4Wh6DG6cGxoysuCReZSE/TcPQ2Y/nMez6CiwJLqMIKEq5SYTZ+7T9bWni6F1bHeQi
         5wIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTE7yMFo9TjmYHEYvrstvS8TywkMvdBRFvlsBuutCfHorcW92+ov1ocXGWfV9ZdSMMV73v9SFDYfTUChI/@vger.kernel.org, AJvYcCX9ulB5eKxe2pb6W7oyJWLuXx66+gcPmHJI9hMMHyukjfjgG1ubju3gAHkQsCIn42ak6yrL577JCGd8Yw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2Bnu9Yehck+HL01s8ReXBQs7kN+D/RAhNjRoq7BopsbqsyIzF
	sSfAMxyTynUtsZtu5NLrm7tJuxiGxAmGzXMPKQIpikn3L2EYUFkEncZm8UD7S9dzXA==
X-Google-Smtp-Source: AGHT+IHU3TNDtsbgikSNwfPsWVl2aF/o3QVug5ZBr+ukvwyGdfztfNY64dbHPVrj6aIcnZZ/5YwsLA==
X-Received: by 2002:a05:6a20:b40a:b0:1d9:29ab:9b49 with SMTP id adf61e73a8af0-1d9eee1e129mr6294432637.32.1730358382294;
        Thu, 31 Oct 2024 00:06:22 -0700 (PDT)
Received: from ux-UP-WHL01 ([240e:47e:2ed8:ab06:94f5:966b:9066:6b36])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2c3e08sm622470b3a.105.2024.10.31.00.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 00:06:21 -0700 (PDT)
Date: Thu, 31 Oct 2024 15:05:57 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: hbarnor@chromium.org, jikos@kernel.org, bentiss@kernel.org,
	dianders@chromium.org, dan.carpenter@linaro.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: hid-goodix: Improve handling of HID feature reports
Message-ID: <ZyMsVf9C4tVzKhE6@ux-UP-WHL01>
References: <20241023082703.23525-1-charles.goodix@gmail.com>
 <ZyLIZXnH1h4snkuB@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyLIZXnH1h4snkuB@google.com>

Hi Dmitry,

On Wed, Oct 30, 2024 at 04:59:33PM -0700, Dmitry Torokhov wrote:
> Hi Charles,
> 
> On Wed, Oct 23, 2024 at 04:27:03PM +0800, Charles Wang wrote:
> > 1) Align with the i2c-hid driver by returning 0 instead of -EINVAL when
> > an empty response is received, ensuring that userspace programs utilizing
> > the hidraw node receive consistent return values.
> > 
> > 2) Implement the hid get/set feature report function using a separate
> > address, rather than sharing an address with coordinate reporting, to
> > prevent feature events from being overwritten by coordinate events.
> 
> These are 2 independent changes, they should be 2 separate patches. 
> 

Ack,

Thanks,
Charles

