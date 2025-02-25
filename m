Return-Path: <linux-input+bounces-10316-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F38C5A43505
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 07:16:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00EA419C0447
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 06:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18DBC2566ED;
	Tue, 25 Feb 2025 06:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K7/DtC/N"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AD93207;
	Tue, 25 Feb 2025 06:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740464135; cv=none; b=h2JcArrHJRJL1L7jiZa2M2VosrHwLW5KHlC7NkU0kjKgAVltBY4GSCqgC36LjRmLSmS9xufT7kbiUyfWeA0jugucrEr+2SaTNWIcow9HR23J5sPZrIVPIvWaipcFyOScNLhKa/UA1IOAC566EHXBLzNiSaYXt2GObvd8gsj3Imo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740464135; c=relaxed/simple;
	bh=HgM3X+2m9OLk23re74divjBIz3FHJmXQ7ME23ohXbng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VvZzEcS48lHQU3QFazlN7mnHm7fWgrRZxFq+kZAnAwqZJhfhY2Scwr0Ge9TOqKO8RPbXazLzWSimN9CgGXRnWthRtA5ZkL0KFl2zSZxd2qB3eTFhVKGx8ESVbWbzDo2cwwwuSH0Ep9R4GcSsw2YeUrd7uNZ601VR2jbJ6kcdYQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K7/DtC/N; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22100006bc8so91332265ad.0;
        Mon, 24 Feb 2025 22:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740464133; x=1741068933; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BTJ4YW1E/d8/IwyVSJf2kPq90RY5NP1f2yDnDVRu6go=;
        b=K7/DtC/NmUCG7bZB1v4OErQQm5AOKvQjy9t3w2AK6/F6xGzTFo/QgEc3nuCHK4r7sF
         C2ZJyufCZiOzSJBqw6jzeWifOJxMW2p1E2flbqLJmLi1VMK/VnxHfl046UPPhN74vCNE
         bEPnvqE1qRB0sRV13WQ5BpNbd0/lPWt/stwjLe0vXdmVLHda3xbwwFxfU6lUC0jndDxu
         gwIHEOl5hMirW/dKeEaHAZqzk1dENYrAxoHFLP4OzUUiJnYdQDFGv5V/RvbEcmO7rOgE
         HtagH343KjEmqEMShNlDZWOcvtl7Khc40523gnKmZBXdBjtSHhDuCH7e9pXKxw4L0efq
         AkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740464133; x=1741068933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BTJ4YW1E/d8/IwyVSJf2kPq90RY5NP1f2yDnDVRu6go=;
        b=dbEttKNpeh8PO6Uoirl83RreIwej8v0hnvgnmyO5HCMNOgIlN/jSCaIkB71d5TnvHz
         MAwGUFigMrbQ/WTMuzVN2LlHI99ju/ybig7cW5qUfp+v0qSdm3cZXvgC06Zg6+FdFueL
         RVTuG7hLGIPZUQ46U2EmjWAN4vzubMPP0gw9SZfNMUal3f+9Y7ReALi+525g1X5Vaf8a
         mkAFGT3v0+2SgwSOa1mKBpEGAIkIRl7ecwFbw8NwXwRDUADCA/fki3Jjl+1JNnhKhdp2
         75DCwUvKGtd/K1k6AW+akU6UIG2u+AR89iMX0YotnvMVe1OIsPn00TTNepEcIpDKgXDI
         p7lw==
X-Forwarded-Encrypted: i=1; AJvYcCUIGjbUwSzbntkc1qEqKkvQi4Hd+o3dOgvOl+depDIvpfhJl9DtWEVWWU0x2aUpF/pdvE7zSdBsyjjdZyYz@vger.kernel.org, AJvYcCV6tRsS/ab6EC8zHxvTmauYKEtEZoX9cl+A1uY7aSK69JYfj2WH91cWklylZGpeVIm+6jHn0iBoQQUu@vger.kernel.org, AJvYcCVcVeP2CRh8mL8FcEoxyoieZjJFQ1x5PXJgIWkTEQ6HHpZL1TxmDjRS0dN4VlhQhKnpz9JYhgRMmw5kWOM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZEbvbJEY/HSr/pHL6QkH3AAuUukY/P9eK+hXfbCf9p1W/rDAY
	3DoJzSUr+17wlU8Ox9Ln+cWGZHHdv/JIhz/STUKzAxKeC22PL7GK
X-Gm-Gg: ASbGncvnxXGpirvda54PoxPJPmPaO9/4HuznOlsf3MjkAaY/fyIwfwNdsLWtZhLW+R+
	FD3wJEQdYt2RoeeYOJBWQqdze7YY150KkoEpniD4r4CSt/ZlVJ8FIa7sjOFyd2mf2fGuypbtW/H
	7VWCOhSu+heInOBzcDN5CNIY/k9B38emTFzPUPsOUGp4C28BBm16gx8onI885n+8tY27sbjiVBx
	8DuA31N9eV7mhQtHwFfS1yHPT0W5mCVvnf2915guk06iv24MXLqeqCqMmKBUHRgVKXP5Wci5bG4
	lEtSCdKSXpv2EO6kgJDjzKqlDT0=
X-Google-Smtp-Source: AGHT+IHDiLECh5yByH1sqMd4J17h9IDxzVERpUbYyDl0rY6eqOShJa0CuOD+3YJm6Gm3L11VgcDmyg==
X-Received: by 2002:a17:902:ec86:b0:220:f151:b668 with SMTP id d9443c01a7336-22307b4c1f5mr33221655ad.20.1740464132903;
        Mon, 24 Feb 2025 22:15:32 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:464c:6229:2280:227e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81ea22sm687195b3a.138.2025.02.24.22.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 22:15:32 -0800 (PST)
Date: Mon, 24 Feb 2025 22:15:29 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: fnkl.kernel@gmail.com
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH RESEND v6 2/4] input: apple_z2: Add a driver for Apple Z2
 touchscreens
Message-ID: <Z71gAbRi4XRZ-fTb@google.com>
References: <20250217-z2-v6-0-c2115d6e5a8f@gmail.com>
 <20250217-z2-v6-2-c2115d6e5a8f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-z2-v6-2-c2115d6e5a8f@gmail.com>

On Mon, Feb 17, 2025 at 12:38:02PM +0100, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Adds a driver for Apple touchscreens using the Z2 protocol.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>

Applied, thank you.

-- 
Dmitry

