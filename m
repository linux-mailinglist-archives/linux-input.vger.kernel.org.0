Return-Path: <linux-input+bounces-239-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F064F7F8868
	for <lists+linux-input@lfdr.de>; Sat, 25 Nov 2023 06:02:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5218281B64
	for <lists+linux-input@lfdr.de>; Sat, 25 Nov 2023 05:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA0CD814;
	Sat, 25 Nov 2023 05:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejhKSaZD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4B6BE0;
	Fri, 24 Nov 2023 21:02:02 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-28041176e77so1957000a91.0;
        Fri, 24 Nov 2023 21:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700888522; x=1701493322; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1zU4LUKVhSEBAEyImAqsIdHza582cUZbQQkgImwexMQ=;
        b=ejhKSaZDKY23TXQ7SSUVMm2FOyURMI5nhwa0G1Y8QDgM5G3DMxtIzBSuLw8AGEDpXG
         dODzlfdjwklAlKM3fZzhPgfxLLhaRRlZ8MH6AJdyjIqql+aw/bchYBEn5UDYEcr8mSYM
         kuJ6Y4nTX2DTzcf2Nj0YvbrnLe/TLuWR/QLmrIlDCAOPKyI3MfBC6HLmebgqd2LAzLpz
         4HHGiKrhNrfQRX/WGyQlV+6KmaSZ5M7i5cyo6yWJzKwZ5G91gjVoXJlPw4TMkGmJ6Q99
         /Vo5iBNbFbkGmoTH6utj9cPjtVzWwfctp2JAWTPeCAZK9kmmPMbPFh0/9fzTxMt5owO7
         8dPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700888522; x=1701493322;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zU4LUKVhSEBAEyImAqsIdHza582cUZbQQkgImwexMQ=;
        b=Ol4kHlI0uLBPERGMd7SNOWSIxi6xXSuLZi5hkUvZRa8TzKMo2Ia/sU8O+pIY0zrUG7
         erVkthRhqUzOgXeSU6O5WmJC00aFh8zlaFUdG8FqJYkArtwJF/nuvjoaI/0bvZO98Jr8
         tKO+ru1jYyIZ7hNZckhj+5/2xSN+VRSAqSlm26x4SsSrBWC9NLUijzj5Gd6buIcCRAMQ
         gk230Gzc++jwbju43xDRaYrh3jIfzvg1R4rWeXfSVp5MocF/nK1Pv1FfZ2JBh3XP8l/n
         85GxqYiynuYOujCYdlHIgqTJSlb1Jwj+JzhAQYFpx+FksqzK6xNAjVN0mRoNMTfH2iRp
         rmbw==
X-Gm-Message-State: AOJu0YyX1jbOqTNUTCiaRL3uUB4uHfZLf0i6ga4OTqi78f8cW3hkNDz7
	uI3OtMA3GYStgTWhsixgPNkI6eOX53M=
X-Google-Smtp-Source: AGHT+IG1IDjtyfsrrILxO18zuVqQT7XqP8yMv76aZUE10M3VFt0iss8rhyKJKH/e41UIHwf3Slp0HQ==
X-Received: by 2002:a17:903:228c:b0:1cc:ec21:9a64 with SMTP id b12-20020a170903228c00b001ccec219a64mr5277780plh.17.1700888521800;
        Fri, 24 Nov 2023 21:02:01 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:8b5c:82d0:578f:d0])
        by smtp.gmail.com with ESMTPSA id ba8-20020a170902720800b001c7443d0890sm4029794plb.102.2023.11.24.21.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 21:02:01 -0800 (PST)
Date: Fri, 24 Nov 2023 21:01:58 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Alexey Makhalov <amakhalov@vmware.com>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
	hpa@zytor.com, x86@kernel.org, dave.hansen@linux.intel.co,
	bp@alien8.d, mingo@redhat.com, tglx@linutronix.de, zackr@vmware.com,
	timothym@vmware.com, dri-devel@lists.freedesktop.org,
	daniel@ffwll.ch, airlied@gmail.com, tzimmermann@suse.de,
	mripard@kernel.org, maarten.lankhorst@linux.intel.com,
	netdev@vger.kernel.org, richardcochran@gmail.com,
	linux-input@vger.kernel.org, linux-graphics-maintainer@vmware.com,
	pv-drivers@vmware.com, namit@vmware.com, akaher@vmware.com,
	jsipek@vmware.com
Subject: Re: [PATCH 4/6] input/vmmouse: Use vmware_hypercall API
Message-ID: <ZWF_xnotegtBElA5@google.com>
References: <20231122233058.185601-1-amakhalov@vmware.com>
 <20231122233058.185601-5-amakhalov@vmware.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122233058.185601-5-amakhalov@vmware.com>

On Wed, Nov 22, 2023 at 03:30:49PM -0800, Alexey Makhalov wrote:
> Switch from VMWARE_HYPERCALL macro to vmware_hypercall API.
> Eliminate arch specific code. No functional changes intended.
> 
> Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Please feel free to merge with the rest of the series.

Thanks.

-- 
Dmitry

