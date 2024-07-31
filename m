Return-Path: <linux-input+bounces-5257-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD05A9436AE
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 21:46:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2701B20E29
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 19:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5676544C8C;
	Wed, 31 Jul 2024 19:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1Zsz4/1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E33C18044;
	Wed, 31 Jul 2024 19:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722455204; cv=none; b=H3yXTio7mo6shlufsesVO9Sczrn+pQWnjUMFafr0hWHzp0UsYEbuwiSU6F6zv8VtZuQ9sK1zQO5eip2SmV2cAtjK8wqElSlcCENMAvLIPo7ZcICu3iq8X3YILqS/U2CnO8LMO8KT8KzORspBKgllZyeQV58hAXTwhDhM1NGX85U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722455204; c=relaxed/simple;
	bh=jNR7w2QAj9TgK6FsQYxo5pOy+sazgn90YT5z6/bNQpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UqxKR6gzDT1uxc7P3BClcTT01Ov0rtfhuZrMuG4KQSGc0NzWtTC6TYeDRpo12IK2r071CFMwItWz2+379ap1A4pEz56hyxYL2ILhzxOzjzEDdboaiEToJUHzSUwuD4LZiwaVnnxzRvURrclg/aEjXD+5qiR+vH8WU8lFbybsxLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1Zsz4/1; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4281d812d3eso40053135e9.3;
        Wed, 31 Jul 2024 12:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722455201; x=1723060001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3mmhXRE/eRyb80i3ilX64logD9V2EM5TBWqbkGOVrTo=;
        b=e1Zsz4/1RQmrB2o4o1xSFIojh01nga/q8sJrL7Mntv+MkF2oBbj4uOP8aZ5X88zS00
         +UptftsIpQS1ZS4xd5169ObwFqd9R8maHlltkdZV/c8zdovtGZl708Tf41hCYAtwB9JT
         RhCjh0rj7gG+VYCVdbiyYc51ZRzcmfH19cGwtkDqqwvdhf+a/mPbbF5lJtOn4Dcv/jlO
         nXYRQFSpyPs+veXJWB1QJ42xUYINelToaz1T4ZSXg2kE7OP9wJbZusaL2Q3Cc6mVIEND
         ZPEu/Eyc83P81BeVs/noCnIor2trQztV+MyslfYK8rRDroQBSZnSoQArAbUaNOGhEXrC
         2ZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722455201; x=1723060001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3mmhXRE/eRyb80i3ilX64logD9V2EM5TBWqbkGOVrTo=;
        b=YV7/88nE/AjA3sms45Qg0t1x6xmOmT2LJX4bt2BU4S9Ix9VBYKxawLG6YptMNTexo+
         tbGJMTG/H50DpNejLK+zBnZ3vFBOx1/pru06U2iUu9Gn4NEB2tuG9XlLpRWt2/IlpgjN
         9n6fVYQQ9rarfrF4XZuh+Ya49VJ0u4j2UyitTl4XfQGiAYb5oSiSQQ1TAM0nl6wzFXYo
         phWWawCv+d0oQIyebhLNAVhsz9Oiqfl5LOkbxbd05dwesvi2uCVn2qCe8izEyiW4EuQj
         nXATODu1vjBkLZWUIYrRaPsmrhBDhs4RpB/YMyhhCTlcTnPeLXwGBahVygnHCRj4109j
         qpKQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8waihc5tAwsLl/ZwU7Tr863j26V3uEkuoSdjtRtFutphxsS+IhTx+Yx9SAm+3sYNn7L1e70vTBSNso5fZuozTRFAMBtqDUYoV0UbTPOplhIKvQD8PM73f7E4gGq3xM6eDeU+rZFl6aSY=
X-Gm-Message-State: AOJu0YyYkoGqHB1Wt2VcOvkS+EjbqxSqOtE/k5Og/fXFcizLG0jZWgot
	QVmMEcW1umHnOi2P4Va2mLeR+Vd8wZVgiHm8LntKZunNC8LzWEgi
X-Google-Smtp-Source: AGHT+IFKYZTfhE4dmJMFhM8AoHjj+GTxTCq307EdiLUVj8oWH4sYfO7wGmY26srBCarlm0/GlsJSVA==
X-Received: by 2002:a05:600c:a49:b0:426:6f4b:b386 with SMTP id 5b1f17b1804b1-428b8a2af34mr4070155e9.34.1722455200241;
        Wed, 31 Jul 2024 12:46:40 -0700 (PDT)
Received: from localhost ([2a02:169:1e9:0:8f4d:9ee2:cc35:c67b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acadb985csm799091866b.212.2024.07.31.12.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 12:46:39 -0700 (PDT)
Date: Wed, 31 Jul 2024 21:46:38 +0200
From: Silvan Jegen <s.jegen@gmail.com>
To: Camila Alvarez <cam.alvarez.i@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+24c0361074799d02c452@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: fix slab-out-of-bounds Read in cougar_report_fixup
Message-ID: <ZqqUnrJkvfsSS9Ag@homearch.localdomain>
References: <20240730234242.256598-1-cam.alvarez.i@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240730234242.256598-1-cam.alvarez.i@gmail.com>

On Tue, Jul 30, 2024 at 07:42:43PM -0400, Camila Alvarez wrote:
> report_fixup for the Cougar 500k Gaming Keyboard was not verifying
> that the report descriptor size was correct before accessing it
> 
> Reported-by: syzbot+24c0361074799d02c452@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=24c0361074799d02c452
> Signed-off-by: Camila Alvarez <cam.alvarez.i@gmail.com>
> ---
>  drivers/hid/hid-cougar.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This LGTM!

Reviewed-by: Silvan Jegen <s.jegen@gmail.com>

> 
> diff --git a/drivers/hid/hid-cougar.c b/drivers/hid/hid-cougar.c
> index cb8bd8aae15b..0fa785f52707 100644
> --- a/drivers/hid/hid-cougar.c
> +++ b/drivers/hid/hid-cougar.c
> @@ -106,7 +106,7 @@ static void cougar_fix_g6_mapping(void)
>  static __u8 *cougar_report_fixup(struct hid_device *hdev, __u8 *rdesc,
>  				 unsigned int *rsize)
>  {
> -	if (rdesc[2] == 0x09 && rdesc[3] == 0x02 &&
> +	if (*rsize >= 117 && rdesc[2] == 0x09 && rdesc[3] == 0x02 &&
>  	    (rdesc[115] | rdesc[116] << 8) >= HID_MAX_USAGES) {
>  		hid_info(hdev,
>  			"usage count exceeds max: fixing up report descriptor\n");
> -- 
> 2.34.1
> 
> 

