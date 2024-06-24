Return-Path: <linux-input+bounces-4591-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0159143A5
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 09:25:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4898C1F2183D
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 07:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD7F04597F;
	Mon, 24 Jun 2024 07:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpmfbNfU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476A545034;
	Mon, 24 Jun 2024 07:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719213914; cv=none; b=QPK24hRVKNLiYzfm6YwZnqVbeSkmXJCDROH+JaGh5ftWFhw96UyWmFsIuDfqL7CLuBHhLy15xdAbK2ZG3d02DD2FoxjCZdUjvhXJbDkWd8ImrNOhrVW0o7jr5JMrFUlrSgoNn4fuPhYwe66+Eh0cNkr168aS9UEivH5nPTcR/3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719213914; c=relaxed/simple;
	bh=UcMT/ajaU/krTpXHwToi0jMokwuOBITDzDgf0FGa1xU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sIDVtTNUL4/mbDv4JSeybgxhm1gkNBXombAf0EQUcDb4y/if1431lB3Hd9KN+zQFQaIURRAE9Zfus6kjydQS9+ahNvLxpPxoY45AigNH04hlB6FOvo3jk/74cwUVtiWbfEj28wrB5xQQD6r5KzZag/2UNY0op5zBpucAy4NYrKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jpmfbNfU; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-713fa1aea36so1653852a12.1;
        Mon, 24 Jun 2024 00:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719213912; x=1719818712; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3mSs2Q/thCXn7CZtQ9R0HaQ060/rkLZsvicCCKzHqYQ=;
        b=jpmfbNfUqltTwzuL6fLvao17Y9zHtYQd+9SRNCKWevKKeTMevo7NrvM/p8ux1adgn3
         Mz2gdG6cpT65k7SFtszTktO6e2ZecPbb3Y6yt5N2FJu9sH+WzF97cWHx8hD1V5wOCJLh
         xMY68TlA6xDMAu90gDmAlMDuogYPjKdb/wX4CoaKLLoEr2jufHEomtvJD2ihHvgZDQIz
         neCgjxIPPty6mHVDkuKNTKSDkr8iXvyM+CticPL9XQ81yruCsfxUxe3wXe3MyF//4Sxj
         m1kVsityipnMmYHdBj7FjxXkP6paXET6RS8jPQ7F3TKo/GxqorgW8e5Rebub3xV2eRVf
         TQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719213912; x=1719818712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3mSs2Q/thCXn7CZtQ9R0HaQ060/rkLZsvicCCKzHqYQ=;
        b=BDXBy6gBIdKLXe9kM6g3lj+Nj9Kqxsz3kC1p4OLdLQrY9WOd2vRbJcOeotK6rAHqQp
         Orca7ZCqqA5nsPSRtd5KDEbTMlChqgkXh4rrED4VgbPp5ZDfrIrrh+seS+HD8pKTQfKW
         Ucuz2D3dat5eGsVAWMufevTfnBVOjQkFqOALP9Ua9G5AaCKu6y30x7uXTKlAX2oiRQ1c
         jPGB0D9u5Ecu/GwIpCA3GVGM7ut7UcyDdrnQnjk7sQ5QgS1fH22RidP5KouZRjW7Htc0
         K+wZ4IM2fJjlVCcdLgnDJ2DjizBU9ar1+PAUGupyy1SPRRDgtQVkSeMjPLCEnVtiJeNU
         q7rQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7oK4VwRnpLRFaxxY2b4Oc2uqshtckTUGdAukCRnaoTVKC5I2hoS3a1cwSkIUdmD/eLHbXAfw7jSmEIEnAF/rQksrtcthbPJw6ziWq8Qw6JrN02L5BpTwL6xfMEV12lOp0TjC6g0rVbzA6/yQ7ZruV+Y0k3s7l/1eO3A8f4d/kUYjnmXb7Jg==
X-Gm-Message-State: AOJu0YzLODFmp2qca3z+eDrSDYMyP4R18hecbBvcMrZ/if6cJsjAJCXO
	8GBArZk3A8jIf5tXaispvI59vgRhCZKqZZok0iKbF2DnCYSSlXMM
X-Google-Smtp-Source: AGHT+IFiCVrArsa0Bx/ya8QGwBsiPkad+1xSUrOwFexpwk3z5tMCE19i5IDBQKKNGn8u5ZyzgJPVvQ==
X-Received: by 2002:a05:6a21:2720:b0:1b5:3ffc:b3c2 with SMTP id adf61e73a8af0-1bcee66c9b3mr3673280637.12.1719213912369;
        Mon, 24 Jun 2024 00:25:12 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:eba1:6f76:e2d7:7858])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7067ce3670asm1866079b3a.76.2024.06.24.00.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 00:25:11 -0700 (PDT)
Date: Mon, 24 Jun 2024 00:25:08 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Caleb Connolly <caleb@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Henrik Rydberg <rydberg@bitmath.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/7] dt-bindings: input: touchscreen: document synaptics
 TCM oncell
Message-ID: <ZnkfVAfubwFFydpt@google.com>
References: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
 <20240624-oneplus8-v1-2-388eecf2dff7@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624-oneplus8-v1-2-388eecf2dff7@postmarketos.org>

Hi Caleb,

On Mon, Jun 24, 2024 at 03:30:26AM +0200, Caleb Connolly wrote:
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +      clock-frequency = <400000>;
> +      status = "okay";
> +
> +      touchscreen@4b {
> +        compatible = "syna,s3908";
> +        reg = <0x4B>;
> +
> +        interrupts-extended = <&tlmm 39 0x2008>;
> +
> +        reset-gpios = <&tlmm 38 GPIO_ACTIVE_HIGH>;

This shows wrong default polarity. It should be GPIO_ACTIVE_LOW.

Thanks.

-- 
Dmitry

