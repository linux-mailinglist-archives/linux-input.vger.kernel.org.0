Return-Path: <linux-input+bounces-11313-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFD6A73053
	for <lists+linux-input@lfdr.de>; Thu, 27 Mar 2025 12:43:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05BEA17C658
	for <lists+linux-input@lfdr.de>; Thu, 27 Mar 2025 11:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CE1B2135D1;
	Thu, 27 Mar 2025 11:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Fflci9VP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF0E1DFDE
	for <linux-input@vger.kernel.org>; Thu, 27 Mar 2025 11:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743075766; cv=none; b=GSay16pKWeFwT2uxfO0HudIGdd5MBdRX7Rxhl3yv2FVa/S4qr5bxeLBq6zEgP9OBzO2jZNfcFFxQe1e9Pwjz6f9M4QnRDUYOd5gmcJY1MA1UQZdJLKHE5acDFX8ISkUWqeZJBPbBzNZabsH6WC9vmekqKpXmx+fetaWog2Y+jo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743075766; c=relaxed/simple;
	bh=eF+vO4HWF5WkZYoqiFRQYzuWAnQ6UlCJ4XBQjnS6q9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NIwLByeGAT1snLuueanN2ytkPLRYTuVHkS0Ir1kGKaP25++Wc8GjnM5Pjw/qVDZUBUxyl4hMrrKBqIh3aPnCg6P97AnUPMqfDjvOSZQMA/8mw0I9rrMd4koVCampuipOHwmr27ov/nDmi20C3I67Bs9Qa3zXy14mawpLHEtFnK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Fflci9VP; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso9271585e9.1
        for <linux-input@vger.kernel.org>; Thu, 27 Mar 2025 04:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743075762; x=1743680562; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hwGnmu50XyHLYTx+XRrSMtCI46qAB4IVnO+O6BeEDNs=;
        b=Fflci9VP5xYYRiR5vNq4EM0cgs/2j9T0KnSLAwqUXQrkfAPbiUhTFSkdzQzsiG7dbS
         jLQC+UjQuqNkpjpruMKSS9eqYOONBH7WbHPeemJYl8cw4xmGbiZhWfwVtf3x1Jo4HKOU
         rcYW6nb18vm+woWHS37Jc+4lCAO0f+RGSHIm4X89b2Q4xz2IRb2riUVUtg/pzBhEZH5K
         jurUM62XR8KX2XgaHLiKRQr0yUTLTuKth08PmlE+2ljVsPwtZzJ3CmxbVMYtaiHqAdCo
         3KTcjZv5bhxsINmt//CE8u/wTMEwDdj8BdfrIvfkXpBa5uK4m2dArtWFgGfSOmAxls7o
         ptgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743075762; x=1743680562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hwGnmu50XyHLYTx+XRrSMtCI46qAB4IVnO+O6BeEDNs=;
        b=T2CKqY4xsXur35K8jt8j/i66ujvs4sxeIP1vGPQrGwb3H1G6sL/yAfDS7W8UB+uWh7
         /Q5ZSuHUqgspR+chfBUe9VrhBiC3jxrMJNX6kbQs7RTrLoRBrThVGZnfoY4Prj3b0XmZ
         4FljfPtSOKPX14EwVpRvR4ckXCOXWyw14e3O+c7uw4vkHCAbyp7CvnxnlzNiLmK6XfsI
         gZYZUaeW19rtJyOtjkbiPsf+CZPjHcyObIcxt8qOsqhpPWjtQSe6FN9IPT0M5nAid2mL
         nR3Wx1hjHLRlvmgONkxP3Z1fRcWMWq4QtACyLUsK2euwEE5KcoJFa44OqLQPAI7v5ZMR
         SYsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXN+CtyXP2ZvgKpezNDBRabE31zWd7dWxHR1wzMYd1BAH1xP1g4qIFso2Xjnbkv7SGpPj32qofiVLyYEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoRXL4iweLW1QTUMj9V9SiR7feKoblNtBsPNcTC8zX18JD4q/b
	2USKuVmYDJ20vTeQQVh/LNBIrG2icP0/ZkZIYquYotMIou0jU6v3awREswwOauk=
