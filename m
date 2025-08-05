Return-Path: <linux-input+bounces-13827-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DDBB1BB8D
	for <lists+linux-input@lfdr.de>; Tue,  5 Aug 2025 22:57:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACFE07AC55B
	for <lists+linux-input@lfdr.de>; Tue,  5 Aug 2025 20:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2376723771E;
	Tue,  5 Aug 2025 20:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+k4IvMB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B840B12E7F;
	Tue,  5 Aug 2025 20:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754427451; cv=none; b=Zgxhm9evHhNyhNAHbzodk3IqwRJ5oK0MtpD3Lrqzk2vaZNzj/Axm7HjQ+pttau89z4DxBk0OH2wsTeEB9CvnX2EbEd5KAtk/tleEavjJF0SNbi6hO/xok5uj533tQUbZSszZM6ceyiJTV6xlliAbNKr1jwg4kuoy9ZJwXyqjCSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754427451; c=relaxed/simple;
	bh=nJY6sL1Vow1jh2tM+KxiZZCdPvhuDW6WGjFbMJBy7lg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bgQO9ihoynkGwRft6XKUUq1E53C/O+62OX8GrkTM5fGHeh1f52x4fz5TDmS2ClbO58Zsrmx/nl574d1Me7OoL94KkPpoqT4bVXCe5jTpN9WJ/Fl/eO+34UCapADhuyKS9c497GgRsvAKqFz6tEU2ZQdjZLpPvcDw12f/L6RGOlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+k4IvMB; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-31ec651c2a1so3887400a91.0;
        Tue, 05 Aug 2025 13:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754427449; x=1755032249; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PZB3WPkf3WjR1LKMOJSlQ99aS+by1+OhlcwCN4d0hnw=;
        b=D+k4IvMBRTabzJwmpHQr57teAGamrutkewVlepk3KVyB6jQCBUVkbaI/kAXlQyh0ue
         3zYJBfYIg52kYII7lDpUatyIeHkmm4sq/CFTnUqiVq8wJm6YWVlHewXlKqJkSWXJiXlH
         LIjgZQzap/phdECfClnpvtTw5a+VU9ig1Gwx0ioOUhCnLYx6bFt/t+182cuG9rY9si08
         iH7XEo1jt+othdUOLeIhtb4ovpoMSIJpFAk9FYWN47AXsLw97NZTO4rDzd6l6kdo6cTu
         UElDnQjVJNXN2Hq/7F6GaBhoeNdm5Tf/4DwcZ938FeC88UlUjv8GGqBGXQmkCLSUjcF/
         xLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754427449; x=1755032249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZB3WPkf3WjR1LKMOJSlQ99aS+by1+OhlcwCN4d0hnw=;
        b=D3Q3/YBl+tyksJYk1gMnbhn+B3sC+ar0VDEjsprni5IpKLeXwn+jOXGoOnuQbRg7n7
         BE030jwP3Yg5Y17/B3aCFy/BCBmLbw/wdB/8IyEmRbgpQijR9BFnzsq5ZubmFIC2B0R9
         M/uimVjysW1V6Tl8pQpQtj3lrKKX9HzM3/OHy8+BWIF8/qD4v8QLh5qNGhXtkQL6mUuk
         mv07+UHAQT/iOAgujzVpEqb7b+N0qL+zTanPDcV6SEyj3/G76UzenoUYy/k6jFGQOEkk
         SM1X2HcySeI04PuTDntckRKtRhILuHerNgbYtgWi0xTwpZ+RWDLOt5ytVtzakc7RLOGg
         ZO6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWWtluLBve9QruNjW7MQH2TeCN8KEwyP1Pkh0qTgOaYjNmwvg4YpAEcoTAsH4SXHtbwfm6dw/2oBxP5G8Lo@vger.kernel.org, AJvYcCXSo5lBhttS8cdYYGPuVSMqByMWE6KFp6yfrjI8ri+oPe6eT8EvVYDdzEO18cT2JEpcqErRNR6srMK2Vg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7JKJKHBy/uIsTtjCuvzNUctWaGd/ZNRh7P2QhHAswKKLflwuM
	lPmfqdU7uHCuXP4IH+q1mLmJaSPlh6Su/B/sFVw6Jiog1X7j2XVM3Mn3
X-Gm-Gg: ASbGncslkYslyBadtrINrsJ0Su4tCGUiZcajis15dC7OAKKu/nowe6FKYfcAqlM06Gw
	el9mbPumGdjENDi3idm/eafyzRpgkDOCgNXui3bM0tb5YidPAnRrd9qvkHFfzTBGdkt7HdXfqRt
	0bf0fLQpv8hpF6p/qhn/chGsbtfwGeyZ9/2EUHOD9YNs8vtsWQQi4BV/EWR/xELrmTIUbXFqTGw
	ZGcxSe5Kaz9bMHvWn1GaHqP8LD4XyFPr3TSW8FeOVGpBRqt2WUNQwsZwA7pm+jwbtTRRoZ0sQfl
	BjdBtp2JMKsCfhl1bIJmge+L9SC/A+jD4y+50Mnwliu1XMN12j/ofKtlgqTNLw02ISIV7KXvWE2
	Jh6PU/QZhnCkm6b8DZo52a6ftjGghEmLv3w==
X-Google-Smtp-Source: AGHT+IG444f++5vk3FrhvAJtQZExIerTSfjt7xRE0X6jhjyLmVTLpcVShlovUWrdPmhXw+dvslCrdA==
X-Received: by 2002:a17:90b:2fc3:b0:31f:336a:f0db with SMTP id 98e67ed59e1d1-32166e093b4mr240510a91.10.1754427448808;
        Tue, 05 Aug 2025 13:57:28 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7365:6457:e1c0:7ff1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63da6141sm17808048a91.1.2025.08.05.13.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 13:57:28 -0700 (PDT)
Date: Tue, 5 Aug 2025 13:57:25 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Vicki Pfau <vi@endrift.com>
Cc: =?utf-8?Q?P=C3=A4r?= Eriksson <parherman@gmail.com>, 
	Pavel Rojtberg <rojtberg@gmail.com>, Nilton Perim Neto <niltonperimneto@gmail.com>, 
	Antheas Kapenekakis <lkml@antheas.dev>, Mario Limonciello <mario.limonciello@amd.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] xpad: Add support for Thrustmaster, Inc. Ferrari 458
 Spider Racing Wheel
Message-ID: <qnu5h6nyigaxdv3m3uxfztrxm6bad6hv6jfnvgbkr5ewhjgplz@dleqh5zzljbd>
References: <20250805192036.53918-1-parherman@gmail.com>
 <1607cb00-1146-4a64-92cc-65eb91062706@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1607cb00-1146-4a64-92cc-65eb91062706@endrift.com>

Hi Vicki,

On Tue, Aug 05, 2025 at 01:23:39PM -0700, Vicki Pfau wrote:

> I have a new driver I've been working on for a few months that
> supports all of this stuff properly, including wheels, that I am
> hoping to support for the 6.17 merge window.

6.17 merge window is closing this weekend so no new drivers can go into
it anymore, only what was in maintainer trees/linux-next.

6.18 is the earliest option.

Thanks.

-- 
Dmitry

