Return-Path: <linux-input+bounces-14690-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 370FCB56429
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 03:06:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8503189C57F
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 01:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946D41E9B0D;
	Sun, 14 Sep 2025 01:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZE92IuOQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C5C1E7C11
	for <linux-input@vger.kernel.org>; Sun, 14 Sep 2025 01:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757811985; cv=none; b=EW3DjKou0PeHOixiAxDa8QbIxyR+27kCfCsGVgDCvlrZUCZo/LbzL0qMxaMpT9AVi1ZVUIstLS2uxEFP3cV2PuAkoga7MkfBpvA7DrPOOImxGterLHO2cngqmf6ldmZEe258NYSLptEtZtTtqg6lRM+yln3muYLATVLiv9tVwVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757811985; c=relaxed/simple;
	bh=ktRIj1BWMRAgHuTHhmcHnZIEjgDrBOtlqKH+mBToSIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=liecfn4hxr42ma1FCqastQwyrzvqj85RVNmTeICwMdxYTI17iUweZuld7noxmN5Stvty8E68mF3UKn1Sp53HPuzBTlV2SKC8FBPwkYltXbFk1pkVx3mI6xDvXaFIQRU8yl8WK/F6P/hvPBqbINOnvPcEb9h+Tnl/9E0EqImI6Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZE92IuOQ; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b4ee87cc81eso2726016a12.1
        for <linux-input@vger.kernel.org>; Sat, 13 Sep 2025 18:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757811983; x=1758416783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YJIU8Q2R9kdfT4ukS71DR6sEqvnpBsLUAFZdleMjmYc=;
        b=ZE92IuOQcl+W1MPwa6uQn8AQOAXYb1kAirYg6oJUmtg6h9C3bR2t+hOLVtAmgr5Ata
         UrBpVDgCSkfURI5DtJRmFpI8FEu0+I7JSoChgENiVfAuFSGqBI94HGi+AesQE3N47CfF
         dGLZhEWBUHduiaPMZYB/WPrdSuGHCWe1wpSCent3z3d6V9i5UVr9S8iz1Q9WWNYitBDN
         W7h8OrlpQKgSaicf726QOKjX72nt8jlbyqqvKQn/0W6B0de5alE6qK54ryeCI++MZWgL
         QGA6xiIffhY6NYbzCFfh6oBhnBF0jQr/GLbOMY1URNJdavs7HDhPInz1ipqRvAAcpcCd
         C8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757811983; x=1758416783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJIU8Q2R9kdfT4ukS71DR6sEqvnpBsLUAFZdleMjmYc=;
        b=Z/xdI2lPZ7fweA6rCRjYb3z+si1AHqG2whoMxVXR3Grz0wuW9jy+FdirmjnvEe2jw2
         ECw/w3lc93N/D+rMalVvKcCI7k3EA2L2DA3OrnFniop7ui1bAY41Ii7KyNASZ9kaAHtU
         YoNYvuqgzB80Ux0dNsXNkFowZ1aYO/XyV16P0+faeelGObCJJWZtgxVjfi5k/WYvVRBi
         ETCjTp9WMzQfnuIAKzKgGYAINEpRHObzIZYanGb3EZCSb15E1GHqo6csen5Us+6Dwech
         WqJbdbz38ftGS0PVEo5Z9Htqi9rMuxtucoSHoJFN8ZcRI7RWlQ09l9uevFigrKU2fiRF
         2PRg==
X-Forwarded-Encrypted: i=1; AJvYcCXzhjfsIxCoUYjv1VFRmyEXHOfdrupggt/OhvZ+h928LvJMW1P3S0nro8qsFb1OL9yWQSzzp0gUdZyMbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHCSIRjCGk4pCI0IhSN2PxHavc4CQa6/5d0CDMNQxqzCcNAzKa
	U3yH0as3tWNHjZCbLLcf6v5KWxFj8X0epOJCBDM6pjZKOzWgdlXfGWHzCMgfxg==
X-Gm-Gg: ASbGnctPR9tngVO1LP7MSJX3AY4Kq1xWHkEZux+ygYSUPsaH2IsbguPo8Gw2RV8nViK
	VwXBbn+cf+QldZzQgYxfYYcPI/2qmWYpGchvFlXL3XlwupDyD5MFegw1AyvwwV9jGV2GF08sXFA
	xyoAYlh9GyYRQZDWBg56hxILcvrK6tCS9TXioRlPPYdaisGb1ckHHqZDdSKXM8D/mbe+NSp2Y5V
	SpJ5cUGlR1Ih9sjJdjOQ8wgsaw7Ihd9iWGk+uiP5n9fnQmQYVakjqbRwr+FfGfvPdXr3PxOi+da
	BBtDHTo9eMrLOaVIABO3VnJnVpj4M1kNfNjyxx4FD14/a8p8M7eRgSo0KJeNNXdOpvAG6l4LBQw
	02UwSMIIc1BbOS4AvJ/OYe70fGjrxJsEE
X-Google-Smtp-Source: AGHT+IGFFpvSpJArs1iawlJwQfacD/sqeThJpnPi1hhTHReWI0+qiuV9oOalWTxS1gOfFGdm+7/JVA==
X-Received: by 2002:a17:903:240e:b0:261:1210:7b81 with SMTP id d9443c01a7336-2611210844dmr44826625ad.44.1757811983295;
        Sat, 13 Sep 2025 18:06:23 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:81bf:abc:6590:f690])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3b306192sm90174085ad.143.2025.09.13.18.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 18:06:22 -0700 (PDT)
Date: Sat, 13 Sep 2025 18:06:20 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, linux-input@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH 5/5] Input: cros_ec_keyb - Defer probe until parent EC
 device is registered
Message-ID: <473egrw7dn2xbe3likrfekyvh6z4uingywp3w5wjqcwo334fqb@j3ffdzv3723w>
References: <20250828083601.856083-1-tzungbi@kernel.org>
 <20250828083601.856083-6-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828083601.856083-6-tzungbi@kernel.org>

On Thu, Aug 28, 2025 at 08:36:01AM +0000, Tzung-Bi Shih wrote:
> The `cros_ec_keyb` driver can be probed before the cros_ec_device has
> completed the registration.  This creates a race condition where
> `cros_ec_keyb` might access uninitialized data.
> 
> Fix this by calling `cros_ec_device_registered()` to check the parent's
> status.  If the device is not yet ready, return -EPROBE_DEFER to ensure
> the probe is retried later.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry

