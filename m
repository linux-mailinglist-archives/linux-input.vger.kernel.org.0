Return-Path: <linux-input+bounces-16109-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CAAC59E60
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 21:04:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E3F6C4E1E47
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 20:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9ECE27B348;
	Thu, 13 Nov 2025 20:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aWoyZyC2"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3F729CEB
	for <linux-input@vger.kernel.org>; Thu, 13 Nov 2025 20:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763064264; cv=none; b=ByRSVncuXvlWHOdcB1Kvu9AOEI1kqbHof+rS8AtyemQEj8vgAkx8sg92eCmme3CvEfwXjlKM0tt3VgyeQNIjShLicspbWE8kWK415Iy8FDt8EV7b+E3q/8K6hcrhSB7LyLXRAp/xTuvArWvIAbBKdfGgeTDvgEGfvmTsSEDRHV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763064264; c=relaxed/simple;
	bh=nS2EOOhXYKViSOIAeMm+5byQzloQ1UOjHaKAxYe1K08=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:Message-Id:
	 MIME-Version:Content-Type; b=RVhtykuVaALqKErmfMzeqG40Z+pPXu7BocTpHPYDa26P3GIRCsOiKb6SfZ72OdLHDSsZd7zqyH7H0Ev9VBvhN0lF424n4VuiQDWhzD/pCFRJXG+zG/VWQbWNXEPou8aDyhRH6gXx9tJfOTptTmGEMAJeC5qgY2YGLu5YX5WdDWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aWoyZyC2; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42b32a5494dso685807f8f.2
        for <linux-input@vger.kernel.org>; Thu, 13 Nov 2025 12:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763064261; x=1763669061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:references:from:subject:cc:to:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8MvqGEXn68Rb3JBy7AEmcOluZgy1M36Tqq79FsoEVis=;
        b=aWoyZyC2RYGwg5L/sBcvmhlv8PwGrXy1BMkbLox5kxGnvdwphxwoEAU0b9aVy24I67
         0Va2bUV9YKNXvRSwKTaLktLOhV2VTRixbZmsfFSTztTYPUjvYxQFBx9CuFNySzX32dhQ
         0hDxfNXQble4yUu0gCHKPLccB36vN796utjtNIK6oH1h4+I6Ba23z3/C0/hNxQa2Gotm
         kDs+lGpI+n0vyuOJjmEL2N0OYCbC9wppjPuUuyGB0rz8Uk4MQZJW935F+2P6i4rOvVsn
         ZOMRF71VK4OX04wq+oIz3d7R5751Gb9sG62TOCizuCXjJi5zXUrEMJc0E6HRi/eFffwg
         kN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763064261; x=1763669061;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:references:from:subject:cc:to:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8MvqGEXn68Rb3JBy7AEmcOluZgy1M36Tqq79FsoEVis=;
        b=jmPc+43JCcQyZHcmZo66tOQlG25t6+1jcfQjVibKTHO5NVYsexQzumuug8OoxxVzXw
         ML9pVMLjh4AqsYxSp1qmArcVsws30IxToPdnMnRQTlKCIX9u6elHOX75miP1QABGppzk
         6fCBemnS/iCbeT7TCaAQ73J4EEgnSu1sTAZWBZDrMUSQHzzdCoQ8TJfegAMS4WQiWryW
         bjiaRwfR0UNktE44VXVOMXiI7hUrzheNmDIlE4kzWDRkK6fbJtyLg7dFdiUIewbryR2v
         SvS43HastnaTT0O5LOPzgAz7NR0ZxdY9xJTHZjpGBesHkcWHu5xwgGi16knemRfPIBko
         Ellw==
X-Forwarded-Encrypted: i=1; AJvYcCWTioeT7xuP7oT8sqJ11yZcWWmwWFQqZMbbSi1rmgYd2DYEShfvDjyzuljOiQPJtK2dVrgKYW+ctgGnnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvCvH8piSGGCVOvHWF73YJdC0uS9qmFTXe7+QTkpcjE+YviPUd
	NWBcZrIYaPWK70cuV1lixAFzvVObmBDcQLnnI59+MR1w3C48lOu97YW1
