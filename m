Return-Path: <linux-input+bounces-15881-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3C9C33F42
	for <lists+linux-input@lfdr.de>; Wed, 05 Nov 2025 05:56:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE5E5464455
	for <lists+linux-input@lfdr.de>; Wed,  5 Nov 2025 04:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A58F1DFF0;
	Wed,  5 Nov 2025 04:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RTNBS3F1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1752F29
	for <linux-input@vger.kernel.org>; Wed,  5 Nov 2025 04:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762318558; cv=none; b=KxWBTQRd22BT5rVVlPvduEuoCs8bGZ4KQoi/tva68hrLhy/6JXDrU6MED1f9E5uPglvwEhkO6mkkEcr3WmcY8CwQWoQCvqCyDwvbpTGLTTLfYg5ytDKYGN9VxPpf3zkanNPkjQxwtRRrH86XaTJNg8cXKz/7N1zLnU7p6SdDccA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762318558; c=relaxed/simple;
	bh=9/Jp1GJaR+DA91kgazRavPpRIXOMGHJeaDr4E9vpPdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKPp7PjbU1TiQ2XT72is3ZsiLOu9UyGCq98AzVXFoc/0Bqn7QK6OLiIZs+ij/Cfwo4o9mp6jsxYG8+O2/80ekSVMtQWL4cdTJMWzOD/3aI2yqczn/6NzXF/rhICUezHrr3ZInwIkJrb6XIPYrYG+ujG5pex08NJQ7oNNnIznQyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RTNBS3F1; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b6271ea3a6fso4406200a12.0
        for <linux-input@vger.kernel.org>; Tue, 04 Nov 2025 20:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762318556; x=1762923356; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3SkGkbWNd8Z24Uo7RXomJvnc0R5cdaaZ4JC7K8uRAoU=;
        b=RTNBS3F1o8AoNciQwC2J7+5ixOKRu7F2aihDDY4akdN7/PB+P6y8ITNH973UQIQMKP
         JDKneA5WT1wrbbPJ0Q/murNqKXmDnEqlypIMgvu5fLRI2pHnhLP046AL73IV2sRvab90
         BflX/+JKtbLfCBN5z6ptSEUpIlsrX1aef1fsbxkDPPrB5AhqxuDhoSTs0EysSohID5fJ
         i63kgnnX/bYt4N6kB7v8dmnibfYxZJxLP+CdeY+/klPWS/nOsrpMsoianirQ/gRJ1Zzo
         A8sLniJ+jUWDYW7lFB0cOaXzvxQbvpOGJezOqiHyZbEif/bdXVkmUi8bZkfKRlbq531q
         ovHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762318556; x=1762923356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3SkGkbWNd8Z24Uo7RXomJvnc0R5cdaaZ4JC7K8uRAoU=;
        b=kcEH6E75LeBLYVcAjpL67EGtuVUM61kyrtdaVXTWjv0zZuMHGfoKq2AoUjMipY+OAr
         wxAOu2X9eLITamj0eRQYB9ISQMLHaOppEelrvRuGcAuCuuoCaP+JRPgGQhVGHEXYzySi
         H7XW76CXSfSCNHLCR+QLdpvUp/1wGHCUKxtbP/YOJHhirVWOBXCpXLfvIGpMrUTya8e7
         iARM+y4VAanb508qCrsVC7lMHm3lI6HTYk8+ASdTsjrsHBYUoMwgY1Q37gz/eLWGG7CS
         ho/IBCJbQWlwNtTnJEYws/zz0kJOdv+nG9Bl1zdiwob1T2EFkZfnSd//3PHNDuvkCC8w
         ZQ+w==
X-Forwarded-Encrypted: i=1; AJvYcCUOHTxWJtN3e3QK6tgG+mmU5CI51ViupwIbbrTrXv+W4wBxt2Jx5kzZZVE+2zoBVpASXbuonjDHs1jyYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrcFfzEKJQCN+BXpMXB8v0b2op720ijkzh2FejWy0HceA3Q1Qm
	tXoUnbaC+GZVfpjPYkbE+wlfDZz9yqLmqzusgy6rRO0Bf0GrDGuUTDf03axeSw==
X-Gm-Gg: ASbGncvpgvKQGemOYcq0d/cf+49LuPXU6jm7NDnBC4XaTOUyxrlovz6i0qhYyyM23iI
	2kByaAR6f4CUtfEKqmEd95pfRyNbYboyhH/5HJ3s0b1y2/tbOI6M0zAnDE/hNdEqRLjD24aHwtY
	TQXVXJFkybDbSu0ntJdgawnXfk2nOUIdSV2WalTjxmFuxF/8n6Bp7Czl3WOIV6vBjFMnApT6MPq
	sP1qTOivXA/E4hzqhUbGiQfVVGOZ2dSWx7Va+dxDyEHzCaCRcXlaBWOOngt9+Zq4IYKtkt1VB8Y
	uI6QYjynbpPkaIKOBlUpKpOVfIY+z++b/NflANStsAKlK1HAbyUS8jMt1VA+XCGkJezOXyy6psu
	8zw8LRkcC7Om7D8MjSkWq3lqwBMkzmiziSZgYERfsLqrNcYsJ+a6AQ9R3cjkBtnSbGx2cdJl16x
	K5vRQkDBP415hJ7fHxZVZ7QtShejMdK7VGQ5yNRM7T0g==
X-Google-Smtp-Source: AGHT+IFvF4EN2vVaoUdNGQ6tkJuScCUogIfE8EU8w4B6e/v0cer3BAbTDZiqWI1pVmd5K+VZJwdt5w==
X-Received: by 2002:a17:90b:2709:b0:32e:64ca:e84e with SMTP id 98e67ed59e1d1-341a6c4957cmr2399588a91.15.1762318556394;
        Tue, 04 Nov 2025 20:55:56 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:86b3:15ed:c006:18d3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68e81a4sm1363766a91.18.2025.11.04.20.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 20:55:55 -0800 (PST)
Date: Tue, 4 Nov 2025 20:55:53 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: krzk@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] input: elan_i2c: Add newline to sysfs attribute outputs
Message-ID: <swn2pwumb7ffpcyer6n5nn6zbdjvxtwxprddymhxzdjzx4lbr5@hkwusbsr5uks>
References: <20251030123458.1760524-1-zhongqiu.han@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030123458.1760524-1-zhongqiu.han@oss.qualcomm.com>

Hi Zhongqiu,

On Thu, Oct 30, 2025 at 08:34:58PM +0800, Zhongqiu Han wrote:
> Append newline characters to sysfs_emit() outputs in func min_show() and
> max_show(). This aligns with common kernel conventions and improves
> readability for userspace tools that expect newline-terminated values.

This format for this driver was in use for 11 years, and there might be
tools that do not expect newlines. I would rather leave it as is.

Thanks.

-- 
Dmitry

