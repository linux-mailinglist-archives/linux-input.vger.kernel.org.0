Return-Path: <linux-input+bounces-10877-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A58D3A646F3
	for <lists+linux-input@lfdr.de>; Mon, 17 Mar 2025 10:20:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E04EE166849
	for <lists+linux-input@lfdr.de>; Mon, 17 Mar 2025 09:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA91F219313;
	Mon, 17 Mar 2025 09:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RbPe5rlK"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEAC1758B
	for <linux-input@vger.kernel.org>; Mon, 17 Mar 2025 09:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742203254; cv=none; b=Cpk2HFVekpHxBmy+yBmdc0qtCezuAiuEU86tjAk7bQIFhAlb2oE4Y87BwUfg8mG5xKKa6H/2y6uJ6rIrUlFUkfZsLhIdiz8RfvaLjZYDwMTcWVi8rT1MbunwpL1uf03gvYFnHkrbJCYCOTomqvVlqYL73YL1EQUEjk0Ou4Poe2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742203254; c=relaxed/simple;
	bh=Q/+AHXQipPI9pdeVK9yPvcZHvPRhgGkv0v9BH7Pp1j8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s7rYvI2EdrNMPvBOGdqy4o+3zIeNKKxepiC1WK9261Uu32K2sVssrlGjuM8KhNw+qzcZVAvV5rn1SdMmaNEdEmRNRaTbyAGRXUDXY3OeTDXspwF70hEG1ar6k3zASgl4zFaUdiWCIAa9QuG4zAuRCXUD/W8QaS2ahlxxh31S0Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RbPe5rlK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742203252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wQAYtZ2CgxPyvA949q/2IqdYnbjoNl4FrlqvLUk18K8=;
	b=RbPe5rlKbaUux58PslYE7Y+3j1JXCdJxbk04xTEsua4AeeTO67I4kw0JO+VujSWP5Yj4uu
	0hbSh4M1U1iJ7lBv1n2GO8RELfRyzcGK3L5Jcr4z3SE3zOmKcIdo2TZGD5K9CB7egEDruk
	Lz1ZPb+LZdsG2VA8xcOuL6owAsQ1TQM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-xzgu245tOOW-ZOcAqsKJgQ-1; Mon, 17 Mar 2025 05:20:50 -0400
X-MC-Unique: xzgu245tOOW-ZOcAqsKJgQ-1
X-Mimecast-MFC-AGG-ID: xzgu245tOOW-ZOcAqsKJgQ_1742203249
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac31990bdfdso361289466b.1
        for <linux-input@vger.kernel.org>; Mon, 17 Mar 2025 02:20:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742203249; x=1742808049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wQAYtZ2CgxPyvA949q/2IqdYnbjoNl4FrlqvLUk18K8=;
        b=mvc6b6icGsDW+bV4B+Bjgw0ThovGviFhlhGrlg8hqo6Tqbc8ntJzEY7oAQsOgDNYOp
         UoNJiUOXYvuF+ICuHo68jeeAz3RV+8fclY7oG6CcsrmjSmE252ZdMyoACM0F+q+9KVgG
         /Nz3QjMVBWxX8wbekhqr/6/qD00vC0WUFy4n/XsHdS9b8Tg7tlqE7d1wI0IKA60shppI
         x4Mr9tJ6rubyads1ntE4xuFevv/Srknk8w7IkJBOibuWxTVh+yhqRcHaxFkwCu9ZufXa
         EhOYuZbQ+KJTKgLWGj02Sh2u0kN77WvtzZ2ymX+zObcxzLvMGzUPB10LtRXvKsmqsBSp
         tPzg==
X-Forwarded-Encrypted: i=1; AJvYcCVM2Nh9Ss2wdc+CfHPyjqq9Jli4cbQoWWJKw/aPE0OIKOSJg8NlXjPy0emMel6aMrkMx8VyMAO8vGEWbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx84Kt2rpPjWBEVpW9PjwdYNXRIwYGVEX4QyRcwzDxoeQB7fZ3g
	ezcCQvrrDqKyyViX1R6NkcpC8QAQr/3Kk69YzHJBQtzcpIPWYywcHdUkzgyEX9uMjpkQjgup+K5
	wmfkEG1OWmfBEbBGWRyUDoRqoIcwMrvzn80HBV1L+h7vQcMrjdYmxAC4tkvvm
X-Gm-Gg: ASbGncvO3yC5s+0nX/bpnc9EnpK3MqcIDVhaTD/2VWIr+e932xvKrBt6CFBWkCENnza
	hnt6kfV6a0+MxG9Wja7RgU4W82F+3s4EgVvENCS46ZGFpmR/7v6u2nkMW7uoyWtb9++IwN35Kvw
	6dXVIZk8m8Y13XeQ8XFAiDRsjrui/JvumjezrQbqnTWKQ8dkVBKcQthA2Njv5VCqArJQLO0QxbW
	nTYjspMyyJBKCD9mDOnDUKV+B5Im3QDj3ov4r9Fw2DD4i9hjldVMmoNbvUjlBT4eRoRD08Zpgni
	+zRse5iz87NsJUF9xOY=
X-Received: by 2002:a17:907:7d87:b0:ac1:f5a4:6da5 with SMTP id a640c23a62f3a-ac330398078mr1211678366b.37.1742203249023;
        Mon, 17 Mar 2025 02:20:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB1+oHBvs7PLecMQRxLRVqXxUJqML6+iLCfi91FLVRX4dLs4qw1VqVUoq/BmyEZsMcQH+KkA==
X-Received: by 2002:a17:907:7d87:b0:ac1:f5a4:6da5 with SMTP id a640c23a62f3a-ac330398078mr1211676066b.37.1742203248622;
        Mon, 17 Mar 2025 02:20:48 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a3e0e4sm635730966b.136.2025.03.17.02.20.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 02:20:48 -0700 (PDT)
Message-ID: <65813e62-aa0f-4167-83c1-49200fc4ca20@redhat.com>
Date: Mon, 17 Mar 2025 10:20:47 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm: panel-orientation-quirks: Add Zotac Gaming Zone
 quirk
To: Antheas Kapenekakis <lkml@antheas.dev>, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
References: <20250222164321.181340-1-lkml@antheas.dev>
 <20250222164321.181340-6-lkml@antheas.dev>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250222164321.181340-6-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 22-Feb-25 17:43, Antheas Kapenekakis wrote:
> The Zotac Gaming Zone handheld features a 1080p portrait OLED screen.
> Add the rotation to the panel orientation quirks.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index f08cdc81dd9a..bbbe707f541d 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -479,6 +479,12 @@ static const struct dmi_system_id orientation_data[] = {
>  		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER F1 EVA-02"),
>  		},
>  		.driver_data = (void *)&lcd1080x1920_leftside_up,
> +	}, {	/* Zotac Gaming Zone (OLED) */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ZOTAC"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ZOTAC GAMING ZONE"),
> +		},
> +		.driver_data = (void *)&lcd1080x1920_leftside_up,
>  	}, {	/* OrangePi Neo */

The entries in this list are alphabetically sorted. Please post
a v2 (of just this patch) with this entry moved to the end, just
above the special "One Mix 2S" entry which is at the very end
because its DMI matches are all "Default string".

Note another entry for another Zotac device, with a board name of
"G0A1W" has been added in drm-misc/next, so please base your v2
on top of drm-misc/next.

Also the freedesktop.org infra is currently being migrated to
another data center, so the drm-misc tree currently is not
available I think.

Regards,

Hans




>  		.matches = {
>  		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "OrangePi"),


