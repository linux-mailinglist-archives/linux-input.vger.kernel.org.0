Return-Path: <linux-input+bounces-5597-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2237C953DCC
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2024 01:02:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB3711F26CCE
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 23:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D527DA77;
	Thu, 15 Aug 2024 23:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+xZj8CG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC9D4A3E;
	Thu, 15 Aug 2024 23:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723762940; cv=none; b=BTkuGH/IhJNLu0EpbKxCFmMshD4++Uu0ja1OCTw2ix8EoIQviNKBY+y1/YpF/EpJ6XgMWq2SFSSaukw912t6zIaE30O4XXe/kZ0cmeKnrqnfiZGt9rDW3F8rsDd/2Szv3gfJf2O5TKdnn81x64JUw6GP7ipLiClaI++ScYqfbgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723762940; c=relaxed/simple;
	bh=XQNPQA5Yo3vJHbRa+Dgs2hEZIl9h+lrQTXZk1uoei90=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J3Lm1I7LKPM8peR63LVvh37dq3H2CJinBaxWC25bXWN9LHpHXL9z0sBKUobBIPI9bK7OcK3jyIjVrfWCOsbgWMmV7CRPx6KFKpIOdYglfvbPX7kVC/8HXKtL/2W9Z2t/1GvDknq5uX5TOQ7MvAiulqKQGsJNBex9q7MnmpaDUpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+xZj8CG; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7126c9cb6deso938934b3a.0;
        Thu, 15 Aug 2024 16:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723762937; x=1724367737; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d1rmzARVQ2QFbXDAOZndMyXXFgob4ly/x0a0A+6+Vok=;
        b=H+xZj8CGZrRatLSiNoMvnoY9I4+HsiWRMG5b6elLH96vT5YyJHoWSYmyftf+/INjOE
         xPHY82EbmN5n5Utx5R7Bxx87qPPiZOXhE9VD+RPWfi84olXNCh8b0bfv12mJTU7pYblH
         woiIhRpoN5WJ6PF+5CWJ/OhVmXVNdR4hz49rhD4kuDBxpgQhkbdXXRKYb80lpta2O1Qv
         va99qzsgN6Zsr7w0nlaqQpaVYB5F4O5TCLpAYse4zp4yjbp3bNvmBB0VgiLrN6Mc5+tQ
         Oatvn3Nl2QHUZPj206FdkUam4/EmbgrINLlCxq3rp/AE/34Khrj9c6bcVPiiDZOVXGAE
         RbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723762937; x=1724367737;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d1rmzARVQ2QFbXDAOZndMyXXFgob4ly/x0a0A+6+Vok=;
        b=fi+/pBceE5NqfylBXyLwAgfmeKHfsG/u+EQB6ko9bErW8D2weK3i2nMz/DC7tkYv8H
         sliPj+gtD9Pt4BRVpM5z7R5LqAjZKu/APG0fk9UcYXb4bedK++T52J7WHH2SWN/wn2zq
         FyjjR2mb9Fv6aIfjXfkEZ14EA3S6C5aYwiBQD8ABfpJWO2YeyQ/CN8hOZzu1G7ok7kHq
         RC+ZOWOz275xbWdvFI1pco2hzSuifO/tgwwlROquSr6lNmWHbCoun4vYfm8LmooxNIik
         QLZAzU1AmmS6uEl/Mo/d0wNqgfAPczNwdaKmUhLEZDP+GxSH4xAyaVMK541T0vps5Ekt
         gn2Q==
X-Gm-Message-State: AOJu0YxrykKyNk8c3zutUS+Owx2vcWRkifEyR04rDsUDj07GBCeJhkx1
	V54Sk1+4qjPM0z1FPYFbYGWqQVaZ3r4LTlhlxK9KL8YYjzbSWz+VG28vJA==
X-Google-Smtp-Source: AGHT+IETud45MtEgpBw/BjlKnHw3C4d0+sgG/Mlw4KuAZ9XFcnfb1aO2vSjhdFwOd9CIneYhp78wUA==
X-Received: by 2002:a05:6a00:178c:b0:710:5825:5ba0 with SMTP id d2e1a72fcca58-713c4d89219mr1350919b3a.3.1723762936953;
        Thu, 15 Aug 2024 16:02:16 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1ffe:470a:d451:c59])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127af18921sm1506040b3a.161.2024.08.15.16.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 16:02:16 -0700 (PDT)
Date: Thu, 15 Aug 2024 16:02:13 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Trilok Soni <quic_tsoni@quicinc.com>,
	Felipe Balbi <balbi@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Arnd Bergmann <arnd@arndb.de>, wsa@kernel.org
Subject: lm8323/lm8333 keyboard drivers - drop or keep?
Message-ID: <Zr6I9RB5mibU_12N@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

LM8323 and LM8333 keyboard drivers do not appear to be used anywhere,
they only support configuration via platform data and refuse to work
without it, and nothing in the mainline sets up said platform data.

LM8323 I think was used in Nokia N810, but despite presence of
arch/arm/boot/dts/omap2420-n810.dts the device is not mentioned there
and the driver has not been updated to support device tree.

Additionally LM8323 seems to be pretty broken as far as PWM/LED handling
is concerned (taking mutexes in set_brightness() which should not be
sleeping) which suggests that nobody ever used it (or at least not used
the version that is in mainline).

Should either of these drivers be dropped? Or if it should be kept -
why?

Thanks.

-- 
Dmitry

