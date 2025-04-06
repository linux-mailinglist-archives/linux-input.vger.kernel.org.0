Return-Path: <linux-input+bounces-11548-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7ABA7CED2
	for <lists+linux-input@lfdr.de>; Sun,  6 Apr 2025 17:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C31837A3E9B
	for <lists+linux-input@lfdr.de>; Sun,  6 Apr 2025 15:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB8D13AD05;
	Sun,  6 Apr 2025 15:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eDzfE7vA"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555FB23CB
	for <linux-input@vger.kernel.org>; Sun,  6 Apr 2025 15:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743954918; cv=none; b=OIg4vqlC4IgB2ZpgpAvuihTu5EJHWHEDjWi52KWJRvRHtpwrTT3rpcV9tpGHQeVvrYgXGjxRBFyPC25ylmnZUEU6ruEvcyOdcLIXs7c0ESmzIuuNSjqhvNugZmkg2xqRHPDGQY/ddKH8JTADFIkFYSt2iHaR+RKkcjlbnq5P1kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743954918; c=relaxed/simple;
	bh=96wKEpADwha8G5Lxd2J7n6Wp8O3FAs9oTYl+k3K0wC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=BEhaudf1iaJpf5dkZtOY5uOqax/QyAq6HuI4YCd30tqyTPEDZeaKbHo60UOPx6Kq/Z0yIHG5bioSzJ72KlsuMRaLVZL7nTsdywHv8qV8BLa6xQsIlSlT9QUe48Gb8tjLRZmb8Yl1EaGxGqroIpOWQvjRHSoMkTQegakBD1QT4ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eDzfE7vA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743954915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sASPzLhXV93WjatM7YLBkr/yAnoKSjxWzbTAvYXizic=;
	b=eDzfE7vASW4pOAa/n2POQVy4sCwZx4zcNdrc7IKxNFFWs2CBUfFmOL1M9ZKgGOM6eTcIB7
	xdn6PAGeajaqDO89+saxaRVqmh7u/tFWug0OvI1M25eTPumTPXvUuiMVqxQiq54IvXvvMs
	wyXYuld5W+Hzpgb3vMvnAJQo4b/ATuA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-TmwCKgv5PW2aTkNP_4BtIQ-1; Sun, 06 Apr 2025 11:55:13 -0400
X-MC-Unique: TmwCKgv5PW2aTkNP_4BtIQ-1
X-Mimecast-MFC-AGG-ID: TmwCKgv5PW2aTkNP_4BtIQ_1743954912
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5e6c14c0a95so2861340a12.0
        for <linux-input@vger.kernel.org>; Sun, 06 Apr 2025 08:55:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743954912; x=1744559712;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sASPzLhXV93WjatM7YLBkr/yAnoKSjxWzbTAvYXizic=;
        b=LAYduuy0nVXlu8MRu7ITSdj62jk07oW/0NlpgWj8yi0V8E6nAXQ5jpG2dBcAb81QS9
         OCGQKHrZ2kmdIHMKNZhyu1LTbMGaDB1hhUlbRmuglCQhHDWsZLbBlekrERLWsiclzTwR
         bwlzmxrldPc88jkSzfvcC0/uYwcNlssKuoPksFOwtBXj39dUWZEDUF/f9kie3EQ6f/84
         XdhBwv4MbjPrMCaemxv4WR83RcjIPdmzEbxH5fZ+0p8rZebutwJjp8WXK0w0xtuogZrR
         Q9YxsAmPVF7Ah9HolGe3aCuMERZJJnq2xG18DQITRxESCZjemAxFY4kDGY7xL+ZTimSE
         rrlA==
X-Gm-Message-State: AOJu0YyPxDwr34/H+9ESliSwfS+1fKeAHozwHgERoqWV7YSjlsUKr46h
	OVop13QU7Op+jasSSUH6Vy5pK0+NzHfTsOCAQ7hLP84T8QtZWlEHvCGpw8npYlqzR7LEHj5nGhu
	rYve7dsxfp6vVuVFrF0ycTzI90ttJWWziYSm1KU6/TycPOdRgOzllK51o47SM
