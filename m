Return-Path: <linux-input+bounces-14569-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCA9B4FEFF
	for <lists+linux-input@lfdr.de>; Tue,  9 Sep 2025 16:13:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8439B166801
	for <lists+linux-input@lfdr.de>; Tue,  9 Sep 2025 14:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3376423D7EA;
	Tue,  9 Sep 2025 14:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AhiBoWcV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D8A18FC97;
	Tue,  9 Sep 2025 14:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757427196; cv=none; b=GiTSTe9GyytYDY0kHzGlBOOGye5jjilEI69iwA81JPqtw2zXr/woFmFyJD5KEsLk3c73TIXqCgbsChmyiZeqYav3OHZyUsnAD9mI8fOqqkIJmsQgFGc8b+3TCGIY+sXbkP55z7OLj3U1bpo4zv1mzr0MLCMmWKojuBBoGdP+oIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757427196; c=relaxed/simple;
	bh=kq3Q2sxONlf8LnQ3OGj9fGWpP44LKtbnldqLnii+nVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WG5Ck0zUtRTYvTGdvcyFJzHu3vo9g63rKY7xH3mcqYTTIlkTCWEljYWhysCJ+9bsgYl03yOZixrbFwfrC+fMYxla84T/w2LafxKyxf/L40XmrF9RhyOF1hzL4J+jeM1p9grIKKcAjjy0AR+12EXKPwIWEhNeIm2Rbk0mAMCVgAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AhiBoWcV; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b47475cf8ecso3736569a12.0;
        Tue, 09 Sep 2025 07:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757427194; x=1758031994; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5J6q6a+zn1xLbdiNAjeG4Vukow5CdpqBkODFgamTiUk=;
        b=AhiBoWcVqRkEX/QvEg+oHhwVLLbeH+nwPq5S4YSqFfzRXKurOzmpG/DISlu1P1r0FA
         hkgbFRbAzbYHIIExlkDCtYd8PjAChVnAG/hO4DNyAXzEiQMfBGbipPjiY2cmw5iCYGOp
         +wrYsJUSVj7Y3lcUnoGx7rkdrLYvIsnHUDvrpokx+6ErQoN6lOnyL1Autxlmxb09ujKl
         N6dV8QnaoT9ETYWTezIqw0Hd66cXgGDRnDgx29zIHrC8ksq28lOiGZcJHGR1L3aE5TL5
         khjDIojMKS9dKcrV470MfjNj71/j5PMJPBOCVtGdtCDFUfEsPzQDL9Oe7VzbPF7LTybp
         owbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757427194; x=1758031994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5J6q6a+zn1xLbdiNAjeG4Vukow5CdpqBkODFgamTiUk=;
        b=banQsOwlkB/WNEwJ+qHWuupZcNBn6DY/u5OA4Pfy50QXXzDPR0G+sJFcQDWpOksd+j
         Az9aaCpfSEtklsH36WbcVaKP3HrlcjvFdoKwB/gx1S3KJfyGDcEMPlyENqfgFEgKUkIA
         PvSLva0nb2PAcjWQl5RWZrSE3WYP8YU9oG4tkB0h1wg3W/AymwjHMtP51lhQo/K7p2Vt
         7ZYOEziT+Co18xZv8mze888dpY14O4kUQ5JpRCb0DKiVkZjsRUq+OTFbVIII2c4PJvEL
         wE8Qp/L2u9PALP2ofmJGexqR6wCEcTe8k982W6M1aDNTE4TeSMdvYIPBQbLC3yubhVNd
         V17g==
X-Forwarded-Encrypted: i=1; AJvYcCUtOiLyrv9AuAHLHa9ZXYTmw7sDVMN5C3rNP2lW/v45BOa8JvEnF6LHPgauW6SjC8R3MKp0sfY5SOb/jAf9@vger.kernel.org, AJvYcCVMOYOGzgFO17B880p5sM1WJBPiqfx6OI1Ux2P7lzabu2UOIQBkwx4lFTSTnP90TbxQ7Hy96v2QNlfL@vger.kernel.org, AJvYcCVSBIHcBZCoxtHIaqiARYUWBvjmdOMt9Lg75Kz5egd7LMQrO/0tbYal6w/4SrRdEbz56cCqIvINBiFhonL0Ew==@vger.kernel.org, AJvYcCWWlAwODD+ea/JHPxAs67zFGFYtDyzkfifl3JEZMNcNjmTdPUpqdPcdlD5dykYUKDteXlAfpnbCeDfZdrg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzPg5aahrfG54TPLAM2H1hQh3IVK+sYBpyeIp075cl2lN2Gv4J
	HR1bmcA80IXMLvYHj3QIy5kQtWLWqOHiIJ/apBLnLZZIlcsWygsF0YgU
X-Gm-Gg: ASbGncv36KE3xUNNuMyvv7No+naYQmD8fkFP5qdt2N84q9mEjbd0rE9eKV/MvHCyS62
	4UI1Uj8+vbWN6m1wf3yyQDzvf0iXzJjcMqusZeO3Vwh7kxqRNPpAagm89wJ7beFNAA1mGPLeL6y
	3JfbSdKwCyRDThgCtSP8Qf9vmA89Er6SqiTad1JMEztH0RIpf3qNYSpEySwCOr6boijGru2Kqqe
	UmFwR23zN+eX0GVkRvrvvNKJTTwgVWnEVKCSvWEcKLGlSuQlm2lBHMtkfNvDV0hpPywD/904rO1
	leoLbbc0qDhVkmv5F8KOzG2oaZIxE35gXMRkx6s2kLvrmrmDr0zGe1rDDslhYDHjA9o+DxEmWE+
	4l7pnssYFsKPwgdYClIapwv4=
X-Google-Smtp-Source: AGHT+IEkwrtBYdpezIiaqwPwiNlJ+8D7PNnqPSNJlp8Hs8avSR7Xn5/TXBsO0RzbBf21bAweQKmP2g==
X-Received: by 2002:a17:90b:1d46:b0:32b:989c:aac0 with SMTP id 98e67ed59e1d1-32d43f1667emr12262528a91.11.1757427193997;
        Tue, 09 Sep 2025 07:13:13 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:bb68:234f:c4ea:1276])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3298520c7d0sm28003547a91.3.2025.09.09.07.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:13:13 -0700 (PDT)
Date: Tue, 9 Sep 2025 07:13:11 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Courtney Cavin <courtney.cavin@sonymobile.com>, Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Luca Weiss <luca@lucaweiss.eu>
Subject: Re: [PATCH] dt-bindings: input: qcom,pm8941-pwrkey: Fix formatting
 of descriptions
Message-ID: <dcbulusmsq6g57ymj7zax6gkeuupwrfekuyrotawxw32fadzhb@wum2hzys5gx4>
References: <20250909140331.69756-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909140331.69756-2-krzysztof.kozlowski@linaro.org>

On Tue, Sep 09, 2025 at 04:03:32PM +0200, Krzysztof Kozlowski wrote:
> Property descriptions should indent with two spaces and they do not need
> to preserve formatting.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Applied, thank you.

-- 
Dmitry

