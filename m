Return-Path: <linux-input+bounces-12772-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C99AD42BA
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 21:16:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75B2E189F5B9
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 19:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414A2263C8F;
	Tue, 10 Jun 2025 19:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UJ9PQpPf"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C0B263C7F;
	Tue, 10 Jun 2025 19:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749582981; cv=none; b=QgGZhvntuwArSN+kpmI0a1cdhSiVKxQjCKq6rHJRZFR5lTBfT0JJkcZZMY8tMdfW48ScBiKnmAgVmiRuTb6+RSPcTGk+r/ffCOyg0xyGWjyjFc9L5otWS8Qbt+Oi1wr6kbPkdzxN1E2q0vfw9v4mK23B/C6UC4OOzzCPdp16S8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749582981; c=relaxed/simple;
	bh=mkKwahbE5Qvvx4u+CpirJQIlcNeEGC6NB9QujrczDhA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=TTUofTxU611qf5hQTRbZSHzy9x5STkCzSwvOlXQD10a7lF1hODUIAcFYIXlvclVryN957Fb2A/Mj1TWvvcbCzqjyJw86gykCc6r6LLBaaerR4T5+ostVqFU6WMRp/h/3NPy1ZhtMoPe/FjU36W3ZOwFPJKvkd3a3oLBpvRa37+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UJ9PQpPf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ABA7C4CEED;
	Tue, 10 Jun 2025 19:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749582979;
	bh=mkKwahbE5Qvvx4u+CpirJQIlcNeEGC6NB9QujrczDhA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UJ9PQpPfXLtKmIKOhDoHRUKnb5u5HGAmi9P6idJmdeHNtleK5RjCZk6W8Kyr29UFA
	 AklKnS6h+hgZ/G0vL8dgVaXnVvNdTGcrxkHYH9D3MPhxXHLC+wrqPsvxYN3M8jz879
	 +eRDqIV4IgMACN8LseHuiflhDjL7puuoosUjcrbe4MMBQb7PlrEdZpBeT/mVG249m/
	 55n590Ror+BZcOj35mQFIfcK5cW1m9N8mmkOSKOb8a6/MOtmgo+V5cfUO4e7Gn1HWz
	 q3eidz6jShyqEsP6PXSO6yc0il1q4+nUzNGGDhS1c6WJnSU0s5gd3e/5IYoXQC7xF6
	 meypE8TGMY4Tg==
Date: Tue, 10 Jun 2025 21:16:16 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Even Xu <even.xu@intel.com>
cc: bentiss@kernel.org, srinivas.pandruvada@linux.intel.com, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-doc@vger.kernel.org
Subject: Re: [PATCH v1 0/7] Add two new features for QuickI2C
In-Reply-To: <20250514061944.125857-1-even.xu@intel.com>
Message-ID: <39sr91o4-62ns-p7rn-4026-4o46q87878oq@xreary.bet>
References: <20250514061944.125857-1-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 14 May 2025, Even Xu wrote:

> In order to improve THC compatibility with lagacy HIDI2C touch device,
> on Panther lake (PTL) platform, THC hardware introduces two new features
> for I2C subsystem:
> - Input max input size control
> - Input interrupt delay
> 
> This patch set adds APIs for above two features' setting and enabling
> in THC hardware layer driver, and enable them in QuickI2C driver.
> 
> Even Xu (7):
>   HID: Intel-thc-hid: Intel-thc: Add thc_dma_content into kernel doc
>   HID: Intel-thc-hid: Intel-thc: Refine code comments
>   HID: Intel-thc-hid: Intel-thc: Introduce max input size control
>   HID: Intel-thc-hid: Intel-thc: Introduce interrupt delay control
>   HID: Intel-thc-hid: Intel-quicki2c: Refine code comments
>   HID: Intel-thc-hid: Intel-quicki2c: Add driver data support
>   HID: Intel-thc-hid: Intel-quicki2c: Add two new features to PTL

Now queued in hid.git#for-6.17/intel-thc. Thanks,

-- 
Jiri Kosina
SUSE Labs


