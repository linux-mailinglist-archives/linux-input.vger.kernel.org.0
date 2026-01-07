Return-Path: <linux-input+bounces-16828-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4815CCFE562
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 15:37:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B47923047AF1
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 14:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3F4234B185;
	Wed,  7 Jan 2026 14:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e144dARk"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD2334AB1E;
	Wed,  7 Jan 2026 14:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767795991; cv=none; b=qCBTqDPuqnNDyGXd7r3dEXtnX/WcYSgYC+VfE7ssPUS0a8zENqjLQC8qOTnugRim+u075aiyf/YpxiSmVk/yhcL4N4GgwLgzinYbgcIoAVJBqVeq0HQXsbyU41+xCjPZxzLyf6pQ9hfUea0mOkRWqyHPGZmikbhXfOnRBSddOQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767795991; c=relaxed/simple;
	bh=DA4VF/B5wYbC79v+FE98eCVe0mLCt4s7e/29h1Us1UA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=blCZ8Q2z6Vu6aJf8eUec5hGKmered1S0eQnBgL0EZ0CWSaUm/eTBx4l/z7b2GgTxIU2FmsHCrUULJHyyMpkemS+lZZ6LQ8M78nGCCgTwGDPzceVrh3Ty6ZoSX1AJHo2xkAY7ifyEDPr7oFZ0pJgYDAQK79ORkIL061gv1Vg4kJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e144dARk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26622C19421;
	Wed,  7 Jan 2026 14:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767795991;
	bh=DA4VF/B5wYbC79v+FE98eCVe0mLCt4s7e/29h1Us1UA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=e144dARkiaiElwA1geUf4Ekl6rvrQM/hrtuU257hmc5ip01pVkVHVC6s/kGfU0YqK
	 oHDSvd6mVPfuJTVpTbLhNL1fXGQsXTL+F3QPLb9OJlEyF6F3g6mEjb1TVSy1kYYxZM
	 weYH4hZxgBO8VUeHju9e3jxOTpc5vyRd4SQZYh2292V3yTEBK8ueI9wAj8s21gAqHg
	 IjiyFRL4ICKFkX5bPWBqP5NGngVTHXB248Bd+8yg0iwWJvYMQtofxk52YwAdfl/B9O
	 hQvtMX2xSpCbhqq9nrgecxFmKgWIflas+9kVF/Pe0ZNJTGexRiDsRqp/oIP6+cDE2u
	 b6CjyqoQEOGdg==
From: Benjamin Tissoires <bentiss@kernel.org>
To: jikos@kernel.org, Even Xu <even.xu@intel.com>
Cc: srinivas.pandruvada@linux.intel.com, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rui Zhang <rui1.zhang@intel.com>
In-Reply-To: <20251226033953.3651688-1-even.xu@intel.com>
References: <20251226033953.3651688-1-even.xu@intel.com>
Subject: Re: [PATCH] HID: Intel-thc-hid: Intel-thc: Add safety check for
 reading DMA buffer
Message-Id: <176779598988.3426536.7111454384644387553.b4-ty@kernel.org>
Date: Wed, 07 Jan 2026 15:26:29 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev

On Fri, 26 Dec 2025 11:39:53 +0800, Even Xu wrote:
> Add DMA buffer readiness check before reading DMA buffer to avoid
> unexpected NULL pointer accessing.
> 
> 

Applied to hid/hid.git (for-6.19/upstream-fixes), thanks!

[1/1] HID: Intel-thc-hid: Intel-thc: Add safety check for reading DMA buffer
      https://git.kernel.org/hid/hid/c/a9a917998d17

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


