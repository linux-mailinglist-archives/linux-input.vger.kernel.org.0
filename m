Return-Path: <linux-input+bounces-9239-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7D9A11347
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 22:43:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83F2A1889396
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 21:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E10D20F07A;
	Tue, 14 Jan 2025 21:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZS+Ey9e"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECA420D507;
	Tue, 14 Jan 2025 21:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736891026; cv=none; b=K4N1GXTHxpZWmARqqHVur2G7qh0TiGc81TGevy27Ea6SSD28oeoYdMFNXRpNTXxpkb/mWkq7roKo/MLuJswJtPDgF7wgTOUc+Uc8DaGoLCQ+IcYGbIURcm2ZKFOd/Z1IN4ViaKM/bC+6Nt1t39iEidI27Lp4neadaeE+D9NheRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736891026; c=relaxed/simple;
	bh=eprLEbrC0QxarTtpdEelN1+mcZoYhFRL1dd851Y8Rt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQZoOptFFi/hiIa/A6S/iSjls90i00/B9mMZERN0pNy/2v9L8ZkoQhKBEjIq7LCG30Maif2ph/+UVwZIGz9qeI2oK2DQTjoDzwO3hj5sfQ7wVlHRiBGaijrXJM0UWTPcSVP8p2Qh3w2Gea3RHooxUVkNFtVKXt+OCEO32ah5+uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HZS+Ey9e; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21644aca3a0so132487865ad.3;
        Tue, 14 Jan 2025 13:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736891024; x=1737495824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7oA360EVr5BlWHiaNqybJJ9EJzkN68SnVC0DzqK2eo8=;
        b=HZS+Ey9eBT87LJ4vTJOprodBjw6AD/stuOmLM5KydnX2FV31BtD0/4rlA0EwLb4wK0
         MH8bTTs2B1YpFrUH8ZhOc2bvDpjObcnq3xYSD3J1dwD4Wk9FbTBZA9Inp9P4Q/iA6fzx
         Z6IsRiTzl3JjohPD/Ez8rNgq9sxbhIAyUYRtbS6WFESfCahR5Eejf4ZBFwkqM9Q+4Ee0
         x4/jxGcHUKIUkvKibX/vPzdZqEs7M44f7qjoWjNmmznEDG66Xn4DXt+2/TfVw/VL28R/
         vABgghuD1Gr939FG5WIotnbTVVmG1G6lun/fp5aA6uhOaHV8129Pv9MsiAPtEs9Su+j+
         rdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736891024; x=1737495824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oA360EVr5BlWHiaNqybJJ9EJzkN68SnVC0DzqK2eo8=;
        b=OtZ+SLsMMTfKGWHpYE9X7ytGHbdT9UOeeUI6NGLmDey9hEex5uEhi2TJ+QJF2YrTQO
         a6lvgl0jVGqwvzpisX8jumeerCdTbpsxBXl32otr4y+sQ9uEG3X4uVDfOWBlDOhfE/b0
         VqblqGMKANP8rY2RdZWABqb58QhgNkjoJFQCTakDIj6y9Qoxjzh8eFRLS8ORnvsGTsjx
         svxdatkm2Xe8JMzKEWkWcJNKhik0OIvekJSuhW4V6R1nxN4pXubvPBVWEGx1rKfIxWme
         I8V/vYOW10O1Q6SIQLL9LCz7y2TP8EiJjxvJFQyZe3j09UgQokXTE4DXifKncL2yxrfj
         OpjA==
X-Forwarded-Encrypted: i=1; AJvYcCVksHGGL2lomoGrxWTWGK1aRZrkeq4CeGzTDHxpHceAvJS4JtMYoGyP7lp2yomUGL8nU6b9fEFSs7kGPYFN@vger.kernel.org, AJvYcCWSqkEb6rCUyMu6Ce1XcCAsjcdVG751W6J0nUU/OgNVuEE5AQpJuA0HFY2iR70jaYRkt7kPhSwGA4GUnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YySrAXHMis4uL9Sn22QksAWDC+Zh94clp+T9bL+vWltZ8Wl61xX
	3ojweoDB5/FGozFtY2eDxAPHNbCeuc9pvXRnnGYdS3SNkP5YBtnc
X-Gm-Gg: ASbGncu8C/0Ao/0Xme3vmPio4wcRW7qfX+Wcye0tBUN4u4JaeJclIwlxLmYBYxEFRTR
	tI9w3kOS838vwKYN1DZV00GdrRfm29V1fbIHuRDtFDilF1740pTxN4dwbkpUef7/0PVcz6M0OtD
	zl3aDUhkAJYe93i0/lIoYkkwhpV8/lD6x1bmix6pEf8XNiY5d7UbYAw3NP/V4fJiIcrs9DPuhvS
	loYDkN3GSzz5EWeMnKbCOZbdkQ+mf0Pud3NWFii1VikKESkyOsGfl6MhA==
X-Google-Smtp-Source: AGHT+IHt9ogSkMhlhhayRZSwhqFNV4/W8I2qJ4ubK5lOBMVGn1HvnIQSI2fyzIwJMzUobH9ZUBVRGw==
X-Received: by 2002:a17:903:595:b0:21b:bc95:e8d4 with SMTP id d9443c01a7336-21bbc95e94bmr123149085ad.35.1736891023928;
        Tue, 14 Jan 2025 13:43:43 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:e152:4a95:d7ea:84d5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f22e52bsm71874585ad.184.2025.01.14.13.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 13:43:43 -0800 (PST)
Date: Tue, 14 Jan 2025 13:43:41 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: Use str_enable_disable-like helpers
Message-ID: <Z4bajVbe6WtuVJJ9@google.com>
References: <20250114192701.912430-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114192701.912430-1-krzysztof.kozlowski@linaro.org>

On Tue, Jan 14, 2025 at 08:27:01PM +0100, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thank you.

-- 
Dmitry

