Return-Path: <linux-input+bounces-8647-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96ED69F5934
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2024 23:02:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36E921618CB
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2024 21:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A27F1DD54C;
	Tue, 17 Dec 2024 21:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VfWA7FlK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940A71F7580;
	Tue, 17 Dec 2024 21:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734472653; cv=none; b=J1MnsjKsf8uwk18zH/82A0kXRwIQrW5hTymAZjXs9sy/2ny8/oCuVD5KbU2Yee9ZKnE2UIeVj576GIuANgeYS9UbZnF6AmrhJjlrIAiOqbe+YZ5N/xK8ok8BAhBLzkwb3mcrzYT4tX6dg9vvFmCBwUKX6WpB4SeVvMuF/o+58LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734472653; c=relaxed/simple;
	bh=o2DAxFOLmhH5iI7idz3VqyE+vH3dWm4Ozl4EbPVAHMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jaTt3dzX6Y/ZGN2dM5wGDSM3P3EKQwqgBA2wmwfXy+jCocnZzPgUyZicVTR2fKmqofaYZxABQTZjWqIFPqlCl0UzdeQJ+Cq2oercLt5eManTcoHtF3AOyOPBED5xGYbD0blavEj4OgZ9smqFWfgon58Ero6DBhMdyvOXlZ4gpSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VfWA7FlK; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2166f1e589cso60566035ad.3;
        Tue, 17 Dec 2024 13:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734472651; x=1735077451; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uCAzFFc1CN+L8eKn2uMMGe75BaYA79nLCiwPBO4Wq5Q=;
        b=VfWA7FlKwC3RJgLUKrbVkrXiVuE6HwLjB33NrSP4pAlzVBuOPOyswT4CzUQN/1U4TD
         203RTo+b3C6KdYy9mWx9Fm7q999lVi/cTSKuBCtFNMUXlNsD47zeBPA0rwaOL9dMJk89
         zhn76Q+ywt044uYIKw2KFXyH2VVlEerd/ejBgZpUC3lgc9Nr+LZAN66k1q7ntEDS5/CQ
         XvI+z2F/3mHbSkiXEe6RhD8vOl/KHDkItv0fvJKaSXtbyo9sGKmcJCMnMifbOgMRyWx6
         DpVeX/hL5uMhT9cvUCY5b53HHNEbL1SAvws9pTeUL/dWCFWBNbW3yrbvLNeowWUi740N
         mqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734472651; x=1735077451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCAzFFc1CN+L8eKn2uMMGe75BaYA79nLCiwPBO4Wq5Q=;
        b=TXCfRn9lUTGlIx5v15lG3zuX8v/W9yXJ/PRyiAyqlZu3uLR2F69jXg0WzX7ZWkExQD
         p/n+S5FlGgkiXCTsQIqPb/lPByOAofHvt3qeWu3UFTsTWBC2AAPawx6IPz1M1SmLj7YW
         S2MslKTqJX1gzf9lUHzoPZ5xGxLDnwFvTZPfZlgpLfNJ1t45gn4Et8JLTb8Fv0GAfQLi
         vs71ArL98jrjkgcebYpZZ+Al3XirQ2wy0UvDmkmdcZIGH1Ze91r9Q/8ZYDD8mvGbPgPF
         4X9KBafUuIsh5RWzRMesVoTWj7tZq7icIa9ikaB6+iO+hwGS2NGjmxmLiroRDrt3GPDu
         lD6w==
X-Forwarded-Encrypted: i=1; AJvYcCXrGOFHswuBiofuZgWILTMTv17oA7xLgRi3Rjo4CtyykYDHaqqDfRqlAT89ivxu/OJsPObIi1m3Xr9yjg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+33QnMsqEQXisMi4280jSXtnTGa4MqpeZEebgrHTItAV+Qrt8
	XdPL5A3jhKLwE16lYASTioc/6PfiWITHNTVANbYB24sBkNi/UnDe7Bsxmw==
X-Gm-Gg: ASbGncsBNa8fxmv4VTg+M04c2iISebQgtOgyQU/3IB1ymfwPH9RLgTP8aLM4uKPIKyd
	Ou6SSPuFIrhmcNnCRSVIVkJXwcEw4Oy4Uezm4ZJ7d8kERU/Qj50rf0r0tWOrooZKiQ8TEO5C9lr
	sR1i6bZu4eUoJXcVlxZc3+SWdgCJk8SvwuJr1SXuOQ0/8TRpGPHnMCPkwNfSS689F39gaXGun9r
	lnbafy+uHTwDoeSErwH6GL+BCHg1TJSgZoDgj9ek5ubvpKZUQwighaJuw==
X-Google-Smtp-Source: AGHT+IEo4rQ8D/MFm1ugZzIutXNwJ8Fv8l1kOVMo59vJ8eesOM+YDl16xIkFCohBGyJ4n/UXlhCl6w==
X-Received: by 2002:a17:902:9f97:b0:216:5002:7341 with SMTP id d9443c01a7336-218d72622c8mr4872765ad.44.1734472650689;
        Tue, 17 Dec 2024 13:57:30 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:55e2:6799:5b4f:83ea])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1db7c82sm64409785ad.13.2024.12.17.13.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 13:57:30 -0800 (PST)
Date: Tue, 17 Dec 2024 13:57:27 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] [RFC] Input: remove evbug driver
Message-ID: <Z2HzxziYyF9-vxns@google.com>
References: <8n377s5p-3r9n-ro38-3r2o-p536745552qo@xreary.bet>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8n377s5p-3r9n-ro38-3r2o-p536745552qo@xreary.bet>

On Tue, Dec 17, 2024 at 11:47:39AM +0100, Jiri Kosina wrote:
> From: Jiri Kosina <jkosina@suse.com>
> 
> I've never heard of anyone having used this driver for debugging at least 
> in over past decade or so. Since we have tools like evtest, this driver 
> seems to be rather superficial.
> 
> Also, it apparently causes confusion among people who accidentaly enable 
> CONFIG_INPUT_EVBUG and are annoyed/confused by their kernel log being 
> spammed by a lot of useless data.
> 
> Let's just remove it.

Agree. Applied, thank you.

Interestingly:

dtor@dtor-ws:~/kernel/next $ git grep -i evbug
arch/arm/configs/davinci_all_defconfig:CONFIG_INPUT_EVBUG=m
arch/arm/configs/imx_v6_v7_defconfig:CONFIG_INPUT_EVBUG=m
arch/arm/configs/moxart_defconfig:CONFIG_INPUT_EVBUG=y
arch/arm/configs/omap1_defconfig:CONFIG_INPUT_EVBUG=y
arch/mips/configs/pic32mzda_defconfig:CONFIG_INPUT_EVBUG=m
arch/sh/configs/sh7785lcr_32bit_defconfig:CONFIG_INPUT_EVBUG=m
arch/sparc/configs/sparc32_defconfig:CONFIG_INPUT_EVBUG=m

I am curious why moxart and omap1 have it as 'y'. 

Thanks.

-- 
Dmitry

