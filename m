Return-Path: <linux-input+bounces-14532-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA61B4741F
	for <lists+linux-input@lfdr.de>; Sat,  6 Sep 2025 18:25:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A66C3BB235
	for <lists+linux-input@lfdr.de>; Sat,  6 Sep 2025 16:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0962524A04A;
	Sat,  6 Sep 2025 16:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P5g1FXfT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED1D315D35;
	Sat,  6 Sep 2025 16:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757175935; cv=none; b=R841NzrVdvEpg8OVbIMqD2twQ4ldAzDw3Y0evhWNBcrs08VNZepexXws2HL7ywZrExpW4EULyaJVvH7vnUXVn+2XSSW8oDn89C3e28tmyxFkHgKwt6UR3h7YW34Fzps8XLp2iSUquf68C2Howi0Ks+sBYQiIZxEJw3m5z2hSdO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757175935; c=relaxed/simple;
	bh=Q44JJ8i5w8fm7QK7oPy2WmRG51Dv69ZVsJb6cMqF4I4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=deFWdvzPRKMfRhX7y6plXyxZGUgpIRGkIsyf4j1OMwKnwarRZ5fBDIdOqSg0R6Nhk676zB7TC9Zaic4b0EmM5E9qJOrh1D+WTkcwrN7BakmSa0XIAGbn7Ekz0jocsc92VXmg6+ayS1peUecgNOFvakMhn0kOxCXs8VVcOv86ldk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P5g1FXfT; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b4d118e13a1so2055138a12.3;
        Sat, 06 Sep 2025 09:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757175934; x=1757780734; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gEnwrOV3MXxfnmmoGy1WCr0zVelqqHdj4W6eSVNaxZs=;
        b=P5g1FXfT2jfUyl/yT/WCDyJs792MCbFBidlcHqPYUxp0zlDIYnW9YTCBv4py4POVX/
         +Y+nypDUFTETblyWiDN00oujvJGsZ8RUM7sGUSinGgZpk3+fZbzLdFe6A+YhbIPQHqzJ
         0D82iRvM7he6vZOd6fW1fRQF7Ufw79og2NcG/8qDojLii0q4mHBgEt8u/m4AdRA47zeq
         jJbX6+d2Adi2dx34lxH37SCuZAbSNwwZW1Vrd7FotLlY7XMaerA2MCWJsR4h92boo0fc
         No8yhffFz5HNjMqQBnUoGbgGnx/FPbXJ5IJTBTi4RcDz9fE4LvGkAlNrG6fqvLhXctwU
         FaeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757175934; x=1757780734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEnwrOV3MXxfnmmoGy1WCr0zVelqqHdj4W6eSVNaxZs=;
        b=L0SUAO4ISvrI7e3KV0ZKA2NSEutV6scMf1vR5dmr0PJEolmsn8erfJDqPfLE9hDCJO
         T3czt8yRM5kLtUW4wmYs13QKDPkuxEPuh614X2vHenSKwUnBuZyr/oyBl12mKfD8cCdb
         0p+AAwVTAsvp44blISP5gNwDgGlG6mpYymkNED7By5kid+wzO67/FrVuEBMVfapYExcv
         fSQwW5WglRrCtwzOl9Hd8/1VZPSjNz5DI4Gf3IKvv3aRYiCQtvqzzDvz8MA0YWcv240z
         RMkavDNjNdiOfZVY5lf1Vb/4ztSY4nLmTyCy6VDvsgxMWiKdI4n0oSDDNsqq+UT3VZw1
         MPlg==
X-Forwarded-Encrypted: i=1; AJvYcCUKnib+/L2My6r+vEbhGMcKbDi1iOBXr8P9gmJRQzXH0jXUFmnGsm+EkrrygKB3g9UYkEERskuAaA4OU5E=@vger.kernel.org, AJvYcCUsCc36/diQjX2tTQhdHwYUutu0KdyyAkeaSCCYqL2tjOV4t97EgTCkn2tma4Lcsnqrrp5fp18C4rbiWviE@vger.kernel.org, AJvYcCW59s2vEav4Knt2LCq1Cgf6ra/Z43JJw9NV8DPrTfgtc/6gDF41uD3o7gzx38INte58Hks4t9KvVVrV@vger.kernel.org
X-Gm-Message-State: AOJu0YzUm1C+vYoYdH9wFPppXWAaV8qvvqc1Pg3mQBoMg8m+hV+csfmJ
	Q39qa1XHUpx46p1GchXUg3jSHG8OCV22/bX50axY9M8yn3DrMjFX6znB7HN6rkMV
X-Gm-Gg: ASbGncv0qp5Pu5O+Tg8Q9nVVMAViZFRQDn0oVHIh1i55yKqi3Q9nEGxcIETT5qZePJ8
	FLB610Mv3Rwpmv/ILi35oIVIUzRLXltTk9vMAzlSaE1Qi2vfHsYWENi/gHY5isDeMVkNv1hbRYx
	vXD9YkJXwpSlqudIosEq0NomhOzR0ZP7CBij+a+fu0zD+Ux8VmNGPCPKKqDg39qpsketrUrl1Xb
	PH9MDbdYpDYGvVs5D7qHJWp/NCDfyfwKMmXze3/fb9VcKJmqLjYhDYf30th3WIrAgUjZ2BIxkq0
	QS9KhgnoDtrwJHjZJu9JN2QnKOh9TGDI47URy7jf95R+jN832E/vvyerJOoqR0MzWHRjmt6j8l8
	4BaWkIaSwis4GqDyukQczu8VNtgFkt5oKe2rIrP0fwBJI
X-Google-Smtp-Source: AGHT+IGUGHGUXwC+KGN4jPZ3eUoPjDhKK1q5TM0NAklHLJQagkflBBhklqliToGCEeYKq03hd3Y0tA==
X-Received: by 2002:a17:903:2b05:b0:24c:a617:1185 with SMTP id d9443c01a7336-25170c477e7mr36953315ad.29.1757175933847;
        Sat, 06 Sep 2025 09:25:33 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:e08d:5959:e7ec:1beb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ccfc7f988sm67193645ad.144.2025.09.06.09.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 09:25:33 -0700 (PDT)
Date: Sat, 6 Sep 2025 09:25:30 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] Input: mtk-pmic-keys - MT6359 has a specific
 release irq
Message-ID: <odrofximcdjjwwowzlpheug5t4pwx5gylfyzr6mqcb5gz3vtud@c2hcoac3svyx>
References: <20250905-radxa-nio-12-l-gpio-v3-0-40f11377fb55@collabora.com>
 <20250905-radxa-nio-12-l-gpio-v3-1-40f11377fb55@collabora.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905-radxa-nio-12-l-gpio-v3-1-40f11377fb55@collabora.com>

On Fri, Sep 05, 2025 at 01:51:58PM +0200, Julien Massot wrote:
> Support for MT6359 PMIC keys has been added recently.
> However, the key release event is not properly handled:
> only key press events are generated, leaving key states
> stuck in "pressed".
> 
> This patch ensures that both key press and key release events
> are properly emitted by handling the release logic correctly.
> 
> Introduce a 'key_release_irq' member to the 'mtk_pmic_regs',
> to identify the devices that have a separate irq for the
> release event.
> 
> Fixes: bc25e6bf032e ("Input: mtk-pmic-keys - add support for MT6359 PMIC keys")
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Applied, thank you.

-- 
Dmitry

