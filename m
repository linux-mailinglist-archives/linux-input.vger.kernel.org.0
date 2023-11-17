Return-Path: <linux-input+bounces-120-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEFA7EF7EB
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 20:37:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 504E2B20984
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 19:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C4DF43AAB;
	Fri, 17 Nov 2023 19:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PvGgm2lC"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5526DD6D
	for <linux-input@vger.kernel.org>; Fri, 17 Nov 2023 11:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700249848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ag0f5YHkyDCym3oSpAhqhc+jQdvXPGOzH3MPR79oyE8=;
	b=PvGgm2lC653I8Xq0KKqSErylLpJ9OzYRUtot03nsSU1cyqSq9//t1WIdo94Lkxewd54dV4
	C8JmX2bmj/nNCl4j1QCrkvcjQ0yesyxnGCWlhzK89ejDliLNzjX28j1jnDRB9xBf5lShga
	QctXK0mrkQtXLbxrUCQJtM7wQyswlj0=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-2W1X14iKOiykuOqIDqx1HA-1; Fri, 17 Nov 2023 14:37:27 -0500
X-MC-Unique: 2W1X14iKOiykuOqIDqx1HA-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2c5032ab59eso22778101fa.3
        for <linux-input@vger.kernel.org>; Fri, 17 Nov 2023 11:37:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700249845; x=1700854645;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ag0f5YHkyDCym3oSpAhqhc+jQdvXPGOzH3MPR79oyE8=;
        b=CI4UbFP8/eMxyvUKZbUkTf9Kiw9zCMkxiTLFtT6LKw+ipMh0SGWPPCy/Ak1qMJdv1Y
         g4YXGYiCRB6gvFu6Ca8KajOlA4gTKQG6zz1Cdw+qTNDpdWencEdH/Iu82USWIXHesrAg
         BUUkxi4cAO/FZMFki+h8IJIbhLevrIH9XAOE8rmEKlezFvPyTTAtjAp0cVZ94I8oXe5N
         trrot+b/87ApZB66NY1E+gUdZjHxiAjNysr6XWDTo2YaE3L3fr3QhvbKFbzlEigRgNnI
         RWVWaz2hkV38ydvpZIpS17+nDR6sxbIin3QIphheZSxr9rSvm73q1Aag6IvxssZTe8nA
         ou8w==
X-Gm-Message-State: AOJu0YxfIMUwDLcPwPMdYBMiAg/PYqgWkAFW2Rs346fDNrlj+qZQfWI7
	BT6sazyGiFSx81mf0x6vEDkmAPGX3K/0YuqoJdRkHuK6tjafbU2rOioOVUE+GPllYoYHWwm0Rsu
	8MWZjKzVJxcWO+7kh94g6eX0=
X-Received: by 2002:a19:6409:0:b0:507:a6e9:fbba with SMTP id y9-20020a196409000000b00507a6e9fbbamr317620lfb.63.1700249845430;
        Fri, 17 Nov 2023 11:37:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrEHbnsCgx7ROQTORqGVyLtSl+WQ/rAM8lIpvwumdXyJLCxDintvVCht1nBSfGPYqad5v5nw==
X-Received: by 2002:a19:6409:0:b0:507:a6e9:fbba with SMTP id y9-20020a196409000000b00507a6e9fbbamr317598lfb.63.1700249845112;
        Fri, 17 Nov 2023 11:37:25 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id se23-20020a170906ce5700b00992e94bcfabsm1079734ejb.167.2023.11.17.11.37.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 11:37:24 -0800 (PST)
Message-ID: <59826c82-2c6f-483a-a3f5-938542e7c3f1@redhat.com>
Date: Fri, 17 Nov 2023 20:37:23 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] HID: i2c-hid: Split i2c_hid_hwreset() in start() and
 finish() functions
Content-Language: en-US, nl
To: Doug Anderson <dianders@chromium.org>
Cc: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>, Julian Sax
 <jsbc@gmx.de>, ahormann@gmx.net, Bruno Jesus <bruno.fl.jesus@gmail.com>,
 Dietrich <enaut.w@googlemail.com>, kloxdami@yahoo.com,
 Tim Aldridge <taldridge@mac.com>, Rene Wagner <redhatbugzilla@callerid.de>,
 Federico Ricchiuto <fed.ricchiuto@gmail.com>, linux-input@vger.kernel.org
References: <20231104111743.14668-1-hdegoede@redhat.com>
 <20231104111743.14668-3-hdegoede@redhat.com>
 <CAD=FV=W3JQu08zwp1XtOPcD9oHNwfC65dVVsxtyTkFog95oLQw@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAD=FV=W3JQu08zwp1XtOPcD9oHNwfC65dVVsxtyTkFog95oLQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 11/6/23 19:53, Doug Anderson wrote:
> Hi,
> 
> On Sat, Nov 4, 2023 at 4:17 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> @@ -460,6 +460,20 @@ static int i2c_hid_hwreset(struct i2c_hid *ihid)
>>                 goto err_clear_reset;
>>         }
>>
>> +       return 0;
> 
> The mutex "contract" between i2c_hid_start_hwreset() and
> i2c_hid_finish_hwreset() is non-obvious and, IMO, deserves a comment.
> Specifically i2c_hid_start_hwreset() will grab and leave the mutex
> locked if it returns 0. Then i2c_hid_finish_hwreset() expects the
> mutex pre-locked and will always release it.
> 
> While reviewing later patches, I actually realized that _I think_
> things would be cleaner by moving the mutex lock/unlock to the
> callers. Maybe take a look at how the code looks with that?

I agree that moving the mutex to the callers would be better,
I've just completed this change for v2 of the series.


>> @@ -732,7 +745,9 @@ static int i2c_hid_parse(struct hid_device *hid)
>>         }
>>
>>         do {
>> -               ret = i2c_hid_hwreset(ihid);
>> +               ret = i2c_hid_start_hwreset(ihid);
>> +               if (ret == 0)
>> +                       ret = i2c_hid_finish_hwreset(ihid);
>>                 if (ret)
>>                         msleep(1000);
> 
> nit: it's slightly weird that two "if" tests next to each other use
> different style. One compares against 0 and the other just implicitly
> treats an int as a bool. I'm fine with either way, but it's nice to
> keep the style the same within any given function (even better if it
> can be the same throughout the driver).

One of the 2 tests goes away later, so I've kept this as is for v2.

Regards,

Hans


