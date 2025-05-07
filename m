Return-Path: <linux-input+bounces-12199-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDC2AAE0A6
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 15:25:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 778CC4A3637
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 13:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A202288CBD;
	Wed,  7 May 2025 13:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="n3ssBU8L"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98D7288C2F
	for <linux-input@vger.kernel.org>; Wed,  7 May 2025 13:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746624303; cv=none; b=h4Li8lMby3mPiRlBXBGt1k3v+N1Mbuy40T2VSkrwlOENatdVaotqfozK2uxeEvihmUrsEeaaq59REn/E7zBqveLtJEuLuYXrosup9WjoufySLbNw3c5E47lBSiAO6zI6VIXW86fncCeAAXa3fNwYJ04kn3YF4/dVw4WMc2Fy+bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746624303; c=relaxed/simple;
	bh=JPbsFId9HOcNNCMKmW+AhN0ZtMa4qZCci/vBQwntvgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BV7V53CbdlfQ5QqC26ruxyI2PSGrLbqG6HL6gN9AwVsbK1GTy54ESGXqMwzxQ3QCzrCFKVeTlyYlev8s3pc/HWOENE12AZcf65rQtV2RDIt2EPzgWrxPCh6bhzGpBrZtMyLNZSROOU+3H3iJpZXQ+HpK3xm3z4x0pn3Hhbfq7mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=n3ssBU8L; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6f5496972d3so1274586d6.0
        for <linux-input@vger.kernel.org>; Wed, 07 May 2025 06:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746624300; x=1747229100; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1mNpLvD5vQVoCYoH8klEkGMCzhi+IWNYb5PmxSoaGgQ=;
        b=n3ssBU8Lp0W2PZYdMzR65aXwQMuNo/o7Nmr/FofZQnTiNB0QemN9b7ejhPlCpAw6CR
         urmmdwInwtUS1SSOutMdT9rQzv0Wb/W+KnEu3IPgWSgUTOZhSjWYvcQJYrFOIdoAIfVE
         /A6o5TlQSdBlYR01dk2tx7mOlgVv/Y3enhWwIoFido6LCwwMNWUj0fIzYZEUN9fBSe+U
         z6Nf+m3tKuUaywbd75n6tfNoCOtjzrVlaUa0Rsp2kumV+K/XsvkHlvuTcES49QPsdEku
         ag4mHEUHEA7Iv1O/rqXVVh1VwNKkwh71ECAeMqf1ff2nCfoDI8xzmS2JaSTjSE2+0e7L
         zHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746624300; x=1747229100;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1mNpLvD5vQVoCYoH8klEkGMCzhi+IWNYb5PmxSoaGgQ=;
        b=tuZ6/CgpiNeX7dtxH263WdbA7PlcqC0Sq0YuAF4Lw9cQNcGspDDl8kGHmddMbTEOMy
         C5tlJjO9RxiMyuTsD1lWPtiA3OC5U4c/NLWMci27LCnBSyh/v5eYO/QtfPbUiVvs5fiW
         eoNv3FRZrhpvn9XwhTvt5ovnF5HiTDKwKBCrPq8R0kKP3mOlMbEzjlnj99EmMkBuCFa7
         JqC5uO3H0AJwmGZgi985qfwwETR356wfv5/aZiBupqeVroKT8uK0KltK4o4cg/g6247P
         D3FMRDr82SQJ92yLIYb9SZWqcke8k7VZrLuFfnx6yaip0UKUIkwICOg/UXSlUia5SBMF
         gbdA==
X-Gm-Message-State: AOJu0YwwycIWjphxbSDvW6AX8Pi2CrVT0ZBwQp5fYoTdxJINAwV++mWO
	jEsQgT/6tSysc5GaDgmYUaKCDAoaUM177re1jusArmveGfd1yqw4b0RLkR54JP1oX0ZqzZIUOgF
	3
X-Gm-Gg: ASbGncuekmyEEi/ua82i3wffkNOqv2nfx5SO1nqC4bi9YBgJHM4LSWYaC09kv8NCECN
	rZAXNJRForrxBUsjGLl3ffVyPnNTrE/71xk0m1Q1J8xD+1gQ979FXo/Y2DkYMqjFW/84A6w+p+g
	IAtp+dQefsWffyCuDueoEzEaCsmrMgenIOpV/TAonynWm0Rf60JZBG7PVXGhz8OGneE2EqIWskn
	EkZ2LT4kTrqovrJilC/Pf8VtjX8dRU8eOQkAi6wSzMdybgf38f0wr3af6hx2SIITj63eCqiCk/M
	SN4zHaIeHh76OuvQCkni8aLV42C/NBLHh938wV/J/Xx6TCMkoTRhi6UHR8qu/cRYu4IWkOqdnYd
	MkL38btZB0Ymp5Qg=
X-Google-Smtp-Source: AGHT+IETb2JbAqHKM0Nsvz8Uj3dfNmRTjWBQrhF4LcQa8hFco6QFGOGpJTMa1w7dB5MoJJ1ZXmiC3Q==
X-Received: by 2002:a05:6870:47a6:b0:296:5928:7a42 with SMTP id 586e51a60fabf-2db5bed9a3amr1627337fac.22.1746624289401;
        Wed, 07 May 2025 06:24:49 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:3356:f6f6:bf76:a32? ([2600:8803:e7e4:1d00:3356:f6f6:bf76:a32])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2db5d0666fesm585351fac.33.2025.05.07.06.24.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 06:24:49 -0700 (PDT)
Message-ID: <9457b419-6aca-412a-b0f7-4b3c7274789a@baylibre.com>
Date: Wed, 7 May 2025 08:24:48 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] HID: sensor-hub: Fix typo and improve documentation
To: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>, jikos@kernel.org,
 bentiss@kernel.org, jic23@kernel.org, srinivas.pandruvada@linux.intel.com
Cc: linux-input@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250507055745.4069933-1-chelsyratnawat2001@gmail.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250507055745.4069933-1-chelsyratnawat2001@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/7/25 12:57 AM, Chelsy Ratnawat wrote:
> Includes the following corrections -
>  - Changed Measurment -> Measurement
>  - Changed clode -> close
>  - Gyro -> gyro
> 
> Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>


