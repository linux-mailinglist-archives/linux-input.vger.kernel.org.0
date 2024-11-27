Return-Path: <linux-input+bounces-8295-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6B49DAE49
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 21:04:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5966EB21246
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 20:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A76152160;
	Wed, 27 Nov 2024 20:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XKUmgCXV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFD612E1E0;
	Wed, 27 Nov 2024 20:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732737857; cv=none; b=IEtuAQaIf/8nbzDE35lijrxmMbdInRNuDNQ8zjnkP+SvaxrBHOGy9mZsJR/CqbWHQ31aLTg5cW0DSPJv3osjge4M/HRyRDXiPdwBs6jnmil4S8kd2LXqYSh4GWvzBzClXILoAzmT/6mALXl3UXQTCGMp6IKOELtio/LHYG07yzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732737857; c=relaxed/simple;
	bh=+I3VcMRQryufEFuF7cLwoQAf4EIUZE9VoFL7v4TeHow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DxJHlsXgz3tF/04IIyCJRPUp/Jv8Dg2B1PvuWn4x2cb388xK3Nclgoz4UUguJIzW8vONeKC8efAlDyLqlSZiFxs+D9I1iAkm9PptRLLLjVovuKtIO38ATCfJT8Sln2IO4+oeZx7aESEpmJMAJxG6KtfIajpHrdz9rZHcyGZ6q3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XKUmgCXV; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2124ccf03edso699865ad.2;
        Wed, 27 Nov 2024 12:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732737855; x=1733342655; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uvRbMacn0TLksEMwMPuDjkuKy33yWDZuBef9N1UTCek=;
        b=XKUmgCXVFBtph0MBWJc/VoJqOu8jikoO2eMZH+HN+O9R7OUVHIYJsMj86eC5pF7Go8
         tZBkbs9qzND2waJoPvBj48FMWIRpag+6xt4C2IZRspHUxwuBcUUloNqhSoeu02PvRu8D
         LTUByatAHGY528lB6HdraWFAeKHqBudcc9FbYOVa6t0lQoLBNbSTDizzVKo8SXjppzgm
         lOCD6i68U+e/iEYmEPousBFdJWZOg2mK9Z3XvQ11Gx/f9ZypV5Iko7IKwCxaDwm+C0LE
         Z0rsmKblmVhDD0AXY4Nlxb7OK98eZJWyEjZklVxCbFkAOBo4YJx2ukmLkpnZYvnAxj+l
         tfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732737855; x=1733342655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvRbMacn0TLksEMwMPuDjkuKy33yWDZuBef9N1UTCek=;
        b=v9ZLbD4XIQNDU3pF33rntGmJGMLWtKIpKIfM/1NJgXNqjXzMxXilEnyZQaix7fSc/k
         CPTrOaF7YK6S/O/iKcUYJM8GWRsM9jT3Kwpisnra7RQhVyrAWTYK7KBnueJF7S+HoynZ
         BoxW3BOR7R1kIY/0WQ7OHM9v7Hyxny83hwX+zMkGuKUBl1ZCZ3bwjob3IH6H0HQrctwb
         1kxhPXOYsLBXQYZJO+JAvKhV53YZK34CbcRKkdyt+yIF88C6QcuLu3/TyJvl6NhW3Aw2
         PVUAzV64NHk/xlmZ9tBcvPmktS+fsKILY7q5iUGj8hHQrVd/OeNViTUm6yD2jii5qyUp
         WssQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsjFY0tK2mGkwoztqClJrbaEjYf+GiZawiojXcWAcnKUUT+FKUrhaHl46XfeHa1nZ0j8IxVYJM6LA=@vger.kernel.org, AJvYcCXO5UO26y6goFKQFn2+Ih9uGRsfIv6I4D9nNCe0JgM7O9xleAP18HYiDWDeyanvMAhkPf/4QXBxPgUzS72O@vger.kernel.org, AJvYcCXpjG7WPop7/W9TCvQTl8zL1VwJBfilJCpXG0x67FYcSJEYQc40Gqs4ftIjrcyfT6cUNV6VYFeAOB2pp9k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGE27tZ+zM7ugq4ykQjYsu1LdgyYjusaIuxo4W7EsgNlqcvcmR
	skNRukO2KmtwgJW1/jYm6oVEHcATAOSq2q185FLPm7egvs0RPd3o
X-Gm-Gg: ASbGnctP18v49CylQ463gCnnZ0bZfh70fpLer3SjK9FukjrMeQpwtVot94ZzqdrKtD+
	jqzpH/jzrw0QW0PTGpJqF4eePrAM1eZhE8hqOlP9EHVK/+GslEf/lf5sKAkjeegtCr+g7pmJAlD
	wF081pzg64IJ38Kp3JqL/CW3iBJzYVmRlOQ5toEHqcDfT9dZNZjsTHvb8YQG/J1xXe+8GWUAQCg
	Zllz4NRbqirjffzGeo0anhPUGDXUDNPQzgER4k9d4g8qXi0CRQ=
X-Google-Smtp-Source: AGHT+IEogU8xye2j4B57UqnY56g++fKFYTVm7QEoc8KlRsqK9zWXzFDDDZWXIYxsPK8wJf7SEaw+6Q==
X-Received: by 2002:a17:902:ebce:b0:212:13e5:3ba4 with SMTP id d9443c01a7336-2150109b05amr48652825ad.21.1732737855242;
        Wed, 27 Nov 2024 12:04:15 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:d991:bacb:df39:9ecd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc3517dsm104549605ad.282.2024.11.27.12.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 12:04:14 -0800 (PST)
Date: Wed, 27 Nov 2024 12:04:12 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: maud_spierings@hotmail.com
Cc: Jonathan Corbet <corbet@lwn.net>, linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: docs: Fix the input_event struct documentation
Message-ID: <Z0d7PHoI1FmeaI15@google.com>
References: <20241110-fix_input_doc-v1-1-745d5f908e61@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241110-fix_input_doc-v1-1-745d5f908e61@hotmail.com>

On Sun, Nov 10, 2024 at 07:05:02PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maud_spierings@hotmail.com>
> 
> Fix the datatype of the value field of the input_event struct which is
> signed instead of unsigned.
> See include/uapi/linux/input.h
> 
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>

Applied, thank you.

-- 
Dmitry

