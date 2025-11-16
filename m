Return-Path: <linux-input+bounces-16125-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8A9C61058
	for <lists+linux-input@lfdr.de>; Sun, 16 Nov 2025 05:35:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 010FD4E394C
	for <lists+linux-input@lfdr.de>; Sun, 16 Nov 2025 04:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58D2F1E5201;
	Sun, 16 Nov 2025 04:35:23 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail.enpas.org (lighthouse.enpas.org [46.38.232.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CF6288D6;
	Sun, 16 Nov 2025 04:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.232.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763267723; cv=none; b=Y9pFxOFvSVdH4QfQqLaKYphuTixkAXxrpEHiCHLH5kdyH3YEawEJgVKmC3B0FXEcVtIrPTlopSF8iqBQ1QxGjnAG4fSFpf1/3S4uUMGwLzethmbmqvG9a2+0zpGUkwlRA2ZD8SZQc1B//03NssbB5q45Qp8eu4yMl/+8+CWMN9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763267723; c=relaxed/simple;
	bh=s057bGZl+Q1uaUlVRkVexz6hPfzkiKzrq8B75jCk+F4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a9zZTRr06NxOdb4cNkH2muYU7N45suwjONZkco2qGCCQnNRW0R+2bgMywMChg8LCtyDDe5O0SBMecw45S74Q+55UdAUgkBnqRwlzLaNMgA6c4SU4DTp6V0bDaxV6mmouBFarQ1lRvZQw40wNNDy6ho25/e9BqUI5n1WRESOBQqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enpas.org; spf=pass smtp.mailfrom=enpas.org; arc=none smtp.client-ip=46.38.232.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enpas.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enpas.org
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.enpas.org (Postfix) with ESMTPSA id ED700104097;
	Sun, 16 Nov 2025 04:35:14 +0000 (UTC)
Message-ID: <ddb16ea8-7588-4c0a-9e34-6bd8babd598f@enpas.org>
Date: Sun, 16 Nov 2025 13:34:50 +0900
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] HID: memory leak in dualshock4_get_calibration_data
To: Eslam Khafagy <eslam.medhat1993@gmail.com>,
 roderick.colenbrander@sony.com, jikos@kernel.org, bentiss@kernel.org
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, syzbot+4f5f81e1456a1f645bf8@syzkaller.appspotmail.com
References: <20251116022723.29857-1-eslam.medhat1993@gmail.com>
Content-Language: en-US
From: Max Staudt <max@enpas.org>
In-Reply-To: <20251116022723.29857-1-eslam.medhat1993@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/16/25 11:27 AM, Eslam Khafagy wrote:
> function dualshock4_get_calibration_data allocates memory to pointer
> buf. however the function may exit prematurely due to transfer_failure
> in this case it does not handle freeing memory.
> 
> this patch handles memory deallocation at exit.

Reviewed-by: Max Staudt <max@enpas.org>


One minor thing that I forgot: I see that the commit message is all 
lower case. Proper capitalisation helps readability and matches the 
kernel style. No need to resend this time, but in case you're sending a 
v3 for any other reason, it'd be great if you picked this up as well :)


Thanks for your patch!

Max


