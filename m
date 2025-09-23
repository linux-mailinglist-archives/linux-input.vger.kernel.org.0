Return-Path: <linux-input+bounces-15015-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC4EB96795
	for <lists+linux-input@lfdr.de>; Tue, 23 Sep 2025 17:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF2793B2925
	for <lists+linux-input@lfdr.de>; Tue, 23 Sep 2025 14:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 604B7234963;
	Tue, 23 Sep 2025 14:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWXo/5rY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9A11FFC48
	for <linux-input@vger.kernel.org>; Tue, 23 Sep 2025 14:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758639502; cv=none; b=heHKiriu7tyrAzbk11Oe1Jzuwmgh/jeRdnAu1lof2ihLLB9WngIDtNTZBOeOhG47ptNpha06i23JoP7Ed0juk9PkeJQ6ttXEBHJt+KvM5QZLfonMEQ9Kxyrgh9el6BcqNOPFyd1EwxcqSxDIwTegAxrZ6VcTRa6T+whWaz6rNNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758639502; c=relaxed/simple;
	bh=gRBqSBgSa6OthtUzDtiNR0zF7w4r08SIGeb3mkOaZf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EGWptIC/sMBhb0+uruZUWwUhrlUHMH1QPNJ546TQsdmdjMftho7iFm+sYp2NvVFbvJZ30bAcWuUgmYVhHJOcJ0j/YC8vEvupDSop275P/OH0TxI29ANuDTeflrx9I/6AzUHItuxXDNWwAbClVkEHeKIK3CHapmitNgK5JMhaj0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HWXo/5rY; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-77db1bcf4d3so4232388b3a.1
        for <linux-input@vger.kernel.org>; Tue, 23 Sep 2025 07:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758639500; x=1759244300; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I4ImXSi7R3if4rDxtPDuHh3gasiZze1yOROTcvFaBJ0=;
        b=HWXo/5rY11+dYX9/DzT4nd61BQkbCsUibCAiX2SkcbG2z16n5I0V0nl22/soTJQz9g
         ian3JT272UrqW7QregjIb5p3mtH9OWEr6mzu8Aayp3NjVWrXWwHfRul6ghCKGsnWBqAR
         Dmz4bfZG4RRju4hzSEZqjXfjTiizqVOEAmrgY1L+6+ZNVjqb9tIEA4YSJ1jj160ri+VW
         Y5y+GpP6/eCwkPsKGBq6jcneTjqcojYjvPKz3eKIGJaFBtmzngpSAmzNrJcQq97XI3vK
         js8SjNAgnr1AqtBx+ESkUdUnXyUggHRavqhh2evj7oVj1FZdpt643sbwTQEUVqh0+g+I
         rtZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758639500; x=1759244300;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I4ImXSi7R3if4rDxtPDuHh3gasiZze1yOROTcvFaBJ0=;
        b=ksDGIqC0m/wiaXme+CzDoeZd4rjKQXr3Nn3+ZEehSu1HzPe2L0rjOuhs8PC/73fXBS
         EV7WIOnnbcmuRCTx0x2aaVAw9wM+CeRcPllR2cxFHL0p2iD4xqsl1g/CHwIKYK17eBPH
         ORUibJXonCrQZ6vI2u/8p3ZtYoaRTy8kQgPfLhgx0JviMTT36gZA0N5c8vZTGaoOC7Zt
         9Yj1mJUhMFy6qpLbWqgoeVBPyVhEoc6w7BK0a4rAnwBUBOobzya0YW5sKPFmFswZZp8d
         Y6pXJuNeNLdw7pa+i1+ZYda6kxhPrI0HsERtkf7t31G+8eUPvs6cciGRnFKbibkM4+fI
         O9hw==
X-Forwarded-Encrypted: i=1; AJvYcCUmfTlIQngdQja6oscxP9mAIB3g3g6Tu1VUA8U9mOJ7geXUCAL9Xb7p5O/hcFKPjy6CAC6vfmegSt7qDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwS+yj1lfacBQvF0ykoLPTzMlHuXinwMIHJZGPVLSJFV1RQ/K53
	nihFqTEgm6p2a5vPRtAhxX8COZCZkNFOja/FR1JHMfQsaZtdKjctWVjZ
