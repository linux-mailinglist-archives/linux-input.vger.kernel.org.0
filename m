Return-Path: <linux-input+bounces-14531-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D83DAB47411
	for <lists+linux-input@lfdr.de>; Sat,  6 Sep 2025 18:21:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 995C63A79E1
	for <lists+linux-input@lfdr.de>; Sat,  6 Sep 2025 16:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE00D2737E7;
	Sat,  6 Sep 2025 16:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RGmgZ59T"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDFD1C5F23;
	Sat,  6 Sep 2025 16:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757175673; cv=none; b=GKRW1KxDjwq2ql7bbmwZjiWBUcrBb51eJgScPZnc6BkWqmnubRLxi2fXgvjKqXd3F6pRATAiEYB1oYAq9ozfNsBBpXALFLvqM/9Rwtar/SsGfIzbJULgvAOh15fbBoFPZytmtj5Xqgn2GYcgj8C0HC8k18YFk85G5pIjfs3co4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757175673; c=relaxed/simple;
	bh=2ynDdE05Uu0V18utDLJe6rKmpr1DVZ5MyG+kWtdhmbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hSqM7MVFdAa1tDaAWxu0qCw/wOpubmFQ8LUnNNEBBlTnkFEwbiWTOVbIVqD1ySp1f1E325yz/fIu9q4mTwNa5RnOSJNC6IEHQ3pDNlnUrSmd7L1NZOsDudP385mpNCMaODNH0vrApMufsFPzzvkZpEzAxmT3o7yF027Gf2k359k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RGmgZ59T; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-24c7848519bso30187295ad.1;
        Sat, 06 Sep 2025 09:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757175672; x=1757780472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WbBN/bObO6Jlu4fh+8gK6wcT0StMIG2MNueU6l6qv7s=;
        b=RGmgZ59TAPZDQMzgkHBy0oCwqLZb9zS+Sbhd0CKHKaIJ4VeGgOPiyP7lh0Ei3Ytzop
         rYw/2yiCOmvjr+U7N9DDdp27810ecxGj8/f4BqzKEGvI+5Er4ma09kDq1Sg0nyGGpFBf
         jxQggRZ2Aa0bUDIiwoMLaXBrU7aDmnXcflyjOp6HC1lOy9enWwMSOj7c+k0rMIDmWrKV
         hahZ6NcreUtLLMXjSt5GJUDgUmJM3/IOgoqDkdyR6Y9ZAkNcf5tYZ2rhQk3ptn1is1Fx
         3V2ex7oiixBoNcRfQvhxg3lc85JB3AA8yiEldwy5u0Lz5GhEgEewYoGfEj+FOuxkUZhu
         K9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757175672; x=1757780472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbBN/bObO6Jlu4fh+8gK6wcT0StMIG2MNueU6l6qv7s=;
        b=KlKkXBwWU+ePJ622y7S2ndBr+fwPxXARe+4MPPSYbpZCWyFJcpD2YLYqDK0zCz1dHQ
         f3Z+V2ynQCTwiu9erQKU4Vjb1kGnJxRczvzm0WTuxNyrRXL7Tu3fO/0VBugg5NPFSIoU
         jVzOwinOBpmzKu09PVbTy9b9cnGkhKtDBsUYMsyLqPimO2UZm+Mkb+sPr0bP9LJNuurC
         bFB2XINig7JRnpDKC6T66uEw8x1cbJVzik3gtGxe4Ar9ZA2ciCknxbGS3k1KOyAQM+Ti
         KvAeu58kW8D59C5o8U53DV5l/h8G2f//xlGGg0pmK8TO0+op2hzvtsWkpsedAhs1et/O
         P64g==
X-Forwarded-Encrypted: i=1; AJvYcCUfy3c3i0ZanB7KONtV6J8GHg4UtwuHc7JQUIKSu5uXxKjuUqAXJ5QPP/mj0UGFlFJPYRFIbvsK5fZ79aQ=@vger.kernel.org, AJvYcCUnCimkoufiRqJUKfCGP8UuwJavwR9I0M9D9UPxnR757NsL6/s9T9rY0bkg7YLC69DunLU7z28IH372PhTV@vger.kernel.org, AJvYcCVhfVYT0C2w2oRmACVbK9UL4nxtod7QVPIrlqLqcxmnZVhlekpHNAT6Vdte4JJGPJg1UEv9V3YbEo9L@vger.kernel.org
X-Gm-Message-State: AOJu0YzxRtyI+SPkPGqxRik2pZmBk8DfCTo4/EbwlKPhAzAg/h8KQyCD
	NOUxXzanpLUfMqYoH7i3r8blgIhZkpSkBnLS0XeOA1jMDI9ym1ICQ0Mi
X-Gm-Gg: ASbGncvYP3U1L06Nj47ZCwngaVCW4kfOhNTic75yBJVmiygruvMJnIv0YJHC/47i8+7
	c5ieN8Zrpr2bZG9Wck+mVbQwoXAB42oHPGay2Q0Xb4h+/9p73Elup87Sv2hHS8uswbB3DWsNk67
	oIg18A3l21cdtaADeywjsCKMUKRZq4EAnR1cn7urml3CYa0uXDkDd3qShdjn4JTzVxPp8bG6BL3
	Cyqxe0t/awmgR+ZVT1jyCMxGG0imJdfkHPKRXrVeuQNJRqiJr03SGyb6O3fvKixBQL+hqajWJP+
	jwOiWRnLzSekp4XvN1a1xYLAHZb7cjA/NtZ+xXiykhpHCnE1w+BQJJSxrLq/d1eGqfjCzAsLuTo
	Nnr4Ob2G72Zn0HdCip0ni5tIvwGitxSWtrRzpKd9JiGqr
X-Google-Smtp-Source: AGHT+IH1qZN+DQ27OCHB1U/5HTdy1mERA+wXWrNPxb8O95OI/s6qBCOSDD0GIZe2PFFDC6b2c2Q/Sg==
X-Received: by 2002:a17:902:f711:b0:248:96af:51e with SMTP id d9443c01a7336-251751e5bc1mr38642315ad.45.1757175671543;
        Sat, 06 Sep 2025 09:21:11 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:e08d:5959:e7ec:1beb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24cac2f24fdsm87369115ad.46.2025.09.06.09.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 09:21:11 -0700 (PDT)
Date: Sat, 6 Sep 2025 09:21:08 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: input: convert max11801-ts to yaml
 format
Message-ID: <32bvq4uuwb6zvmk7cd26rahoz4vaz257thlxtsat5atpmlszxa@ppdpssfesz77>
References: <20250904200641.531897-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904200641.531897-1-Frank.Li@nxp.com>

On Thu, Sep 04, 2025 at 04:06:37PM -0400, Frank Li wrote:
> Convert max11801-ts to yaml format.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry

