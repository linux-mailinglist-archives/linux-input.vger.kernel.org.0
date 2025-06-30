Return-Path: <linux-input+bounces-13243-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31274AEE806
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 22:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C5E417FE90
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 20:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3291F583A;
	Mon, 30 Jun 2025 20:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="Q1WtwZb8"
X-Original-To: linux-input@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 685781B87F0;
	Mon, 30 Jun 2025 20:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751314728; cv=none; b=GBpZFjBO8ek9Vqdq539Ur+/UW7XSJQMKmnqdd+tPnSylmQzTeHeQFqTESJ8z7xYterWHQCwQN7mMN8IQS2kThOJ5oOboO7t6zi28d8wxwwyl/GAiZYGaDCzo/s2IrwwX+fj8wmOvYmI2PTfku6jkD1Q17pwwT09D57Ty0eFBICg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751314728; c=relaxed/simple;
	bh=eYoPCv26BZhs2vQSuqUEgy4rFDDGY1Mq39elidL1o9c=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XeT3asNVSkZyQG2/eSVQRPvAp6s2JmwMNXH3QJzVnOkIprGlINTNjMigJlpY9wrykWX05pu8JAUsbRuw5H4232W+Ymtc/ePnQ+rBf9M80BQTLWz4JBWkFo/qmfF5wPfsMZYx2AvwDzgaE/DfF1MsUfQlfKOzRBGzZTnWsFvfRdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=Q1WtwZb8; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [100.65.217.140] (unknown [20.236.10.163])
	by linux.microsoft.com (Postfix) with ESMTPSA id 609F9201A4D4;
	Mon, 30 Jun 2025 13:18:41 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 609F9201A4D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1751314721;
	bh=OYVx5tw+fe13imVYo7TA01cwwd+U7WHshA4ZukKJRgc=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=Q1WtwZb8XoSmpH21gIaN1FdHF7ovSnxS++5F+tmAybOCqyLbn4yqrXqcp9eNqUu30
	 ZmeHxa6p5dO8z+ALfs5GquJvs14UL/3SZ2si0ijJUnVDyuTKr0DSWti1knAsQ5E0es
	 OLJLUEoU439jYz52/tWcmPBMyZ6tm5wlTGrfKPYE=
Message-ID: <41f3cc74-694e-41be-b767-20c7561990b8@linux.microsoft.com>
Date: Mon, 30 Jun 2025 13:18:40 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 eahariha@linux.microsoft.com, kernel@collabora.com,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] Input: mtk-pmic-keys: Fix null pointer dereference when
 no compatible data
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
References: <20250630-mtk-pmic-keys-fix-crash-v1-1-e47351fa9d1f@collabora.com>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <20250630-mtk-pmic-keys-fix-crash-v1-1-e47351fa9d1f@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/30/2025 7:03 AM, Louis-Alexis Eyraud wrote:
> In mtk_pmic_keys_probe function, the of_match_device function is
> called to retrieve the compatible platform device info but its return
> data pointer is not checked. It can lead to a null pointer deference
> later when accessing the data field, if of_match_device returned a null
> pointer. So, add a pointer check after calling of_match_device function
> and return an EINVAL error in null case.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
> This patch fixes a NULL pointer dereference that occurs during the
> mtk_pmic_keys driver probe and observed at least on Mediatek Genio
> 1200-EVK board with a kernel based on linux-next (tag: 20250630),
> when it is configured to have mtk_pmic_keys driver as builtin
> (CONFIG_KEYBOARD_MTK_PMIC=y):
> ```
> Unable to handle kernel NULL pointer dereference at virtual address
>   00000000000000c0
> Mem abort info:
>   ESR = 0x0000000096000004
>   EC = 0x25: DABT (current EL), IL = 32 bits
>   SET = 0, FnV = 0
>   EA = 0, S1PTW = 0
>   FSC = 0x04: level 0 translation fault
> Data abort info:
>   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
>   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [00000000000000c0] user address but active_mm is swapper
> Internal error: Oops: 0000000096000004 [#1]  SMP
> Modules linked in:
> CPU: 4 UID: 0 PID: 1 Comm: swapper/0 Not tainted 
>   6.16.0-rc4-next-20250630-00001-gea99c662a089 #145 PREEMPT 
> Hardware name: MediaTek Genio 1200 EVK-P1V2-EMMC (DT)
> pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : mtk_pmic_keys_probe+0x94/0x500
> lr : mtk_pmic_keys_probe+0x78/0x500
> sp : ffff80008275bb30
> x29: ffff80008275bb70 x28: ffff80008202bbb0 x27: ffff800081df00b0
> x26: ffff800081ef9060 x25: ffff0000c6fcf400 x24: 0000000000000000
> x23: 0000000000000000 x22: ffff0000c6fcf410 x21: ffff0000c09f8480
> x20: ffff0000c09f4b80 x19: 0000000000000000 x18: 00000000ffffffff
> x17: ffff8000824cb228 x16: 00000000d7fcbc9e x15: ffff0000c0a2b274
> x14: ffff80008275bad0 x13: ffff0000c0a2ba1c x12: 786d692d696d6373
> x11: 0000000000000040 x10: 0000000000000001 x9 : 0000000000000000
> x8 : ffff0000c09f8500 x7 : 0000000000000000 x6 : 000000000000003f
> x5 : 0000000000000040 x4 : ffff0000c6fcf410 x3 : ffff0000c6fcf6c0
> x2 : ffff0000c09f8400 x1 : ffff0000c36da000 x0 : ffff0000c6fcf410
> Call trace:
>  mtk_pmic_keys_probe+0x94/0x500 (P)
>  platform_probe+0x68/0xdc
>  really_probe+0xbc/0x2c0
>  __driver_probe_device+0x78/0x120
>  driver_probe_device+0x3c/0x154
>  __driver_attach+0x90/0x1a0
>  bus_for_each_dev+0x7c/0xdc
>  driver_attach+0x24/0x30
>  bus_add_driver+0xe4/0x208
>  driver_register+0x68/0x130
>  __platform_driver_register+0x24/0x30
>  pmic_keys_pdrv_init+0x1c/0x28
>  do_one_initcall+0x60/0x1d4
>  kernel_init_freeable+0x24c/0x2b4
>  kernel_init+0x20/0x140
>  ret_from_fork+0x10/0x20
> Code: aa1603e0 f90006b6 f9400681 f9000aa1 (f9406261) 
> ---[ end trace 0000000000000000 ]---
> ```
> ---
>  drivers/input/keyboard/mtk-pmic-keys.c | 3 +++
>  1 file changed, 3 insertions(+)

It's preferred to have the stack trace in the commit message body rather than below
the cut line to allow for searching for the oops message in git history.

Also, it may make sense to CC: stable@vger.kernel.org for backports

Thanks,
Easwar (he/him)

