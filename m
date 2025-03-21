Return-Path: <linux-input+bounces-11047-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95618A6B2FB
	for <lists+linux-input@lfdr.de>; Fri, 21 Mar 2025 03:33:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 266F03AB3FF
	for <lists+linux-input@lfdr.de>; Fri, 21 Mar 2025 02:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08BAA6A009;
	Fri, 21 Mar 2025 02:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Y5a+VVD1"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11CB208A7
	for <linux-input@vger.kernel.org>; Fri, 21 Mar 2025 02:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742524395; cv=none; b=cnfpHffFlCIMo7wm5XfD/+bc8YfaLNQp+hsiY5AAJ967JTWugOOdb2VnHouUgAheMaF6bUcMmLGQF2Wn7acPc62VXXS6hnS0IiTd82EXVPJXOdtHfsHfT5lHWFEPe9J191s3d7LDSSABJW8iUmbGB+AuATtkFceE2HnSVNvCdTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742524395; c=relaxed/simple;
	bh=fh8/hKnhmAdMmulO3dOA/fUcq3ROAQN7CvfWvXaT2R0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SY73dZqIzr9WqTZD8jzR0H6j8OZUb+F9Kc8AVyChptkM+8zdu+uXk9wHR1GuZ04jBWaYk7xyJ/8FiCNBPzAgGbnXTT/Nkyj5142IeQnw2wP6/hxm6uNczgx6bI2jYZXwBuFle+142gRGdPdn1VWcfEysQHbV10IgNIx8prBn93I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=Y5a+VVD1; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 37ABB3F22B
	for <linux-input@vger.kernel.org>; Fri, 21 Mar 2025 02:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1742524385;
	bh=yGdWxK9JVirSn2lLRI6kllOEuz1GJUXaDgPsY8xB3Nc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=Y5a+VVD1ojOke5htLTf4yD0SGufb5rXBJVmoC4q56tCfqu9vd0sAHqv4WzVOTAF76
	 QXxg6z4hOX+nqa1HK3LpLP5u/o1EYmT40onjG9ieLQvLT8TeL7znact5YBkCjrE1i3
	 IhBLvr5LPKmSq5RfEpzuRUY63Ca2Y7UmwSzfwVJLzQwFtrLbMO9cMlusjTyagpmCzd
	 dBVQjTiqiP/iD0Jv3vJ92qqdyZ7DlLxsn3DObfOMk6UNCgrEjqP1Qe71PsGpU4BvBS
	 MP0JdX0Y6Z5h6f97onu6Da/hBKBT9un+ma8YdsPdvfwF/+L7mcGbDGe5ODnV0L/tLm
	 IwsdKHmzVyOjA==
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2242ce15cc3so20592575ad.1
        for <linux-input@vger.kernel.org>; Thu, 20 Mar 2025 19:33:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742524383; x=1743129183;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yGdWxK9JVirSn2lLRI6kllOEuz1GJUXaDgPsY8xB3Nc=;
        b=r78IKFX95uYZxu6ejZoN0u90mTV3Wkr0S2pCM5oZKaEGa6isHaP5K5kF/xyqjs7Ucc
         ylhPmunKceEMhaHY1NXdaPGnmozjEZP8SLKvCHa4SAQFZb54c50i+iTL89ZA/og+Brcu
         xmWBPwsMSCXYxX5LxENmptVyGeiM4cu6KSG1QSFd9SrO9PEPEpiKwN/m7I79KGCidxB6
         ZX+jDrI97ot/u0g8mIvo76KevrjVJrqwvfDP9wmMNhiC5yRaTh2AV2BExnxHmSepNjVM
         5gEsQW/G8H9spF2Z1JwYhGEtMQBoUIV0Pst6fS+zAlcJco2n5MuRumL2p6ZywDpyMNus
         EZMA==
X-Forwarded-Encrypted: i=1; AJvYcCUVQfKVyvByNLePd+JVBaoIb72BPnP0TCkDaqPvuWUGmQaPJGf4W15MLcn8vyu/lpSpC82KpPEn/+uMkg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yww1awtwH9QSrxgnJMc7mLpuswqZgEDhtNrTcQg3xVrU4y+Ay2a
	wOgkeT/VM5xWmidPBeB4WjBXY4+HjQtVcY1cqXM5HONqR5L/J5oS8bopeJgbwV4s4RqYMlmPhF6
	MAxtuZ6a+9jPN/mH9iXZpMROwZKVvm94m+eF0hLunP2FzntdRD85AqS7krWIY4t9Kv9jIRqe1sE
	36BnaqgcxVO2I=
