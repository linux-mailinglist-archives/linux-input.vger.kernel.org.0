Return-Path: <linux-input+bounces-4975-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1500A92ED54
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 18:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 163561C21CFA
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 16:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 035A716D9BA;
	Thu, 11 Jul 2024 16:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZmAY+1R6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E54E16D9B7;
	Thu, 11 Jul 2024 16:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720717150; cv=none; b=gg1aaZSHtIH3Qign5h6vCjZVePgI+NRh7jvwNqRBJZzANnHa8F3dEaAaASQjD6nTfZqVGtLdFVZPm/SjkR+uV79kJxgdyFrdl+d5NGPbmT5rBRxGtkhB41dIpnotJy5idRBaUhKtV8/acHoO98qFzwQI0Yc2bwikcX776TNT5zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720717150; c=relaxed/simple;
	bh=plctfo8iBnoMFnzoXeE+bB0UeZTZ+PUS5nvRSchqkiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gNkxGINloOaNrZ9a0ZRa5J54G8PfuFQcn3D0crjfreXtt8ArfNYdqQgMUNKGkqGN1bJb/Lx26tNHs2SB0AvCtjROcoYDAaPtm2aDWR3zPBd7fFVrpKgvWQpeME6yiTISdYEyzy0kdOIFp2oEoMaffG7W/7Y7iA17krHMEBmKvcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZmAY+1R6; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-25e04a7d9f1so553501fac.2;
        Thu, 11 Jul 2024 09:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720717148; x=1721321948; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tMUjnCsE/tLYkkpuhi+oCrSbeNv52wydATmzobtPUpc=;
        b=ZmAY+1R6Vu5tK6e5PALuS4ZWC6bJ8PcXR8lv716xASyk3gui3j2AWxU8iNyLIgZoxz
         FMOL90dPoxIsqyKK9Ne8H6bIdiScXvrHdcBnKmu9VDBuX3ixiglXO4k3lEbsJWy51MYw
         Yu8gVVm5lc4o2evQqNRPmVDB9jzKtVtg/sanpeKQAl9LqXkbCIVH5mrVXsmfPyXWvTtm
         Ib8ApYwqwMPhRQjvb95KrZquTW8vr1yUwl4xnTdwIsAD2Q/RZcEGBJPBUJTj4V0Ag+V6
         joHzcXU87zSIM00l7ECUHJjrrSNFXE85GCJoER434D+LRcL8OCxV5qbER0IIT37H6R1Q
         MSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720717148; x=1721321948;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMUjnCsE/tLYkkpuhi+oCrSbeNv52wydATmzobtPUpc=;
        b=OiHzkq2GR73qv2pXe3gLSmxtkPid+V/o+oMEHWjJcvhGwX1xu9FVdHY6H2G6UHD3ml
         O0jMBearGW+KCypRuwLK52E6QvG9MsLDctiGrIB14xppiuagIR5l+FgzueClVPyDJYPX
         AXuDhRJOVJaD4aBc0Cul79vNevDW5GzEU0ZRnc0sC3IrNAD92UreqbOrZNb5pjeJ6tSZ
         V+rgh+MmImT/BdIhFB/z2hhC6Yqd5X+mLOA8DlqMJtLD2hWhcmetWwNHe6yMfthmxYVG
         tGGumZJo/2SuIMYhIKhYXlMDJn+92X3E4+sQ+ViZySRDOPcm8mmJWbLMHizx0McU7q/X
         reCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhIdH3s5k3JcAV0ru/HR25VXHm45RnBO6hmrstuM0QiY9QM9lSMIGmgekPiGWlSdDOOqhPU66fvq0/kVW3UpkWoMec+rFlv8bELIHl0us9W+bnCV8H1i6dK5yHvi/uQRFP06kpgc8fSuKGaHY587Oi+zMyiImvOGdRQ1WLwJ6GQ8Kwdjod
X-Gm-Message-State: AOJu0YwYajHzHSZM04dvH+UBhgWCocjaBhARy028aJIuDYqtj8rgjUhw
	p9VbMChb78gxBQKcKxrvWySHA5DEZTjSR7NAb4YV8DUbbn34gIlV
X-Google-Smtp-Source: AGHT+IEjaMG9H1N1y+h9qn6EUn1w1/YsbxFFT3hasiLz6/tiRRa4X70zyMuz0K2gFlmvSOXNLmyo5A==
X-Received: by 2002:a05:6870:a353:b0:25e:2923:a373 with SMTP id 586e51a60fabf-25eae7a3377mr7231416fac.15.1720717148465;
        Thu, 11 Jul 2024 09:59:08 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:4761:5ea8:2da4:8299])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b438c0996sm5925705b3a.60.2024.07.11.09.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 09:59:08 -0700 (PDT)
Date: Thu, 11 Jul 2024 09:59:05 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH v3 0/2] Input: exc3000 - EXC81W32 controller support
Message-ID: <ZpAPWdv9oTS6ouzP@google.com>
References: <20240710-input-exc3000-exc81w32-v3-0-4272183628b4@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710-input-exc3000-exc81w32-v3-0-4272183628b4@pengutronix.de>

On Wed, Jul 10, 2024 at 12:28:30PM +0200, Philipp Zabel wrote:
> EXC81W32 controllers use the same protocol and have the same resolution
> as the EXC80 controllers. They can be supported by the exc3000 driver
> with minimal changes.
> 
> Their featureset may differ, though. Looking at the messages, it appears
> the EXC81 also supports touch pressure or area measurement, for example.

Applied the series, thank you.

-- 
Dmitry

