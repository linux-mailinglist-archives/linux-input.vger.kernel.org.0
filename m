Return-Path: <linux-input+bounces-15665-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5187FBFE295
	for <lists+linux-input@lfdr.de>; Wed, 22 Oct 2025 22:26:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F2060355986
	for <lists+linux-input@lfdr.de>; Wed, 22 Oct 2025 20:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0E72F9D83;
	Wed, 22 Oct 2025 20:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/fH0Rcx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0442741DA
	for <linux-input@vger.kernel.org>; Wed, 22 Oct 2025 20:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761164775; cv=none; b=liKZpQ2BEwRVw5MPnJmd86CVvY8oQgTSN0+u/orPkxcUsPQXYJNznx0dKBaWjkxKCJ+9eGupiGh0UnB1LE80EO0zHGau5/lbtyQUCmCvIuEHP75foLq/Iceo2U8flitiC52y2XjwvJDajcH0ywj+V905ARkDT/ZtkxTGZoi5LTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761164775; c=relaxed/simple;
	bh=UsE2MC6YhiU2H2YxopFmG19GYWLjhkDN5teQLVlPj+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RemAUIHF601Ghp170ymjh+YxRjEJtxScQkuN47r2OxkRPr/6Uc2f2yvOYpr9y/6+tuqTViW8VGz4uHGd0MqDNPLlHaMZxwjD+gHG6e8QCo9+OL+TN68P4i+ImmUNfRyrB3RoK85EcfJdX3hJM/tV7NV5dMcLCeomnKrRkZ2EO/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/fH0Rcx; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-793021f348fso53709b3a.1
        for <linux-input@vger.kernel.org>; Wed, 22 Oct 2025 13:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761164773; x=1761769573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T8eeYBeVEIY6XvODE4oNhMEO0a9ohRRG70mMGclTsoo=;
        b=g/fH0RcxhIMeRv9EGpLbgcfa05Fayz2AZmPaBVyQg2saHaNZYqpxwFun3keFTcw5hh
         eywukNJRTLJq8AUudtUSxxd3DNZN9ilnnt1h2w9cssVzkRnc7xn7gKnXrrplkyLTXbUL
         WGewi5g0x75zHFLZKKLYnFy5TWxg2As4mFHzEgrlC/5gM915Rv0n4R0v1vJOqqeN69+r
         kj353/s4I/5qXqHSdCOW9mvwuWwlIboWc89xfq5v2qHsKMuLxktCWqVY7qtOWdQdI2if
         KVRar/oCGYEnnFK/go6eEwBAkyPkRZ9s5JjcTxgxS131qqA86Ng+mUUAS4/BmtwL6GMC
         JZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761164773; x=1761769573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8eeYBeVEIY6XvODE4oNhMEO0a9ohRRG70mMGclTsoo=;
        b=aF0TFpaMJl46NF0mnc5HwdeExpJ7e+TS3M9yvXH5yeP+mPUfNIR0VxnO5oAdW7kNfc
         zCtfr3729ilLmrvZh76DTnIy/+urgZDCAbq8/svLKJJ2VtSSIGIm5SkUnuANISomA9BG
         tKZ5GMzfukZsM9WtsvkSYtnEO4OTtxOocY6wN7HlHjWlmh0dg2N+vv8aJA7fBKVWQLrH
         AyCYjLZj0bW4aaCtTLsz/pB94tCNtR3g9ZEp9TkFcJJS50HUyLscAQsfWea5tcw2Zq3Q
         EfBclD21VJZq62PyRIr+CHVtPtGhisE+iUeNwBPciElyJLn9v2QW+aL6FsA+F5h8sU9C
         d53A==
X-Forwarded-Encrypted: i=1; AJvYcCUck80CFzO1NUR9G6urlNfu90gxpz6ULCXiUF6eJ85AWxS6aLhFmB9gs+FDja5OwrMDLZpA3FmK2M7dMA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/iOA0ZJoHiHx/m5TiykBeGHcq5XqCtlrkv8CXVRJpZL+agIDc
	fqHrtvxgS73WdgpQw9/Ul1Y8up5Io44GYn9F4Pme/pMbcy8yBjhg5k27
X-Gm-Gg: ASbGncvD7fcHjocF8b6LAji7OS/kEfpqrO6tMUxSZ2jQWWGT3OA1LEp6Jk433YgBnoV
	OwkVLxl71kWj2uqrN+KEELdTQ02Is7rT1qNoWH8UDVHuPoMP246JgyephBqgCVV/Ok/ifEq6fhl
	WfQaS2lZJSdqObKlkd1kqE3MeUzOs5BC7jhc4AzAQe3oFkMyFZwHfRs1zApXMyN1QSSlRAIss2z
	nNI+aly22+x/mGW8WR6ruj4sBEuHNgFPEMSl4XbepnQZbuQWhN9TPlfzvVux8Bg+mb/hGHCyOQU
	8wl2zKmZpC2i/FjvPBWhANkU7/gxiZ0C3dCl1tCang/QLdsV6b5oIuA++KW3ZOyJe9D1EbbWpxe
	5uWKl2CTVhPk7Dj28PkNwifUzY5CMyBei+bVKgN/Q2ITz4ShqpvaVQKLkLnD15g1T7l1kvQrzml
	316p4mOKt00YfvFjIlAaiVWSequXK/vS5YyiGcNB/PLTxNNt+frg==
X-Google-Smtp-Source: AGHT+IFDRCcByl//79aXbsGB2yKo3kBq184UaG8KGH4X6om7TJOgKw+yz9TH2hch3mYKqlgj9G617w==
X-Received: by 2002:a05:6a20:72a3:b0:331:e662:c973 with SMTP id adf61e73a8af0-334a8607001mr29327304637.32.1761164773019;
        Wed, 22 Oct 2025 13:26:13 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:53a9:459c:bdc:6273])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274a619d5sm123324b3a.1.2025.10.22.13.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 13:26:12 -0700 (PDT)
Date: Wed, 22 Oct 2025 13:26:10 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v4 1/2] dt-bindings: touchscreen: trivial-touch: add
 reset-gpios and wakeup-source
Message-ID: <dp2qoiiigb3zv3w2osyloiugasgypbgj6lcnikcekqpq2vb7wz@q5qpzmlfei2i>
References: <20251021201924.2881098-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021201924.2881098-1-Frank.Li@nxp.com>

On Tue, Oct 21, 2025 at 04:19:17PM -0400, Frank Li wrote:
> Add optional reset-gpios and wakeup-source properties.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry

