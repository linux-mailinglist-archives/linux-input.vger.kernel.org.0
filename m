Return-Path: <linux-input+bounces-16123-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FE2C60EF5
	for <lists+linux-input@lfdr.de>; Sun, 16 Nov 2025 03:13:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 98FE2356D91
	for <lists+linux-input@lfdr.de>; Sun, 16 Nov 2025 02:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA7C1C3BF7;
	Sun, 16 Nov 2025 02:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DUE5nSgY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4CD1D5CC9
	for <linux-input@vger.kernel.org>; Sun, 16 Nov 2025 02:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763259214; cv=none; b=FcLjzoNrY1W8Xp0Plq60YsCl1dZqbWz+DeJPl7l/aDa+a9q7r9nf3q7Jc6SKCBHbCOuEQB2YkWPN7B6D2jJB0PJtZ9niPj99Y4vycI+zWXkuusDnXj7r3mWzRNbUAPwqoZmJW7+cDA6R6ZnFH/mNQ0jyhqpErsLiw1uSJwpStk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763259214; c=relaxed/simple;
	bh=/44LvM8AQWggp4U6i9NO52b1VJ4v+EeJJw+1KN2isK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cFjNUQL9Wy7H2kMgG9t+YsbZWPPN0Th3nXvuxBrGsWnvJH1eMGaVT7wvNF3MgZ2/1fWwOZ98XBPaM49jbZeTU2HZXFndPb3/Xcl+1LSlQ+TfaoCXKkscqznaloFtYp/YzlOO7w+nMqJvy99TzGMiHD1KndwVj6OQ01GzfVYY1R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DUE5nSgY; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4775ae77516so35448975e9.1
        for <linux-input@vger.kernel.org>; Sat, 15 Nov 2025 18:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763259211; x=1763864011; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eO8eJm3Fq0xeKh1Umx2qOWJV932ivv5ZYwTFxdS+7K8=;
        b=DUE5nSgYHdUR/rDq5jyjqaLUPMLjY7b8eBRCrDfT7ARAjqaiYH9g+Zl1Xvfm+7a0Ub
         j0/Ui4Rn9Vv47JxglDgr4L9s20ahuOqbuSqWv15OIyq6j3ItQsn6HBrWLreDvvMKs6PY
         IEgHkbixZTWADM4La1L4TaFO6BcchawvhSGsGDwjCsAivH2fcKq+Xnkdax8tnBs3WiLT
         A7RiNJwfQyppZOQIrX2XLgpwALfHXVJtTWURMADibXySPnBHEYjbYGctmmIFdmBvWIFS
         vNUMkRyWR6KH+s71rHwvyP8r4FeQJVtez6sitSz/yMIH35DMvqgVvBn+p6Mr6U7gHy0u
         0GfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763259211; x=1763864011;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eO8eJm3Fq0xeKh1Umx2qOWJV932ivv5ZYwTFxdS+7K8=;
        b=kWGI1oQMT59jszgGg4PuAQ15f8jgrNHnFmOrv8rqlLaEoeTMb2tcD5/KmH8eBRzsQK
         8/JjHeVYQHnrIFpqyF9Tdlu1gm+EZ9U7GMVf0v4cZ6C4XKFs1ZrwlXdThMMgx8FtNmWB
         TiXzXbt2Y5Fw6c2Fx1+9s1ii84QlQO7CBLZfIUGgWL789oT3W+ii4redKp2fuD/7J01r
         f02xi9ry1Bjp20zrEfasX8elrCNUTo6kKzhGn9e2vaZcVStiE7m5P4MtMoonYW+WBmLh
         DrGrdTg+9NAibJ78dl2Vlthb+O0KOU7BVQcbnuX76G3JBBPPNJJgOgNZRuTkB1rzXwW9
         +g2Q==
X-Gm-Message-State: AOJu0Ywi8utOmYRzCcZUiupN9YsubyLcAFmQt29ybG0L3Oa/NTLaCpng
	UyKJdW1xTyejym53C1gH2BXsG9eS37Znde+GvPeEN4DE82d+6IAR3luu
X-Gm-Gg: ASbGncto7W6ZUzNVqRIgVW+ww3F9+qdqy4lTU7Kfb5mwWFAxXGRmVPbKvZsaba0jECW
	TfAvtJb282j+xqhc8z6IPnqY3swnx8USn/j86LrkyAB257I7esOnEepmBXi8ZFq39CQKNbtTiHW
	5hSFPj1dXhsEXepa/+jwSH3RpoDQ8BmqvopQeBYttBQKNtiM/jTuEPITT7PL2q3wTu0zapP/hKn
	MsYHTJQ++iMfMAR97kAF7356QStK2V2JHjYIjdfrRaIotoAgbqYCXk/2ieIHlxgeXnUY6yGd+Bi
	//HsZEoT4u4k3bOMygpSAKU2Zx2mSsP2KpVnbs0fCSHO12YU/08D2Q84EAmVsGI1DV7yjvnwWy/
	d9ksTIkcBCOZciBjnMl7ZbpkhcrLg8WnnLjdvoS0G2kuABY1age7AOLNcJQ+DkxW++2Y/jSjUdG
	7jyWJ2w9u+6Gy68yfl7H+F
X-Google-Smtp-Source: AGHT+IH9zjmjM4RH80ZZVg/4C+XCKs+m6X/4uGXRPlJz6MZrtR+GR1Z8B897Ghs6U6rlb80pSwfjLQ==
X-Received: by 2002:a05:6000:657:b0:42b:2a09:2e55 with SMTP id ffacd0b85a97d-42b592d106dmr5971024f8f.0.1763259210666;
        Sat, 15 Nov 2025 18:13:30 -0800 (PST)
Received: from [192.168.1.12] ([197.46.78.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f174afsm18243360f8f.33.2025.11.15.18.13.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Nov 2025 18:13:30 -0800 (PST)
Message-ID: <b576d956-2efa-49db-aa46-c7f937beaf47@gmail.com>
Date: Sun, 16 Nov 2025 04:13:28 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: memory leak in dualshock4_get_calibration_data
To: Max Staudt <max@enpas.org>, roderick.colenbrander@sony.com,
 jikos@kernel.org, bentiss@kernel.org
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+4f5f81e1456a1f645bf8@syzkaller.appspotmail.com
References: <20251115022323.1395726-1-eslam.medhat1993@gmail.com>
 <3aca217a-4cf3-4793-855a-39ed99eb81d2@enpas.org>
Content-Language: en-US
From: Eslam Khafagy <eslam.medhat1993@gmail.com>
In-Reply-To: <3aca217a-4cf3-4793-855a-39ed99eb81d2@enpas.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/15/25 15:22, Max Staudt wrote:
> Thank you Eslam for catching this!
>
> That mistake was mine, and your fix looks good to me.
>
>
> Reviewed-by: Max Staudt <max@enpas.org>
>
>
>
> I think your patch may be a candidate for the -stable tree:
>
>  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/stable-kernel-rules.rst 
>
>
>
>
> Thank you for your help :)
>
> Max
>
>
I'll send v2 for this to cc stable mailing list.

