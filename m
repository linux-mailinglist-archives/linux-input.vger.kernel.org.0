Return-Path: <linux-input+bounces-720-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC8880EE2B
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 14:55:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B2341C2098E
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 13:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1AE6F636;
	Tue, 12 Dec 2023 13:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bstFmk06"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AB2483
	for <linux-input@vger.kernel.org>; Tue, 12 Dec 2023 05:55:46 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a1c8512349dso750584466b.2
        for <linux-input@vger.kernel.org>; Tue, 12 Dec 2023 05:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702389345; x=1702994145; darn=vger.kernel.org;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ohagBc/VE0flX9ngoAg6RG0o9oobuGsKuKjVcmJS1Y=;
        b=bstFmk06oheb2gZCIxNwU1uT6W2BSDT2FUAQtSlqlcyN6NQRANQRsk0MW3hz//ER4F
         MSVkXdeUsb1v7F4z4aQNss2jdZYLmiE++StUsajDSs7MdXKOJohY4lCrTqRgZmxbr9Pa
         e0NG/sjo4NP2oz+ZNCoTeQ9LCIPR9CzeNmDh4PR7VudkWaLMveOkXje22hD5p+vJXmYV
         y0l0+o6Frpmj2GAAQ55Io86omdhCy7MAofFP6z70+CXPFCqkWtRQbDiUqXybry8JVnji
         mHCZJbNOFY8QXAjS4gD770JS9n0cH6kCQp570IUYmlsRPaAE8ZrOjSl++qHd65Fx9f4a
         Yy2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702389345; x=1702994145;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ohagBc/VE0flX9ngoAg6RG0o9oobuGsKuKjVcmJS1Y=;
        b=rmKXt60MSaOX0paGpIZoQzRAaTUD30HnX9EVimGnoeOWhN1VPtEfvZRBnUPnfwnI9G
         nfztyngwrNGw2gxV10YSjPmJORwzEAxW0OFwEjK4o2GJma0iCzIEj/u+fzik3N87EGwq
         6gFwPtSQjR2wbdxQHz/xgvhSWtvVyRDRhv29vD7ZwLkZUoGRPLMY+hRI3pjfp7AgMdS7
         JCWrOtA9xvO0RwLAMIoYUVR8hHy27ZP0wjT3aN7XDM6cbsCE+ejCvPLqU1kJp6dLg4cU
         RuQgqYEsgA0blWkVZcQ0wdpM1SEZm2UqqAMPq6n+QHOd1p/gVyYbYJk7N7zIbMET0Wnq
         1d9Q==
X-Gm-Message-State: AOJu0YyQNza6W5WBqfjvdyhkKp0/ghN+/IoisJXdvFRMxuq/2z/5zE+5
	evMBMX8aiIDVMM2m8+2V6OkjJI0hx0vp6G4D/ro=
X-Google-Smtp-Source: AGHT+IFYK3jOe2c1L1RAaV9F03HNqJHdbSp9I28W+lmTgU5Nkhn6PMMFnPrWhXes/iLPMmJRkBtTHQ==
X-Received: by 2002:a17:906:118:b0:a1d:b924:1042 with SMTP id 24-20020a170906011800b00a1db9241042mr3361942eje.13.1702389344796;
        Tue, 12 Dec 2023 05:55:44 -0800 (PST)
Received: from localhost ([193.86.92.180])
        by smtp.gmail.com with ESMTPSA id he43-20020a1709073dab00b00a1e21893a26sm6281018ejc.222.2023.12.12.05.55.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Dec 2023 05:55:44 -0800 (PST)
From: Jiri Kosina <jkosina@suse.com>
X-Google-Original-From: Jiri Kosina <jikos@kernel.org>
Date: Tue, 12 Dec 2023 14:55:44 +0100 (CET)
To: Daniel Ogorchock <djogorchock@gmail.com>
cc: Ryan McClelland <rymcclel@gmail.com>, linux-input@vger.kernel.org, 
    benjamin.tissoires@redhat.com
Subject: Re: [PATCH] HID: nintendo: add support for nso controllers
In-Reply-To: <CAEVj2tmFg_o-h++994MByzUPiaGtWPChsJ3s0G9ThhEKFNo3Xw@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2312121454110.24250@cbobk.fhfr.pm>
References: <20231204081721.19507-1-rymcclel@gmail.com> <CAEVj2tmFg_o-h++994MByzUPiaGtWPChsJ3s0G9ThhEKFNo3Xw@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 4 Dec 2023, Daniel Ogorchock wrote:

> Thanks a lot for the patch. It's great to have support for the
> assortment of Nintendo's switch controller variants in the driver.
> 
> The refactor of the button mappings and variant detection looks great to me.
> 
> I've been able to test successfully on all the HW I have (pro
> controller, joycon left, joycon right, joycons in charging grip, N64
> controller, and SNES controller). (I don't have the genesis and NES
> controller variants to test with).
> 
> Reviewed-by: Daniel J. Ogorchock <djogorchock@gmail.com>
> Tested-by: Daniel J. Ogorchock <djogorchock@gmail.com>

Thanks, applied.

-- 
Jiri Kosina
SUSE Labs


