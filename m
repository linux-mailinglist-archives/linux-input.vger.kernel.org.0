Return-Path: <linux-input+bounces-7394-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F3C99D9B3
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 00:15:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA1862831BE
	for <lists+linux-input@lfdr.de>; Mon, 14 Oct 2024 22:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C6C158538;
	Mon, 14 Oct 2024 22:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kL4gGdJ0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA984C83
	for <linux-input@vger.kernel.org>; Mon, 14 Oct 2024 22:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728944108; cv=none; b=T2GdclBcAmO46CfPlMGqXOT7mRGHUnF3oiYIwEQWwab/QpJd0896FVelCFl0uvQWQir8OsqFB3E/rqQyu+9oAi70aZNYmu65amDnjM2vHWRvxKWwi4+DhpMB4S7lbF9Kd4w92bSAwy3tynySTJv6D5i+LlzrMXmATLB5b3ofG2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728944108; c=relaxed/simple;
	bh=Yf/eZI4VliuOuMyOjKSWost7vX1fuy0cFpSUTmNtLas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CJ7Ith4UPOSUVIz4Ck+0eqry2UWpoQhK2I7RqwD5zL0TgcTYGzghCJdy+rvUuUAawj7g9uKe4A9DdnMYEVhKV/DMPSzIe4Q7LHV1Zi61mvQE5zujvlqBmdWf6OfVWq42rEhlwPwz4p/Igs0TtXrHQecYIRENDHqyRa0DArdMZ10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kL4gGdJ0; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-716a5b9ee6fso2473951a34.2
        for <linux-input@vger.kernel.org>; Mon, 14 Oct 2024 15:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728944106; x=1729548906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+F8Wk5+qlfD4SH77wzSsHRQd7jTKQOZnCdTsqCoNLCg=;
        b=kL4gGdJ0fbL4A7ZRL37omYPVfMXlzktj7viotVjFP002VNnAOEmB9h95y3pKr1aHrK
         aW4hXPD47q1oHdfRqW9a54FMRiopcU7J1jX+DpkPk1BP97OpQLKhCBpp/JZPnuWvkCWg
         QLVuAU8mYf19eZk+whj+Tb09AMYgA9+TKhzhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728944106; x=1729548906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+F8Wk5+qlfD4SH77wzSsHRQd7jTKQOZnCdTsqCoNLCg=;
        b=QuvOXbRIqXIB1SOpsh0WVF9JF2kLdWEROjRrOufxog7DnRUlIdeCoXiHVzolisE5tI
         T8fVgumV28iqv+l8dEWlDsVMe+TeqIrRiex2j0jMsNLZfKn10iJcMCPpguyqqA0iKHcf
         nE76f4dc0VaFwSMPFuD6xGI/UpYWUmcPNz2RnnR5szx8OJ5Ur9/VOwInSNd7YiPt5MjN
         xUU/sb0wGzIxDbTDkA+6wZqD+Yt3SI/daaTziqdOSVGSx5bG3zE1t0yGhxGxQ7mqE7PL
         ZaBt7u1SevRXBtl+QJ4niERKnS0/vL0CLV2LmzbS66xG3ZqsU5gxxvREKW0ODtBhS8Ww
         paOw==
X-Gm-Message-State: AOJu0YyF0FkkJ8wccNIhDzh0+AQNsu5d5t2mq9nu0Ubk3UjAOPYcR3yQ
	3d2YwYVXfR/poxeuSo42OtksHq2TrM5kBQkf6acgOsq9QB823vy8Vj+2ZspR+Q==
X-Google-Smtp-Source: AGHT+IHv7cESfpCpyS6PnxJTZvgQAQzDSd3AaccIYVMFc1kqF5EmsZgaigriA5gF0G7b8ubtNZJqsA==
X-Received: by 2002:a05:6830:6a96:b0:710:efd5:f467 with SMTP id 46e09a7af769-717d6579104mr6852480a34.29.1728944105985;
        Mon, 14 Oct 2024 15:15:05 -0700 (PDT)
Received: from google.com (syn-076-182-240-212.res.spectrum.com. [76.182.240.212])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-717fba05069sm15866a34.34.2024.10.14.15.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 15:15:05 -0700 (PDT)
Date: Mon, 14 Oct 2024 22:15:03 +0000
From: Aseda Aboagye <aaboagye@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: Re: hid-input.c && vendor defined usage pages
Message-ID: <Zw2X50VzyzF4AyBT@google.com>
References: <ZvNaHt7ePvoUpgy8@google.com>
 <Zv1gKyTELpTngKIq@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zv1gKyTELpTngKIq@google.com>

On Wed, Oct 02, 2024 at 08:00:59AM -0700, Dmitry Torokhov wrote:
> Hi Aseda,
> 
> On Tue, Sep 24, 2024 at 07:32:30PM -0500, Aseda Aboagye wrote:
> > Perhaps this is a naive question, but why does `hidinput_configure_usage()` in
> > `hid-input.c` configure vendor defined usage pages? In actuality, it seems like
> > it's mainly handling some HP specific usage pages.  Why aren't those in some
> > `hid-hp.c` file that's selected by a kernel config?
> 
> It is simply a historic artefact. These usages were mapped way before we
> had HID sub-drivers and accompanying infrastructure.

Do you reckon that we're stuck with this behaviour now since migrating them
out, will likely break users who don't have the appropriate sub-drivers
selected in their kernel config?

Thanks,

-- 
Aseda Aboagye

