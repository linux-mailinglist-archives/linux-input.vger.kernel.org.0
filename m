Return-Path: <linux-input+bounces-16383-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE49C8F8F7
	for <lists+linux-input@lfdr.de>; Thu, 27 Nov 2025 17:56:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 99AFD4E1EA3
	for <lists+linux-input@lfdr.de>; Thu, 27 Nov 2025 16:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0873C3385B9;
	Thu, 27 Nov 2025 16:55:46 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail.enpas.org (lighthouse.enpas.org [46.38.232.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C47239E6C;
	Thu, 27 Nov 2025 16:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.232.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764262545; cv=none; b=RPiLuKKzmS6uEvEy5KQxrDs86U/0DT6t1Az85qusiBn0YYA6OnsTe85v2MEgaQdfUNCDzrcmzDI2ESiWsCQBczmJJrXCsEuXmeALfkzCrWD/evbUsqzwlxm2ieaTZox4jcBqfJBMAe3E7obiZUy0l2on4rOm/Kyrd2TLhjZyfUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764262545; c=relaxed/simple;
	bh=KKgyVLDt1LQ6xtQiKuU1VJCsRWj5UA+JmJBJq+gYYh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j5Qn3zuXjSp5Hrxeotl8xlb9v3Px/TxpUm9fIQznfZAOG0uLyaVg0I8ag8JlzDdMIIs4uRbc9UyGvc4GuI4aQVAGNuLCqqEVt7agvowrSxp90s634Nwlbr1Jibvefq3gexsnyVI/sAvgTySYWFO53gPZkxY/FZWhS1D+1kCzg8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enpas.org; spf=pass smtp.mailfrom=enpas.org; arc=none smtp.client-ip=46.38.232.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enpas.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enpas.org
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.enpas.org (Postfix) with ESMTPSA id 1D2BD103FD1;
	Thu, 27 Nov 2025 16:55:31 +0000 (UTC)
Message-ID: <e1fb509f-6a3a-411f-a756-03c389eb4335@enpas.org>
Date: Fri, 28 Nov 2025 01:55:29 +0900
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] HID: memory leak in dualshock4_get_calibration_data
Content-Language: en-US
To: Eslam Khafagy <eslam.medhat1993@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, roderick.colenbrander@sony.com,
 jikos@kernel.org, bentiss@kernel.org
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+4f5f81e1456a1f645bf8@syzkaller.appspotmail.com, stable@vger.kernel.org
References: <20251122173712.76397-1-eslam.medhat1993@gmail.com>
 <6251f6df-d4ac-4681-8e8b-6df2514e655b@kernel.org>
 <44eb6401-e021-4c69-96af-0554f4f31e57@enpas.org>
 <f67a5702-4b44-41bb-9538-19063bc28b41@gmail.com>
From: Max Staudt <max@enpas.org>
In-Reply-To: <f67a5702-4b44-41bb-9538-19063bc28b41@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/26/25 3:19 AM, Eslam Khafagy wrote:
> Lastly, One question to max,
> at the beginning of the function  dualshock4_get_calibration_data
> buf = kzalloc(DS4_FEATURE_REPORT_CALIBRATION_SIZE, GFP_KERNEL); if (! 
> buf) { ret = -ENOMEM; goto transfer_failed; }
> if the allocation fails. can't we just return here

Never.


> or do we need to go the the end of the function and do sanity checks
> at the end?

Correct.


Without the sanitisation code, the driver will divide by zero.



Max


