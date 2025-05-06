Return-Path: <linux-input+bounces-12183-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D035EAACDFD
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 21:24:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E6F6461213
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 19:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4235319CC0A;
	Tue,  6 May 2025 19:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iNjsrup5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE60179A7;
	Tue,  6 May 2025 19:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746559454; cv=none; b=lptB64+M3+HwbxKX3+bDn8rPbaU9cV/rgjmCIP/K3AC31Zncc2lkqGhhZa6cQ2Nd44I004B6bPTb8tU76bpBpoDmQqOAMcDj5/qFC/451jK/F2OiNWB3TDrdUE27t/JMT6XgBQkX3FqTa1ZbyG0/Hab4Nf15IX3cl6KqDnYQu7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746559454; c=relaxed/simple;
	bh=AndJLm0BDD0IfptSbil7BFqhM2UjQDjqZwbHyRm8MvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oq6FqtptDnRTH1zNPkzOWB9WQpFT2p1LRpXaNaJ2/LoWgz8WNVPNztUf1OVanAFFTVZMdX6LrHoyAz6dEXToOrQ4Y06pnX6cXUfOCTmTecEPFpbUHC8uWWs9W+Z8Iob8Wh0O4DEg6kXtBppQFDChaPRbF6mTxRvYlEFhqTu6jQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iNjsrup5; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736bfa487c3so5545801b3a.1;
        Tue, 06 May 2025 12:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746559452; x=1747164252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RXGS9ycUwMhqdmfGF9SYZQkCupKrx+ufRNtD+4zd0Ko=;
        b=iNjsrup5/TE2JTJhjgJXWm/hub+9qoQrrJkreUr0dFZHyK9oPGklrTUwClXgpaMXSW
         wYjGcEJrjMSpBHmhCcD62Uj7kJeN51nk2OtySy+6i8SkUkH5YuSxAEVo7oT3HsXMHOSl
         eUz0dP1kHclhQPG9D/bXJbxn3lO4Ga3VVbpXZFamejb41fZbKyB2AutqYlniTV/Ok44D
         UVGWkbRvOLy5725Q6/nhLHl6INlSBwx2gDyL+kadfzvK7cc8eYtC1JcZ32jhLLrmo9Pr
         Q/FQ1s7jrgis9aSGtOwZFWtAT1+ZjPiZnrOwfsFPI4DgAj+39w+o+sGJerFMY9tm6s2I
         n+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746559452; x=1747164252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXGS9ycUwMhqdmfGF9SYZQkCupKrx+ufRNtD+4zd0Ko=;
        b=CHYWK9gDphO+J2UThuYFvUgHzF2uhwpPLnz92GquAjIWf0yIXLWaSSnN6excmdS25d
         a+NZGymghwMTEtko59ksd45aJgSfB6Iq5QikUUYK9kEg1Fo/p6QDNI8034FBlmBf73ET
         o5DOokRNdHlrhZdCl5udVGGazpdGHsyZu/ngZipBiaStPbUJWVlWA4+Cp8rNABSq2Es3
         HDeMVdQ7qUMFD9b2MrQle4Vy3lW2KKD9uioDgXCSYyAJDwPEnGWMJGXxQyqDLopF11oP
         bvnPYlem2qZJmPPs3Suq2TN/L0vUT9hGttud/bkPrCWN3e2MRk+s1nwySMnrXWe3xLug
         ofbA==
X-Forwarded-Encrypted: i=1; AJvYcCWT3uKXTxNYH7cYkdQOwsqW2aXxdq9s9BrUgg14flpE4P+jZg2uSFbKWhjvN5nMzYF2AuhDVm+iadRDUs382g==@vger.kernel.org, AJvYcCWliL7Uwq2TwEinnrVSatWFvQ+y0ptU1Zm1qHG0kHCZLelWIkHZMD9JxamxLBFS/+NUoPkxM11g8tVsz/A=@vger.kernel.org, AJvYcCWz3csC/wPWAfoUVQbb97dJQDFZbWT8cT3a2yaoU/Ap0XnNljGZ4gd3d/o7BAcSy+rIDzXuFlyG4OL+@vger.kernel.org, AJvYcCX65Qp3Ct3a3YGsl3Y5E8a1PkW8uXEpcnLIRjWCa3/e3OkJl1bhChO5cd8NAVpPjA3f2BX3iTC6MFqV/IAU@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/t6tHZfLyac7RnIF5XObN+UwUYwSeE+V+ICKHimHV4Nv39X4q
	OsYWckibiTTHO86Hz1BYYpGUwJunVmE3kOpvWAFC9L3WkYqLgqljESUbhA==
X-Gm-Gg: ASbGncsux38b7RdlKO0YuCd1CTyroHS5F32jESNhjjHf7H8G04ORnc1dwc3VNL8U1/r
	T1LBqhg6072HdVcRTBpbvFmDuZyp1WnplJkqhyqDIgQa915F/hEOCfxI3Zy+itcuINl7RPWLhwn
	WLwsOrkTguC5/GHTIQbyzKMmOprDcbX6r6LRsM74ZAU0tr7tXkKOOtVsozgdFeOVM/HoD9qiczG
	Dj1PHdc5L+SR7dDE6zEqee5YGKwxs+3o+Rwkh7pVnWB4bHnyViQqR8YysuRs6BvNBWSIpZUO8Lk
	7OgoLgKdrBnk0YnJfppXpkFAC7tikZR0bwOigekuwQ==
X-Google-Smtp-Source: AGHT+IFlq4UY7F1gkaWWhCakxJ0TpKlGbHimjUiWSulKddxJUkc41O+kznmibaQuAaEZy7JzBqlG/A==
X-Received: by 2002:a62:ea0f:0:b0:736:b402:533a with SMTP id d2e1a72fcca58-7409cf1e85cmr294041b3a.1.1746559451825;
        Tue, 06 May 2025 12:24:11 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:17ab:9e47:29ba:57e6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058d7a497sm9368253b3a.33.2025.05.06.12.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 12:24:11 -0700 (PDT)
Date: Tue, 6 May 2025 12:24:08 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: foss@joelselvaraj.com
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RESEND v4 1/4] dt-bindings: input: touchscreen:
 edt-ft5x06: use unevaluatedProperties
Message-ID: <p7pyyb6orbqpdk46rs55simotv44i563j6urvrlj4sb7yzqei6@6ezdhwcwpklx>
References: <20250506-pocof1-touchscreen-support-v4-0-bfb53da52945@joelselvaraj.com>
 <20250506-pocof1-touchscreen-support-v4-1-bfb53da52945@joelselvaraj.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506-pocof1-touchscreen-support-v4-1-bfb53da52945@joelselvaraj.com>

On Tue, May 06, 2025 at 01:18:38PM -0500, Joel Selvaraj via B4 Relay wrote:
> From: Joel Selvaraj <foss@joelselvaraj.com>
> 
> In Xiaomi Poco F1 (qcom/sdm845-xiaomi-beryllium-ebbg.dts), the FocalTech
> FT8719 touchscreen is integrally connected to the display panel
> (EBBG FT8719) and thus should be power sequenced together with display
> panel using the panel property. Since the edt-ft5x06 touchscreen binding
> uses almost all the properties present in touchscreen.yaml, let's remove
> additionalProperties: false and use unevaluatedProperties to include all
> the properties, including the needed panel property.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
> ---

Applied to the input tree now, sorry about the delay.

Thanks.

-- 
Dmitry

