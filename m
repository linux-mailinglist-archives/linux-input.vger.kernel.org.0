Return-Path: <linux-input+bounces-160-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E87D97F2963
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 10:53:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 751361F24FF0
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 09:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 524E93C081;
	Tue, 21 Nov 2023 09:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="av7KBjYy"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5180FA
	for <linux-input@vger.kernel.org>; Tue, 21 Nov 2023 01:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700560382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GzejYp7eEfnnaFGznhUl0kWeu+oCqzBW2TFnBp6PATM=;
	b=av7KBjYyU7yZ1M7W13RjpdFYOUzakI0VgzOBs8MtvKoImBMi/T0u5kD732muluNAG9y5Zv
	FSGolBbHZsJ3FEarEY8dalzTGfSIKXpKhvKPW4AdgvMpvXdD3fXtCJRyZOSP/CbgATKdHa
	RbtYL+EYROWP18vLL6C5h9W1suIEMUk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-mnLuOsShNZenei3CWVO-wQ-1; Tue, 21 Nov 2023 04:52:59 -0500
X-MC-Unique: mnLuOsShNZenei3CWVO-wQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a02cc56af16so12977866b.3
        for <linux-input@vger.kernel.org>; Tue, 21 Nov 2023 01:52:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700560378; x=1701165178;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GzejYp7eEfnnaFGznhUl0kWeu+oCqzBW2TFnBp6PATM=;
        b=VWizlqRyXOEo//OjuhiVV8sWg3QjFyxUrCDDPgkp0XbUZvtrHygGSAR846wOtzyBb6
         TRHzscE+ypz96vuO3JoLw1RcdemxUa2rFFLqF5H0+R0BVZjWjerwbGJzuI4xFUuPBJJa
         0cuyfROuvewusx1XYv75onCwnLuVemA9JWC8aWYvMrx4OOV3izOdyPSQv/j/pXKZ1VTP
         KNQJFSfMroh9Gq+rLAFscEvYoqrgBZXcdSaf0nXlcqB05kwuMPqsOufkjteIR3ageuif
         T8S1Gr/o6LbuOOkK4CZe/HRiy8D30GbgYWQOwvrZgPtkXzk7zVbP1/X2fLBuEVdoMnuD
         SSeA==
X-Gm-Message-State: AOJu0YwmHhm1MSTGIX4fw9Ym8+aKR+7rI0YCH711t8NVsv3fReZ3LWNm
	4r4MCZxnvz79eLm3QzGB6d5S9idcMflBFTGs+Mm6LOrL5Wr6h9OzD/17juYcnHcGmniHmf8bAmT
	ldgtzy2XJGHSRZIkyYVjI/Fc=
X-Received: by 2002:a17:906:74db:b0:a02:38a2:4d79 with SMTP id z27-20020a17090674db00b00a0238a24d79mr741914ejl.41.1700560378175;
        Tue, 21 Nov 2023 01:52:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMuAwUtLtzJ3z2+5lbft/mCnRzeT7zSNdcXdWFn9NAiKDcszJ4bfU8cyvKWQCYmQZjZtI/JA==
X-Received: by 2002:a17:906:74db:b0:a02:38a2:4d79 with SMTP id z27-20020a17090674db00b00a0238a24d79mr741894ejl.41.1700560377864;
        Tue, 21 Nov 2023 01:52:57 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id v27-20020aa7cd5b000000b0053e43492ef1sm4541823edw.65.2023.11.21.01.52.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 01:52:57 -0800 (PST)
Message-ID: <32d4a384-2fb3-4f67-9f14-7a639a0621bb@redhat.com>
Date: Tue, 21 Nov 2023 10:52:56 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 4/7] HID: i2c-hid: Move i2c_hid_finish_hwreset() to after
 reading the report-descriptor
Content-Language: en-US, nl
To: Doug Anderson <dianders@chromium.org>
Cc: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>, Julian Sax
 <jsbc@gmx.de>, ahormann@gmx.net, Bruno Jesus <bruno.fl.jesus@gmail.com>,
 Dietrich <enaut.w@googlemail.com>, kloxdami@yahoo.com,
 Tim Aldridge <taldridge@mac.com>, Rene Wagner <redhatbugzilla@callerid.de>,
 Federico Ricchiuto <fed.ricchiuto@gmail.com>, linux-input@vger.kernel.org
References: <20231120193313.666912-1-hdegoede@redhat.com>
 <20231120193313.666912-5-hdegoede@redhat.com>
 <CAD=FV=U+emgVbnRT2yQonZ013CRmYXK1bxh8+xGGn5LCnOmL5Q@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAD=FV=U+emgVbnRT2yQonZ013CRmYXK1bxh8+xGGn5LCnOmL5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Doug,

Thank you for the reviews.

On 11/20/23 23:07, Doug Anderson wrote:
> Hi,
> 
> On Mon, Nov 20, 2023 at 11:33 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> @@ -741,12 +741,9 @@ static int i2c_hid_parse(struct hid_device *hid)
>>                 return -EINVAL;
>>         }
>>
>> +       mutex_lock(&ihid->reset_lock);
>>         do {
>> -               mutex_lock(&ihid->reset_lock);
>>                 ret = i2c_hid_start_hwreset(ihid);
>> -               if (ret == 0)
>> -                       ret = i2c_hid_finish_hwreset(ihid);
>> -               mutex_unlock(&ihid->reset_lock);
>>                 if (ret)
>>                         msleep(1000);
>>         } while (tries-- > 0 && ret);
> 
> Right after this loop, you have:
> 
> if (ret)
>   return ret;
> 
> That will return with the mutex held. It needs to be a "goto
> abort_reset". You'd also need to init `use_override` then, I think.

Ah, good catch, I will fix this for the next version.

Assuming there will be a next version. Did you read the cover-letter
part about the moving of the wait for reset to after the descriptor
read not fixing the missing reset ack 100% but rather only 50% or
so of the time ?

And do you have any opinion on if we should still move forward with
this patch-set or not ?

> I'll also note that it seems awkward that
> `clear_bit(I2C_HID_RESET_PENDING, &ihid->flags)` is scattered in so
> many places for error handling, but I couldn't really find a better
> way to do it. :-P

I guess we could just no clear it? Only the wait for reset
wait_event_timeout() cares about its value and if we run that
a second time then the bit will be set to 1 again before calling
it anyways...    Not sure I like my own suggestion here, but
it is an option. I'm afraid it may bite us later thogh if we
ever decide to check for the bit in another place.

Regards,

Hans