X-Gm-Gg: ASbGncsXnnUJ67sQmaIOaIGx4VxvVWVD4WKClJ1st2UC3iVHAVglF5zaWoQzR6fC3Ne
	NTA3dVuVYE7gxI2M+Rcgw8nMqRdKWkTegdPsx0+7em1iJMWfDEPjyjpAiBeTNWKWorHhp4R/DQ5
	tFJLK+7BAa3zSfhKWJI1oBBn8erzts49TH7hX/ZOt/msAcHoWFHHuiXWvJlbheBTsuUGcD8Ypo3
	4VorwuGM9d+uA6BLdCOifLndgiU0o+n1RSzKoZzhqKmCulp2EWLUzWrtoD6CIvgPXtzi8vYJJJ1
	yZs4n8gzUBhZhJFoT1pXppNHNpdiBXy7/VaEmyFSAeKddqWCjYLVgNutnwdrUQegc2xJIjJzd44
	17A/eg5LpEZzy1WsoAS1EwQ==
X-Google-Smtp-Source: AGHT+IHxQud/sts4jUj3rWl7atpMgeW2AEZlo7j926k/DmxvMnse39hxq1AoC3ZKQcdcRrj3t9hXxQ==
X-Received: by 2002:a05:600c:4f45:b0:43c:fe15:41c9 with SMTP id 5b1f17b1804b1-43d8d641abdmr4440155e9.9.1743075762504;
        Thu, 27 Mar 2025 04:42:42 -0700 (PDT)
Received: from ?IPV6:2001:a61:1394:8401:ac5f:98de:4c1b:7bf1? ([2001:a61:1394:8401:ac5f:98de:4c1b:7bf1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82e836f2sm34897965e9.11.2025.03.27.04.42.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 04:42:42 -0700 (PDT)
Message-ID: <04a011b5-a7fa-4270-a072-365b5abd2aec@suse.com>
Date: Thu, 27 Mar 2025 12:42:41 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: WARNING in cm109_urb_irq_callback/usb_submit_urb
To: Alan Stern <stern@rowland.harvard.edu>, Oliver Neukum <oneukum@suse.com>
Cc: =?UTF-8?B?55m954OB5YaJ?= <baishuoran@hrbeu.edu.cn>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kun Hu <huk23@m.fudan.edu.cn>,
 Jiaji Qin <jjtan24@m.fudan.edu.cn>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 syzkaller@googlegroups.com
References: <559eddf1.5c68.195b1d950ef.Coremail.baishuoran@hrbeu.edu.cn>
 <62d91b68-2137-4a3a-a78a-c765402edd35@suse.com>
 <a3f66f2e-a99e-47f2-a3ef-742b6903cc5d@rowland.harvard.edu>
 <7be81186-2d18-4d0e-8a93-d2dda20b02b2@suse.com>
 <07f2ec1a-0363-4734-97ff-a129699b1907@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <07f2ec1a-0363-4734-97ff-a129699b1907@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20.03.25 18:25, Alan Stern wrote:

>> static void cm109_stop_traffic(struct cm109_dev *dev)
>> {
>>          dev->shutdown = 1;
>>          /*
>>           * Make sure other CPUs see this
>>           */
>>          smp_wmb();
>>          usb_kill_urb(dev->urb_ctl);
>>          usb_kill_urb(dev->urb_irq);
>>          cm109_toggle_buzzer_sync(dev, 0);
>>          dev->shutdown = 0;
>>          smp_wmb();
> 
> I don't know anything about this driver, but the placement of the second
> smp_wmb() looks odd.  Should it really come before the line that sets

Indeed. This driver is not written for comprehension. As far as I can tell
it is not necessary at all. You need to set shutdown to zero before you
resubmit the URBs. But I don't see how the barrier helps with that.

> dev->shutdown to 0?  In general, smp_wmb() is used to separate two sets
> of stores; if it comes after all the relevant stores have been performed
> then it won't accomplish anything.

Don't we guarantee an interaction between smp_wmb() and taking a spinlock?
> 
>> }
>>
>> This driver has a tough job as the two completion
>> handlers submitted each other's as well as their own
>> URBs based on the data they get.
>> That scheme is rather complex, but as far as I can tell correct,
>> but you need to test that flag everywhere.
> 
> However, it's quite noticeable that the code you want to change in
> cm109_submit_buzz_toggle() doesn't have any memory barriers to pair with
> the smb_wmb()'s above.  Shouldn't there at least be an smp_rmb() after
> you read dev->shutdown?

I think this driver assumes that the ctl_submit_lock spinlock makes
it safe.

> As long you're updating the synchronization, it might be a good idea to
> also improve the comment describing the memory barriers.  "Make sure
> other CPUs see this" doesn't mean anything -- of course all the other
> CPUs will eventually see the changes made here.  The point is that they
> should see the new value of dev->shutdown before seeing the final
> completion of the two URBs.  Also, the comment should say which other
> memory barriers pair with the ones here.

Before the completion? AFAICT they need to see it before they try
to submit an URB.

	Regards
		Oliver


