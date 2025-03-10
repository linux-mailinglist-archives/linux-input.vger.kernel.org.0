Return-Path: <linux-input+bounces-10686-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D74AEA59BBC
	for <lists+linux-input@lfdr.de>; Mon, 10 Mar 2025 17:55:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 426EF7A443D
	for <lists+linux-input@lfdr.de>; Mon, 10 Mar 2025 16:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D2E1E5205;
	Mon, 10 Mar 2025 16:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jlfMDeRt"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D1319004A
	for <linux-input@vger.kernel.org>; Mon, 10 Mar 2025 16:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741625670; cv=none; b=WQPwSDA6rTrFFkJ54WddQOIMBcoDlEBJ5H1zFFSxd8YaIzCRQWkU/jcRiljojdcjH2xvca0pQKK+W7mKgNvTBDnWRn0nD9DzEjAbTZlcRGrkeySYkGnt5be7JciHxvrOIYUBiBy5qyQnKHXVw2qPNBQexB4Oly1II29TQC1J7KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741625670; c=relaxed/simple;
	bh=Na3jxNTRah5DY5P57ee7lS91A4yGdTCMR3cfVSWJRDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pkAyxIjoInaBvm10vvpavT8ITWjuR1NZnT39T31X8QUi0PJ9W3xk7C89zUiKw3RH/gqe+2r4QyxTLi830Ir0wX0OcvVfxugOnUBdG99jiV1XgU4XwbKZtD3pZjFyRjkMAGbMWAEAGTM0bHeGqRCGvLu2RG7I9CjqDnAUSrDfW7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jlfMDeRt; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22438c356c8so50920475ad.1
        for <linux-input@vger.kernel.org>; Mon, 10 Mar 2025 09:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741625668; x=1742230468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eb2GYBadpnSomZPYGTCJbaqYXWFsOeCfH9pcOkGW/ek=;
        b=jlfMDeRtJi2FssUt4tNnLdmN7fkWv6yR+Z3M88MKfidOYTtdlDyDpMAMbGcokkEs4I
         sZLXn9ewxZxD65aIc+HBszYazE0Y/A3OH62jOlcXGL6ydR5H4E+n5mz6hPcKcIR/6m3y
         eMDy+7RKsvcz/UXqclILPS3sobkFUY2CiMT3zt/w8z4Dt23ySMvsTevDNdRPeDHcBTM0
         Py4vpXB2asVvHx8wTpgWohk519c5G/PSt6O11IIC41N/UoywBB3lyC0cLcmrY+XDdM1K
         3541Nl5l7VjHodoVGFzbvH2sYi5NZm45BEAiaEvnVelz4bOfe3mrEYFqypQDtbRDupEI
         5KDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741625668; x=1742230468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eb2GYBadpnSomZPYGTCJbaqYXWFsOeCfH9pcOkGW/ek=;
        b=FNworb21Uby5m31WyFYQWQRYu9Rayoh2uX81iKBnbyf5xIpAoROxnN5JS0it9cS8b1
         7N4CC+rOs4NKvmlrAnUEMHqnK2K4/+vzIAP0L/btRYH9cw5Mnu8/YvEfRB6d8AcFXZD2
         VWPDzdZPDk3ooGmClCGYpy5/UQwJHJkrt9ZwfBpp/pcuBo60/fz54dH3KRh0lENcyKkI
         BDDC78Nbp+FM71qbZtm1iasG8FYspgysi41KrQqFFSWPOHuEuPBSwZSv8+Sx0O+Vjtba
         GRuk9RSSs/mXVQFRc5NtdQznJsTYqjpGwBxegDU6Da8gHYNyLBppL2CHLI0n+amBLANE
         6gxA==
X-Gm-Message-State: AOJu0YyUix6CazkvCtk0MdhvqUVeecFH+IDrLnuIhZv+bBXhOlBHkWi1
	ksf3NbgSC66rRTna1ARDC4GORZyQUDhnPCowesKIzY3aAfVQjthY
X-Gm-Gg: ASbGncuOaq8VRtwUAUgTYyw7y4PYIcoLFZ8ms4I9DjDV6pPPkOkA1NIM1nHSsKSQIbk
	pZlABsbwlh7KPyIpX/iKmqAmtNRZdulgj97P8aqt55ukL7Ie8uNRJVBDj33WOD6/Fnm/LvSiStr
	0drmdqWz0ZWHhjOmTfxij6BMYtkDSKVFclxjW9ULRQ1MEsptGtEb6gMB1vMeYRS2aT3F9XCuGKb
	JMUq8JVfGV8lCDbkQaw34+MSBptRZOG/OCyZZdX34t8NQjVCXAvu9x7DgZTJ8FXZV3Ypm+flkdU
	AKBzdz29vlWE9oPF8e/C49+IZAhYhJRTz6hJiiMgOoTl
X-Google-Smtp-Source: AGHT+IHq26Y182PYisU5gSZlT2OztlLJBRbL6ukaAbe4H03O3SnO/NujUPei/G50zDZfUZevx4RZpQ==
X-Received: by 2002:a17:902:d48c:b0:223:6657:5003 with SMTP id d9443c01a7336-22428bd57e4mr230732955ad.32.1741625668192;
        Mon, 10 Mar 2025 09:54:28 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:eb9f:29c2:9ede:46d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e9fedsm80974345ad.67.2025.03.10.09.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 09:54:27 -0700 (PDT)
Date: Mon, 10 Mar 2025 09:54:25 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jeff LaBundy <jeff@labundy.com>
Cc: linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: iqs7222 - preserve system status register
Message-ID: <Z88ZQcJ78NJg-A-1@google.com>
References: <Z85Alw+d9EHKXx2e@nixie71>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z85Alw+d9EHKXx2e@nixie71>

On Sun, Mar 09, 2025 at 08:29:59PM -0500, Jeff LaBundy wrote:
> Some register groups reserve a byte at the end of their continuous
> address space. Depending on the variant of silicon, this field may
> share the same memory space as the lower byte of the system status
> register (0x10).
> 
> In these cases, caching the reserved byte and writing it later may
> effectively reset the device depending on what happened in between
> the read and write operations.
> 
> Solve this problem by avoiding any access to this last byte within
> offending register groups. This method replaces a workaround which
> attempted to write the reserved byte with up-to-date contents, but
> left a small window in which updates by the device could have been
> clobbered.
> 
> Now that the driver does not touch these reserved bytes, the order
> in which the device's registers are written no longer matters, and
> they can be written in their natural order. The new method is also
> much more generic, and can be more easily extended to new variants
> of silicon with different register maps.
> 
> As part of this change, the register read and write functions must
> be gently updated to support byte access instead of word access.
> 
> Fixes: 2e70ef525b73 ("Input: iqs7222 - acknowledge reset before writing registers")
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Applied, thank you.

-- 
Dmitry

