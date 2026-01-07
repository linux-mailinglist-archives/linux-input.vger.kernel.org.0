Return-Path: <linux-input+bounces-16827-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BBBCFE538
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 15:36:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 513143002BA9
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 14:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4312734AAFC;
	Wed,  7 Jan 2026 14:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nhukg1Pb"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAC534A777;
	Wed,  7 Jan 2026 14:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767795990; cv=none; b=Z6Hb9olEr+fgt0TNyCbJtFhF57yDQsV0CB4o05LDAj6Y/v/vj6FSkeB3jR4eJRANK8tJtfSK4O50xs4scPj31IEqP/XuEGW4j7OKwJ626oNFzAaHtBvwwwIbisPO0KNYwTUNPJjPyhM5LGr7jKgTAimtitAHtcu5Axc4kF0epu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767795990; c=relaxed/simple;
	bh=BxvBixM29Fc9BQrz+lXjcvrRyozVHS1QJfKqOctX8ow=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bRaErBwOktIJz/odgzJL0z5+4zeosj7jBBIdenk0FhWc4RoG26xG+sGDhChFuUPzHeb/Htqeaf5TvSu14+CN3anzKUnaruw9BkzHhIDu+iin0ChL1B2icZWFsrn92hg5kh/8VRy1SvJjStbh0Z1a5G/u1ZDcMk9SYYlg2ikNO/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nhukg1Pb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78AE8C4CEF7;
	Wed,  7 Jan 2026 14:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767795989;
	bh=BxvBixM29Fc9BQrz+lXjcvrRyozVHS1QJfKqOctX8ow=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nhukg1PbPr+kjfUVfoDu1OtN0ld+Lb8nc96coTa2LWZt/1ZuxE86T7Zmz3cHcJAtS
	 Uh4sRymYcL/K17DkbDS6EbdrYx1EcRZ04FEeKwfYfSioQqpU47vjqQciL8wcx3PSsz
	 8dbj6BnLdPlYvwdcHyjbLV6bXha361Z7L6msa5vWnmSTBjGjVI4IA7XGD2zTMl8sdS
	 AcXSFC//m9pdhEyRCSYyjgwJuSQr5wn/Gq+wn5i42YZlm35QB+HE6g96+lHSVQIt76
	 FuroenczKxDLXHNFAumncew8Pz1fM/X/HiAxZWgFXyfkvKC6puV7r6Nabr7QvdKeT1
	 GRkkL7e2fINkg==
From: Benjamin Tissoires <bentiss@kernel.org>
To: Tim Zimmermann <tim@linux4.de>
Cc: Even Xu <even.xu@intel.com>, Xinpeng Sun <xinpeng.sun@intel.com>, 
 Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251128075426.628500-1-tim@linux4.de>
References: <20251128075426.628500-1-tim@linux4.de>
Subject: Re: [PATCH] hid: intel-thc-hid: Select SGL_ALLOC
Message-Id: <176779598822.3426536.9876451982754645728.b4-ty@kernel.org>
Date: Wed, 07 Jan 2026 15:26:28 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev

On Fri, 28 Nov 2025 08:54:22 +0100, Tim Zimmermann wrote:
> intel-thc-dma.c uses sgl_alloc() resulting in a build failure if CONFIG_SGL_ALLOC is not enabled
> 
> 

Applied to hid/hid.git (for-6.19/upstream-fixes), thanks!

[1/1] hid: intel-thc-hid: Select SGL_ALLOC
      https://git.kernel.org/hid/hid/c/dd76788f9ec4

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


