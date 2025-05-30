Return-Path: <linux-input+bounces-12672-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 548AFAC9803
	for <lists+linux-input@lfdr.de>; Sat, 31 May 2025 01:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E8729E2E5A
	for <lists+linux-input@lfdr.de>; Fri, 30 May 2025 23:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9533028C5C1;
	Fri, 30 May 2025 23:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nTxiw/O/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D7828C2C8;
	Fri, 30 May 2025 23:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748646771; cv=none; b=kaTZ5nlIbVONIX/EOQ1Loq/Hcp5L3rYpcJAbKD8vKpp4CBFe5K3R+BqV+9MMVvqWp3E5/wB5/C+nkv7rv1EDkfCvC9DVPS4S5C75zRhw2ku2YFzu6duVmnQsmE0J6/YxZfX1LAFlmJjTZ6ea3zU9/cYp/gY/LatMpmjDMTA97iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748646771; c=relaxed/simple;
	bh=nbrt/PGJxMyE3yw1a7SCXWcYovhnujWuWgoE4oy4YWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FgP2eV/pUw/dJZ4ng5xMOPc3tnAXRW3zMp0HxhRBwroNWIxVrLNa5jHmgeF8T3JeHwNSHTx1/iHOrj8+BxsJQB1af5VhxEyovIHRAGy0aL5psET2GYpXRgIL28kVfCsaWSmYEp+MB4lJ9x/VYJ1gz8ApKvIUoIToq+g1Qn9FiA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nTxiw/O/; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so2076316b3a.1;
        Fri, 30 May 2025 16:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748646769; x=1749251569; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MqUM//8SfQwKzGfaGh29crkUGUUF/A3WL9Up46EW+mM=;
        b=nTxiw/O/60ufTT5xKeRiwSFFDG1xGlJboOwudwglDcKyr+sFcKUa3u8mG388rzuy++
         tsjhU6kbLUPi5hxnEWAnCfF+A6buw88PPdK1YdBZhq4X6qJkv6J7yqUTR4uEa99JP0Hc
         jRrPXTaMcLFZiHG98H9CQwQkaID2uGjzD2FGOz2skkga4EjvJhyj1kBi42Whe7xM/jQh
         RPm/LOXsFbo9d8y8dCBn5wj93Efpb1KTWGFBmcYDTDHFGnWSqG7nQy1zHHWyI9M5RGjh
         ydC4CYbBYG3sYkxAGwpnLeSx4E997gtzgqRFtpLu6G3gkonI6guABrgdvyNabfsc9O+s
         SEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748646769; x=1749251569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqUM//8SfQwKzGfaGh29crkUGUUF/A3WL9Up46EW+mM=;
        b=MZkUHGPfmVP2UKLXUJmesfLgr1CK3VngepCV6ajUp5MtRf2GjEOb3K0qvwW3BoIVYY
         fzDdZePV0B0uv4T+GpUp++tbE7hNuWyHHFa10sWUXrtjAehBQS6LQ/uPptVn15WmWSH1
         pVqZxBmpoTnYBsuiCz6ukxeqZgVAihjpxj/kVjzGYA9yinBvHMz2T8OthFlOMhRDEGbT
         dgkgDzfZFaTvXit/rV/2b5/vd8wrHx/zX4mEznx8IWQfTQmupB0JAiApyWEgdo5z0q9Y
         KKhptNTkcWWVir8/KRZykszH408mvRs6baeGoJOEM05BfZbYSJVNVc+CQmvYxjQWIu91
         wkkg==
X-Forwarded-Encrypted: i=1; AJvYcCWr3wZhRL5Hqivljn4aEqBaydH8+D2KZk3BO/SrQx+HbJaMovpYXg2ozzqFGIa3C5E3Tcfz0KjHnApKzRVZ@vger.kernel.org, AJvYcCX/XSbzM8iVmIBCYR4BcEdeJylg01nGUpg8wcCoBQ7qfqVtPFUgq8Inbt0Svwu6vVMuKjm+uq8apKLyiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiJhDhW+QhWvMgHGIE/ibdr67mnB1+dw73tR4bGdwkvQpqRYlA
	VgLJ2jzdkpbvZ9x3WxWUWarl46gXCXOA0ykr2O4c9Bk6F3y2XORPI5fF
X-Gm-Gg: ASbGncsXW4DaMffFL5jgipcAPw/CLz1hrcxDHYO9jIgVIQ3e6SZ5d9C5iyKf0kT16fj
	wVf60e40Nmlw18wXQAveHEDyBGNfY56yLfGUR5SinbILsPJHtcBFtbd5n6U6fe0B/ivOGU6ZB21
	bXU9aKAEE8l+oNeKpAJEQkLskwQakj06dRwqhkY+CmGXw6x/C485EArrNADfgyFZfhe1lE6uHK8
	mxz9XTX5o6620avZvN2ef/K5ln9j9x7iSrIx1afaW/PAKRGbKgVszpwPuBmQSFWXLwh+2cffxDe
	4L/Gi8CrS+IG5MJF+dFfzeG4sWAtXElYq7LrI/ctcUIQ4sclbu64
X-Google-Smtp-Source: AGHT+IFHeyI9jVuPAyDeBaVv7nMJ1xnzkjCCEZ326DeO/nr42OA9VJ/9hB3rIhvTlv+eLYcNY/yLfQ==
X-Received: by 2002:a05:6a21:164e:b0:1fd:f4df:96ed with SMTP id adf61e73a8af0-21ad9764696mr7528449637.26.1748646769223;
        Fri, 30 May 2025 16:12:49 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:24e0:5639:ebc6:8c16])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affafb01sm3670106b3a.104.2025.05.30.16.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 16:12:48 -0700 (PDT)
Date: Fri, 30 May 2025 16:12:46 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Paul Cercueil <paul@crapouillou.net>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev, fabrice.gasnier@foss.st.com
Subject: Re: [PATCH v2 0/2] Input: gpio-keys - Fixes for interrupt callbacks
Message-ID: <ozixu2kocpxmtlh5mymdpm3hlovtvrepoedcu7gafqoxchcyjx@h5ajy7ujqye4>
References: <20250528-gpio_keys_preempt_rt-v2-0-3fc55a9c3619@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528-gpio_keys_preempt_rt-v2-0-3fc55a9c3619@foss.st.com>

On Wed, May 28, 2025 at 10:50:20AM +0200, Gatien Chevallier wrote:
> This patchset fixes a "BUG: sleeping function called from invalid
> context" when CFG_PREEMPT_RT is enabled and a possible concurrent access
> on button data between gpio_keys_irq_timer() and gpio_keys_irq_isr().
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>

Applied, thank you.

-- 
Dmitry

