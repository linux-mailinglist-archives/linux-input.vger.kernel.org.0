Return-Path: <linux-input+bounces-189-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D987F331F
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 17:05:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 361111C21BF5
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 16:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0863D59167;
	Tue, 21 Nov 2023 16:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JI3C6tIM"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5F39126
	for <linux-input@vger.kernel.org>; Tue, 21 Nov 2023 08:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700582735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s0kyHNDqBGXcNBLNOa/auQXF9LoKyfrqyNQvYEfFqgA=;
	b=JI3C6tIMb/JGITQfkjExk9J2cX1J9IXJTpfqMjJbLfbubmguWpSS9grZUMhh0QAEqK/PhG
	+JdiS61mf4l2rUT96hWR03gCdiR36QJ2VERDV/sLmYjtzN67OhzM6boNuCGsDhxRhIQxDA
	73y/jM65hG9cJmQEN4Nm2ADYlsgm2DM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-5rKXFMFcPLiXqtrMa0ZgQQ-1; Tue, 21 Nov 2023 11:05:34 -0500
X-MC-Unique: 5rKXFMFcPLiXqtrMa0ZgQQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9fa63374410so242879966b.1
        for <linux-input@vger.kernel.org>; Tue, 21 Nov 2023 08:05:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700582733; x=1701187533;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s0kyHNDqBGXcNBLNOa/auQXF9LoKyfrqyNQvYEfFqgA=;
        b=sGru6/b6jzojg0Bd2SCvnmvxNx4fAZDwHUT8SDOc2sYmqJZ+9+1SUiBIX5AVxHxh1O
         1dgBrdYcN3vYzRVGvP5JCrlA9fpRCIthl0aV04VAiFQvhBsPRQQJPf+GOR1QnVVOJ9AT
         3TA9aSwk5zdlLEP4Jx9NtxKLYuGn0I4taP7gU3dCcwx++X9upEZOHVpxThygI27KWb5J
         ANJBJbOlGGpygsS8oT0H3oXKS24Be9gNx2Kwf+tcvxG0fMil6ExPKdIC30xADc5xobQJ
         RMjGSSpSHZLBYitb37y+lizZfN8Fo7a03LoogU3+ByCCIERMyOneMUxTzp6bMzGL+vL3
         pH9g==
X-Gm-Message-State: AOJu0YxlnzJDxQJz4spqWZ+mCeRYhnXPY2yf6cBw8IEQPm/B68d3yhyz
	NFcgYYKT9dLBn3qqwlmY0AM39ErIUqra2smsNdbbyhwra+vLFkDezkF6ujnYgQ5RU39p0V2vIXi
	PIbrOJZik/AlDk+JZ51r2w9w=
X-Received: by 2002:a17:906:24b:b0:a02:4a97:8b3c with SMTP id 11-20020a170906024b00b00a024a978b3cmr1501526ejl.58.1700582733395;
        Tue, 21 Nov 2023 08:05:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERvbYQrQPZg9GqZm39gIKPSNJ0navNsG7gOeYJjOWf61//vk9GKLpq7s1Oia2yMVo0qLpuxg==
X-Received: by 2002:a17:906:24b:b0:a02:4a97:8b3c with SMTP id 11-20020a170906024b00b00a024a978b3cmr1501502ejl.58.1700582733136;
        Tue, 21 Nov 2023 08:05:33 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:6c4:9fb2:fbc:7029? (2001-1c00-2a07-3a01-06c4-9fb2-0fbc-7029.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:6c4:9fb2:fbc:7029])
        by smtp.gmail.com with ESMTPSA id m23-20020a1709062ad700b0099297782aa9sm5377538eje.49.2023.11.21.08.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 08:05:32 -0800 (PST)
Message-ID: <bc2b1ab0-32fe-4484-abe3-2f60b3cfa7d5@redhat.com>
Date: Tue, 21 Nov 2023 17:05:30 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 4/7] HID: i2c-hid: Move i2c_hid_finish_hwreset() to after
 reading the report-descriptor
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
 <32d4a384-2fb3-4f67-9f14-7a639a0621bb@redhat.com>
 <CAD=FV=UPiW+6CyawQXUvSOj0QH8_ynFq0GZapHCrDVc7LNAmVQ@mail.gmail.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAD=FV=UPiW+6CyawQXUvSOj0QH8_ynFq0GZapHCrDVc7LNAmVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 11/21/23 16:25, Doug Anderson wrote:
> Hi,
> 
> On Tue, Nov 21, 2023 at 1:53 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>>> Right after this loop, you have:
>>>
>>> if (ret)
>>>   return ret;
>>>
>>> That will return with the mutex held. It needs to be a "goto
>>> abort_reset". You'd also need to init `use_override` then, I think.
>>
>> Ah, good catch, I will fix this for the next version.
>>
>> Assuming there will be a next version. Did you read the cover-letter
>> part about the moving of the wait for reset to after the descriptor
>> read not fixing the missing reset ack 100% but rather only 50% or
>> so of the time ?
>>
>> And do you have any opinion on if we should still move forward with
>> this patch-set or not ?
> 
> I'd tend to leave it to your judgement. I have a bias towards landing
> it because it improves probe speed in a way that matches what the spec
> suggests and, IMO, probe speed is important.

I'm tending towards still merging this myself too. So when I've some
time I'll address your remarks and post a non RFC v3.

Regards,

Hans


