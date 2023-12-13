Return-Path: <linux-input+bounces-735-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 417668108AB
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 04:19:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1D63282418
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 03:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 423496124;
	Wed, 13 Dec 2023 03:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RjuUgVvo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88C55B0;
	Tue, 12 Dec 2023 19:18:49 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-286f22c52c7so4638460a91.2;
        Tue, 12 Dec 2023 19:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702437529; x=1703042329; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tUsrEWDzuZ1gsEXsSPNm1wFCElovbWFBrMSojE1ZCVY=;
        b=RjuUgVvoCA3dAP8y4CNkwSF4xbI0kKLm+MvLmEp+1XSWSJVP+tmBwp2gcdw8jBt5uQ
         Bdr6Yi3zMgQt3H1MD+LyXZ8xm5NysAievDf9Caj++rZuB97FUIfbT6N8rU/YbQZ9KL7y
         e6txfzv6nHml5k+nqnNzKNTsw1Sle57eFVWekAyDvVrIVIY3v9O70JhrI4vzVPF/AIi6
         /wodOPYjOBl9cPql8l2XkMTxN4Y74dErg9XC3qwN8kBnriUCFgs/SLtuBl4jPM3nhN0f
         xV47+skgM/hmbXzMEGiy6DKSr4wfraXPrdJy7rIbxwvkJQCAqCsEk8qfgZ4kgT+9bKXv
         YAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702437529; x=1703042329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUsrEWDzuZ1gsEXsSPNm1wFCElovbWFBrMSojE1ZCVY=;
        b=heVAvYbjNuK7k63y4lcf/W0WOCV9Rwl+klCiF3RWq4fD3BJa9WifJvdrn4eVQcfR0R
         v1I5eGZakkCoe8rvSx0Ry6sJWPyPbsE3VTf5a+Xsywjt5E6F+6B7GQ6LWR5Z3FjD7bbK
         Hbm7lovVrO2N6wbxBa8TLYJ2legk206+2orbJw3NbvL8hXtDU3JkFrkv4f7jLF7q5j23
         fVW7u25G/TONoidY3pZ8tq90+4PvlriVXsjX+PbnWAQ4MG79UZh2uKeiDKBF7KetFFfA
         LkRaE/PoNwQUuKf52abKqKr2g7rkE0K1L3bziSlmT0JhXEDFWeMTdJYS7EQw8luo8q9U
         gtrw==
X-Gm-Message-State: AOJu0Yz3gW2YUnG8tE6FpwhbyOHdn6s4rVZm8cTBYvk6+/3xHO6aZCUD
	BBlxK6dsTQN3L6dcDFJ9IFMv4TtMfm5/IA==
X-Google-Smtp-Source: AGHT+IEVM7xkRCmEc2GLIq9p4QBAsq/SfE5WHtKjyR7f5eyhufrTmQYA3iHnDD2Nh2FO2mHKL2WsFA==
X-Received: by 2002:a05:6a00:b89:b0:6ce:6e6c:cdc7 with SMTP id g9-20020a056a000b8900b006ce6e6ccdc7mr4066790pfj.56.1702437528679;
        Tue, 12 Dec 2023 19:18:48 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:96c1:256f:67e0:c0db])
        by smtp.gmail.com with ESMTPSA id l66-20020a632545000000b005c6ee23cd30sm8798333pgl.77.2023.12.12.19.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 19:18:48 -0800 (PST)
Date: Tue, 12 Dec 2023 19:18:45 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Valek - 2N <jiriv@axis.com>
Cc: krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	robh+dt@kernel.org, u.kleine-koenig@pengutronix.de
Subject: Re: [PATCH v6 1/2] dt-bindings: input: microchip,cap11xx: add
 advanced sensitivity settings
Message-ID: <ZXkilekhSEEFXC_p@google.com>
References: <20231121155250.613242-1-jiriv@axis.com>
 <20231121155250.613242-2-jiriv@axis.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121155250.613242-2-jiriv@axis.com>

On Tue, Nov 21, 2023 at 04:52:49PM +0100, Jiri Valek - 2N wrote:
> Add support for advanced sensitivity settings and signal guard feature.
> 
> Signed-off-by: Jiri Valek - 2N <jiriv@axis.com>

Applied, thank you.

-- 
Dmitry

