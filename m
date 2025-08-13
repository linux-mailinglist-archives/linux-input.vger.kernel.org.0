Return-Path: <linux-input+bounces-13970-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8FBB248F8
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 13:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3BA7561D9C
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 11:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E21D72F7441;
	Wed, 13 Aug 2025 11:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZMInV3YL"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB20425C80D;
	Wed, 13 Aug 2025 11:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755086219; cv=none; b=Pum3+TR47Q7Wh8I7Th3aOyeTopTsZuLUN3K4tHQZtJC8rsubSSdhfnnpeOkQVWDAQ3VC+Ly2b/nDlDLvmskotSRsHEVvg9QhzttCPjxz1lVyqbSp/IIpSwddWoaa7MI7mza/Dg+Wct0VAVWEpXlyYDPPeBXxS8hYrZ5y9OQyzcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755086219; c=relaxed/simple;
	bh=ic9jYHlvqW8X8XkbQZo0JxtF8yPI5ARNOFOn8sDThMg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JBOM6FuVmorJAi6YuIimZE9edsUH8uRXLwZ3LcepvxN8igNz/QAaiVg11OV8+HrH0+tRdUAxS0/Z6l6fmMHrnHjl6mPwswzSMJoQAZZfb4R+cCkEYO2nBL+xcC/aYSrTXunu8rYRbZyVABniG7x0w4JSg31TWjWADH17ZUPhuZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZMInV3YL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE6A1C4CEEB;
	Wed, 13 Aug 2025 11:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755086219;
	bh=ic9jYHlvqW8X8XkbQZo0JxtF8yPI5ARNOFOn8sDThMg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZMInV3YLOEXDfpAP4yhaBPXMMU+vb9n1FbOoQOaCGtb1rcsI077fkq8a7u+x94zcY
	 N3k+GPyE9FcnmRwPOrna7smkgYqjr3U91cpcQcAlTPI3tLglEgt3Xq3Ql+VABnayhu
	 Ox4DFKkI1Rk45EBFZcu0F0skbMz2cSA9/NEPEhFfPvubfOZ3Ft/PvqgOygVQSChoUz
	 fEMCjna65+dHvxF3TQOBneu1afFNG3JzwkMMvM4SybOp5FsMf6pCnYXfdgs9XCczDl
	 lzZ8oxGbbEtkVTXJVwx8dJBpX94OULxpJa0lel9/8E4vMyOYbY9bMC9u52vA5CCLeT
	 YDdTSY0lEAwWQ==
Date: Wed, 13 Aug 2025 13:56:56 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Even Xu <even.xu@intel.com>
cc: bentiss@kernel.org, srinivas.pandruvada@linux.intel.com, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Rui Zhang <rui1.zhang@intel.com>
Subject: Re: [PATCH] Hid: Intel-thc-hid: Intel-quicki2c: Enhance driver
 re-install flow
In-Reply-To: <20250806002332.1487447-1-even.xu@intel.com>
Message-ID: <8pss6rqp-9n14-980o-8s72-39ss0q0s9o58@xreary.bet>
References: <20250806002332.1487447-1-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 Aug 2025, Even Xu wrote:

> After driver module is removed and during re-install stage, if there
> is continueous user touching on the screen, it is a risk impacting
> THC hardware initialization which causes driver installation failure.
> 
> This patch enhances this flow by quiescing the external touch
> interrupt after driver is removed which keeps THC hardware
> ignore external interrupt during this remove and re-install stage.
> 
> Signed-off-by: Even Xu <even.xu@intel.com>
> Tested-by: Rui Zhang <rui1.zhang@intel.com>
> Fixes: 66b59bfce6d9 ("HID: intel-thc-hid: intel-quicki2c: Complete THC QuickI2C driver")

(please use the uppercase/lowercase in shortlog consistently with how HID 
subsystem has been using it ... I've fixed that manually for this one).

Applied to hid.git#for-6.17/upstream-fixes, thanks.

-- 
Jiri Kosina
SUSE Labs


