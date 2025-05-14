Return-Path: <linux-input+bounces-12374-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F28AB7954
	for <lists+linux-input@lfdr.de>; Thu, 15 May 2025 01:11:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B02E43A7C14
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 23:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A58F2248AE;
	Wed, 14 May 2025 23:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkN4L4dB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A485120E6E7
	for <linux-input@vger.kernel.org>; Wed, 14 May 2025 23:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747264290; cv=none; b=od2eip71ECYKvmZXGai+q9ZoKyqhaKoBh0SbDQg3mEpMdyjUNjJ5zdx5nZqazBtR0fFP4wCgFnvk6idy8iWhY7HidQTmxFT9/bCAdWnBoZods0JluE095HZe6OeHDZ0YKoOu3Y64mImmjsHjxW/JGdhfqlAnGAoCOzN1VHAj1C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747264290; c=relaxed/simple;
	bh=EhQJKGBc/wQ9RlYsWrn5g8l04LK5V8su+l2esc5L1DI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lDzSiAEJzWu6qTCaF48NP/vx54R5MUDx+M2/bDX/BXIWbQXSobHqqsulF/eciSuTE1+pkjgRkjpvrcjuPGWRfArfKIeEN8QlMZqvgLF2F1LJfMxZjBmMEPbgW3nI1pwXO/9F4dtl013wKNUnqRzbmlyXw1P3Bhqj29lfW7lpPSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkN4L4dB; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-30a8c929220so366477a91.0
        for <linux-input@vger.kernel.org>; Wed, 14 May 2025 16:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747264288; x=1747869088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GrvXFycPtaWhv/nvpAUDbbFrKzXMOqTdRuQheK9oatY=;
        b=hkN4L4dB563WHzvj8cdi2EgmY4rjWydZHJkFdN4jlbuUJIlBCu6GC1puvJeaxrZdzO
         d/D0NtovWvNZwY+OUxZf4ZxEX6tchKCcBYO7SSFtGM3ZMegBcjEUO1gYcy6T9w62s6dg
         i2j1ainlEmlwYkIv5472j0FbuR0brmz+cMZcC5IPjSy56CgP39qnB5Q62b8h4Dg8hdHq
         asF79A3Rv9EJ3PR+ar3RTnKzhTB19TIYkhI69rf/eKDifwUZYrCJi5xSJv7M5wRgVgSA
         xRGacuXdyHhJjvnYT4DBsfxgu4427qPNwI+Rytnyi0GX3JwEeO8bKCGAoIEiD4iX6W/3
         q2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747264288; x=1747869088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GrvXFycPtaWhv/nvpAUDbbFrKzXMOqTdRuQheK9oatY=;
        b=iH6GfpcnnujkuOsSFYDm4NMIOBg6jrC/nuWPAJs/K78Q2Q6OpatX4MfcxX4NRSxVMj
         BPhwBbgSi9CufX8N8KGewoqYDNy54JjfAP+DVY/CUX1iObSvXHM6a+8QvbcI9C4Cx/WN
         VJK/ThXbkYbWR2/ABeKLI53qxIakTN2riLL7JD1MbtwFodCLhfii3F2WpRBGl/D9HFFn
         HxjmHnxPBUJ1yguWInJ3x/59KlNoFsIWrdRajivSLJh3pQqkDEGwhluv8eKW380AZZl3
         WVl1TFQ/7rRKQrCs1i0n9ZDHvkcsFbY+By0v7E7ozjnEhmrBcthgurBA4xEwedMD2lBF
         Kb9Q==
X-Gm-Message-State: AOJu0YweFFGqTLv8LYXpzt3vzUf9bobTpThk8DKNiF5phvtXK+Gc1fTW
	9X7BNtS5QPaTK7c8v69vVrFaiH1io+j5zopVmyH0FLAXanlB25nu
X-Gm-Gg: ASbGncsE9LEx6Lzkodk8ax81wfE8noGi+9WSxj6qrmCk4twRw6JGyiwNFegHLsd9jqu
	OYIuesyyp+JZwZQKEVwZ+Y1ybactmVh+LCpxVCPCiIabZIS42Teq1J4FCIrdMd8o7dhJeKxJ2DD
	KDLhH28D7EoCKDlgS/OtArFVjPen+DZNZnNjlKv63QUAvpbl2kgOIs60TOMcNcbGZ0QHCRlhhLY
	pcA01mAqhirq6czFWPGSc7IANyOY9C8z3btJsUnrdRbVW9ZCcqSBII+vWe6GsZpUDmnoNSQL4rk
	PnwvosZTZ2uDDnO/CcpXGFW7oKIBQoMnF18hZ/RqN3/IcVX4WXLZc9wTpvDcygQ=
X-Google-Smtp-Source: AGHT+IHyk5pUkUeH/AxEycL9kxFEad893bEtwW5b0qag02wmmXQ0kTZQddSbVjkZBb4LGl078e/RGg==
X-Received: by 2002:a17:90b:2e52:b0:2ff:62f8:9a12 with SMTP id 98e67ed59e1d1-30e2e62aa0amr6956161a91.23.1747264287658;
        Wed, 14 May 2025 16:11:27 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:e5c0:a508:c1fe:736c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e3349cea9sm2310521a91.42.2025.05.14.16.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 16:11:27 -0700 (PDT)
Date: Wed, 14 May 2025 16:11:24 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Vicki Pfau <vi@endrift.com>
Cc: linux-input@vger.kernel.org
Subject: Re: [PATCH v2] Input: xpad - Add more controllers
Message-ID: <b57fpts7j3ulz7umbnisppgm56z5d4mwsz6xvukwefglhf6j3e@tdykp5u3djsm>
References: <20250513225950.2719387-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513225950.2719387-1-vi@endrift.com>

Hi Vicki,

On Tue, May 13, 2025 at 03:59:48PM -0700, Vicki Pfau wrote:
> Adds support for a revision of the Turtle Beach Recon Wired Controller, the
> Turtle Beach Stealth Ultra, and the PowerA Wired Controller.

Are any of these depend on your patch 3/4 extending which controllers we
send init packets for?

Thanks.

-- 
Dmitry

