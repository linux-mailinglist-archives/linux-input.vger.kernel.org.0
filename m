Return-Path: <linux-input+bounces-4678-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DE391AD34
	for <lists+linux-input@lfdr.de>; Thu, 27 Jun 2024 18:51:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16EB328884B
	for <lists+linux-input@lfdr.de>; Thu, 27 Jun 2024 16:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C6181990C4;
	Thu, 27 Jun 2024 16:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQi/AgxK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23791991DB;
	Thu, 27 Jun 2024 16:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719507074; cv=none; b=dCdm1Ug6KZX0urgDCwHdWaFFbHS3LfWIloPkL/Zn+0+Bvfxexlf9VcIPNukofbNaagU57/MIV03GB00dOVjlVa/vWItDzG2uvpfibVBqu7QUINtAQx3/wqDyo6qAghQENdmvn9R+TUovYmremfgrWoZvZQjhMALLxB3r/bdy4NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719507074; c=relaxed/simple;
	bh=zpcwn9flbKcq0T6UN63hvuzvkWllw7Tqpb3Aa9DMctE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLwW7UY7xCacxJYrF6R9mfHBjpXagWFGDf/OWOvqax3p2eXLFoXcoFFwb5mVLxi8dE7Vpc/RF2fzJjZtYv4bI9cl3k2R7m+ekHJ1ZyjsrTbjyW1Ch9FDxM1/lr3WW6tMVSF+YGh4q7QSRvy7JWbySxgzFlKsRiZ2kz/QBU53MTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQi/AgxK; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7067435d376so1501292b3a.0;
        Thu, 27 Jun 2024 09:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719507072; x=1720111872; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q+P8ZMHBFh7Ea0PmzSMD7AKjbgN9ipTjqguYxy6dCKE=;
        b=kQi/AgxKbrOaTCQcbqljQdJ0uhD16kALh6KHedKaoHrd8r6FtZi2ot/WsfhDNAamTR
         dpdKFuNS2UybYc6f7YCJsrgi7WatvAtnO9doDOK9nUxJNT0RRKXhHN7hjPiaOMBwoQ2e
         iH21tWXJ6KmVlttKvoeBM0nv7HiQSoWvyma2Zs4g6CzNNbMGdkw3c7HKHv89MJpEmrpi
         VxdFwlyMDY4jP65xlmgTcEOZPdcQlyu2OhBNVLr+hU+WJQzqyW0Otgqqd/2eL5srru+x
         qBvQ26zqTXzs8ShOyYoI6Ze8KhugQ6yqQDGe9HE+lVmI4mcE4lJzxItWN31Rou4CB6BX
         LgTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719507072; x=1720111872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+P8ZMHBFh7Ea0PmzSMD7AKjbgN9ipTjqguYxy6dCKE=;
        b=DAFujQxTGgowZ9O4rJ/0stznGz7Icgia+wC/+O+wgmz1iUHSw6u/YBg2GrnPhKg0kt
         7YbiUq8s4dq1167hz/OpM0HuPZo/yUJON4T0v69TCVMppeXvueDmyBfbbf029LT7haBh
         0LYebxY7ztjwh+WkSu9oWJbB1HJ0LOW48c62bCSYJnqkZfATISz5fpicuXJHopvqL09s
         /iXmxcjIxDVMmfB2f249X3toeBFrk+VD32PQmM33UOLs7GRvaVafahTtIuQZLFSqKeB7
         gNh3v+SbtdcoCQXt+yqWkt1zmC/7zhyKO5p51FQKdyJ6uP1i+0LQcmzqIb90ohxdt74z
         +IIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWc8fVz0dDYoPfHJNmxKW4woywtG3CVe/g/V/9aCy3yZqZQ22FguXuw5mi0DID9Tj19WG72/01H/YRw+I9cRT8tDfu/Op/pI9SVk6ISB+0GBzyjTbjSBeMoSnW/EIDR254Kc97e8piyQc1Y0kHFAYViGSvEaF8ia/4hLaym9tuVpLnEwYtJ
X-Gm-Message-State: AOJu0YzYM7zJxmaWfReq0KhLJzHvBqznMXyQI9E1IJM+66mILK94lgeo
	UJJByWFc1xt1zSnMfXOyQHjfg28lV8v3GJcEIuTPA1Kx0pML+0NW
X-Google-Smtp-Source: AGHT+IEtsHGRa5kfKuqYiySLzZn6IDZD4AjzxULhgcZLdzw6y6a3eBUMXL/wpPOeXdDOqPwZo5HkNg==
X-Received: by 2002:a05:6a00:928f:b0:706:7797:27ef with SMTP id d2e1a72fcca58-706b4fec34emr3808432b3a.1.1719507071890;
        Thu, 27 Jun 2024 09:51:11 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c4ea:7ce4:91ae:d360])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-706b4a073c3sm1585740b3a.115.2024.06.27.09.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 09:51:11 -0700 (PDT)
Date: Thu, 27 Jun 2024 09:51:09 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH] Input: exc3000 - add EXC81W32 support
Message-ID: <Zn2Yfeaewi-Bxx83@google.com>
References: <20240626-input-exc3000-exc81w32-v1-1-ac42d3b87aff@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626-input-exc3000-exc81w32-v1-1-ac42d3b87aff@pengutronix.de>

Hi Philipp,

On Wed, Jun 26, 2024 at 04:26:48PM +0200, Philipp Zabel wrote:
> This adds support for EXC81W32 controllers.
> 
> Tested with firmware reported as type "PCAP81X32 Series",
> model "Orion_0183_1019", fw_version "8001280G".
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  .../devicetree/bindings/input/touchscreen/eeti,exc3000.yaml        | 1 +
>  drivers/input/touchscreen/exc3000.c                                | 7 +++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml b/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml
> index 9dc25d30a0a8..c299838e2680 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml
> @@ -18,6 +18,7 @@ properties:
>        - eeti,exc3000
>        - eeti,exc80h60
>        - eeti,exc80h84
> +      - eeti,exc81w32
>    reg:
>      const: 0x2a
>    interrupts:

Could you please split this chunk into a separate patch so that DT folks
can chime in on it separately from the driver change?

Thanks.

-- 
Dmitry

