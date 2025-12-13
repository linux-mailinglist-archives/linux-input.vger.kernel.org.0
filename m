Return-Path: <linux-input+bounces-16555-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EB6CBA7B5
	for <lists+linux-input@lfdr.de>; Sat, 13 Dec 2025 10:39:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72C3A30B5256
	for <lists+linux-input@lfdr.de>; Sat, 13 Dec 2025 09:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBDA42DF148;
	Sat, 13 Dec 2025 09:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGW2QtLw"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD6913A88C
	for <linux-input@vger.kernel.org>; Sat, 13 Dec 2025 09:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765618742; cv=none; b=stJ7wtR9371jSO+LGIApsITAatyeNxv+0Sud6hUxJPt0JLvBgDX2WL4ZCVFGsAPCOe0tWROEQCCeU3RD3BJkYkN90tpMELjYQ0ewiBuM/zS0MCmdN81Ht8c2R26cwijgr9kgciFE58YFzZQ8Zv3RDKHsfs0smv+eOCouutOQN3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765618742; c=relaxed/simple;
	bh=WXCphjCZZ7bGdKF2zta8ieDXu80tlgLfo65zMgmICU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I2xZ3DSke0J9csslnZjuwXGC/jf32VYNqFquF/fdlbxd5JXMzA/zHvECyQyl9XQuMqCFGatNsIshGTOve0aqU/6/xe4mBavWgHi2H6io1MFoYlzRZb9vfYXvQnJcEXhXP0UwRecfOhOjThjAwgvPsNJvZi9O/NW1f3EVfNaNyYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGW2QtLw; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a07fac8aa1so9246555ad.1
        for <linux-input@vger.kernel.org>; Sat, 13 Dec 2025 01:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765618741; x=1766223541; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Zg9r476TB45nezjLOKEc6mD8KJOcEm935qiWqcT++Y=;
        b=mGW2QtLw6jnaD/HeFVmmhVZ7hX9FedQuiJhkwnUsh4syG9lbJ52fkYSskYlf66iRaZ
         F9LHdFN1BbNqqHPgBH2qJuBTaKTwg0EKucdjXvBWZckvDjRyd3lmuFDq3vdFPWHXsvMa
         oepAhE3jaDFg1KCAVxIRUb/vcoc2otqcaUe8/BR5FVEsQgUN0dj65/phzgKRzcOO7At6
         T1kG4KmNY7UTH5a+fsL3CGDNVaXbnmzM3KhDfKAT7N3AeVsm1OikekU9NA1oaDfF7cbU
         FUunsgysrU0F5Q5tdZVufq11xkNEFo/KTBXfo8ViaNuMx85d9EeOCdtDivqqimn25psQ
         kt0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765618741; x=1766223541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Zg9r476TB45nezjLOKEc6mD8KJOcEm935qiWqcT++Y=;
        b=i3AHMRxEOpAa0IfVSHwKptO/IfQx+/M86PXO5U05GPTaCu5dW3aGL9yX7B2U1kTZAS
         fhHbkcV159sD3+qFFSjoYckDlSDFtYaMaOTHirzkpsxBY5zFnMerOCQZdM2tQcoAw8lT
         FRVja5Jsy8dSLX6d2A4BbvvCURhg/NYwio7KlR5tZ1oZOzzDXKWo4LFtYCAaDPVlpK9z
         mtUktPIqfxSrsgZJ+SJWCg/6EmFmZNFZGEINzfM5XjaYy5zCHB1orwUIg4ru4PSK8gYe
         Ke58w+C2uNSbSceaHq7hAcpweAaIW5OBJAxKdqJt7cB3rEpbqmZbHyQSGBlJIVlLaHGi
         +jwA==
X-Forwarded-Encrypted: i=1; AJvYcCXFOlPJy26VyzPDamCI9RXW7VhOL34oi3OZp9SwwvjRRoTZxcLimOvnQIa9phqnTBhudiFGXUOi8k5Cjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGUxpOLuWfsrCWpDGz5OHcDafxhZIWgcmqxk/3aRdyHmatXyXr
	B8boNQeeKNUUx9bFqzC4TaGP8AwUkmvZwZSm6fTDUUpqNpimkpBTPlSN
X-Gm-Gg: AY/fxX7Tr7dPyptshoyTxLEfyK/SCtWUPBlvpGA5gRowNMH2xrdKo+0ASOa5ZPgBQhJ
	3nAvD1lURarzZSmZSDmV7sexJv0XoPpGSSrSTvh1Iyhc30wcIFTWAWQlYpQ5ZLF/giTRkab1oYL
	0m3nSot0t+oatumNQOfYCVntOnMkrbDWkzIfglh+HpnhjxeACZ+aeO5OismlnLBKtHLfcLZcTSW
	cd5EGbfQIHVYLAAV3kmI5BW1yJjJpILkS9lg2rIVhp+f12kD3Cmb9ljOMJhhnlOIZmOdFTupYFp
	xbUFY1GA1Ww+n/GN8qUHTTfZvfy01PHe1tJVuCFrXGkITScAjO1c7WYmyBTYhvM0syZVCYfSOXF
	w/XL3/ev+a1xgwmki81mXlC5aTBpNsPxN18gxM/CZsmACOiK7dU+jqttlhW2WD2D+7jK5qir8P/
	O6J06aZzTA6M1x0rmefQscWwdBiNLb93ygQYOxBHzE8nUUlQ63bMau
X-Google-Smtp-Source: AGHT+IFeQpCPEXO4SIqFFkwFCO2Nbnyxy/OkiOZq+4VUC4VzZoHs/ts/r+OXgZeXSSt1eSbiFqYkrg==
X-Received: by 2002:a05:7022:e88e:b0:11b:af12:ba30 with SMTP id a92af1059eb24-11f34bde21bmr3505767c88.8.1765618740524;
        Sat, 13 Dec 2025 01:39:00 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:3478:9150:d4be:149f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e1bb28dsm25640060c88.2.2025.12.13.01.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 01:39:00 -0800 (PST)
Date: Sat, 13 Dec 2025 01:38:57 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: Samuel Kayode <samkay014@gmail.com>, imx@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] Input: pf1550 - Remove "defined but unused" warning
Message-ID: <wfdhjzhkggp26mwqgvxuanuzjq6v2g4pmc44jz6kx4xwkewwhr@movikefnuvcz>
References: <20251210211149.543928-1-vaibhavgupta40@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210211149.543928-1-vaibhavgupta40@gmail.com>

On Wed, Dec 10, 2025 at 09:11:41PM +0000, Vaibhav Gupta wrote:
> If 'CONFIG_PM_SLEEP' is not set, compiler throws warning for *suspend() and
> *resume() function for this driver. Using new 'DEFINE_SIMPLE_DEV_PM_OPS'
> fixes it.
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>

Applied, thank you.

-- 
Dmitry

