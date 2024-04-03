Return-Path: <linux-input+bounces-2808-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD058975B1
	for <lists+linux-input@lfdr.de>; Wed,  3 Apr 2024 18:56:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0E8C1C23636
	for <lists+linux-input@lfdr.de>; Wed,  3 Apr 2024 16:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 169BE152DF2;
	Wed,  3 Apr 2024 16:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XYPXPTTD"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52F8152500
	for <linux-input@vger.kernel.org>; Wed,  3 Apr 2024 16:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712163353; cv=none; b=Z30GA2PMJQGhtI4X5IpuoylZ0ejQ7GzbtorInU7o44acHarksYFU1t1FGl11CtMMHxdZmd8sZfXDCMlcZ9BrurvoWv8NprkKnGsA66dsxe/0g/Xt/EcLL5oG3hF4Ff6zOdgr43THRPe4TswCZcuvhOnMOtiCd5v8PIdNPrFV3HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712163353; c=relaxed/simple;
	bh=4jJrjHK8mhH2+XRUWtDAF99v5nQv4WwqENIYqGi3klM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EF2YDl+my0J72NXKWm+Aj7buDhV5UsHYxeVjifQSvMpDGfdwQD++IMC9HWbhmt2W06Vvi7UIuEcgsqIIgsYQbgoEhQt2Z6RPw/eBXtpzSNJEe3MMOkziISm3Eun1HRx1YONlscUGY8NORQ3Q39VBxXrQEzkV3XTuFS9UQlLC3zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XYPXPTTD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712163349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I0tT9NwtMxOQ3/QidalKKNOGfTytjEb5HDBw0dV5sAk=;
	b=XYPXPTTDGNaVMopcJgq+pjuyuPjJy582VQ8IMl1fUI2nTXzifrkuedJV9mNVTTsTl0E4pR
	VEZMG9dYUuLp2YuWcMc3XrceZ2UNzcJF7ldRpzubqGQiXBMCeoq8Cd+NwHIzEfFDDCncxi
	ipMvJSc4FW44mNxroLJGF9YjjrWfhag=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-wPrJjTD5MSm5tNFW0BjeYA-1; Wed, 03 Apr 2024 12:55:48 -0400
X-MC-Unique: wPrJjTD5MSm5tNFW0BjeYA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a4e34a32a92so3263866b.0
        for <linux-input@vger.kernel.org>; Wed, 03 Apr 2024 09:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712163347; x=1712768147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I0tT9NwtMxOQ3/QidalKKNOGfTytjEb5HDBw0dV5sAk=;
        b=ItyGZEIFJo/uzznlzzM5yykKZk5a8Mjg+luVBJW9cGJIFA9l158leVtkUJWh46ry7v
         iGvjAPuG6V48HtxRqdMPocfCVQVE/2GNbugZNWuiyxysyz/9CltQjMXtOVtgN8AXzLYL
         iy01b/TRFisCNh2t97lLefS83Jt6DDd84tWsePsAK89QPK48eM86eW550h4/VRU5HwWc
         LfVxSTGvdxSN10voPxhzMeQYV4IHoPhViLmFxwfHLnpkm908SguUpa4Zhl/9SGpBYQ7y
         rSNRoskySO7vwmFIUDTSfeGoLANPjuUSrakKQK6PQCxYec7cfsddZym3Z3D8CmIdFCAi
         towA==
X-Forwarded-Encrypted: i=1; AJvYcCVQEfUzd2BJOBnG27TedAQQPHAyotpA8GOXbT1MzOqEu1uFZ0hHAWsP6kTW2sUHk18O02pUc9GUNTaavJptHy8mLUyhoY9/Z+c4cis=
X-Gm-Message-State: AOJu0Ywq3Ml7AAOj8bfPBT52Sf630XbUGbtaUasowibqr2ARga720IbU
	QW6oL3/KDmBGjIKlSVy6cPfVcq9Z23Wia8PRfqC3RKiAcjuBZ+cgx1CafTzWXeBRGI3ScylT41b
	iMUrs0C/ROZRYIEl/iHH/dqUFo273Tm+a62zkoAFWiXFKXrw/Cl7Q2Sp0QQ/fLjq6swDF
X-Received: by 2002:a17:906:d8b:b0:a4e:9fc3:de50 with SMTP id m11-20020a1709060d8b00b00a4e9fc3de50mr194745eji.21.1712163347327;
        Wed, 03 Apr 2024 09:55:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtv1RrPtglAG1fV69TYlqzx8x7hOEFywi4AavsMfJnh4NZfMLgZdRMbPTdggQqWq7+0w6JYA==
X-Received: by 2002:a17:906:d8b:b0:a4e:9fc3:de50 with SMTP id m11-20020a1709060d8b00b00a4e9fc3de50mr194730eji.21.1712163347016;
        Wed, 03 Apr 2024 09:55:47 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id t5-20020a170906a10500b00a46af5f023bsm7873735ejy.202.2024.04.03.09.55.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 09:55:46 -0700 (PDT)
Message-ID: <02d348c8-4125-4f72-a431-e6d62b8533cb@redhat.com>
Date: Wed, 3 Apr 2024 18:55:45 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] HID: logitech-dj: allow mice to use all types of
 reports
To: Yaroslav Furman <yaro330@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Lucas Zampieri <lzampier@redhat.com>, =?UTF-8?Q?Filipe_La=C3=ADns?=
 <lains@riseup.net>,
 "open list:HID LOGITECH DRIVERS" <linux-input@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <6713652f-9a44-422e-b6a7-45501093cb08@redhat.com>
 <20240403165425.114844-1-Yaroslav.Furman@softeq.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240403165425.114844-1-Yaroslav.Furman@softeq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/3/24 6:54 PM, Yaroslav Furman wrote:
> From: Yaraslau Furman <yaro330@gmail.com>
> 
> You can bind whatever action you want to the mouse's reprogrammable
> buttons using Windows application. Allow Linux to receive multimedia keycodes.
> 
> Signed-off-by: Yaraslau Furman <yaro330@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/hid/hid-logitech-dj.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
> index e6a8b6d8eab7..3c3c497b6b91 100644
> --- a/drivers/hid/hid-logitech-dj.c
> +++ b/drivers/hid/hid-logitech-dj.c
> @@ -965,9 +965,7 @@ static void logi_hidpp_dev_conn_notif_equad(struct hid_device *hdev,
>  		}
>  		break;
>  	case REPORT_TYPE_MOUSE:
> -		workitem->reports_supported |= STD_MOUSE | HIDPP;
> -		if (djrcv_dev->type == recvr_type_mouse_only)
> -			workitem->reports_supported |= MULTIMEDIA;
> +		workitem->reports_supported |= STD_MOUSE | HIDPP | MULTIMEDIA;
>  		break;
>  	}
>  }


