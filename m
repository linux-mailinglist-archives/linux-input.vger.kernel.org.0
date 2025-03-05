Return-Path: <linux-input+bounces-10552-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B275A4F693
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 06:36:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 806AB188BACE
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 05:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED247192D97;
	Wed,  5 Mar 2025 05:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SBTY+qNX"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30272E336D;
	Wed,  5 Mar 2025 05:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741152977; cv=none; b=L4UWouXTjUPv+XPWzLZkk0IrPApvoAcfi8VQdt3uZdLiHB65YJhE/RwLpd4ui+56LXzkgALN9k9iu2JfTqEq/eOaMY6spjphWWzBHZlnulRcLX/YBaW+9rR3vSbSZAAb9sNk42BsYuhdmqXLX0It6ZUv1cCVUdKDXOzQPfkjsAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741152977; c=relaxed/simple;
	bh=tZP4YUw7nd/tn+RFskuM/HRZLjVtCMrW6UhnVbuKhp8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=vFYbxO2UC3c80hkAlnjsZ58hjSguF6cbEhBqywqSBzWaPspZBAxW8ghg7wEadEo5jU6HeJOGHgdZJ/EFLKzZge4yfLu9uan4X8+veEyMtaRAXp16pXtGt49kNQqGiGWv8WK16Jpr2JmQw5XN5NOMwMhqJcq7r1m8URkgpBd8jS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SBTY+qNX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF2AC4CEE2;
	Wed,  5 Mar 2025 05:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741152974;
	bh=tZP4YUw7nd/tn+RFskuM/HRZLjVtCMrW6UhnVbuKhp8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SBTY+qNXfAVIxBiuDjxsr0yMoI4ZpdD+kfpPTZd88o8ObmgNzGI1ylmc+WTtBpqAD
	 +oPoaRMC3uSoUrdikCNurl/gc9CPMxKVSwmtGSfiRP6aJyCqhcxOlcHTiMKVOyd339
	 Fu0De4I2hIwGGOItOD17F8dCa4MdO9bg6vjJ5uFtTiGlmnaBVkxrBKEiu1nIVsZtZJ
	 zClmbjSc/j5bPzmYxMHxJVtHIkXSFZwQY8q7TMaL/MdFH4lHbAP2lGCDrLWZTrpYZh
	 nxop0/TS7v4MG9tE1yem59EtiyhONXFR0RHTMdaXixGscTwi1fCwT2xtFCDNZ1SYWc
	 ABP3f2A9CFyww==
Date: Wed, 5 Mar 2025 06:36:11 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: "Xu, Even" <even.xu@intel.com>
cc: "bentiss@kernel.org" <bentiss@kernel.org>, 
    "srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>, 
    "mpearson-lenovo@squebb.ca" <mpearson-lenovo@squebb.ca>, 
    "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH RESEND v1] HID: Intel-thc-hid: Intel-quickspi: Correct
 device state after S4
In-Reply-To: <IA1PR11MB6098ECF413F5F4E8FD120B4EF4CB2@IA1PR11MB6098.namprd11.prod.outlook.com>
Message-ID: <68roqo71-3887-ro16-0qss-52q455sqoo1s@xreary.bet>
References: <20250304032255.1131067-1-even.xu@intel.com> <96qpo784-8r1o-sor7-p42q-q06n1p389913@xreary.bet> <IA1PR11MB6098ECF413F5F4E8FD120B4EF4CB2@IA1PR11MB6098.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 5 Mar 2025, Xu, Even wrote:

> > I'll now apply this as-is because the code is already in, but perhaps renaming the
> > flag to QUICKI2C_RESET would be in order.
> 
> Current patch is still needed, quickspi device init flow is: init -> 
> resetting -> reset -> enabled. Exiting code in pm restore() callback 
> takes reset operation and puts device into reset state, but forgets move 
> to enabled state after init flow is done.
>
> Thanks for your suggestion! Let me refine the patch in V2.

I have already applied your v1 patch to upstream-fixes queue so that it 
could go to Linus quickly, as an important functional fix.

So please base the naming fixup on top of that.

Thanks,

-- 
Jiri Kosina
SUSE Labs


