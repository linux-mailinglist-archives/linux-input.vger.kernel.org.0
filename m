Return-Path: <linux-input+bounces-5660-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 557F0956B55
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 14:57:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 137B928403A
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 12:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A868C16BE12;
	Mon, 19 Aug 2024 12:57:27 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001D31487FE;
	Mon, 19 Aug 2024 12:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724072247; cv=none; b=heYBnN0ldtY0gxTQwh5P6YjiU2M6z/AAZuWNeiOvGfvraYUsDMF5RtrQ9To2sAjT3Obvlr2IN3ki9kHZzMFf8VMqn3ZRLtsCyWWSTCbx1SLmYZuGXFMGAlr+qcejhGK7J8FPp9Vj0JPFwSV4JYJoxmpRmlx4BoHAL5gjMwsdKmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724072247; c=relaxed/simple;
	bh=X9d3of3aXsaKQl5CDOZnvu54x0U/02bbYH0NTxc3YbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hg743gXbUmr5ZwNyqAmdx+0Gl9O06lpLE5nEB34HSLO52OcGZTrv9qVWIcWpHML8P/Ii05fPpFby4uRiYg7sHol34XXVB1DSIbewNcR+RXjaZFAiLJ4KZUDBhIbA0d373R9Ig+99RtETZTyMDDv8yA/5xl5mzobSyeH7t2/UTzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3717de33d58so2735574f8f.1;
        Mon, 19 Aug 2024 05:57:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724072244; x=1724677044;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0ZpW69A3r3oQGs1jzFxWO9nTo7uyXmatuExT8VLMtw=;
        b=ogEsJmtvJJjSNAa3sZdlBAycb248VNWoY1wHycWn4oebxqpPMUSYF0A4xOv9cGuJZV
         E/s942ZeDzWw2HqWQ1UR20pBGN5Ged4ZOORis/FZdU/hwvI1uns5+sr1TBtYE2q8OdSM
         t6Yodutdz7p/IpUYDqbeGWZaxi5AwwYTG/uwCRg+H/NFyvRSc6LKdF22Z6741dzNU5LS
         JVdQdVYvbP0NiG4OqHb7pi5GNrtoJHfJcwNpoPuwxZEfb+pg/AWJNfrXCNJb4cKVNx9e
         X9wI9q+QKKg8n31BA4NYmyKyRi6u0bT/0o+Ms2jb1VRTAy/7ua49q1wOw1Z8JW+O9iSR
         BGhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVupKuTtBZYj0CsbHHywd/ML1GkQmP/8K3Cua4HtsfhlrFQviTJtWq7g0d1JU2+oCj4rsG9/jCzODOl09mk7FY3NDaNU/QGmbSfVUbvlSeJiB3+3IeZ7ld5rHFloN4+98xSOu+WLgXNaov/rqoeTMhVgWoCptrWXOBZOZFCOCQEl1nniGWtJPaV2jJfEYG1RZ5vxmPPrt2FjQX8noX+NwRl/fdufTkTC8M=
X-Gm-Message-State: AOJu0Yxh1yxw5YmjK1OUSd0+c6PTL7PMu/fbdlbE8r8FAs9OzKy2GRr8
	MrpVqIW6yui7bQ7gkNTKjG/uafOWqiuhap0+yjpUwTU5dnTrttlq
X-Google-Smtp-Source: AGHT+IFIpQ0zLyMhxiihY1RRzBqJaZIevaG2nGDh83Nd2plM5T8UwGXFDe+2xWByyJ6ZxwPoGCa1fw==
X-Received: by 2002:adf:e906:0:b0:368:4e2e:7596 with SMTP id ffacd0b85a97d-3719465603bmr7590194f8f.37.1724072244121;
        Mon, 19 Aug 2024 05:57:24 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-37189839f9dsm10543437f8f.20.2024.08.19.05.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 05:57:23 -0700 (PDT)
Date: Mon, 19 Aug 2024 14:57:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 07/14] Input: samsung-keypad - use per-chip parameters
Message-ID: <vizxklhqb2gvevfpup262s6dbmljlnit5oc2uxv2zubfuhcy73@3ev5tsopnhxg>
References: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
 <20240819045813.2154642-8-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240819045813.2154642-8-dmitry.torokhov@gmail.com>

On Sun, Aug 18, 2024 at 09:58:04PM -0700, Dmitry Torokhov wrote:
> Instead of doing conditional logic based on the chip type, define
> per-chip parameter structure, and reference it in the match data
> (either of_device_id or platform_device_id).
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/keyboard/samsung-keypad.c | 61 +++++++++++++++----------

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


