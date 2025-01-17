Return-Path: <linux-input+bounces-9354-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF24FA155CF
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2025 18:36:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23E39188D45F
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2025 17:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8BE819C574;
	Fri, 17 Jan 2025 17:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nnz+aEfB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC91A95C
	for <linux-input@vger.kernel.org>; Fri, 17 Jan 2025 17:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737135372; cv=none; b=tIBCn/ZCUmbKwz0MHTqqh8k2eGJJ61DeGuvHVFR2VtdZ6znRgEfPHRQETPKZRMsVpvjuWc1Bs6C4nS5ncjFZ4p+fQIM6bMDy4WFE6N/2Gv2lust3flRlVtHH1IpilNWg8n1Fj/3BSGOefc7BAIhm3aM371KePFDZbU2Q5camqpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737135372; c=relaxed/simple;
	bh=0FNpb/sXalFOYX0+M3MckPSrYerqMzCEV2OnqFCofcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VYiQbuqzhDFXkXifXD6ipRc5nTYUo6w54lcSMxa7O0LGxRmaARy8iaX9FI4pV+Kc8GCOqmxL8s2HvqdB+DCrN+H3AXJm+fGQOyy5Z2S9YJCs989YqD+R8eKdj4ldGJoqIOoZTdV5JSlCwCRCoy59ql25vQeDGhc6BICHLOuG/NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nnz+aEfB; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21634338cfdso61873875ad.2
        for <linux-input@vger.kernel.org>; Fri, 17 Jan 2025 09:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737135369; x=1737740169; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HIoUH+Q88sQTSlNfM/LMjQS3kDnZmxhnMJLFd56x9Qs=;
        b=nnz+aEfBfaWguOCnCTTauZJBP72esBbMelCsKudRIM1i5nVR11DRvpL7cV3DjY5+AZ
         3jkcKPyz5kFp7MGwr60Cg5s5QBjcv45a0Ir4sCG01KiJjOXyBb1HkRbKEgYPo0yl2dQI
         vwOWnMsw3wCsyt5hNnxfQD2jtAQG86b7JgKVGcdOAjctIirPno3Y46UROvXh3c/f8Yd2
         Fl1JgsWpt44pg+WDEcZwNVbguTnfl2m6yEu7VGbwaeC6J6OPVgODF3pGF1EqDz07+ySu
         Gn8sM7RfhPVzDKWzEIjnP98L/Ib8oU7fz9TT8bnavWXwUSDkweHrBSAOXQgV8rn+9QaG
         IJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737135369; x=1737740169;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HIoUH+Q88sQTSlNfM/LMjQS3kDnZmxhnMJLFd56x9Qs=;
        b=qQagLzT/FDXq/c32FBellKdAn5gGY5v63rxDJTe26aAXvqof+JkHdaz2zdmQZblLNs
         RN+CMn97GTCB6JJ9gaIEmKhJGb3BhsWNEc91gWGW/xp3QN/kfXaQ5LvdBzgHUYkpqGR8
         HSOBQ1rPzg3JAH+fQ/mup8MHG7A3EfvpggTxcXrttkQaRNG/CqspijcIOuXn3x2WiIdZ
         ZEFrJ53Hpux5Zr7AoQbv1U+qQVeMrOpW+Bm1GwmHaD57tRg+2JoeBQ/rFlqg7tytFsEf
         IIwu1CKrnta3rdFQxBHqA9Dlkfs9o0XAuB0XEaNkYUGLTo1bkZMk4/ad062XqE65nTd0
         e2tw==
X-Gm-Message-State: AOJu0YyCeaxvLxr3Y9NfQSO+rcuKPWzg7NwOp90iRLOYKUVMVF/jLbSR
	Faiap/kPBOhYkmaqKHdkLf4VrcVnQqSQ2RjWAJRXgC3sy5r/BzaFpxeLEw==
X-Gm-Gg: ASbGnctCE7D/pKVgizVzAYKqL5tT8MSZI0BJEjFlX3FMDWTnOj0uYR2nCLLpULTzwRF
	7Dv4n4fnoh7ssdBdMcckqH5RvDkcjJ/qumuQtUWb3slT9+i5vpad59hfnikJnt1rzGK5zSZsAr+
	7iQoQEAHmTJ5NVfyM3Ga7aNn7/qWyorka37I/u2nfjjS0jnyRx1RSoTL3hsqQlyo6FofmEhPFEz
	IdBeUl8T43WxGGh2+r3Z+Q8xbTl7WJbT87pc7JXEcx39rG3MnKfGjrvTw==
X-Google-Smtp-Source: AGHT+IHEN1EoGkyF75Rvi2sVE0XOuUHJff4ofgWLX9aUH+bsCOZSVI4i0Qrs+Am6t0bUXvNW9ssVPw==
X-Received: by 2002:a17:902:d4d2:b0:215:94eb:adb6 with SMTP id d9443c01a7336-21c3563c51amr52397765ad.40.1737135369436;
        Fri, 17 Jan 2025 09:36:09 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:5b21:de92:906f:1f41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2cea2e29sm18761535ad.38.2025.01.17.09.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 09:36:08 -0800 (PST)
Date: Fri, 17 Jan 2025 09:36:06 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Pavel Rojtberg <rojtberg@gmail.com>
Cc: linux-input@vger.kernel.org, gregkh@linuxfoundation.org,
	Nilton Perim Neto <niltonperimneto@gmail.com>
Subject: Re: [PATCH v3 11/11] Input: xpad - add unofficial Xbox 360 wireless
 receiver clone
Message-ID: <Z4qVBqpPjkqx-6ih@google.com>
References: <20250107192830.414709-1-rojtberg@gmail.com>
 <20250107192830.414709-12-rojtberg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107192830.414709-12-rojtberg@gmail.com>

On Tue, Jan 07, 2025 at 08:28:30PM +0100, Pavel Rojtberg wrote:
> From: Nilton Perim Neto <niltonperimneto@gmail.com>
> 
> Although it mimics the Microsoft's VendorID, it is in fact a clone.
> Taking into account that the original Microsoft Receiver is not being
> manufactured anymore, this drive can solve dpad issues encontered by
> those who still use the original 360 Wireless controller
> but are using a receiver clone.
> 
> Signed-off-by: Nilton Perim Neto <niltonperimneto@gmail.com>
> Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>

Applied since I saw message from Nilton acknowledging SOB. Thank you!

> ---
>  drivers/input/joystick/xpad.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index 647c788ec5d1..b0780dfc558b 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -151,6 +151,7 @@ static const struct xpad_device {
>  	{ 0x045e, 0x028e, "Microsoft X-Box 360 pad", 0, XTYPE_XBOX360 },
>  	{ 0x045e, 0x028f, "Microsoft X-Box 360 pad v2", 0, XTYPE_XBOX360 },
>  	{ 0x045e, 0x0291, "Xbox 360 Wireless Receiver (XBOX)", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
> +	{ 0x045e, 0x02a9, "Xbox 360 Wireless Receiver (Unofficial)", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
>  	{ 0x045e, 0x02d1, "Microsoft X-Box One pad", 0, XTYPE_XBOXONE },
>  	{ 0x045e, 0x02dd, "Microsoft X-Box One pad (Firmware 2015)", 0, XTYPE_XBOXONE },
>  	{ 0x045e, 0x02e3, "Microsoft X-Box One Elite pad", MAP_PADDLES, XTYPE_XBOXONE },
> -- 
> 2.43.0
> 

-- 
Dmitry

