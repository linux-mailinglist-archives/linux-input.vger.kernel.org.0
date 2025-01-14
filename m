Return-Path: <linux-input+bounces-9222-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CBEA101F7
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 09:24:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70CA27A42AF
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 08:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B2D02500D6;
	Tue, 14 Jan 2025 08:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p6O54MSF"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F952500CC;
	Tue, 14 Jan 2025 08:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736843086; cv=none; b=Mc+4WHzeGjnt4dhEw3+ccuSLryW1E9hcSBRQt0ekW0F26ctd3zL8VRZ4NOZDUdtt4oIG5TatZulsQgXPkO8pw/4ZoMO+yuJu0INaSq9i114WV977hXm6Dxs4s7jTTUG4MY6WxXwVYx446p5wC3FHBy718kRFdvt6GvPBKoBybbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736843086; c=relaxed/simple;
	bh=AnYVQkU1KXdOQycls8k/0dZBMC+HSBkidhPsB//77OE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=awAlUnUbAvqw87/kQtxVnsmxrweINhIbjpWo0s+MRLPmoGKHWdcj4FEJNwJpMSodPcWrQpTeVm55MB61j/0tAmBY9S91oIfNCKf+bt/7kWuSlSkAWEacPMugp7oQyQgxKjCUW2rT1Cnu3amKnl5ATA61z6qXbh1wgh5KZPpRd7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p6O54MSF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E13C4CEDD;
	Tue, 14 Jan 2025 08:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736843085;
	bh=AnYVQkU1KXdOQycls8k/0dZBMC+HSBkidhPsB//77OE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=p6O54MSFUAHowy+vj7/nkaObvIn1ywsqCLOMGKRqY7J6O1pqrqC2R4iwKCVyZmnzt
	 wPmV2b6dLlrYQRRc+KJK8bOAKB7WsE+j59NCgIj3tHk8pMCgSvOvFoxjiHe4xFTX5y
	 97gyYqedMR+pyDFJDnCRlZ38COu2fYsI2/EvTsJxAYmVxQoCYSLS5Be615lAJjHhrO
	 2aKRYpTW4pgwcAYXeFn5g10fhEAJNsk6oKkb+v2TGGL5ExTRJ3wBvyB/d2yFV2zFYl
	 T12pmC1EGFYbsII5BgsisDZobVr0Edg5TOauqMviiXf7+ZKtUsF9KNgmP3TsExD3p8
	 /MxDiU2OIwNDQ==
Date: Tue, 14 Jan 2025 09:24:42 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Even Xu <even.xu@intel.com>
cc: bentiss@kernel.org, srinivas.pandruvada@linux.intel.com, 
    mpearson-lenovo@squebb.ca, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH next] HID: intel-thc-hid: fix build errors in um mode
In-Reply-To: <20250114003712.3042688-1-even.xu@intel.com>
Message-ID: <08992rqn-5r94-ns0s-3641-46p927445op1@xreary.bet>
References: <20250114003712.3042688-1-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 14 Jan 2025, Even Xu wrote:

> Add dependency to ACPI to avoid acpi APIs missing in um mode.
> 
> Signed-off-by: Even Xu <even.xu@intel.com>
> Suggested-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501131826.sX2DubPG-lkp@intel.com

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


