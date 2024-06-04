Return-Path: <linux-input+bounces-4081-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 122868FB606
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 16:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 432491C24EC5
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 14:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1C614BFB1;
	Tue,  4 Jun 2024 14:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GCr3CgbG"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E065B14AD19
	for <linux-input@vger.kernel.org>; Tue,  4 Jun 2024 14:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717512141; cv=none; b=njnFqScczCEYeW+JcbYE/APzkx3TtluHiIkMFUsfPbdMj4uCyuLcfX0E6dE9d5thZPVOOvPHWio/VC2BWMKtuFOusTfP3FLTXuZAT+6CS0yT/X1NY29X7lrY2iGuTjUmhFoMwzQV6PfUy1AfDFum4K5zrlJKupri+diZm5to9KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717512141; c=relaxed/simple;
	bh=Ghqj7sm86kY0ZfjVRuy7AMU0AJWf5Kbzzfiaeeu4Smc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nDPh+g+W0pf4dwSIov2H8Pg0CO5Z9maUVcEcWIT+GtezKyQ2E/RoYOfJSAbNWZ7oEPOvMztn2JOGuLQh6Rg0z2dHiQKP4yzTBWw0I1aNy1lCrLcYPtMwN4vdaQXdI3afQ4Ky2atoqrBeZSXiOLBbR/pnYeCI+zRzhQIi2319wcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GCr3CgbG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717512138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6GSKZn5YJoJ3kMztNbh4Ff0sh8p7A+Y7W7uSyuwooK8=;
	b=GCr3CgbGFtppbFBknp5GHAFYpN3skru48lJfzrg7+r9ZcCjhPDtx79mUh0VY238EMQd+jD
	PPK4FjKBAWuCBtjfXqJDUJevEGy4PDuS+UjiGsVZN5UYOfNL7s5EXkKQLpGHHqwe8nBzU8
	LkTjgKDx2ETeYGFQer2pBfwJETkGxNM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-RdS0BXdbP7Ga_YfhoVExMg-1; Tue, 04 Jun 2024 10:42:16 -0400
X-MC-Unique: RdS0BXdbP7Ga_YfhoVExMg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a68ea01c455so37181766b.0
        for <linux-input@vger.kernel.org>; Tue, 04 Jun 2024 07:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717512135; x=1718116935;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6GSKZn5YJoJ3kMztNbh4Ff0sh8p7A+Y7W7uSyuwooK8=;
        b=ItLh9PnUu8gpTVNw6LGOXcIKPKM0YInl5NpLNeBjWoBFmK7ZNMipukGBCaSuGV0Joz
         siWmIGDN2BK47y0UaqwSgxemgkWVDnDZhn8HUPPVG5JM8U+Nbhlo7f+fVyA4F/8BGk8Z
         3azFQLvbs7jVkE6ZXjkJrfqUItk0KOC4geg2txJezUy0C5mYNDX7SBsfgZekbYFZp0si
         1FX/htwLi5IOMarWpqxf2GvyWOclwewJn1tJmgP3Sphs5GGFHR3p67HKopkEBp8oasdI
         jm5JSKmchfaRMPhkMYobIA1suHqWoLyIKP3J+A9T/Dgv/UbiZp4DoshNcHOOREtuA4Bc
         SCjw==
X-Gm-Message-State: AOJu0YwOGe2pyvsU9fsedF5F586DuGjgZTtoyuZMsw2aR7DTEk+BGyCu
	jwJ2u0fzEn+uC79eRKQb9lhjRQZy1a1t8MZFL6e3NU+3mdEMrMqcCDXzS62mr0nq8PiV+udOsFZ
	6I9ekB206eQOt8Gp8yO9eE6Wz+F8SrvhlWz8qxehQcPiYkygr942LhkTWcOC+
X-Received: by 2002:a17:906:a946:b0:a65:d7f7:f3f2 with SMTP id a640c23a62f3a-a6820be934fmr797485566b.36.1717512135494;
        Tue, 04 Jun 2024 07:42:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdDULiev1oH5nT3hJB3si4jO9YRCWfF0/Nqzsz2PAZuFe5bOc8WIqL7WohgMsV7xNUgCC15g==
X-Received: by 2002:a17:906:a946:b0:a65:d7f7:f3f2 with SMTP id a640c23a62f3a-a6820be934fmr797484566b.36.1717512135073;
        Tue, 04 Jun 2024 07:42:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:e7a9:b143:57e6:261b? (2001-1c00-2a07-3a01-e7a9-b143-57e6-261b.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:e7a9:b143:57e6:261b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68e940ed6asm411617666b.22.2024.06.04.07.42.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 07:42:14 -0700 (PDT)
Message-ID: <ad6c1af5-b0bb-430a-9d6f-0cdb1d2d8904@redhat.com>
Date: Tue, 4 Jun 2024 16:42:13 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: lg-g15: add missing MODULE_DESCRIPTION() macro
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20240604-md-hid-lg-g15-v1-1-265b094db089@quicinc.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240604-md-hid-lg-g15-v1-1-265b094db089@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/4/24 4:33 PM, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lg-g15.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/hid/hid-lg-g15.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
> index acbec1dcf196..53e7b90f9cc3 100644
> --- a/drivers/hid/hid-lg-g15.c
> +++ b/drivers/hid/hid-lg-g15.c
> @@ -954,4 +954,5 @@ static struct hid_driver lg_g15_driver = {
>  module_hid_driver(lg_g15_driver);
>  
>  MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
> +MODULE_DESCRIPTION("HID driver for gaming keys on Logitech gaming keyboards");
>  MODULE_LICENSE("GPL");
> 
> ---
> base-commit: a693b9c95abd4947c2d06e05733de5d470ab6586
> change-id: 20240604-md-hid-lg-g15-e4a106ba126b
> 