X-Gm-Gg: ASbGncsnthg/Ud5xRX4Tay0+Vn+ecQk3H4w+VSUZVPTBs2a7uMvXtDz/5kP3gpe+V5w
	F4K4DOqdvaPVEyQ3IHNTPC12kLhAIvKq/eY+U5j+QIBs1Ww96S1yzvqnzkM3193awSVrHoGbBxd
	GMNe0v4RlhGv90LGpH2EgoTnr8DvlG7EOiyDT/QnjwECPUTfv29am9819AaHIgsD6b+ZA6rUHfK
	P1l9dfF3l8WEnX6F/dj3c42vyq2rIg3KX+zWX3fKjE7PtF/M4gLT48SpqHeLq3j5LhBiyh0J7rp
	TlQxdjsVoGCppSfxB/+ruA+IfKR7TgBeNAUKVbF9iFzyDkSZVmw5D8Z8M9UNjBdKFxgRt5ndsY/
	akFc/26SPFFlN8Fp4qYp3vkcoEuozByEXPCRDUdIwbpGKtz3K/XrfGQ5GS7BBgTCtnf/Gi8Zipv
	UirumNYKg5AZScxQ==
X-Google-Smtp-Source: AGHT+IHio0sEJlb+wMLrWB9QGlY6eXInKBpRi+AmlHPkKhcW0TL/sk1P8B1KFQkaR7ZKWijSaNjG5g==
X-Received: by 2002:a05:6000:4006:b0:42b:549d:cdfc with SMTP id ffacd0b85a97d-42b5936c434mr496552f8f.35.1763064261300;
        Thu, 13 Nov 2025 12:04:21 -0800 (PST)
Received: from localhost ([2a02:169:1e9:0:8f4d:9ee2:cc35:c67b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e84a44sm5417457f8f.14.2025.11.13.12.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 12:04:20 -0800 (PST)
Date: Thu, 13 Nov 2025 21:04:20 +0100
To: Oliver Neukum <oneukum@suse.com>
Cc: roderick.colenbrander@sony.com, jikos@kernel.org, bentiss@kernel.org,
 linux-input@vger.kernel.org
Subject: Re: [PATCH 1/1] hid: hid-playstation: fix memleak in probe
From: "Silvan Jegen" <s.jegen@gmail.com>
References: <20251113192713.537344-1-oneukum@suse.com>
In-Reply-To: <20251113192713.537344-1-oneukum@suse.com>
Message-Id: <2ZRRQWNSQYRXG.3QYZSHHA37AQ5@homearch.localdomain>
User-Agent: mblaze/1.3-19-g420be43 (2025-11-02)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Oliver Neukum <oneukum@suse.com> wrote:
> Free the buffer if we bail out in the error case of
> dualshock4_get_calibration_data()
>=20
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/hid/hid-playstation.c | 2 ++
>  1 file changed, 2 insertions(+)

This LGTM!

Reviewed-by: Silvan Jegen <s.jegen@gmail.com>


>=20
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.=
c
> index 63f6eb9030d1..128aa6abd10b 100644
> --- a/drivers/hid/hid-playstation.c
> +++ b/drivers/hid/hid-playstation.c
> @@ -1942,6 +1942,7 @@ static int dualshock4_get_calibration_data(struct d=
ualshock4 *ds4)
>  					 "Failed to retrieve DualShock4 calibration info: %d\n",
>  					 ret);
>  				ret =3D -EILSEQ;
> +				kfree(buf);
>  				goto transfer_failed;
>  			} else {
>  				break;
> @@ -1959,6 +1960,7 @@ static int dualshock4_get_calibration_data(struct d=
ualshock4 *ds4)
> =20
>  		if (ret) {
>  			hid_warn(hdev, "Failed to retrieve DualShock4 calibration info: %d\n"=
, ret);
> +			kfree(buf);
>  			goto transfer_failed;
>  		}
>  	}



