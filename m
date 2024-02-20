Return-Path: <linux-input+bounces-1967-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ED67785B722
	for <lists+linux-input@lfdr.de>; Tue, 20 Feb 2024 10:19:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6274EB2670A
	for <lists+linux-input@lfdr.de>; Tue, 20 Feb 2024 09:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B20DC5F84E;
	Tue, 20 Feb 2024 09:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fzeibqOF"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215F360ECC
	for <linux-input@vger.kernel.org>; Tue, 20 Feb 2024 09:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708420714; cv=none; b=j2ZSelvUvfmV0BLs5mbSKBDIgD/II2nfFmF8SflDMQr3g8xbr4ZPdFXo8xAciTO1Hcrl8MvX6LWFSaYBiMREkW80kz9GvdFyLQG73NvgcaFH/Tf0CP8NLUD7U6hR6KhkkxUu3fASr5QYUHrQnp8Nd/G/JmRF3YluNTURJ1prTSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708420714; c=relaxed/simple;
	bh=Pjpym6pBWsftiIYC3BXDjxDftaIjTZrVIrPNdDqVV+U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZR/JAT8visOOq9crN9mc159W5BseRNk744bXktGjKh2fMbalTwipiykaBquL80QmW/kVhBtB26sLbVRl6Y55LKXYIF3tCeL6zZLV5jBHJtOmAudZkEg2M77NtPZVOqeG3q1057vF/x3XwwzNYRhU+J0+7EN1/xP8kLIV8oX2KGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fzeibqOF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708420712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vkzby9wfQQhUZRcpTbjHhp7P8uZMSLkRfL4T/QvrGZM=;
	b=fzeibqOFR6I0bPKENMFbyZu99C1K7QyPoXCFajwmIV1UIhT0imIg0ngad+Ers4txEZqgqX
	tlH4D+U2kQi7IBFjR1OZGVzQq3ql6XF1Tm1lJzp7Dd1RzSWK6Z/m43V+7TKqgCgDGd2Lbj
	DWEtPDCBhcBuy9ZIGWUCK62ecjoM6IU=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-qTOSeyNvMX2v3GA9m2mkhA-1; Tue, 20 Feb 2024 04:18:30 -0500
X-MC-Unique: qTOSeyNvMX2v3GA9m2mkhA-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-511a4a286f2so4592906e87.3
        for <linux-input@vger.kernel.org>; Tue, 20 Feb 2024 01:18:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708420709; x=1709025509;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vkzby9wfQQhUZRcpTbjHhp7P8uZMSLkRfL4T/QvrGZM=;
        b=NNELW+uH+G/74WNmbc0WM9mD6n8ri+86WENxoXzMucXqaKQNzju8YlESPulXgDXPU3
         fw6KMFrqKxn3WMRQmTP3zVKskRsUazq55GQTvJtDmI7LMymv85aApXDkw5dRc5FF3R8I
         xb8AJ1DMCo9MmJPeiYf6Sobi1Emzkkf9PmqZpniVAjHxmoRXYArcXz/BM/u7AUvXWYOb
         8RIlbofQYcqwLCEx8/weI60zcbrzEWSD3vIK9JSf7i+ExzgJTeIWz5dTFGZq1ge7ecuZ
         awCntJRdvwxqV6zgWfLCSrZOc5meccS/jYzrlCdPxMnIQGMes+3/BB8NgJvq9yUUPvF6
         n/jw==
X-Forwarded-Encrypted: i=1; AJvYcCVdmALaMg/j4d7g+OFiGxjab0whiry8u0F1y/1DojotjcbucqnimCK+fpk7P4bqiz3RLvyrsX0mUZOiSvwwhqNcSozqoaMRk5QooGk=
X-Gm-Message-State: AOJu0YwGjOZCaVvzIiX2dTmjTmBECKnMfX6urbXj9h65Wbu5SpvtiTcr
	AL255LEIecVTtb2cUyQuo7IFsF4RK0LNPb2mcut1i327+PKKLsUAFCbESnwk/mOp+TQ7XiMm1dI
	m/dUAo/lV43POsd/DhhtI9nSGRCRP+PBR5FFVnLpgFmQZlBovTbUCZkhbvE6+
X-Received: by 2002:a05:6512:159:b0:512:a93a:f5a1 with SMTP id m25-20020a056512015900b00512a93af5a1mr4334350lfo.36.1708420708950;
        Tue, 20 Feb 2024 01:18:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEEqm11cyvxMjF1g+2iM0xRpkZ3M4fWTa6V4c4a2kufWdQQu89dk7xHknoOQDeqxrJBoK9pA==
X-Received: by 2002:a05:6512:159:b0:512:a93a:f5a1 with SMTP id m25-20020a056512015900b00512a93af5a1mr4334341lfo.36.1708420708638;
        Tue, 20 Feb 2024 01:18:28 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id v21-20020a05600c445500b0041266f5b041sm5575587wmn.34.2024.02.20.01.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 01:18:28 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org, Thomas Zimmermann
 <tzimmermann@suse.de>, Robin van der Gracht <robin@protonic.nl>
Subject: Re: [PATCH 02/10] auxdisplay/ht16k33: Remove struct
 backlight_ops.check_fb
In-Reply-To: <20240212162645.5661-3-tzimmermann@suse.de>
References: <20240212162645.5661-1-tzimmermann@suse.de>
 <20240212162645.5661-3-tzimmermann@suse.de>
Date: Tue, 20 Feb 2024 10:18:27 +0100
Message-ID: <878r3fjxy4.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The driver sets struct fb_info.bl_dev to the correct backlight
> device. Thus rely on the backlight core code to match backlight
> and framebuffer devices, and remove the extra check_fb function
> from struct backlight_ops.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Robin van der Gracht <robin@protonic.nl>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


