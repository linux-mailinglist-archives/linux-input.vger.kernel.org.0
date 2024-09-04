Return-Path: <linux-input+bounces-6187-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1ACE96C6A5
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 20:46:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 880471F269F8
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 18:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B1001E2006;
	Wed,  4 Sep 2024 18:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="foZLVm0i"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D870D41C6D;
	Wed,  4 Sep 2024 18:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725475566; cv=none; b=qQgq52CB0h2SYkOAX8VnPCOOTQ2hNtxcJerImIkdxLbe6fFuLGbaIjCG9b4EHTDlS0kSm+kseUg1LmZOOREF8vyem/mR7xyb+8Q2TNfxAziClBxkUaZAVVCqJEenR3keZxEvZCHi9A0fKM2Qq58BXIsjo89DMYWvQhpm3bBPk70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725475566; c=relaxed/simple;
	bh=Dk80cgHfgvhtG3hlWMq5Sd83w3a6ykovSRge1QbM7I0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c5+rTVuk/5UdImd/hX6FP7hDpCnPBccpekXjWxUPKM1MfzNudcBk7aMN/cURpdzNbwpx/y7p1H7U3Qw0ODQAVY9nVd4FuaOTecRya1sm+KzvQqod2SYYO7Bmvdz0pFAUlyIQt+ymyplMUnIK3QHiitawxz6aC5O31gseyFYGsfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=foZLVm0i; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a869f6ce2b9so762873866b.2;
        Wed, 04 Sep 2024 11:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725475563; x=1726080363; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GskvCRhfcAwmr5253iUymakzID+2+I+HrhujHF9z1LM=;
        b=foZLVm0i8lcf0SZHNuCB8HbKgE1vNmvrFXdyVzrp9IoVJopZYsN8IQ4m7M0mmF8oSH
         xeuFo5+VPWTSS6ZJo9IkHooRjwhWc1g9Dcmzj+3Ph6edyRPuhtwOU5j0ckzFHaomrtft
         +d1vpRIaumRcNPRLOvuf9dDOq9YhrF64ZM5j00zsxO3u1N+balMBgrdr+IAIwFCCUg5o
         xVb9XRIsuYUNbluoWD7yb3fVruTgtJ4quroBnnZKUDWxAGPammdM8B/XwdjZOxVDq3wv
         mBFnPGdMfr0qIBWXAMVJMP3l9VTacgcjJED4jRg2dqvTPjdahYHvEIhtZgJOrTK8xFxT
         WuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725475563; x=1726080363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GskvCRhfcAwmr5253iUymakzID+2+I+HrhujHF9z1LM=;
        b=Xknh+wG/Gzsfg50qxQSNBqVMzhFNFU5iVKFOHBp3EUAf3pNGhOpDz+3cZscPsrwCb1
         kYq2ilxi3rRYXIpti1obl4YXQjxfek0YDtEnBB+w9LDjXUqUulBljLHZK/LNN4e1hmY/
         2t2lVjYuLOd43j6kdgCd5cHVs30eBTeAU2hbgftX7L23mdr22FtRIvcjZ5rarjKgJWKb
         pejnKVW/ghv27D8MAFYlSskd1CMgJ/NqW4VquspymkfxtVEiNa7APzfvACsGTouyyuHH
         BFB+Nl1AfJILxeawcTCHqCmzYd1e0qJcVZ05OCHgjGH0hnHhJCuTfN5qCzdV8HEGn1xQ
         O75Q==
X-Forwarded-Encrypted: i=1; AJvYcCXi0/XKezGzOveUsPYKfgpvAmXFtdrqXouPsgIizvyIWqO97ElnsNVUBm1LVxq1Li0FXyyYOw/YuNPNbS8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqKE7yJRqtssq+2dzcyw9oQ/d0iRaXHbEBhaMl96/lt4wbJVoq
	BOqDYhAJQ2aNvWnhGZFqj69zAVGV4gU1AfqnZkXNMWn3yTTUC1U6
X-Google-Smtp-Source: AGHT+IGhTO5k/+/5d8Xo9dsVZE5HMv3qs+vKLXszGxwL8jUeoJfCUp+Zi7Zusz5jD2TLtLN68X0PRQ==
X-Received: by 2002:a17:907:72c4:b0:a86:74fa:6a6f with SMTP id a640c23a62f3a-a8a32e767b2mr371957966b.23.1725475562918;
        Wed, 04 Sep 2024 11:46:02 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a623e3180sm22777866b.203.2024.09.04.11.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 11:46:01 -0700 (PDT)
Message-ID: <1b2254fa-9f1a-4150-b610-abfb55e4d161@gmail.com>
Date: Wed, 4 Sep 2024 20:46:00 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/22] Input: iqs7222 - use cleanup facility for fwnodes
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Ville Syrjala <syrjala@sci.fi>,
 Support Opensource <support.opensource@diasemi.com>,
 Eddie James <eajames@linux.ibm.com>, Andrey Moiseev <o2g.org.ru@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Jeff LaBundy <jeff@labundy.com>,
 linux-kernel@vger.kernel.org
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
 <20240904044825.1048256-1-dmitry.torokhov@gmail.com>
 <f0956e79-8261-4bd5-96ca-3795bbe1faaf@gmail.com>
 <ZtimWmQ2B_WlcvTw@google.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <ZtimWmQ2B_WlcvTw@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2024 20:26, Dmitry Torokhov wrote:
> On Wed, Sep 04, 2024 at 12:50:44PM +0200, Javier Carrasco wrote:
>> Hi Dmitry,
>>
>> On 04/09/2024 06:48, Dmitry Torokhov wrote:
>>> Use __free(fwnode_handle) cleanup facility to ensure that references to
>>> acquired fwnodes are dropped at appropriate times automatically.
>>>
>>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>> ---
>>>  drivers/input/misc/iqs7222.c | 30 ++++++++++++++----------------
>>>  1 file changed, 14 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
>>> index 9ca5a743f19f..d9b87606ff7a 100644
>>> --- a/drivers/input/misc/iqs7222.c
>>> +++ b/drivers/input/misc/iqs7222.c
>>
>> ...
>>
>>> @@ -2818,9 +2813,9 @@ static int iqs7222_parse_reg_grp(struct iqs7222_private *iqs7222,
>>>  				 int reg_grp_index)
>>>  {
>>>  	struct i2c_client *client = iqs7222->client;
>>> -	struct fwnode_handle *reg_grp_node;
>>>  	int error;
>>>  
>>
>> Nit: reg_grp_node could stay at the top (where it used to be), as you
>> are assigning it to NULL because there are no sensible assignments at
>> this point.
>>
>>> +	struct fwnode_handle *reg_grp_node __free(fwnode_handle) = NULL;
>>>  	if (iqs7222_reg_grp_names[reg_grp]) {
>>>  		char reg_grp_name[16];
> 
> I think this follows Linus' guidance (in spirit) to combine declaration
> and initialization for objects using __cleanup(). If it was Rust I'd
> written it as
> 
> 	let reg_grp_node = if let Some(...) { ... } else { ... };
> 
> so declaration and initialization would be the same, but with C this is
> the closest I could come up with.
> 
> Thanks.
> 

Combining the declaration and initialization was right, no doubt about
that. I was just nitpicking that the variable declaration could have
been done at the top, as it used to be. The same as you did, but not
separating the declaration from the rest as there are no instructions in
between.

My second thought was that you might be attempting to declare the
variable as near as possible to the "some" initialization, so you moved
it a little bit to get it closer :)

Either way, if you did that on purpose, then

Reviewed-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>