X-Gm-Gg: ASbGncuJ/9W3K7InkiY5WLmVoKnvuRwAZZ9sfGvOZSlJgS8AErw3kH7EbRjDhp9cJu1
	snn7qpi8l5bEFqiTOZ1VJu3L+gIvZdrbOIcDT42o3FjkW32rkkEJxmgTGHd0V7+PCweEPcv3dDc
	H53EGtO16wEzaO56oIrpdyy3JcMVoZJKRvdP4aZBO1ICo3veSmJwG3fSf1mNaPD969fgSvOklm1
	+mVCqA6+MaClREASKrcXdRqAjmkUvLmp9xbrFt9tZjMEHPxFZLvULNX5lt1qvZIlHKgPk+FMgvA
	u4PYamBHJh0GRZbUDtZRZCD9VXUd1G2q1N8L3xPP+3F6j6Gq4cbrI+8VCjqxPiouxLxzMBkXilS
	CJCh3TtiIgT2KerwGhGRQKAFF+qw0TBPC5DtuXxQP853zisd6nNnBsrpuaPvc4c3b9Q==
X-Received: by 2002:a05:6402:13d1:b0:5ec:cbf8:ab28 with SMTP id 4fb4d7f45d1cf-5f0b431080bmr8234802a12.22.1743954912240;
        Sun, 06 Apr 2025 08:55:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMfrUcdcRqTSNqbQTwm5PVcpUIgk9Ut3gasHOqbYOSUGLeYQ3+LbfzRuDtLV8qB9gou0hhFw==
X-Received: by 2002:a05:6402:13d1:b0:5ec:cbf8:ab28 with SMTP id 4fb4d7f45d1cf-5f0b431080bmr8234787a12.22.1743954911773;
        Sun, 06 Apr 2025 08:55:11 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a4027sm5408252a12.73.2025.04.06.08.55.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 08:55:11 -0700 (PDT)
Message-ID: <d0b9a381-b00c-437d-8e5e-38aa5de57f2d@redhat.com>
Date: Sun, 6 Apr 2025 17:55:09 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Progess with GeoPad Tablet
To: Henry Isaac <henry_isaac@live.com>
References: <AM9PR03MB7712C3309E9C832FDAA3A9CFEDA82@AM9PR03MB7712.eurprd03.prod.outlook.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
Cc: linux-input <linux-input@vger.kernel.org>
In-Reply-To: <AM9PR03MB7712C3309E9C832FDAA3A9CFEDA82@AM9PR03MB7712.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Henry,

On 5-Apr-25 6:12 PM, Henry Isaac wrote:
> Hello Hans
> 
> Very sorry to email you directly again, I somehow lost the the emails with the community cc in, feel free to add them back or point me in that direction. No idea how I lost the emails. 
> 
> I think I may have made some progress. Before when running 
> 
> sudo i2cdetect -y -r 9 
> 
> We would get no output, just the lines all across. However withing the BIOS I found that settings for the touch panel could be changed. When switching from Goodix GT7385 device (which works in windows) to Goodix touch device when running the command again I get a new output 
> 
> Line 50 d 
> 
> Unsure if this is progress? 

Yes this is definitely progress for some reason changing
the BIOS option seems to have turned on the touchscreen.

The output now looking like this:

[henry@archlinux ~]$ sudo i2cdetect -y -r 9
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                         -- -- -- -- -- -- -- -- 
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
50: -- -- -- -- -- -- -- -- -- -- -- -- -- 5d -- -- 
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
70: -- -- -- -- -- -- -- --                         

Indicates that the touchscreen is at the expected 0x5d
address, which matches with the "Goodix GT7385 Device"
option in the BIOS.

I wonder what happens if you change the BIOS option back
to "Goodix GT7385 Device" ?

Does "sudo i2cdetect -y -r 9" still show the 5d entry
then and/or does the touchscreen maybe start to work.

> I'm wondering if the bios has 2 different options. One for windows driver and one for generic Linux? (If that's a thing) 

No that is not it the "Goodix Touch Device" option
you chose is for a different Goodix touchscreen
at address 0x14. The touchscreen now showing up
at address 0x5d matches with the original
"Goodix GT7385 Device" selection.

Regards,

Hans



