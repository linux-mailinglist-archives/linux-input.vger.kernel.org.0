Return-Path: <linux-input+bounces-14673-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A65B55F91
	for <lists+linux-input@lfdr.de>; Sat, 13 Sep 2025 10:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98AC917E500
	for <lists+linux-input@lfdr.de>; Sat, 13 Sep 2025 08:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DB112E612F;
	Sat, 13 Sep 2025 08:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jTjGpJlp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7611A2E1EE4
	for <linux-input@vger.kernel.org>; Sat, 13 Sep 2025 08:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757753635; cv=none; b=fWqJVBOHtra72c7kCMfJ7JJKZ7D+BgNCVedQuua6GD7fMIXX6j6NsKpHwzvno3bePV+TKxi+WtP3Do5ibvYxDcyAa0xQxavu+EPx6ky6q/w9KaU2NqZeIAMEIKLWjp94qrS04MkH3lQtlQ84RCj1zLnFmm1e4k2Tv7zAr//5eTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757753635; c=relaxed/simple;
	bh=hjX/8U9e+Qrmt58XABWZDNFleTWJFxO/SMBT8NBKylk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UkMLCxf6u+6+G7KKkCtURN5QNJjv/vXD9EM506dcUtBQFKmEKjBQIt6WEJXxrhIjcDMWcxs8Uqmo0sb5zRf2ZObhM/lHREdqbZbx+jUg7A33JR4M0mn7t2H3Zz1nNfTA3fF4jCvoEvNzpR6Xw4ctwW7LeJjgK+mTRQ6uU9j7GVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jTjGpJlp; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b07883a5feeso474630766b.1
        for <linux-input@vger.kernel.org>; Sat, 13 Sep 2025 01:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757753632; x=1758358432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nRBsxly/heSok1/GwCP1v2e7VTjywigrOJtGbwcrN40=;
        b=jTjGpJlpC0Py7to7GOkrrewUBu15LIyzJ68Cy+vfi/yEzxI/Tt6eQzog15YCgl5IvU
         cYpojcytMuxRruU3ZrjSr3eRVeyn0i/TpOOk4+RodboCpuk6HI7pENJ9ZOl6o5CnMCQ0
         WbMyjVv6fD/sFQsLkZ3hxkYb495Uj14AUBf8U/aWTBzlJTrCk7oXAlQ4EF2kjNTa1lxq
         OY4iYYUPgCNAhyk+TaujDxjXhzGvRayWdX0ZOvnAH2HiT+UXeFFSyVjBPVL/59+1eanq
         Dib2Os/Z9wJc3pF3iVT0qj4nBmfZxeuMIZlbdmgFM0Uak31WeiYAr3eOJAcD9YqhKKGH
         UYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757753632; x=1758358432;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nRBsxly/heSok1/GwCP1v2e7VTjywigrOJtGbwcrN40=;
        b=xKhzafoH5vdJG3PG4cL2TBqoTjYoyOJfV6YuorRwOZC/0OQjgwqmAnuM+utx5+o4K8
         UCaI0KTvIwap3JEUx12wznnuHb+zZz7EPobvo88igyiwjeX0Ca5aqwSrLVeyYO5CUnyq
         g6pdocwy1jP3rmqZJ/vqN2b4HDZEIWm9sV47yQUTZ33NAeib2Alui/Ohpjk9+VY5XohF
         Z6Ts0b67lOto3VagGc86RIoQa1F2rDIKawGbv9BQBrPKT2fPTkXPo3VANZaPJjHXtEzD
         A7ZJsWro4j+b9/QZnpJAqsv+wHrixwFGs/gwhXh+oEVcGDlb5DEeX0a3T8t0EGKqxUHZ
         w//w==
X-Forwarded-Encrypted: i=1; AJvYcCUZbG+iF1cAtHj8GdWPOJplMZtJh4GNUPf4dp3jB/E9XU8V6W116BJTmhuCyMOEZHK5vT2DcNAi7NQ5Sw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4UuElIX4oDwvfVvV9L+HBkPgyRldtu5VB4u00f4WRzCNyCCS3
	3OwDHbTzUgHQlSK4Y2mvU2K177DHDbA5+RXHIFAIUVSMnAyTb0CKY9j+
