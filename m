Return-Path: <linux-input+bounces-5313-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD98946F09
	for <lists+linux-input@lfdr.de>; Sun,  4 Aug 2024 15:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 985F22817B6
	for <lists+linux-input@lfdr.de>; Sun,  4 Aug 2024 13:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E005837160;
	Sun,  4 Aug 2024 13:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SLnykJ+s"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DE01CAB1
	for <linux-input@vger.kernel.org>; Sun,  4 Aug 2024 13:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722778617; cv=none; b=Owu6793lm9klGuXRfbgL9nCRJrOaf/++iRQXucmF0y7dY8twjWJzsH9m95bgX5s2TkX+Kpi+DSZbTw7tzRL+AX0vP515dPi6YvdiZIrOnwQMvL1mxaZ9FqZlcgLs0m3QENRmr0D+Vs0KeD+m7SHBFpM8PjicvVTmvtnSMlRd/jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722778617; c=relaxed/simple;
	bh=iFguVEayxy/6i/kXK33dtOGb0Vf9o9K+gk4mhO4vv08=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MTnmD+CuiB/UU4rs0YkTNd6rWwjXNILQ2M2w3UyWz+VlqlPMskSI7lNGFweKs5GqVy8XLCN9cG5NK8OsLhtd6VWQiRpbXiWH38mp7pXh6S1BKK/yk8bglr8aUCwyjmrkeMpxMWMv0iLRMScM4wM/zWIbfUNT8hsKhYmzQ/7COn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SLnykJ+s; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722778614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ekGjsydpSil5mrG/y7twbUiA1Wy5ByiU1t/KMOjN+wo=;
	b=SLnykJ+sZ9V/0ke4iQ3f7ZQR/+rirfJdi5Yuj1KZtzR6JNGbv3ec32SVXXeyNQN/zle3aB
	AekXT9ptxi7tKZrxoukE27y2nmRg8UKDRJ+pbx7wmibIvqENfny5ujetq/5jqUm4wX+RSJ
	uoLAYGqsZMVCyZO1JWfoNob/hs9eHFg=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-Qhh9Wyx_MFegMhUVdm2aRw-1; Sun, 04 Aug 2024 09:36:45 -0400
X-MC-Unique: Qhh9Wyx_MFegMhUVdm2aRw-1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-70e9ea89b42so8480752b3a.3
        for <linux-input@vger.kernel.org>; Sun, 04 Aug 2024 06:36:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722778605; x=1723383405;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ekGjsydpSil5mrG/y7twbUiA1Wy5ByiU1t/KMOjN+wo=;
        b=hqx7t7RHp31Ud2/xvWbdHy3f9/mYfR/NVzb5dyfqLlv2up5yS8HfI2us+RyXetM3TW
         aNjWvc8r50hVpeTo10iPGu2KJk/3Nu4nuu7pxIRwlipJuhOCiYo/BUkNia/F5p46D3/k
         ECCnIe+zEEtaeh7+yjGP8N1gd2eGyfPFTN/htSgNF4orTtLugWh9SPp+s8OEt2i0kMHY
         iZH7iuIB2I43KhY4CQ23ZeWxaY2Y7cKCOw86EtN+Gg5TQuTvtFI7bv3OkDzCPpVKSMV7
         30yCYTVMRDFz7RCH7u0UOrrkCiGEMmiUQOHOjNyo8AtQIOy7oNLZw46IOfwZ3QukSYqk
         Z56A==
X-Gm-Message-State: AOJu0Yz1t8IkpAMMu5/agFJJ4OzJiHnpiKzUSxSxdYHZ7VrsjxR+8lwr
	yQd4NwAB4j2HFn81qv4/zt/FQqd1MmvEk3i2bhFn8hlRUJYXjAJXYFJgIn6HMFnHTUhfyizOTwX
	po4H/JfjhmO8RheUSLKhStvAouJuobbu+etFl86F1qmLqWdfglEBS/8MMYExJ
X-Received: by 2002:a05:6a00:10c4:b0:70d:26f3:e5c5 with SMTP id d2e1a72fcca58-7106cfd1abamr9363061b3a.17.1722778604793;
        Sun, 04 Aug 2024 06:36:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEI/UjIDd4rvAzJinT+Y7bDiGXW48q9SiC72cNEtEQrIVj8ZISxG0VFVJqaZYcX9IU6jaU9Q==
X-Received: by 2002:a05:6a00:10c4:b0:70d:26f3:e5c5 with SMTP id d2e1a72fcca58-7106cfd1abamr9363050b3a.17.1722778604396;
        Sun, 04 Aug 2024 06:36:44 -0700 (PDT)
Received: from localhost ([181.120.144.238])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ecdffefsm3943772b3a.139.2024.08.04.06.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 06:36:43 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>
Cc: Linux Input <linux-input@vger.kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>
Subject: Re: Removal of cyttsp4 driver from mainline Linux kernel
In-Reply-To: <2024080301-unlikable-sepia-49cb@gregkh>
References: <Zq3Jc7Vt0BM5VWAa@google.com> <Zq3JxhVMPoZsviDT@google.com>
 <2024080301-unlikable-sepia-49cb@gregkh>
Date: Sun, 04 Aug 2024 15:36:41 +0200
Message-ID: <87frrk8l5i.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:

Hello Dmitry,

> On Fri, Aug 02, 2024 at 11:10:14PM -0700, Dmitry Torokhov wrote:
>> On Fri, Aug 02, 2024 at 11:08:51PM -0700, Dmitry Torokhov wrote:
>> > Hi,
>> > 
>> > cyttsp4 touchscreen driver was contributed by Cypress in 2013 and since
>> > then has seen no updates. The driver uses platform data (no device tree
>> > support) and there are no users of it in the mainline kernel. There were
>> > occasional fixes to it for issues either found by static ocde analysis
>> > tools or visual inspection, but otherwise the driver is completely
>> > untested.
>> > 
>> > Should it be removed?
>> > 
>> > Thanks.
>> 
>> And of course vendor email is bouncing...
>

I contributed that driver because was working at the time on upstreaming
support for the OMAP3 Nook Color eReader from Barnes & Noble, but never
made that much progress on it. And even though I still have that tablet,
it has been in a box for more than a decade so unlikely I'll ever do it.

> Sound like a good reason to drop it.  If anyone needs it back it can be
> reverted and fixed up easily then.
>

Agreed.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


