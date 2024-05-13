Return-Path: <linux-input+bounces-3698-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1A88C498A
	for <lists+linux-input@lfdr.de>; Tue, 14 May 2024 00:14:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CCFC1C21519
	for <lists+linux-input@lfdr.de>; Mon, 13 May 2024 22:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A10584A54;
	Mon, 13 May 2024 22:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H83ZHn4t"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE8B84A53;
	Mon, 13 May 2024 22:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715638438; cv=none; b=PvzF0sThMnmKLSMzC7MXqqPAP/MjC4NO+zYIkR7ue5aAPO6MCuAAf3JZ8/wz26bPfHU2HdCubEb62U95yZCgCPaVTqyUVo2o+um62+7TfSIJald1hdMqb/gBxdW7y26/CS8V5bfv+f/jOPb63Ou1TwurPZ/zMq3d+6cJltD77ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715638438; c=relaxed/simple;
	bh=fszKNaErOVr89f2N7I10ugUM0eK51AgdD71W67kYmRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X4gPLyK5W6ZZVf9LsLBzMJ1Hwm2u4ccMlZkWErRirhnxkcfiJ1bb1gv4JHodnMX/IiBUN8R+MdXW0ujIvINJVphskX1bVgIT1aC14VuWjjl4PX030CmnryVwUqLO9MIWtxaKmVVSQmbQsDA0diWxDGFMoS6PmJDHuE17gcwe9ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H83ZHn4t; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6f4178aec15so4208551b3a.0;
        Mon, 13 May 2024 15:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715638436; x=1716243236; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4j8RFdGC0VuedZniVwUhCiKK7Ds6d9wSnywXzZOXi1E=;
        b=H83ZHn4tqxrDgyn9pJ/DzKCcQhEWa740x+wO7s+TsvTdp+0UHVlPeoRkW4OzPEXA0Q
         yXfdTz/hLFbQdQmadz6u8ET+RlnW4ZDswI/CGoBZYrnaYOTjj+Z70Dxx7Z1tsZ7LI7k9
         5q3sKbl12QZwtuVvBHkBvB2JtpggwYHFdtXZAsyWK1iLAsgYfpw1FJkXnUj2SSKTQnbM
         yeP1QiGxoPMfdDM7NvfjDgUirQoLaVsAYRX7NRb0/zDCC7l1WywibaLCq5qfQU4ii315
         Ga5eUdUcbBn55amk9Nw/u2LTY02iUJcTjNULLaUklodGyD/syxf5Lj/TknB2sB69C2Hj
         HA3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715638436; x=1716243236;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4j8RFdGC0VuedZniVwUhCiKK7Ds6d9wSnywXzZOXi1E=;
        b=PO2gHzX0bq9/uuYm/TBIK2ZAfWZ0Xae30DG+iTAGxSQ/Ea5oSnxMg1HNztkqth1Rs6
         0PJqieZMvKGdcMxvXWYgYtuWBTl22EOS/6gjar/S/KwOPSaP/jnZZfzu7Kcyf5VUsAw5
         tEOLK9GkeuyLG6w8klRf3y32ni5OmGnfFRFruyrSG/u9fY/gvhwYBw6eIm2FzduUcqLq
         mEW8afzLeMSPHCw6fgHLr+x0h3KXV/yyvYKMksMp1+txBu5iMRxMvkAEk/I0XvxFBPnC
         mrCNZupZpevReyWYIm5QfOxJimWOYLZv88iN3MxlSRdcfQ2BqrIWXFJhwDV9+/I8Nx5Q
         HCFA==
X-Forwarded-Encrypted: i=1; AJvYcCXw9UKG8BNqUv5zQoWhBsLB/cRIYTgsFarckQ3i4fjiLWOqGvlmBMeljYIAXdJ+gw75jLBZnZ7d25axZBIdjQPsaNaGHDM8PeEs0AjVoNjQdzWEDdn8DP+YZ3XKF0t9Dw2HHsO2hZhvUc/2OQfgbJ0YHJyyVDx/U7J24FpTvVRMu8rUkH5v6g==
X-Gm-Message-State: AOJu0YyCom9GKUXxtZarnrKdy8Mui32I5qnzqrdmPFwz4FQCG6YuWUZd
	kKMWNOS/5jWgLGz9ZtSMVwLyJGH35kDjNCoS1l3rtYFp/BjHgbrp
X-Google-Smtp-Source: AGHT+IHyZ3Ykh/dzNACO+8VcemDzWxChD4oe7jk/x/UbNmdAuCsrQjAd4OLu7jpZ5LdPxkGgd+ZWAA==
X-Received: by 2002:a05:6a00:4b56:b0:6ec:f84c:902c with SMTP id d2e1a72fcca58-6f4e0347697mr11790794b3a.24.1715638436162;
        Mon, 13 May 2024 15:13:56 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7704:86a9:2c56:6794])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2b39c1asm7881839b3a.220.2024.05.13.15.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 15:13:55 -0700 (PDT)
Date: Mon, 13 May 2024 15:13:53 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Hermes Zhang <chenhuiz@axis.com>, Tony Lindgren <tony@atomide.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] Input: gpio-keys - expose wakeup keys in sysfs
Message-ID: <ZkKQoTq2xyNvJlHE@google.com>
References: <cover.1715255980.git.agx@sigxcpu.org>
 <2b6eb6c3f68509aa35cdf2e2a586689ae97681ab.1715255980.git.agx@sigxcpu.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b6eb6c3f68509aa35cdf2e2a586689ae97681ab.1715255980.git.agx@sigxcpu.org>

Hi Guido,

On Thu, May 09, 2024 at 02:00:28PM +0200, Guido Günther wrote:
> This helps user space to figure out which keys should be used to unidle a
> device. E.g on phones the volume rocker should usually not unblank the
> screen.

How exactly this is supposed to be used? We have "disabled" keys and
switches attribute because this function can be controlled at runtime
from userspace while wakeup control is a static device setting.

Kernel also does not really know if the screen should be unblanked or
not, if a button or switch is configured for wake up the kernel will go
through wakeup process all the same and then userspace can decide if it
should stay woken up or not.

Thanks.

-- 
Dmitry