X-Gm-Gg: ASbGnctJJCQaGNQEjGWmQfEVlbenaRr+CPOq4vWyDQYh1zlKJbpd4pXh1zl3DUE6/7N
	/bo73zRs6FS75WVRgwdD9Fr0MVUQkcjMvNZUaXUy6T6Y6N0VPxvOjeFDhTUC1BvmiGVrN5kppmR
	bjSkYymUZHpcW7nBQ/q8G6J/09fkgZWxuvApi7v4qYqFjcR5H3lCHcCjvrWsFCURigfAcbnLF0K
	loykL8lpLjKOyG0M/ApmJFUVZzcL4UOiNtyWEBHQURUels6L4YKRhxvo7p8cMZyZ4Lr19UiQ9xC
	qR/xJGhmhJ3NtOXtATdCplrLroGQGrUqHosyRqzHT2u7I/vlKiwR6vWxhTTCeN15+PuFVU1qoPR
	c4JbjDeFNlwUejBBfIt3Z8GVBVl9MZCE7Aocx9R7PEewQuQumdlfG8CAqI2akX2IkDZw=
X-Google-Smtp-Source: AGHT+IGRNH90vlh6pNSpSkah5E3lqgD6Qwr2bzQ2h7i2Vu2i65lG54BlgGQar3DeQCKypUkZNJ4X9A==
X-Received: by 2002:a17:907:9805:b0:b04:5385:e80 with SMTP id a640c23a62f3a-b07c3a98830mr539708866b.64.1757753631816;
        Sat, 13 Sep 2025 01:53:51 -0700 (PDT)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch. [82.192.244.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07d09e5414sm218564466b.18.2025.09.13.01.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 01:53:50 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id E9A76BE2DE0; Sat, 13 Sep 2025 10:53:49 +0200 (CEST)
Date: Sat, 13 Sep 2025 10:53:49 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Staffan Melin <staffan.melin@oscillator.se>
Cc: zhangheng <zhangheng@kylinos.cn>, Jiri Kosina <jkosina@suse.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev, stable@vger.kernel.org,
	1114557@bugs.debian.org
Subject: Re: [regression] 1a8953f4f774 ("HID: Add IGNORE quirk for
 SMARTLINKTECHNOLOGY") causes issue with ID 4c4a:4155 Jieli Technology USB
 Composite Device
Message-ID: <aMUxHZF-7p7--1qS@eldamar.lan>
References: <aL2gYJaXoB6p_oyM@eldamar.lan>
 <c8f3d402-e0ec-4767-b925-d7764aec3d93@kylinos.cn>
 <e81e8d68cb33c7de7b0e353791e21e53@oscillator.se>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e81e8d68cb33c7de7b0e353791e21e53@oscillator.se>

Hi Staffan,

chiming in hopefully it is of help.

On Fri, Sep 12, 2025 at 09:57:04PM +0200, Staffan Melin wrote:
> Thank you,
> 
> I tried to apply this patch to 6.12.39, the first problematic kernel, as
> well as 6.12.41, the first bad I tried, and on both I got an error message:
> 
> Applying: HID: quirks: Add device descriptor for 4c4a:4155
> error: patch failed: drivers/hid/hid-quirks.c:1068
> error: drivers/hid/hid-quirks.c: patch does not apply
> Patch failed at 0001 HID: quirks: Add device descriptor for 4c4a:4155
> 
> To which kernel version should I apply the patch?

As the deveopment goes from mainline then down to stable series, the
fix needs to be developed first for mainline. So the patch is targeted
there.

But please find attached an updated patch which hopefully should work
which resolved the context changes.

But ideally you can provide a Tested-by on zhangheng's mainline patch
to get things rolling as needed.

Regards,
Salvatore

