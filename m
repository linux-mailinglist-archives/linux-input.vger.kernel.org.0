Return-Path: <linux-input+bounces-632-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE5280B086
	for <lists+linux-input@lfdr.de>; Sat,  9 Dec 2023 00:24:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E00D1F2125C
	for <lists+linux-input@lfdr.de>; Fri,  8 Dec 2023 23:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8065AB9F;
	Fri,  8 Dec 2023 23:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N88lMPRT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02A52171E;
	Fri,  8 Dec 2023 15:23:59 -0800 (PST)
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-77f3c84e0f6so131934885a.1;
        Fri, 08 Dec 2023 15:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702077838; x=1702682638; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=swkDbVbtiZsl7qx5eTQpBbuEmX68qUc5TQ0Q8dkO5JU=;
        b=N88lMPRTApa+lMUlbBcLJ+JGT24b21JVOGr7rNZ3pn/3v9TdDgtJJRGgq4CO/hZkIH
         gH4tBK7T97Z8qC/fFNnZwHO7gjOV/iAU7ybZrDeSHYtOgtTStS6YMC0+j/jNgx8UzkWu
         KW1mXTyfQ10ZAo6z3SUklwlCLv3v6yidyXBqpKh0C3JCq5r2HLOlT4b2XKlPO54EJGGb
         PZtjLJwybyW0tgD7li7xsdSeoXicIxuVwpkV4cpeB4nynQmHGV+k5CEM91FtgRbcJ3Qs
         RtKwIFcwgmw+/MKBoI6n1GPL4f+qmxbvnBGHvwHuOk+O68rgCXtr6URu/biJbUpsmWxS
         m2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702077838; x=1702682638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=swkDbVbtiZsl7qx5eTQpBbuEmX68qUc5TQ0Q8dkO5JU=;
        b=H3+F+meIjhnt4/ucFR7r5oDTcGK9nb+U/tMaeN3B7nZIXnYG8ICXG44bqVtwUJ+Wpw
         biL6Hg6d1ag8/E7MHdMKy2vT6GL4RF+vGEq3sgkSgYQpOnh1mTC6D97nIh7ju6U//rfp
         ZsbhLANv2Fgp154lK99Yy6sdQ+XAEtIh2wk4NRjdv71IxVz2Y/Z3c4BsGeN2ao6s5w1q
         veK06xwxLbSnZqFAkfy7PU6orjS0sH+kev3EOa5bzvDiAxJRyJ10GradIuyQJcLixY/o
         F+OK1PGAHAKrM2bT2bUoE8Hx3/Dq3Z7NWV4hLgTvuNTQLDx6v+RULLJY8a3d5AfxDDB4
         7xQw==
X-Gm-Message-State: AOJu0Ywg1YfbiHCPtl5+XZ8BDXhh6MvCI6E9M3ifVy/HOHccbXUGCjRc
	/l4+iy/2dpTNM2K+ZL7s0U8=
X-Google-Smtp-Source: AGHT+IEEEr17nF2+zSrKK/DQoTdshQqAJTHKRbxaUJ/63jDbhIQS4HEv2bZjp7t/HMwUkEFRuYP47g==
X-Received: by 2002:a05:620a:440b:b0:77e:fba3:a211 with SMTP id v11-20020a05620a440b00b0077efba3a211mr1080699qkp.107.1702077837956;
        Fri, 08 Dec 2023 15:23:57 -0800 (PST)
Received: from google.com ([205.220.129.31])
        by smtp.gmail.com with ESMTPSA id ul10-20020a05620a6d0a00b0077d86528920sm1024400qkn.120.2023.12.08.15.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 15:23:57 -0800 (PST)
Date: Fri, 8 Dec 2023 23:23:35 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Anshul Dalal <anshulusr@gmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v1] dt-bindings: input: convert gpio-mouse to json-schema
Message-ID: <ZXOlUwNh-JzAl3xO@google.com>
References: <20231208075037.114598-1-anshulusr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208075037.114598-1-anshulusr@gmail.com>

On Fri, Dec 08, 2023 at 01:20:35PM +0530, Anshul Dalal wrote:
> Convert device tree binding documentation for GPIO attached mouse to
> json-schema.
> 
> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thank you.

-- 
Dmitry

