Return-Path: <linux-input+bounces-12673-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FF7AC9805
	for <lists+linux-input@lfdr.de>; Sat, 31 May 2025 01:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69C0217AD3A
	for <lists+linux-input@lfdr.de>; Fri, 30 May 2025 23:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 981CA28C2CE;
	Fri, 30 May 2025 23:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddMEH6ux"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C85421884A;
	Fri, 30 May 2025 23:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748646869; cv=none; b=nH1kjY0PG9cX9Ji6WNSe4zKZWBUWKIlnb0MPpShRCHDClNVb2A18AGQ6X5ClsJY/KON0sk67+btEJV7k2oSG3+n7Xpu7HUez9I3XQanw+E6Jk5lBUw5zyzslhPzF+9c33vGnUl1aKZlOBzf9xJE4IcxPXM7dBjn+HlE2+6Y4UCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748646869; c=relaxed/simple;
	bh=1xxtjrjvNzQ/vVlQhd8UkAkskcNVNZ/Qd8Fvv2+g7ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O5sqvDztVfrulvhwrkYUSxhmy8a2uzCIndROGTKYF4kHSNgL+/dPI5GN/UQV/1mY/PiTLmsqI6dsqZIDLaXPjVGMsiorADkhU/Rhlg0WtNWCNNJC9nvxSVQDzVBAhuZnsYtDSB3xxkNQ7tjNxa2Lz1iZzpdiCAaaCye1PVQ6ISw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddMEH6ux; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2351ffb669cso18767755ad.2;
        Fri, 30 May 2025 16:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748646867; x=1749251667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=05FTeTvI1USsMwE4U8Gmguq7t6PTgIZfYVr666J83cE=;
        b=ddMEH6uxmXcHRWCJkAe9bDNiZNbxEEi6gqJmF48Z0+oiRnZUt5EEnXit/9Ld6tfS5Y
         TiqNwuaDqAqKC0ZtAQDL757LOL6AkOYS0UnnuynB0jVm6iCw8/xuA6IgF83//whJb95P
         Af7kpXip4OmzSyMYO7KPOjGY+MHqpgq2KIwQ780qnYp6V8haUomB3MNOQPYBaXgUyTyr
         Lwk99VfOQ89YNjYtP/TJ5ZKQ/wVIlQvf72dA4T8SSje9h7Jianu/Zu70nxff1Sgcl5ks
         mnmys7stkA7Fv3NtFoTJY0Pkx7EgwzEYdkwNTKL8M6OIYXqWN5iraHPMd48B3XjkvsJ2
         6lZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748646867; x=1749251667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05FTeTvI1USsMwE4U8Gmguq7t6PTgIZfYVr666J83cE=;
        b=jSIsqQOWe58WUnDAUc82qGAcDkKaUJvnziqB1q+ynmCI33rEGiL2H8qOziYas4GLM3
         cMEHDg7q9sC68mYBGwD/eGvQPU2Xc4+zW1YuMYZZFx4kyLZTOzudAffZpZZDnlRmNgH0
         nB1KFyR09xJyzeW7j5rJz0FZFam6QFUkL9IXe7EHJNW16aiqy1TLgakU21h7VJW5TMvB
         /w5R8tvLvyA7fW2H+9/RzFncMmZebrlkIdnezKsGccLRvzY5agBbONlcOyaKoPSrau5h
         Z06tsDj1ZlA84GqH8I/rvgd6zd9FhITeqJYWMLxMOvlGLxHZGN4E+Azv3bPnbp6AFZ7G
         0qxA==
X-Forwarded-Encrypted: i=1; AJvYcCWZNxc5ypyExyBQc/bMW5ewaDXHv6k7V/oS/y251nzgVLnWwluC/aMI80wzWfwLdFgA3ryPb/Qy/RAfRSGA@vger.kernel.org, AJvYcCXRZjqumAn/dxdycxRC9LsrNhHrIb5dBSaaVr5MhWA3sbnXUDjR67SqyOMFr+069B0r2Gyf19ZvAHJZmA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvu9skIB1IQTSExM7rpQSKYpFLUDIAK+7r+APy7BKQgcb1j14f
	KimBBF/9gCdsgmlZufo4zzKZ4hZBxEw1dq6I3lB1O2mt7ngH/UmSSEYPxdOJGQ==
X-Gm-Gg: ASbGncsBV7QNoUrbFFZ8zH5T6bjdqaCWdKZZqAIqey7xMtarzej1S652vfJJDnl8yIe
	b0x2sftnmO/3jsWSvKUWxIeWyRfFZZP+wVPmmLZbGdYVuXde+RgEM1oTLFM2AJGOeUHT+qt2LSX
	e4+eujXI3nLespc3q5o5BnHkmhS0+cqA5HGsp+KMdRsk2OWxMD0WWa7ufwaf1+katnDfFA7lowF
	D7ke4QPtaeHcuw7Xs8m+4ngMXuZs7UDkPgcfKYhpqd1gR8MaD9PnDL34Jh4d8HwrQF8RPFYFvpb
	RGX2WdBHlVsSeHeqGr3VcPniitysyrxF6Qail97c+JllLHmrJjJ1h1TgE76Ykz0=
X-Google-Smtp-Source: AGHT+IGBT5sIVIB/f9FMVH2nVXhwsTBTwspEdKEpqDEDFnADi69FCX3frKgFssZnofMRq7nupgfaaA==
X-Received: by 2002:a17:902:f690:b0:234:b41e:37a4 with SMTP id d9443c01a7336-2355f6c54afmr803775ad.6.1748646867277;
        Fri, 30 May 2025 16:14:27 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:24e0:5639:ebc6:8c16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf951esm33275245ad.202.2025.05.30.16.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 16:14:26 -0700 (PDT)
Date: Fri, 30 May 2025 16:14:24 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Kees Cook <kees@kernel.org>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, David Lechner <dlechner@baylibre.com>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Erick Archer <erick.archer@outlook.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] Input: ims-pcu - Check record size in
 ims_pcu_flash_firmware()
Message-ID: <brjna7vjgzn6fpbdoxwhzs4qonbs5dzqujpj3lufgkxetxlvvb@oyiz7m6cqltu>
References: <cover.1748463049.git.dan.carpenter@linaro.org>
 <131fd1ae92c828ee9f4fa2de03d8c210ae1f3524.1748463049.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <131fd1ae92c828ee9f4fa2de03d8c210ae1f3524.1748463049.git.dan.carpenter@linaro.org>

On Wed, May 28, 2025 at 11:22:24PM +0300, Dan Carpenter wrote:
> The "len" variable comes from the firmware and we generally do
> trust firmware, but it's always better to double check.  If the "len"
> is too large it could result in memory corruption when we do
> "memcpy(fragment->data, rec->data, len);"
> 
> Fixes: 628329d52474 ("Input: add IMS Passenger Control Unit driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied, thank you.

-- 
Dmitry

