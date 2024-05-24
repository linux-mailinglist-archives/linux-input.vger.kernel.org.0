Return-Path: <linux-input+bounces-3812-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 376638CDFA7
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 05:15:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEBAB1F224CA
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 03:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C50D6BA45;
	Fri, 24 May 2024 03:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Oo2uUXmX"
X-Original-To: linux-input@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F151FC4;
	Fri, 24 May 2024 03:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716520532; cv=none; b=LmvG81NBGp4dOglTcLI2HCELdESI6xY1lE1wWcTrox/2+i6vJwpbmFAu97TM67NH0CZvvZ8Q4aPAQTqFBY0p/uJ0DG/0SJvmOEmADDDs1lgtAP4W03X3R5NEj5O9LyWAf8eyVzNlNDMZx19zCeNlXX522/GL60yltHoXr+9dnk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716520532; c=relaxed/simple;
	bh=M0REdcJESOdI2zljW5iAkli8/MpFChjhCrUTmmi62x4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hTlKs3N9CmQq2T+I7LTDkUYAHtugj88U8Fxt+3ssvWt++mUXmx5GxbZ9GeLu/QM4ICifiCfiLXsH7UuslmKWs0P8iGogczT9QRJqeiMEu0puS5b6YtYjzdQOHaJxX0gqFSA1ZamxttEh1a0pS3L0DZc8OUQmhPudQAHFZKHU8ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Oo2uUXmX; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=M0REdcJESOdI2zljW5iAkli8/MpFChjhCrUTmmi62x4=;
	b=Oo2uUXmXZgIIFfNSRpkP8IQ3zcRL42ooT0lDz5rym+iw35r9xBGR/XvjFFfnjw
	StgBjm+NoBr3DoPWIU8Fw027RZFrHIUlQ3ZBgvu49UA4mT3ktosm1jbWuezdyeO7
	S6/VZEpTmH1VloGvbMwBSgMIowKU+f+9EPYyfKN5k5t6E=
Received: from [10.42.116.195] (unknown [111.48.58.10])
	by gzga-smtp-mta-g1-1 (Coremail) with SMTP id _____wDnd2MWBlBmnhqhFg--.1290S2;
	Fri, 24 May 2024 11:14:31 +0800 (CST)
Message-ID: <6ce4c794-46c6-1485-2918-aae82b92a9e3@163.com>
Date: Fri, 24 May 2024 11:14:30 +0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] HID: usbhid: enable remote wakeup for mouse
Content-Language: en-US
To: Oliver Neukum <oneukum@suse.com>, jikos@kernel.org, bentiss@kernel.org
Cc: linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, huanglei <huanglei@kylinos.cn>
References: <20240522092257.19373-1-huanglei814@163.com>
 <9d37e0b4-91fa-4239-b767-2eb17e78ea84@suse.com>
From: huanglei <huanglei814@163.com>
In-Reply-To: <9d37e0b4-91fa-4239-b767-2eb17e78ea84@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnd2MWBlBmnhqhFg--.1290S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZw1kGr18tFWDGryxXryfCrg_yoWxZFcEkF
	sIv395u345Wwn7J3W3tFW7GFW3Ww1j9ryxJa18JFn7XryfZrs5Xr4DXw1qqa13ta9avr9F
	gr1S9rs8tryj9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjt8n7UUUUU==
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/1tbisBjo9mV4JjF4kwAAsX

Just wanted to support mouse  wake up.

Set it in userspace will be a better choice， Now，canceled the patch.



在 2024/5/22 18:00, Oliver Neukum 写道:
> On 22.05.24 11:22, huanglei814 wrote:
>> From: huanglei <huanglei@kylinos.cn>
>>
>> This patch enables remote wakeup by default for USB mouse
>> devices.  Mouse can used to be wakeup devices, but the correct
>> place to enable it depends on the device's bus; no single
>> approach will work for all mouse devices.  In particular, this
>> covers only USB mouse (and then only those supporting the boot
>> protocol).
>
> Hi,
>
> could you explain in the log why you want this to depend
> on support for the boot protocol?
>
>     Regards
>         Oliver


