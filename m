Return-Path: <linux-input+bounces-10524-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A734A4E336
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 16:29:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E67F18871D4
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 15:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 426016FC5;
	Tue,  4 Mar 2025 15:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ehemMKSj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861AC20A5E8
	for <linux-input@vger.kernel.org>; Tue,  4 Mar 2025 15:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741101290; cv=none; b=g3+QkT6yUF5DSlm0zANoTtrOaLBTsKmYAO3x/gDxpYtQcARrhcbe48wSxrViTupn4KIIetfQYyGjbPbb2u1P0NYSYlOZvZiYvyANIzIRsNh8C69ROaiBNfyT8wIA0Mk1KWjr3f/ex7jmG+a6zeAM6vK5fzy6mgOU2mrzSzb6cPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741101290; c=relaxed/simple;
	bh=QH8RRorezmdTYMTKoXYMzC5x5d/VIpIsLclidWF7lHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TckzMqhwcli9jQkfNJE3r1dIl/1TfWPhPYTwHIt0YunFdOyRq/9ExfSfgzaB9oJYVv4vSZgCrNn5i5bZfGQCrno/COzQZpkro+GYkghwskTfBLo9gG2E2PP2FUBsKoqBZay7nrJ6K4FtFXUnmpWR72qW2Fi9mw8aaijwaXTS6i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ehemMKSj; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e44fda56e3so53885746d6.1
        for <linux-input@vger.kernel.org>; Tue, 04 Mar 2025 07:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1741101287; x=1741706087; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cyQirIPuiOHyfjBKhYIIUlziBd1n3c1DfU9q1Z/Hmv0=;
        b=ehemMKSj41lB74q2y2T+bO/dqefUBaJ+uq6Cu1c9YUU5xgkPCyaGOOIEF+ppUA3GT1
         5NvD+bkIsLHJVvTlCzzlgU1Z3L93w1V5A5qRsTCylYR4yLTDciBXEVO60YXJIDRZMhY5
         3EtVV6rPlA7GBPEIH8opL3miv69ZNZUcK9buLovZPivDMV5IHViJPYpac1YSta8ZNoQn
         ZbEW6VU3BZIkUjfeFEHGGIiXyL2w+rS1hDqZfIj5tVQ4PQh2+igoBWY30ZwU2xYJ9Uym
         pI3rrNEBDYZKv8gE8htBJmzDKxxgbOIihwqv9MpG4RaeqQXsKBlWrMVWVgkdty26HxR5
         fP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741101287; x=1741706087;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cyQirIPuiOHyfjBKhYIIUlziBd1n3c1DfU9q1Z/Hmv0=;
        b=U3CvVzh84CqIkzAWtkiVV4YRKIvzmDm9j2OtsnwTUMFcSHLEhp6sm1pMN7xPzOM+nQ
         ASKLy7Tol5+iZV5iIjTU5e4x5p3Vzbsbxfr5SLT8nhppKlOntCvhzkqWBD2F+r8J9WFr
         /m1JpnEWGnkEiDFa+7rGqhmRZTIvKkidtlQhTBiG5hF0aB5I/+SlFr90g9wCtLrleQ4T
         ip+LKdCJqyL97fNogjoxspq64pVgpZMOvxWIGKuBvWvPmI+cWYgt7obZIUYwTQNO6wPy
         UbBDRytbR7YghT8jmb03/+8xBwxjzH5vQ/sYT6QRJnhdHRImu2Nw7mDqgpsP97WX1Aqo
         dn2A==
X-Forwarded-Encrypted: i=1; AJvYcCUekJHl9tZU1BUpzR7OCpclYYbmWuWz8JCyiSX1hVtZbeAnLbShEAZp8ShMCxTeanLt5/xRSVwTE0uHJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd0QqyvynvdD8jppWrTh2wtuTO3CVgkV76N81/AyFIGV5qNpvH
	pHXmV/fA4Y6FXEWAqOmtyBafOYJfFZBk6sBCd++9plfHa//PFKNIfzW/BfYXsJjE1J+6rGT+Fy4
	=
X-Gm-Gg: ASbGnctod8Msi/6M95u5SYzukBxX6V4NO8Bm/crOsmvrdXmhfZGFkZ2BIV5hmb2AbGq
	quMhSRr4MwYTONiZ3/QOvbX9iMPK6N3HoE7c5qDucenHaBuRmdnAIAZuNWSkCfoHWrJf46jYsrf
	h4BA2IAACz9JkW7/dhxRR3yQecm1mHWRt+x104GLQ0lVL1XXXj9OITDcZrczhODTOTG0FkJgKbA
	N2pzgYT/gWdcgbUCw+oCy6IKOhSXEdrUtgYUpc/XKRG2H0DvmowC1f8IZeZ9EANMYFr3aZapJfY
	IBHza5QkEL4Dj0Qeszcjm4aY5XxOqt6yEheDCTmiHfVPQo7Z1KbB5771yzMggKE=
X-Google-Smtp-Source: AGHT+IEyx03NM4dZ8P1UssU/O7Qhz/2mWAebMTS1jkXSxn0YW6FPbHj3UrA4hvHJYCwiNwk0300rVA==
X-Received: by 2002:a05:6214:f2f:b0:6e8:9053:825e with SMTP id 6a1803df08f44-6e8da8c1a48mr44604226d6.17.1741101287431;
        Tue, 04 Mar 2025 07:14:47 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8976da32esm67315626d6.110.2025.03.04.07.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 07:14:46 -0800 (PST)
Date: Tue, 4 Mar 2025 10:14:44 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Strforexc yn <strforexc@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] UBSAN: Array-Index-Out-of-Bounds in usbhid_parse (HID) on
 6.14.0-rc4
Message-ID: <765270fa-dfca-46cb-9d4a-7f4a61c19663@rowland.harvard.edu>
References: <CA+HokZreT4LYLbru4cc0iU4jKkdf40YnVunaGX0hFV2GAnnuEg@mail.gmail.com>
 <21b63d7e-5141-426b-af06-9465609e2ca2@rowland.harvard.edu>
 <CA+HokZrYvNhfGQ7Kf+smO1EzrX2Fvtqm92cEnE0M534kXZKHjA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+HokZrYvNhfGQ7Kf+smO1EzrX2Fvtqm92cEnE0M534kXZKHjA@mail.gmail.com>

On Tue, Mar 04, 2025 at 10:21:03AM +0800, Strforexc yn wrote:
> I hadn’t come across this patch earlier—thanks for sharing it! After
> reviewing it, I can see that it addresses the UBSAN
> array-index-out-of-bounds issue
> 
> Alan Stern <stern@rowland.harvard.edu> 于2025年3月4日周二 00:02写道：
> > Have you seen this patch or tried to test it?
> >
> > https://lore.kernel.org/linux-usb/20250131151600.410242-1-n.zhandarovich@fintech.ru/

You might want to work with Nikita on testing, improving, or 
resubmitting the patch, because it hasn't been merged into the kernel 
yet (as far as I know).

Alan Stern