X-Gm-Gg: ASbGnctk2+uR2DzV6H1B1ggCWIXmk2IHJkn/ZMhQJcKbikAI+jmxXekPpCYJJdKDIgh
	uoS0H2Hsg48b4Aw60FeIcSyFVWr8OfNnJnccN5Gjcl79EmZmQ6ayBCKzSWH//LMsVnMf7D13xtS
	xCgffctQEzVd60ksMdwR2rk1hoBkodCoWJ8gYGxEy1WfeSA/eWSh9S2rNUC0zEcKYDJ/j8OT8X0
	n+CSKOm7iNobXNQZ7aZwKzQs9aC+/aga78XdbIBXX/dHwEfz83/gtFxLBHSbH7uV2EsR3dhiFMU
	yNWqymzfj2NBmpv67KPnownF6mB69VxuT8xr7I9jNsEZFJAYWZcfVRrnik5u5tF5YeQ=
X-Received: by 2002:a17:902:e78f:b0:224:c46:d162 with SMTP id d9443c01a7336-22780c7bfecmr26407545ad.20.1742524382835;
        Thu, 20 Mar 2025 19:33:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGOUGS7kWShHwzPKCmuY0RVOFosLtvfv77lN3gqgOkwEjIa7sd9qLWWEZv2O+6vYApUGXhmw==
X-Received: by 2002:a17:902:e78f:b0:224:c46:d162 with SMTP id d9443c01a7336-22780c7bfecmr26407305ad.20.1742524382384;
        Thu, 20 Mar 2025 19:33:02 -0700 (PDT)
Received: from acelan-precision5470 (220-135-95-34.hinet-ip.hinet.net. [220.135.95.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f39692sm5535345ad.44.2025.03.20.19.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 19:33:01 -0700 (PDT)
Date: Fri, 21 Mar 2025 10:32:57 +0800
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: quirks: Add quirk for another Chicony Electronics
 HP 5MP Camera
Message-ID: <sgvhxwvrylxdev77hb4hlfcviopljj3i64vempkxaigioyvcki@2fgjvotmp6d4>
Mail-Followup-To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250321022540.4016923-1-acelan.kao@canonical.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321022540.4016923-1-acelan.kao@canonical.com>

On Fri, Mar 21, 2025 at 10:25:40AM +0800, Chia-Lin Kao (AceLan) wrote:
> The Chicony Electronics HP 5MP Camera (USB ID 04F2:B824) reports a HID
> sensor interface that is not actually implemented. Attempting to access
> this non-functional sensor via iio_info causes system hangs as runtime PM
> tries to wake up an unresponsive sensor.
> 
> Add this device to the HID ignore list since the sensor interface is
> non-functional by design and should not be exposed to userspace.
We found another Chicony device with the same issue.
Please apply this patch after the previous submitted one.
Thanks.

https://lore.kernel.org/lkml/20250312063532.551938-1-acelan.kao@canonical.com/T/
> 
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> ---
>  drivers/hid/hid-ids.h    | 1 +
>  drivers/hid/hid-quirks.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 5fdea9116a3e..554dbed3f3ed 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -298,6 +298,7 @@
>  #define USB_DEVICE_ID_CHICONY_TOSHIBA_WT10A	0x1408
>  #define USB_DEVICE_ID_CHICONY_ACER_SWITCH12	0x1421
>  #define USB_DEVICE_ID_CHICONY_HP_5MB_CAMERA	0xb82c
> +#define USB_DEVICE_ID_CHICONY_HP_5MB_CAMERA2	0xb824
>  
>  #define USB_VENDOR_ID_CHUNGHWAT		0x2247
>  #define USB_DEVICE_ID_CHUNGHWAT_MULTITOUCH	0x0001
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index 452fac15550b..91b3d121bb1f 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -371,6 +371,7 @@ static const struct hid_device_id hid_have_special_driver[] = {
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_ASUS_AK1D) },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_ACER_SWITCH12) },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_HP_5MB_CAMERA) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_HP_5MB_CAMERA2) },
>  #endif
>  #if IS_ENABLED(CONFIG_HID_CMEDIA)
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_CMEDIA, USB_DEVICE_ID_CM6533) },
> -- 
> 2.43.0

