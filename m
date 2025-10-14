Return-Path: <linux-input+bounces-15462-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE5CBD86F4
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 11:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABD1D421751
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 09:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E8472DCF7B;
	Tue, 14 Oct 2025 09:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y4yAha5o"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70BA2080C1;
	Tue, 14 Oct 2025 09:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760434144; cv=none; b=ZTMigkJ444sECNL66Yyw0CRsJ0d4My32VMX7vTrEPfdf/PR+PTqgj/uZflgSP4zfThHt/Mz9X6C893fTC/jQ+d2sYvT1sYifz7G03Dxg8VNA/coea4N7ZgVH+0dqH8U25LOh9lKcDOJtv5D4bPd+lr+OjVkZMI0YJ5xU7CvafK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760434144; c=relaxed/simple;
	bh=pJMD1Hn89peZZ+mtAaM/JR1s/K9uaXUSXiKyh6jsP2Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cj8H22q0755CSpkqS2VoR3AUXOZUnCGK2OQD+WPjZf0O9htTj71qX0p5NfwPwSW1eRSboK68PbY77JfNnQXbLDVe9xIKOBTbvUqrGrQIuhUex1AYBlfNfChC8yTeuzauJHj9DDS8D0goDBZgV69YZ0e5UBAU+1rDzbdG2r4usj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y4yAha5o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64173C4CEE7;
	Tue, 14 Oct 2025 09:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760434143;
	bh=pJMD1Hn89peZZ+mtAaM/JR1s/K9uaXUSXiKyh6jsP2Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Y4yAha5oEsooODK0m4Jow5FcdordhTPFMWPuSDIAc/a7Hxt6z5F2VXHYKGiZeTeAd
	 5wE59bV3pPS29I5iq8pzOFyliN/ZBNSuVbbfq3CJb6hNgl+qRazlAV3O+YWqPMRHzk
	 jtsn0DYyzFpGNuDBNy8eVGeLmct8lwXitYWz1ZW1eGCr5w/0PrxET2ZEK1uzy7Gww/
	 O/7j+kyvEzZNEsTuIgmOUUjt92CzqVCCS+F1CEnnFaDv3YODtvOXVFhFZgxTxHMfDc
	 Q4etrFA4EO9P58m7cME+XknUi5MZLHepDjktRt+lLty5mJ0olQBIRvhLm6RLaSFas/
	 Emxj5DMt06TTQ==
Date: Tue, 14 Oct 2025 11:29:01 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Even Xu <even.xu@intel.com>
cc: bentiss@kernel.org, srinivas.pandruvada@linux.intel.com, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Rui Zhang <rui1.zhang@intel.com>
Subject: Re: [PATCH] Hid: Intel-thc-hid: Intel-quickspi: switch first interrupt
 from level to edge detection
In-Reply-To: <20250919070939.223954-1-even.xu@intel.com>
Message-ID: <13o2s0so-nq3r-5909-4n2n-o97q2s35025n@xreary.bet>
References: <20250919070939.223954-1-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 19 Sep 2025, Even Xu wrote:

> The original implementation used level detection for the first interrupt
> after device reset to avoid potential interrupt line noise and missed
> interrupts during the initialization phase. However, this approach
> introduced unintended side effects when tested with certain touch panels,
> including:
>  - Delayed hardware interrupt response
>  - Multiple spurious interrupt triggers
> 
> Switching back to edge detection for the first interrupt resolves these
> issues while maintaining reliable interrupt handling.
> 
> Extensive testing across multiple platforms with touch panels from
> various vendors confirms this change introduces no regressions.
> 
> Fixes: 9d8d51735a3a ("HID: intel-thc-hid: intel-quickspi: Add HIDSPI protocol implementation")
> Tested-by: Rui Zhang <rui1.zhang@intel.com>
> Signed-off-by: Even Xu <even.xu@intel.com>

Applied to hid.git#for-6.18/upstream-fixes, thanks.

-- 
Jiri Kosina
SUSE Labs


