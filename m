Return-Path: <linux-input+bounces-8162-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B5A9D357C
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 09:34:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FEEE1F223F9
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 08:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 347541865E5;
	Wed, 20 Nov 2024 08:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="b6A0MNQi"
X-Original-To: linux-input@vger.kernel.org
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [151.80.165.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886FF16F858
	for <linux-input@vger.kernel.org>; Wed, 20 Nov 2024 08:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=151.80.165.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732091622; cv=none; b=Bwnz4AwUMxfCrWomiJnrAMBxOM5g+XO1OaaieX6NvBq/eRE26NhpcBZAzlhSEQKRTXe+u/c2ws8C84zsmLtjCIcUnignJOx0rg6lAOxmRugDERE2e0Jh8urV0LEnvHjA5jLZzvwmt01kzOHVQt9E1i3096tD4hDMUtYhabXO39M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732091622; c=relaxed/simple;
	bh=F82L9QlgmWjMXMQ6Xwl6t/SxUUuVDCx6XYhtrhGUNCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E3drzBcL/JFkP4NF42NMQqB6CaN1fJ9xgJ8JmHPBu4wPAGDQ8Hj4mfgQI8wj8YDZcx9W4VghhpmmC0gE/R3v4YEh6aSj+Iq3hNG9xeLzH+yc0QB1qBndaSUt6fdUfKo6W5VY0BRFm+rMQJ/fNCQ0yvi0tQMVXkaUBbZlxJMxryo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=b6A0MNQi; arc=none smtp.client-ip=151.80.165.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
	by relay2.mymailcheap.com (Postfix) with ESMTPS id D3DE33E8A5;
	Wed, 20 Nov 2024 09:33:31 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf1.mymailcheap.com (Postfix) with ESMTPSA id 460CE40085;
	Wed, 20 Nov 2024 08:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1732091611; bh=F82L9QlgmWjMXMQ6Xwl6t/SxUUuVDCx6XYhtrhGUNCo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b6A0MNQilJpPlwcigw/dYY5/SBCSq0ZyErP1eQ6v0oSFKQaUsHeAn0wi4MK92voMn
	 KiQ6OYFcz+WLUZoz9kIr6dI7s3BCTdTmfEfAkD4BdSojDYYBzXH4Q6dvMWkwiMcDB+
	 J6X5qyTA/hl0OV9+VESs6HEofEjsZUYHT4k5EX6k=
Received: from [198.18.0.1] (unknown [58.32.41.254])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 2D8C7409BD;
	Wed, 20 Nov 2024 08:33:25 +0000 (UTC)
Message-ID: <64ff35f9-258c-4a03-8060-d0a6abb6b1b6@aosc.io>
Date: Wed, 20 Nov 2024 16:33:20 +0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v5] Input: Add driver for PixArt PS/2 touchpad
To: Benjamin Tissoires <bentiss@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Binbin Zhou <zhoubinbin@loongson.cn>, Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Huacai Chen
 <chenhuacai@kernel.org>, Xiaotian Wu <wuxiaotian@loongson.cn>,
 Jon Xie <jon_xie@pixart.com>, Jay Lee <jay_lee@pixart.com>,
 linux-input@vger.kernel.org, jeffbai@aosc.io
References: <20241023083805.2164641-1-zhoubinbin@loongson.cn>
 <CAMpQs4+KDsKrV6086LZ22h8z87J3x7sdR-UNLnz0x0QB=4Y5hA@mail.gmail.com>
Content-Language: en-US
From: Kexy Biscuit <kexybiscuit@aosc.io>
In-Reply-To: <CAMpQs4+KDsKrV6086LZ22h8z87J3x7sdR-UNLnz0x0QB=4Y5hA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.41 / 10.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,loongson.cn];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	SPFBL_URIBL_EMAIL_FAIL(0.00)[kexybiscuit.aosc.io:server fail,zhoubinbin.loongson.cn:server fail,jay_lee.pixart.com:server fail,jon_xie.pixart.com:server fail];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: nf1.mymailcheap.com
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 460CE40085

Hi all,

