Return-Path: <linux-input+bounces-8607-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D81B9F3764
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 18:21:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE8157A6D62
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 17:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34639204F75;
	Mon, 16 Dec 2024 17:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJkAKTd6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B805C25634;
	Mon, 16 Dec 2024 17:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734369685; cv=none; b=AMcQPStLJq55BXIRpucM4JT68u3b5Gpe8+ytXg1IpMRyeraBLv+Z/0eetwUzYzQB3Lk9BV6xlcKR2/9nbS9x0lwg9BdU9LJHWgCSInnPUfJ+CNFrc7VtoMmlU/w6NWavaDqpQge22kIfOFxZBxIhnWalofMq4lTNkOnkpyXV/gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734369685; c=relaxed/simple;
	bh=IcL1XjdkUIEBmmzvEb6EiZPV4byjUljVf66+eHQX+Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nfx4FMZvT4DxMPlMOJtNugB5fD0NvoeNWsqyBgU1sW1lPFSvTcbiC8VSdsWkJJuIL5VEyxaOxiC20P6ix+XAUwNev6rckhCJJZxh/0xYQqBTHuszTOmoN/NFtXlDcfoS0UiCoBLH2+LayUv0kXIi/m+vC+NWe7VRg3W7D9LyK0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJkAKTd6; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7265c18d79bso4706506b3a.3;
        Mon, 16 Dec 2024 09:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734369683; x=1734974483; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IcjBpJX+zzgt7wIjPU2TwNu8q+9vMRU4pA4lmjT7Ylo=;
        b=GJkAKTd6kf70cOlgyTgsfocZ4lJFWu5ZpLKAka1tn7Z1oEdcyADkKoI6x1xKjMxO0x
         Z0wLYNcT3aNsX72CRxQh8G4kmo9U3BLUudALnsAVTP9uElN7WHGbraL3YODCTa8yN4Wk
         1LCHlQwgvBzY/WF4XLoVY+XnM7GcCHO6ZVmj+0hAaKsPQwMsk4OLoBlkR9oCg2eaMNlk
         RwKRT7X0mSUoNTGeEzRX0ufVu7k9DBBk+86xsD5Z1UAvI02zPs49pYN9UJ+b3bA0h+vX
         voPAv0h029eOAduEUUZB9I4lk4YrQWD4yRV2nyQ+97oCk/aVT+aGsIdyFo5Nm+CaTvOm
         Rllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734369683; x=1734974483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IcjBpJX+zzgt7wIjPU2TwNu8q+9vMRU4pA4lmjT7Ylo=;
        b=rG2F5Juw3sPJ3w+fO2/DQNkuGszp0SYwnrmaNOO0ZZ5k67T6OE/PsuBghQZ7XRKsyT
         52MqpRoH/O6djI1FD1JswnesHqudH2swR2CNSNKGapGbjlbGPImAgWajvEeBvbAq4ycW
         OfqoOzsxcuP8Bv9YHLwFvhi8cxzOXXJ3hIGC1ATQIl0uMaYBcenQpuFbyoU4MEC6p97c
         MJbqG63DapfWkzcerzSrvlRx4AFw6inNZ4IyEKZmt/+dmyLEZXup9podwdGBObv1/BOU
         RuA1BqiGmi58DPaYBtDGcMDT8gFqAXvUk8E48AFv1uGUGTSZXXIX+pEii8imRg/wL4K2
         6ojw==
X-Forwarded-Encrypted: i=1; AJvYcCV1QV/f483MV2hsgXscvGyXNxN4bACE/UWt3my9k4jn/vEdHWC7Fn56mBuaDA3wqKLFmnB9LBuCz5wqWvCNKPxFxXJ1zg==@vger.kernel.org, AJvYcCVNWk+fSxxyLqUtwOHD+GogVNmISygXap3U6IoYXX3EJnXL2U4aDEx2viQrVQPLSn2wVSkPIjcULFRTccQF@vger.kernel.org, AJvYcCXdz5tny3jPD5om/ezwMhufYR7UGg42cJJEVpn/VDQY/o2PFFvRls3IQhzw3eAKmtgqJdQYuDNV0Eyytw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWlShfYqsuiLFZW3QVzhdxAifx48kFcKOo6KSEjs+vO/XqGpT9
	z3bMQuzvK4FRkQ3e/Wdh0pCII/r+G/w0isnfK+aO2JDpUTVDub9tiMV9Rg==
X-Gm-Gg: ASbGncu45NsA8EEbFygqANDYEmdQsACKFd5UFyNQs9PXn4siKEARLnZ427A8F5Rz+0w
	2T7YtopfOQF/W22RMxBTVh8+h4oOcYIIrXj8mEZt52y5+61r8T+KU5dlTumcF3d/BlkyFUi/CsH
	Rz7wpxlU7a6yujTS5YKyLbj60G/+UWisY0bXYl682b+IZOELXQeUOdDLbdUKLfI2e1/b/FOM3O/
	DSeVHhuMH91F1YtMorBJNb8pgeve7Yial9kGHHThSS23QncLZV2QXhSnA==
X-Google-Smtp-Source: AGHT+IEL0ah1zj8HhvrqaHeKinHAb5ObqgwkbHEUEbO1BeM3QxAvO7JHNSB4FgpuegdTvWV0EcfdmA==
X-Received: by 2002:a05:6a20:c99a:b0:1db:eff0:6ae7 with SMTP id adf61e73a8af0-1e1dfdd7c82mr19757265637.33.1734369682955;
        Mon, 16 Dec 2024 09:21:22 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:e6c1:cee8:7b58:a395])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5a93567sm4342543a12.4.2024.12.16.09.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 09:21:22 -0800 (PST)
Date: Mon, 16 Dec 2024 09:21:19 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: o2g.org.ru@gmail.com, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, corentin.chary@gmail.com,
	luke@ljones.dev, mjg59@srcf.ucam.org, pali@kernel.org,
	eric.piel@tremplin-utc.net, jlee@suse.com, kenneth.t.chan@gmail.com,
	coproscefalo@gmail.com, linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	josh@joshuagrisham.com
Subject: Re: [PATCH] Input: i8042 - Add support for platform filter contexts
Message-ID: <Z2BhjwkkysKsmhVT@google.com>
References: <20241215233628.4500-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241215233628.4500-1-W_Armin@gmx.de>

Hi Armin,

On Mon, Dec 16, 2024 at 12:36:28AM +0100, Armin Wolf wrote:
> Currently the platform filter cannot access any driver-specific state
> which forces drivers installing a i8042 filter to have at least some
> kind of global pointer for their filter.
> 
> This however might cause issues should such a driver probe multiple
> devices. Fix this by allowing callers of i8042_install_filter() to
> submit a context pointer which is then passed to the i8042 filter.

Right now i8042 supports only one instance of a filter, so the driver
probing several devices will have to sort out the ownership of the
filter anyways.

Unless you plan on supporting multiple filters I do not see the need of
storing the context in i8042. And if you decide to add support for
multiple filters I would need to better understand the use case.

Thanks.

-- 
Dmitry

