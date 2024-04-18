Return-Path: <linux-input+bounces-3114-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F158A9584
	for <lists+linux-input@lfdr.de>; Thu, 18 Apr 2024 11:00:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FB4D282A6F
	for <lists+linux-input@lfdr.de>; Thu, 18 Apr 2024 09:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E117215B548;
	Thu, 18 Apr 2024 08:59:20 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C6F15B542
	for <linux-input@vger.kernel.org>; Thu, 18 Apr 2024 08:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713430760; cv=none; b=IjYzpgpOnlh+plQzJ3ODY2/AbAniRmSnzXPe0+s79S+7hON8ifAQFsZ96PPJpHveNXGPaD02kYuvqlDIvZd1YpbGSfaXZOJftGmGuIFi37piW5SINZnX1EG8Bn7mwkDem2jzCZHPb01bVnZS6008BcqSWymo8ovnAgTSGx8P1c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713430760; c=relaxed/simple;
	bh=DLvv5GEORt9mlgqdwdbTjkqxFo4Et1E9KRmatrJ/U8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=p534bD6vOlRXmB3xTKdaYKwdhGv3ZVTh46WnO/kH4k6nX9w4D+Y8Ofl09tb0l8ug++fyN/gqWuaMPdl600EwJa2aB3cGqg774zEGA4lJbDRy/f4SJW5hKh8n34lg6p97xteIpSNXOyyZrAKQ8qXrhexeXxO7oxw7kHsvMQGyabw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mail2.sysu.edu.cn; spf=pass smtp.mailfrom=mail2.sysu.edu.cn; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mail2.sysu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail2.sysu.edu.cn
X-QQ-mid: bizesmtpip3t1713430738two8lax
X-QQ-Originating-IP: HRDUyiB8C8GX/NWlwhl1OXJZYjVguHi4AKvmnnVZywc=
Received: from [IPV6:2001:250:3002:3270:348f:c ( [255.199.207.5])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 18 Apr 2024 16:58:56 +0800 (CST)
X-QQ-SSF: 01400000000000B0F000000A0000000
X-QQ-FEAT: +ynUkgUhZJnGzuDRUAYNy/+tz91yxHCGDs60nk/DvwhzKk/gK8VSbAw4fFFlm
	7auscf2DKNHBv6mcGl56XYhzSLObQsDCbKO6ThRbDN1gw8L8pmUhSfjvT3T+kcLNszodYVL
	YeoRi6/3Q1PhZqX72EsmVE+uflCyOCsy//z6yAi5sFXzXIK0BmnAGh40pyzbT+kP1hTS/aV
	5te0OGNWM1X7OvAZAFTnTlNfoCJPG+779M9sVdHKeiZBBMsDv7Z9ZmTFhw3UCh07ahq5VQt
	K1kqZuYZWQ7X10l2pw2Z2V70OjUiii077YcH5V2JSQjcWPqU7YMf7zb8D5kJuE3GnmAjD0t
	4xLUxW12hM/ZxjLd24ellyAVGdK3k3Yi6bXveZxx5YiLK9Zj0E=
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 3389459207315888004
Message-ID: <BFAD3AED2C23AA7B+1b1a47f6-af12-41a5-ac64-1d82238c8288@mail2.sysu.edu.cn>
Date: Thu, 18 Apr 2024 16:58:56 +0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: PS/2 - add support for Lenovo Xiaoxin keyboard
To: WangYuli <wangyuli@uniontech.com>
References: <593C1A73FB93BACE+20240326131718.20497-1-wangyuli@uniontech.com>
 <ZgXUZtEwHEF8Rs3i@google.com>
 <AA3FCBB9232F6C97+0e28ccd7-11cc-4047-866c-92069ddbb550@uniontech.com>
Content-Language: en-US
Cc: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
From: Shang Ye <yesh25@mail2.sysu.edu.cn>
In-Reply-To: <AA3FCBB9232F6C97+0e28ccd7-11cc-4047-866c-92069ddbb550@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:mail2.sysu.edu.cn:qybglogicsvrgz:qybglogicsvrgz8a-0

Hi,

On 2024/04/18 4:16 pm, WangYuli wrote:
> Hi,
>
> On 2024/3/29 04:34, Dmitry Torokhov wrote:
>> Could you please tell me more about the keyboard?
>
> Link: 
> https://lore.kernel.org/lkml/20230514083336.3811-1-yesh25@mail2.sysu.edu.cn/T/
>
> Link: https://gist.github.com/yescallop/5a97d010f226172fafab0933ce8ea8af
>
> Those links above mentioned the same situation.
>
> Lenovo has a batch of laptops shipped in 2021 with the same problem. And
>
> the combined sales of these products are considerable.
>
>> What ID does it use?
> 0x83.
>> Majority of keyboards are using 0xab83, does your device forget to send
>> 0xab by chance?
> Unfortunalety, I'm afraid not.
>>
>> Thanks.
>>
> Thanks.
>
I'm pretty sure that the problem I encountered was already fixed by a 
previous patch:
https://lore.kernel.org/r/20231115174625.7462-1-hdegoede@redhat.com

Could you please check if it is the case?

Regards,
Shang