X-Gm-Gg: ASbGncusALF/MOqel0DK7U12dW5SGfdfb1dNEYgjbECk2DD8IMmSS4XkTNdYRVF/1A4
	caOm9rHofvMyMe1yXmSmWNjYsdTD6thjG6ZLUXGF0vPDrsokm2I2F/SxvMznutFhVTl8L0B3DE2
	0IIqOY2dKgKcd4+WJoES6JAKI9Ier0JITph5/xGPeqAU/c6dMK1oBKFdGaVA4+wZHAMHoftpDBz
	qFilxVKgBrmGcLwDOCG19D56Rvw0HGJlCmdNoyTo1Ghv3d8Oos5fhYTQbMKvv5eCS2xVEWtNU9d
	YYzDRyME6rOFyv+7MYzj7L1Hhn+JMSBma1i66hVm812VzXp15Kywhzy1eBtzGrGjk8wauXttG2Y
	XuDxpDCcdkc9M7/K04fsOgtTBi8xlAhUI8QoOxpyORCMVKF4bVm45dLzFfQ==
X-Google-Smtp-Source: AGHT+IF/zZclFSEgpiyYayQeOXrzChZJj4MnQ21sLwn2CDDgyVrjtxcXUaNDM9WgSRffhfGpsMsI+g==
X-Received: by 2002:a17:902:e80e:b0:267:af07:6528 with SMTP id d9443c01a7336-27cc48a2813mr39477455ad.35.1758639499884;
        Tue, 23 Sep 2025 07:58:19 -0700 (PDT)
Received: from [10.0.2.15] ([152.57.99.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016bea0sm165554175ad.40.2025.09.23.07.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 07:58:19 -0700 (PDT)
Message-ID: <65c32c82-d744-4477-8a6d-10ce9a4cd295@gmail.com>
Date: Tue, 23 Sep 2025 20:28:12 +0530
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: ft260: Use sysfs_emit to write formatted data to
 user buffer in sysfs show function.
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Michael Zaidman <michael.zaidman@gmail.com>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev
References: <20250923144926.307315-1-bhanuseshukumar@gmail.com>
 <2025092316-pasta-parachute-737e@gregkh>
Content-Language: en-US
From: bhanuseshukumar <bhanuseshukumar@gmail.com>
In-Reply-To: <2025092316-pasta-parachute-737e@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/09/25 20:26, Greg KH wrote:
> On Tue, Sep 23, 2025 at 08:19:26PM +0530, Bhanu Seshu Kumar Valluri wrote:
>> Inline with sysfs documentation, sysfs_emit is used in show function
>> to write formatted data into user buffer. sysfs_emit is already PAGE_SIZE
>> aware.
>>
>> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
>> ---
>>  Note: Patch is compile tested and verified with checkpatch.
>>
>>  drivers/hid/hid-ft260.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
>> index 333341e80b0e..8677bea46bea 100644
>> --- a/drivers/hid/hid-ft260.c
>> +++ b/drivers/hid/hid-ft260.c
>> @@ -826,7 +826,7 @@ static int ft260_byte_show(struct hid_device *hdev, int id, u8 *cfg, int len,
>>  	if (ret < 0)
>>  		return ret;
>>  
>> -	return scnprintf(buf, PAGE_SIZE, "%d\n", *field);
>> +	return sysfs_emit(buf, "%d\n", *field);
>>  }
>>  
>>  static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
>> @@ -838,7 +838,7 @@ static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
>>  	if (ret < 0)
>>  		return ret;
>>  
>> -	return scnprintf(buf, PAGE_SIZE, "%d\n", le16_to_cpu(*field));
>> +	return sysfs_emit(buf, "%d\n", le16_to_cpu(*field));
> 
> There's no need to change existing users in the kernel for stuff like
> this, only try to do this for new sysfs files.  We've had too many bugs
> where "simple" changes like this cause problems (recently in the USB
> core for example.)
> 
> thanks,
> 
> greg k-h

OK. Thanks for the prompt feedback on this. 

