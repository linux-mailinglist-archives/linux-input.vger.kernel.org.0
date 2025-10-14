Return-Path: <linux-input+bounces-15461-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B068BBD86EE
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 11:27:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5C80D351CEC
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 09:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 275682E5D2A;
	Tue, 14 Oct 2025 09:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D5Xx93bt"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C492DCF6B;
	Tue, 14 Oct 2025 09:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760434056; cv=none; b=JP/dHN9spHUP665/q14Fbg+WE+O8JdNl81KzO3jrjFLAgCcLKJIFOyzwQsvwZ6n62GVbeTorD0A5CDJqozh33KUV/miMIa7ryNw+DD7IsfKRUdpDxTG3yOfl+sXCgPl0Qej/4Nr/Mb3t0NEGYIWjSTu9ysqJqcuv7ukj6t/KkqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760434056; c=relaxed/simple;
	bh=RZQAsmOMMg41pdQsZ6dTV2IUjsNDb8CKMzlSCflj2n8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=EALc3/aXIOD4UK1UYVn3nLj60+Rn5ZnvBH0QYxy99rXSHYsayDCbH8U+fNH+VAPG82ZYROmZXlUjqDtNqTnm0RejJuXY7vcImcR78aLBEubd5opGbVx0Af+vicimYmxB08NeuUtrZ43H8AD/vv50dW1EKa+J3fBN7se0AFmwUUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D5Xx93bt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A6EC4CEE7;
	Tue, 14 Oct 2025 09:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760434055;
	bh=RZQAsmOMMg41pdQsZ6dTV2IUjsNDb8CKMzlSCflj2n8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=D5Xx93btsixS50gQrKveGsSHnpLTj2f6DpRDiC0/WX1y8rij0/rPpZXYCUAEah3uY
	 70l3+zYahKAWH6TmIRuR596RpFib7L6RxqN04097XWvUt6D7NqA+mZ36orKsbftxSE
	 01yyW0l4Nj/OkM9LRlKHqdDh6edsy6xu1ZBmOSOEoyFx5SGOEuPYWEPeAjalloGYzW
	 AekLxdxKxO0ml8pLxGY6JCbc1vGLFP2EhjDX9JauFShX1feuhA1AMfiwruQqUUZPdy
	 pZs8NzxcQeHa2buesDC1VBI2k3hf2G09s6vTdRD7WPJSaPd8OA/1tnT7jaSIYR3S1d
	 5A5Y+9Mcc8E0A==
Date: Tue, 14 Oct 2025 11:27:32 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Xinpeng Sun <xinpeng.sun@intel.com>
cc: bentiss@kernel.org, srinivas.pandruvada@linux.intel.com, even.xu@intel.com, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] HID: intel-thc-hid: intel-quicki2c: Fix wrong type
 casting
In-Reply-To: <20251009033108.1212471-1-xinpeng.sun@intel.com>
Message-ID: <rr345r6p-3sr8-so4r-5r5o-0pq0o033057p@xreary.bet>
References: <20251009033108.1212471-1-xinpeng.sun@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 9 Oct 2025, Xinpeng Sun wrote:

> The type definition of qcdev->i2c_max_frame_size is already
> u32, so remove the unnecessary type casting le16_to_cpu.
> 
> Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202509280841.pxmgBzKW-lkp@intel.com/

Applied to hid.git#for-6.18/upstream-fixes, thanks.

-- 
Jiri Kosina
SUSE Labs


