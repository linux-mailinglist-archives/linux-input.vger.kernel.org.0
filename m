Return-Path: <linux-input+bounces-10379-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7F8A4514E
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 01:14:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DF29168C10
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 00:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85BD0139B;
	Wed, 26 Feb 2025 00:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GjuYup+U"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B21D224D7;
	Wed, 26 Feb 2025 00:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740528863; cv=none; b=XijC60v0mGhsh9JVclk1FgiDMpzOYcnRyhSK4hTlkf2g6OfVS07/ShRS5fdiz5gDxnlgGUK8cWPESHxvdawRREitsmZp8YsFq3s3iXw8v7gLjLhLcjfAaK1Ki36HzHOlzN01Zh6xYnC3d2tR9fxlQ2fo5m+tb8PjyX0HbF4Yp8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740528863; c=relaxed/simple;
	bh=A3aTVVDpMdzFTZk8e/XAL8nIRDLIylq/gkn+dPvim5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W0APIviL2ahUtw29TNr9AcT1/xeKBgDOIL2EKfdHhfqwW/Hl6z6G1dsObVN9dh5eAcvdE4QYDRBu240nAMz5HHDMu3YmZ+v71CIMab68GuSjenqH1ICi6EOXfzlOMcpyGMQQQjyn1esq32xtUoVasRFNsnmrd5lL9y+Fymj20Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GjuYup+U; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22185cddbffso5690415ad.1;
        Tue, 25 Feb 2025 16:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740528861; x=1741133661; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4My5jVEJErIjStZdjbUIXFTXSHwzHdArtm4CRaNrmw=;
        b=GjuYup+UMTwyYXtAEN+x8Ur6+cqkPAhnFl3+ROGVRqa0uOFpNff+X6mk92W3BmkXxQ
         9/C9hyfzSzYSmuuFzeb5Z3XYyY74ugMSzm+Dgn+9AWiJxh+lcIAM6vcioxDQ23NPPca7
         +u//4Vk9lT2fQRn4AbsJP2RYOL3P3rEVUh6FRCZe1wGgofBYrOdnPhn6qV+B90gDlRGA
         LwQSia8klsYJVFqm8hjqcj7+0vXDVuqe4xzCJfyjCF8zChoXFAW/ozTgsYyav6SpcoV/
         1tbhJgLDOj2mdco+aCb/RZOvigVdShZ42diCW5AmMzptij/iDxO2LTXRsKiakkwoLA1k
         Z71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740528861; x=1741133661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4My5jVEJErIjStZdjbUIXFTXSHwzHdArtm4CRaNrmw=;
        b=ZMDVgU0IpS6OUcwYphEwjaz0L+WSasR/UVkmqA/2j4AT9JA3QDPcbfJwSrdse8a2Dc
         w0YtPNfdevQX3NMn/7tUT3AgLLER2RTmHSQj/2SL3YEABAUstgtjwmRqxBQzVGK5LSyP
         HKWXeLks0IyNrF9AcPhBc2NPlLHtvojETPGE23AsqV3maIjzqwIi/eJrHyd6vrbz4qdU
         EcmdmTVowUiXNC7UhMTGkh26e4h7fJ6aZ/K0UhzueM2mE6wn8PxTeQXjkHAqOxlZpzuD
         qoXCCJMAES05tEj1VnfXi5G3hQv808TfYjWgfZNzXsK53P0X1aETOXfTFLEu4A59SjF0
         Uzvw==
X-Forwarded-Encrypted: i=1; AJvYcCVBF8Oi4nEHKgEu2lbvnc0VFn2vCzQ5IB+SS+bMPDIvuCHgHveIZFp2OJ3Hv2WbYxn9HElg1Kol2EBCgL4=@vger.kernel.org, AJvYcCWjzrQdW04j3eUYQkrqkuAhBo/0ijw8LX+DMy+YZqK+qnXrp2zR3JMSjlAW2HeIgYo4SxM5469ZBMj4@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3k1RWMt5dgdRX5XoL4IztZYH7fDKadks/CTsMJJsj+FpRVCG9
	Hzy0PscR13FJiz3ZxPoqmNPGnyaqz1UidzMe3PhoO4uEeEc16py0
X-Gm-Gg: ASbGncutIgE5wvSgjR5XbDgaKc5Pk/7I++r7R4OOO5JmlhRmLR/jB8ui1MBsxUrDEoc
	kjFeFsMqTT+cnM5JVYCsLCIOzvNdSYQbiSoL9ZXqEvZC5qEoSt4nVI7OrXKLHFgrCPVU/O8Ll7f
	FuhVjlbIVb2w+AW5Ov76UJVhRXg2KFhuVaXlKnWBp3JqS5mbVvXuhPEmOK6qpSF2gMXoE84mFX8
	mJGOgVuOroJM7LH9DYw9+uBF8gM14F0pozl1+rzBX8nukN4yHpCkZ6kJAvnYnUhNEl1SBahOWN3
	SnYt3mMYNjTbckM9AnAuv748Rjs=
X-Google-Smtp-Source: AGHT+IG0WrLRbRMKYCzj2SQyPymEOT3Tmxu8/JqVUhCISyUsQBmHftX1S9Eu28nOKs1Y8EIesne7MQ==
X-Received: by 2002:a05:6a00:2e14:b0:730:9637:b2ff with SMTP id d2e1a72fcca58-73425ca201fmr31364323b3a.7.1740528861223;
        Tue, 25 Feb 2025 16:14:21 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:987e:29fc:176a:2ed5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a7f9a8asm2230890b3a.95.2025.02.25.16.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 16:14:20 -0800 (PST)
Date: Tue, 25 Feb 2025 16:14:17 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, Manuel Traut <manuel.traut@mt.com>
Subject: Re: [PATCH v5 6/7] Input: matrix_keypad - add settle time after
 enable all columns
Message-ID: <Z75c2QU01g5ZLUHo@google.com>
References: <20250110054906.354296-1-markus.burri@mt.com>
 <20250110054906.354296-7-markus.burri@mt.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110054906.354296-7-markus.burri@mt.com>

On Fri, Jan 10, 2025 at 06:49:05AM +0100, Markus Burri wrote:
> Matrix_keypad with high capacity need a longer settle time after enable
> all columns and re-enabling interrupts.
> This to give time stable the system and not generate interrupts.
> 
> Add a new optional device-tree property to configure the time before
> enabling interrupts after disable all columns.
> The default is no delay.
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>
> 

Applied, thank you.

-- 
Dmitry

