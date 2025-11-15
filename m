Return-Path: <linux-input+bounces-16120-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E29C605F4
	for <lists+linux-input@lfdr.de>; Sat, 15 Nov 2025 14:30:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D52014E3069
	for <lists+linux-input@lfdr.de>; Sat, 15 Nov 2025 13:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7D72E2DD2;
	Sat, 15 Nov 2025 13:30:39 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail.enpas.org (lighthouse.enpas.org [46.38.232.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7012E0927;
	Sat, 15 Nov 2025 13:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.232.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763213439; cv=none; b=rjOjuNnIOlzi+qNITqFMmywj59+/XwmPwBwYMcbixHedD8vwSCF2KdFvGM76T2r5ehkeRTMNskRd5+SNNbjT7kTaYApoPjlDSu5ru2E2l7GPMUdAupLpDGIYRmG8t8WsHvug2H2D6qs15VqzMHNm9ZZlC20YfURKCm8s9P9tXl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763213439; c=relaxed/simple;
	bh=w4eqyhrHncsiG5C768yjXMGbfHo+T9ZbDSB0gdfUU7s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Nu5wYI7JvLNMc3ah7jSnad0DILFOEUwfvVpib1q3iHJ42jZOiOV58ZkAy5/4fWF2CMu0ZX25fw/0tpcGF0dAYa0Gkf41v8rFAPO72mIL7nIDI7NbZ52ejU6sBoA6wQqUzdUf2nGaLmaQEPS9Pmo8iOWFUCFkSk7cCplY1T7F8bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enpas.org; spf=pass smtp.mailfrom=enpas.org; arc=none smtp.client-ip=46.38.232.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enpas.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enpas.org
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.enpas.org (Postfix) with ESMTPSA id 7DDBD1043C1;
	Sat, 15 Nov 2025 13:22:41 +0000 (UTC)
Message-ID: <3aca217a-4cf3-4793-855a-39ed99eb81d2@enpas.org>
Date: Sat, 15 Nov 2025 22:22:36 +0900
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Max Staudt <max@enpas.org>
Subject: Re: [PATCH] HID: memory leak in dualshock4_get_calibration_data
To: Eslam Khafagy <eslam.medhat1993@gmail.com>,
 roderick.colenbrander@sony.com, jikos@kernel.org, bentiss@kernel.org
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+4f5f81e1456a1f645bf8@syzkaller.appspotmail.com
References: <20251115022323.1395726-1-eslam.medhat1993@gmail.com>
Content-Language: en-US
In-Reply-To: <20251115022323.1395726-1-eslam.medhat1993@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thank you Eslam for catching this!

That mistake was mine, and your fix looks good to me.


Reviewed-by: Max Staudt <max@enpas.org>



I think your patch may be a candidate for the -stable tree:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/stable-kernel-rules.rst



Thank you for your help :)

Max



