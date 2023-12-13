Return-Path: <linux-input+bounces-755-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89617810B3C
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 08:14:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43305282304
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 07:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2BC182AF;
	Wed, 13 Dec 2023 07:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="auVGA2c2"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53FF718B;
	Tue, 12 Dec 2023 23:14:38 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5c690c3d113so5433091a12.1;
        Tue, 12 Dec 2023 23:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451677; x=1703056477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fpt9vht0zIQ5nO2Er3jawYfCXZtyIGFa5O6APbhC+7c=;
        b=auVGA2c22Hh4S3WDUQAel1IWmtmrvbxVZtxKOHCqo+0ICcNAyB7Z91HCK9MJ1gJ1HU
         yFaAX6Bamt0+AjtAURKKNmIDMaW34k1/2U2tL1d6HVUBNZbnjtj2M2EpNkAZ5fEg3nKP
         WRhqgx3boz25DMo+vp9ELimtof22QL2tqxrA/DEnyoASUMYIj8rWE3z5e2uo3SEgViyn
         z8996lPcg/Jr3+dHzgKH+wjCN4fc201itFdn0TcREsz3ti/20I1QQByi56YzXIooiWHb
         SIQ48tBnyAfPtRJBkZ5hGw9+WTS7YCYQkUpFGVf0s8ekBbR/GZdxlxL4uqrmXjpbDMrE
         yCPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451677; x=1703056477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fpt9vht0zIQ5nO2Er3jawYfCXZtyIGFa5O6APbhC+7c=;
        b=rmj8dkEx88F9k9yiqPuGl4mPyzPmOxfeGsCrcysE6JRkqAqqiTBvBWmq2QYUQ4O9/j
         6MC5UGr7VxZKfVOTwSNaWcFTBAKDjqvKxpE9UE5PmLFhSXEL014LphZS7raCpVPGlVUt
         wGwSRejTwfEb4N1b0H0ZVC/gGVwZEEZYFZOC2Dm2RE9EAMzWMllq9xmX/e9LzaV4nK6K
         A2Qc5XLL0m5mJeakbrpAxGdt/aquSrndR8Lv4rsbqZWVZEd4dbFSeYbnn1NDHjex05fA
         YmXgjsBVnPh5BIXZ4em2ENa40PAKvNfan/souN2TslVOf+Jzn/Idx+PvuMoXFMhAJpxG
         ozdA==
X-Gm-Message-State: AOJu0YyKPKN4KyQNOAxIPqjMA5e703Asn2EGe2GtSwLy0eeTLXQj9eOO
	Z+3eyzMFX8WmGudg00dVGB4=
X-Google-Smtp-Source: AGHT+IFiOaFoDZcu86ZB71YTKWXUnTrQPB2F/YJNZ4osHzc6V+4IWa8LuNptxgWnOiDRbNE+fodQJg==
X-Received: by 2002:a05:6a20:9390:b0:18f:c737:1c9f with SMTP id x16-20020a056a20939000b0018fc7371c9fmr9235730pzh.5.1702451677576;
        Tue, 12 Dec 2023 23:14:37 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:96c1:256f:67e0:c0db])
        by smtp.gmail.com with ESMTPSA id ks19-20020a056a004b9300b006ce7d0d2590sm9350469pfb.0.2023.12.12.23.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:14:37 -0800 (PST)
Date: Tue, 12 Dec 2023 23:14:34 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tony Lindgren <tony@atomide.com>
Cc: Rob Herring <robh@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dhruva Gole <d-gole@ti.com>
Subject: Re: [PATCH v5 2/2] Input: gpio-keys - Add system suspend support for
 dedicated wakeirqs
Message-ID: <ZXlZ2i0wvI9iu3tv@google.com>
References: <20231129110618.27551-1-tony@atomide.com>
 <20231129110618.27551-2-tony@atomide.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129110618.27551-2-tony@atomide.com>

On Wed, Nov 29, 2023 at 01:06:15PM +0200, Tony Lindgren wrote:
> Some SoCs have a separate dedicated wake-up interrupt controller that can
> be used to wake up the system from deeper idle states. We already support
> configuring a separate interrupt for a gpio-keys button to be used with a
> gpio line. However, we are lacking support system suspend for cases where
> a separate interrupt needs to be used in deeper sleep modes.
> 
> Because of it's nature, gpio-keys does not know about the runtime PM state
> of the button gpios, and may have several gpio buttons configured for each
> gpio-keys device instance. Implementing runtime PM support for gpio-keys
> does not help, and we cannot use drivers/base/power/wakeirq.c support. We
> need to implement custom wakeirq support for gpio-keys.
> 
> For handling a dedicated wakeirq for system suspend, we enable and disable
> it with gpio_keys_enable_wakeup() and gpio_keys_disable_wakeup() that we
> already use based on device_may_wakeup().
> 
> Some systems may have a dedicated wakeirq that can also be used as the
> main interrupt, this is already working for gpio-keys. Let's add some
> wakeirq related comments while at it as the usage with a gpio line and
> separate interrupt line may not be obvious.
> 
> Tested-by: Dhruva Gole <d-gole@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Applied, thank you.

-- 
Dmitry