On 10/23/2024 4:52 PM, Binbin Zhou wrote:
> On Wed, Oct 23, 2024 at 2:38 PM Binbin Zhou <zhoubinbin@loongson.cn> wrote:
>>
>> This patch introduces a driver for the PixArt PS/2 touchpad, which
>> supports both clickpad and touchpad types.
>>
>> At the same time, we extended the single data packet length to 16,
>> because according to the current PixArt hardware and FW design, we need
>> 11 bytes/15 bytes to represent the complete three-finger/four-finger data.
>>
>> Co-developed-by: Jon Xie <jon_xie@pixart.com>
>> Signed-off-by: Jon Xie <jon_xie@pixart.com>
>> Co-developed-by: Jay Lee <jay_lee@pixart.com>
>> Signed-off-by: Jay Lee <jay_lee@pixart.com>
>> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
>> Tested-by: Kexy Biscuit <kexybiscuit@aosc.io>
>> ---
>> V5:
>>   - Rebased on input/for-linus;
>>   - Fix wide PixArt TP type judgment in pixart_read_tp_type().
>>     Each type has a unique FW return value to avoid non-pixart touchpads
>>     being misjudged.
>>   - Thanks to Kexy for testing on non-pixart devices.
>>     The List of tested touchpad devices:
>>       - TPPS/2(broken on V4)
>>       - SynPS/2 Synaptics TouchPad
> 
> Hi Benjamin:
> 
> I've rewritten the PixArt TP type judgment condition to avoid false
> positives for non-PixArt devices. I tested it on several PS/2 devices
> without problems.
> To be more rigorous, if it's convenient for you, please help me test
> the previously problematic devices based on this patch.
> 
> Thanks.
> Binbin
> Gently ping. Benjamin, do you have time to test this new version of 
patch on the devices that this PixArt PS/2 patch broke?
>>
>> Link to V4:
>> https://lore.kernel.org/all/20240704125243.3633569-1-zhoubinbin@loongson.cn/
>>
>> V4:
>>   - Thanks Dmitry for the review.
>>     - Just return what ps2_command() reports, instead of replacing it with
>>       -EIO;
>>     - Refact pixart_read_tp_mode/pixart_read_tp_type(), to separate mode
>>       value and errors/success;
>>     - Pass the INPUT_MT_POINTER flag to input_mt_init_slots() and remove
>>       some redundant code, like the call to input_mt_report_finger_count()
>>       and the setting of bits in the touchpad section.
>>
>> Link to V3:
>> https://lore.kernel.org/all/20240701094953.3195501-1-zhoubinbin@loongson.cn/
>>
>> V3:
>>   - Rebased on input/next;
>>   - Added comment to msleep() in pixart_reset() as suggested by Aseda, no
>> functional change, thanks.
>>
>> Link to V2:
>> https://lore.kernel.org/all/20240624065359.2985060-1-zhoubinbin@loongson.cn/
>>
>> V2:
>>   - Rebased on input/next;
>>   - Merge two patches from the V1 patchset;
>>   - Initialize local variables to prevent random garbage;
>>   - Remove some noisy debug message;
>>   - Check ps2_command() return value;
>>   - Use macros to represent bit operations for better readability, such
>>     as abs_x;
>>   - Remove the code related to rel packets, for the normal
>>     intellimouse detection is well in PixArt.
>>
>> Link to V1:
>> https://lore.kernel.org/all/cover.1715224143.git.zhoubinbin@loongson.cn/
>>
>>   drivers/input/mouse/Kconfig        |  12 ++
>>   drivers/input/mouse/Makefile       |   1 +
>>   drivers/input/mouse/pixart_ps2.c   | 310 +++++++++++++++++++++++++++++
>>   drivers/input/mouse/pixart_ps2.h   |  36 ++++
>>   drivers/input/mouse/psmouse-base.c |  17 ++
>>   drivers/input/mouse/psmouse.h      |   3 +-
>>   6 files changed, 378 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/input/mouse/pixart_ps2.c
>>   create mode 100644 drivers/input/mouse/pixart_ps2.h
>>
(patch body trimmed)
>>
>> base-commit: 2de01e0e57f3ebe7f90b08f6bca5ce0f3da3829f
>> --
>> 2.43.5
>>
> 
Also pinging Dmitry - could you please review this new version?
-- 
Best Regards,
Kexy Biscuit

