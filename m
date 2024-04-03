Return-Path: <linux-input+bounces-2805-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 390B2897426
	for <lists+linux-input@lfdr.de>; Wed,  3 Apr 2024 17:38:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A62D11F26984
	for <lists+linux-input@lfdr.de>; Wed,  3 Apr 2024 15:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF10149DF5;
	Wed,  3 Apr 2024 15:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VeaCojPq"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1BE1369A0
	for <linux-input@vger.kernel.org>; Wed,  3 Apr 2024 15:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712158725; cv=none; b=Iz737aciV5bZWhCilbD7WB+chcZLkw1idRdt+NfJpLRPbleX7thgOSi4iEyacM6ec5YHcaYGih1G/EmyH6xCkudENHEmpCXRc5EFWnFgmzeDaYORrAkf0LwHbxo4Z27B2FsJQVRa9VtjcokMu2xUyjxEVxwZCaRKQAV0608TIbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712158725; c=relaxed/simple;
	bh=gvXAN8FqAYyv/zTvnFyrftLXCVC6JR3X40KuZJIRr0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aIFJtUgnfJqU5ZMZtNAQwNTYrYroE1G5e4suS0wb5G1mZleRPoPNl7avmsQOE5TqMwMYxv6upRJYeo/ppdr/nPUr50G6VKkGVE/ABRPb181u8Kzrth2t6Dufie1QVsMc1uPaeWXEmJtLUIDQFspTlTL01GxOtl3w9bmm4QibCgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VeaCojPq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712158722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7ulisZosQVDxfmEDrSXMzfQcC4WL56xkDy6UZQgPC9w=;
	b=VeaCojPqVWI6i8xo4PYIYnmn+eLbSHnZb405DOFJiarXcDQWch3Jkfj/yNKpFbJxb0xFnq
	Dw1o01r8EEO+krkqWaWPB9W5iyRbkr73drNfklB+dmr4GGP+udjFbrKDXUxT+0rM7EjJ4F
	oobvOQsQIM9AHxh/Btu2wwpd8FLMKU8=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-FTtgcF-MM4S0T39O-Wj0PA-1; Wed, 03 Apr 2024 11:38:40 -0400
X-MC-Unique: FTtgcF-MM4S0T39O-Wj0PA-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-513e31aef6cso5752400e87.1
        for <linux-input@vger.kernel.org>; Wed, 03 Apr 2024 08:38:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712158719; x=1712763519;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ulisZosQVDxfmEDrSXMzfQcC4WL56xkDy6UZQgPC9w=;
        b=PEJJkvgtZXbiGUa/spjDXRpLtIXGGa+yZLwzAJUZOXxHiDI8a77bU8S8jX94w9Wj0J
         7XlYXRPUlBJeaSgFn15Dkd9AtBEQMmdGzMrThN7M0LnCRwxbOFBWTsDpLRgmqfqkQz5X
         cqY5asBMnwoTSWggMIEmYTmGQCsGI8wx5ojcfnmg+QocNJ7vhSMdxyiUnfzJ+F/m055j
         nl03W+6h3vpUqwe98xQRjSHov13OlxLTYj4OoVFFMLIKEwaSnnNqxwG6i83LjehMrmKY
         lWB2lUvNrU2B529kWYbnO0ZHsWbbLzGT5Q46wRVSev1BewxGqgsp/WACSRCfTungCfyk
         AE7w==
X-Forwarded-Encrypted: i=1; AJvYcCUHePYy0iBk8tCI03DfV4Pjt44Aimg+SMaXsvkuteiUb/4sHnTevagGKiNyJgjoyViojiGPoa7mnuPRaByIGETXkn3MoJaJXDPFXzk=
X-Gm-Message-State: AOJu0YxZHZjoK3Ult1FYz41U0iKQTLvbS36S6Lq2MhOM7D3GiEDVeOm1
	6ur4RbURZflcMT2UqFPnLCgcYkQgD6pZpjJ4pROuPsVEUoe/Us4sn2e/P0pryzIXBgaFavz7naT
	HDrxQy0Fa6EbFr7yPpAcZ0KdGz+8pWLvNuisKlVfQtixgVK5viirCj8PPH89/
X-Received: by 2002:a19:c509:0:b0:515:af1f:5bad with SMTP id w9-20020a19c509000000b00515af1f5badmr3726478lfe.28.1712158719438;
        Wed, 03 Apr 2024 08:38:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWDpvKh5HePjjuSqDW7G2f74KFaLPXqg8tpOijWh7Nbj6ROZij9vpsI449A6cEWrPjqHuEJA==
X-Received: by 2002:a19:c509:0:b0:515:af1f:5bad with SMTP id w9-20020a19c509000000b00515af1f5badmr3726444lfe.28.1712158718687;
        Wed, 03 Apr 2024 08:38:38 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id o1-20020a1709064f8100b00a46baba1a0asm7870261eju.100.2024.04.03.08.38.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 08:38:38 -0700 (PDT)
Message-ID: <6713652f-9a44-422e-b6a7-45501093cb08@redhat.com>
Date: Wed, 3 Apr 2024 17:38:37 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] HID: logitech-dj: allow mice to report multimedia
 keycodes
To: Yaroslav Furman <yaro330@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Lucas Zampieri <lzampier@redhat.com>, =?UTF-8?Q?Filipe_La=C3=ADns?=
 <lains@riseup.net>,
 "open list:HID LOGITECH DRIVERS" <linux-input@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <7e34dc43-b70b-4a50-86fd-f021f2de4845@redhat.com>
 <20240403150638.18749-1-Yaroslav.Furman@softeq.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240403150638.18749-1-Yaroslav.Furman@softeq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Yaroslav,

On 4/3/24 5:06 PM, Yaroslav Furman wrote:
> From: Yaraslau Furman <yaro330@gmail.com>
> 
> So, I think this should work fine for now, but IMO we should see if it's
> possible to allow the driver to receive all events that a keyboard can send,
> since Windows application can assign pretty much any keycode to any mouse
> button (perhaps not the main ones though), and then we might see the same situation again.
> 
> I tried doing that on my system but the driver stopped working completely.

The actual code change itself looks fine, but the above should have gone
into a cover-letter or something like that.

This is not a proper commit message and this is also lacking
your Signed-off-by (which you did correctly include in your
original version:

https://lore.kernel.org/linux-input/20240128214906.60606-1-yaro330@gmail.com/

Please send a v3 with a proper commit-msg + Signed-off-by.

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


