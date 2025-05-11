Return-Path: <linux-input+bounces-12259-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45189AB26C5
	for <lists+linux-input@lfdr.de>; Sun, 11 May 2025 07:27:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B07D7189665E
	for <lists+linux-input@lfdr.de>; Sun, 11 May 2025 05:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C83214F9F9;
	Sun, 11 May 2025 05:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DjnTpRwU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2930C3D6F;
	Sun, 11 May 2025 05:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746941232; cv=none; b=sGAk18IzsoKfbQi9lf8iKul3OvCueGiunI7GQtD+V4eXmCTuuDxpdWa4ehDzfDbpUYrFN3d/BFI7Ur6KtoFb+fDGI8QEh6HTxs2n4x/FGa5HjQCdNgKQBez9K1z8/Egvo0jH6FR7K4cbOtXhy9TUQpOmxbBTsyubmwjkUgAbP5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746941232; c=relaxed/simple;
	bh=1BIAru3L3cWj8NXER210rd62F9sl7nWmGALuniK0oZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c/ZqyShTtxe6iRN3L+KrzyMShmkR8R16WxX+Zj2E7PZRyUD4owvQHTOz9fgNWHMDL6k5jAkAOIFeajWaxcCo67xfJ9/0x+BrdNhMHiV6TaDJ4AC2h6zHM+zCs3EEn19toLNrXuYsNYs8z3kmvbAEpuVvxcXULbgzJKIQm/y2BCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DjnTpRwU; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-30aa79ee726so3315867a91.2;
        Sat, 10 May 2025 22:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746941230; x=1747546030; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nVdzlfBr8H14X/I6iAD1wbdO7tVeDWK9yW3UjkKQ9bI=;
        b=DjnTpRwUROl4saD6Pm61D2LemrxFHP/V+nn/0myL1R+MNgDGHPck1XtYaI1ikw9cMZ
         h0RbT5C07fyVTIW1XxCOkPQOviksJWqOE8Fw6mFQZhoBhuQY4hD6o3vEQmKBvBcijBJW
         tuZQgZuNAmQVp1tHtNl+37q+JEfb0DwR6YwsXcwvy2aoDhtxptqH1eH1WSyB46C3o64j
         te7QN6rcbN6pwu+04QWZ2dmZK50+Uox1NJJ6GyIjnSXjlZ/dNsRXWlqem4bSIqx4RNGg
         fuL93A9PZnvuR3NZXI/Rv3Nskkn91GbCKQCnZNJOy1LaAx0NMNh9NBsmGif8NosFgw94
         hn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746941230; x=1747546030;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVdzlfBr8H14X/I6iAD1wbdO7tVeDWK9yW3UjkKQ9bI=;
        b=ECZBV8hOCkzeJTb2kKx6OngWOFwLiVr1aHWcnhCJbvtKKo82o39AjNBTHU8lGd3u7e
         fX4Gc0jFEH5QHMyAMC5gM87KkJ8jl1hbqPRuxg4LkSGBAIChTUHe9793vDCjQwZbAQp8
         rwj/ftowwqpDFVS8iGjG+eLtJgEVhCtdUSs80k821vXKHB5XZWAvEYtaYC9XTDwOoG0r
         7K15681v2coa6c/6XgmX0zk+R+jNuq+7OQoO0rKAZO8peHLURwabQS2ZZDfl+Hy2LymK
         IyDeBOb4NytvGECnvergfiX3R/7tofWgSXVF48AGY00TBX4kQa0vz+eg/asJNy1gS0N3
         fXCw==
X-Forwarded-Encrypted: i=1; AJvYcCWDqeqKulWCG0Ae2uC7fkA3a9gFiXDQ9AXO1+E3Gd8eTPrSwa+0Cfcw2QbhSfhuwC9ptVgOUoPCPGyPQZU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz96dLXIXfupcdPRCKRXWPgpz/wSjsmJfB5a+Kiw5aDZc6bZZSc
	XMKElFNHcu6MRNcUTGclI2yqHhD7FT8xkU8taMFtbH6E+sLaypuf
X-Gm-Gg: ASbGncugYkt3KwUenFNLZ4nVnePs26qdTXnF6QgY1AYcvObeJIWw/uVs76o+6IDG17q
	y/gmtTy6WqfblSrMOEAq3FtAeA+yV+NfOVn3v3WgR7RpPQcsKFieOwsFvTqdWCWOAJw61BrbPOD
	//ic+v9l7arvvnso1htiFIR4U6m0TU1vVCBO2/fHX9NN0FkSHGLs9u5ZH6o5eEoGHTdIuDTV8zf
	7cmMkhqoISDYo3HsLniocBx0VyfT4mvMBq3kXG5WdrU8755y4An3TX/OdB4lv4shA3DKirj6w/H
	jCPoCfnoEcrdDI3FHl+0GBtPAn+Sy5BXHsq6z5CJ5BVhHRt+FKUk
X-Google-Smtp-Source: AGHT+IHHQt90d2yX7gle8ojJiCXMULxnVDnE7q1j/LdZM4gt8y728Hl6+KAUG1doFvEhfF64F+L+/A==
X-Received: by 2002:a17:90b:3848:b0:2ee:863e:9ffc with SMTP id 98e67ed59e1d1-30c3d3eb442mr11905729a91.21.1746941230104;
        Sat, 10 May 2025 22:27:10 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:81cd:844c:3bd7:4808])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad483ffeasm6605992a91.2.2025.05.10.22.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 22:27:09 -0700 (PDT)
Date: Sat, 10 May 2025 22:27:07 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: hisi_powerkey: Enable system-wakeup for s2idle
Message-ID: <mrahew5lvu6ekb2i47rwfaxbnk7kjpggidjelyqaqt6niqyzza@mntljqynlwlz>
References: <20250306115021.797426-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306115021.797426-1-ulf.hansson@linaro.org>

On Thu, Mar 06, 2025 at 12:50:21PM +0100, Ulf Hansson wrote:
> To wake up the system from s2idle when pressing the power-button, let's
> convert from using pm_wakeup_event() to pm_wakeup_dev_event(), as it allows
> us to specify the "hard" in-parameter, which needs to be set for s2idle.
> 
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Applied, thank you.

-- 
Dmitry

