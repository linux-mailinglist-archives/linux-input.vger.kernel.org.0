Return-Path: <linux-input+bounces-15585-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 97326BEC71C
	for <lists+linux-input@lfdr.de>; Sat, 18 Oct 2025 06:23:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CFB6C4E9EA2
	for <lists+linux-input@lfdr.de>; Sat, 18 Oct 2025 04:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ABD1287517;
	Sat, 18 Oct 2025 04:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FFrG/yRL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CFD283C9D
	for <linux-input@vger.kernel.org>; Sat, 18 Oct 2025 04:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760761381; cv=none; b=GhHMNrfgsmEFEQJSvpwtWnEJhIVtEjyv5Ra+IQz7jlpKmnvJwsZeGrr8Ddytbbp1KCq30SdeQWy10s3pSe51KR7TsGm8ZeSdbaEQOajCdAEDqCvBvo0Xwjkx7v6VmmEr/qow563AzRazPg1zFK4xS4XMXYVMEtRONhrNJmL7hVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760761381; c=relaxed/simple;
	bh=twucSrQ5gBaSxq5bHh4w/uiMfTGTQSSYFbLCd3U7t1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=biQyuU4G2T2IQYQ7CrBQimNVFjmTOYH+k50Rb+1SGnR4ku2mpELhuC157SMYBquVClDjXMiHF1c26/iKS+cOGkvHjZlfbaZ+Tjps+NAn31jxj7noT1YFFfU+BRAn4HOacPsh5E1l+ys50QnIXbsh/qGi32NlHDYdOP7ZNlc8XZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FFrG/yRL; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-781db5068b8so2145138b3a.0
        for <linux-input@vger.kernel.org>; Fri, 17 Oct 2025 21:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760761379; x=1761366179; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9sLob+FuMRhc3oCQLkxbSCKuBsggj1HN+/JP5OBcKrA=;
        b=FFrG/yRLejUwgHhCLt3PdErv354g7VQQgIlnFWEdFotO6bYVjzdCUMio53YpEOwLwN
         UbfTiwPA8hXRV8sJdkbvdiXNzSxjruImeLRWeUc6KyVdQPTxs2w2vS99o7mg3rAkeE98
         z+Adt+XqEumh8b3RqTTHGwDQiixkqa36jP1b0Oz2RLwMeMysI5wdg7WSsZLPR7WUeNAs
         L3M4h8ahUy4DCXF3oQH40OrKZcFEx9+sM4HfRfAlpH2lAoKjWc+BdHYExsiX+0GqLdjs
         q7Q0nwFI50m+i7cpXq6+gfmrWsHio93yIc9RUrRH2p91y4dp+d6rJ17xJyPzxJT0YLwA
         UHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760761379; x=1761366179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9sLob+FuMRhc3oCQLkxbSCKuBsggj1HN+/JP5OBcKrA=;
        b=tHcMKutulmOhegKZR88k+IT5kbLFATYYEbDqLTFVo7Fz267fRE4InVkcZoQZQMZ6pH
         KQxUSSG2rlz+xCRly0BFcVT8z1Na/ZFrM7B22ON2xZFYuXBMJRzPP8WtBTnobQY9+9Bw
         WHZYpr7dclxjxyenX3nvx6wQ2d1aVUeXGEoNX0kAz6h4z8uSNFm5jx1up4qq52oamyNd
         Eqh9JVqLC0Un50bZXBMWN3lYEe2jhX+7dz1V5sfbtf7j/IrC755Dk/lBFAQkdewdyz6C
         D6fwu8UQsbVLkb1mVpZ7FeZYLswCSSG+5ThSx5XUCS8/+OmmJr4EvZKip65sTJvI/6wA
         m9jA==
X-Forwarded-Encrypted: i=1; AJvYcCXNlEqZEpQyVrfo1IRTCz+R3snpxml2W1ex2X/iWJ94mFfggKV8p1tNN1Vfgq7uSvmnppLYjxQ31NZE8g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/h1Q/O3PHGTZOgiyhESkZDqfqOR15F9Hv5XFFxySTX/DnEeZF
	jQ1zwUAfKlqlL6Zh4yIDJHoJOL0l/fIpu9EhvniK4MtGgKyClLLHHXliwX12Eg==
X-Gm-Gg: ASbGncvNiqEkAt6sCrpriOjmTSn/fWP+hue9vHC6SpIk/7XjacIDqhmgR6DbD3QP5Ov
	spJMYqdHYabJXGEFmbfP7s1WhLjj2NQCfXhXUi3klNLmtlEYLUzOm0fwxCnkE2jKfbrN9QTP/g4
	aX7xnZFbIc5lPaNrTwnTO7rQrquTZCrgEz/LMXtb78OtaPTTukkY1RjyJMQOjfZIb5YKzMmUiCu
	lOXLynYMPQ0U4Aq9LSHQcQMdhtxzxQU/tUuz2uVV+ok9CUj/ZET/YpRkuJDFtLSMxUMvCbaggNJ
	WSxExsRaxpB09ob3BwSy4NcrxiiWc3JUQ35WnTZkev40OrRzkZrIT95648YL3ySoGCbua4ThLHX
	hhp7smXjS8UmYVxrgt8gvPXOlcNOs/d9GKaafGvPZDZe8VftX3V/NzyYahuunskQTOpr+68NT2x
	pkZYiD/XTyBFNORG5qVGMFX/B0sapQd2q34U02iY2bYQE7g8Q5IdI=
X-Google-Smtp-Source: AGHT+IEhKFhi3mFcny1EeYAjFFvibCPRFlOFAaD2YdcMmlpvQjgeW53Ajd4FqG8YZ9mvVIB5YeafcQ==
X-Received: by 2002:a05:6a00:4288:b0:7a2:2100:1d4b with SMTP id d2e1a72fcca58-7a221001d8cmr7669202b3a.14.1760761378534;
        Fri, 17 Oct 2025 21:22:58 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:5e2d:c6df:afce:809b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff34e98sm1318508b3a.26.2025.10.17.21.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 21:22:58 -0700 (PDT)
Date: Fri, 17 Oct 2025 21:22:55 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 2/2] dt-bindings: touchscreen: move ar1021.txt to
 trivial-touch.yaml
Message-ID: <jxtqhq7u5obj6em7p6hnzqjkmr7svomeptqy5bgvmqr75pbbnq@d5didfx4qqvl>
References: <20250926184720.391335-1-Frank.Li@nxp.com>
 <20250926184720.391335-2-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926184720.391335-2-Frank.Li@nxp.com>

On Fri, Sep 26, 2025 at 02:47:12PM -0400, Frank Li wrote:
> ar1021 have only reg and interrupts property beside touch common
> properties. So move context of ar1021.txt into trivial-touch.yaml.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry

