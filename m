Return-Path: <linux-input+bounces-7785-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D84979B70D1
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 00:59:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7791F282A6D
	for <lists+linux-input@lfdr.de>; Wed, 30 Oct 2024 23:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74672217655;
	Wed, 30 Oct 2024 23:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bqp484sK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6C91E2835;
	Wed, 30 Oct 2024 23:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730332779; cv=none; b=MAVuY00CI8vfCdio1ahN3zAqDbssJY2KCd5PPLivp1U1eFMlMA1PT0QH/onOPuKDl+gAVvU1CDwO7bvCQzuBcwpzqSczF9d0BUg7sVTpTz3iK7vC+jSdlR+u5m9qgKE56iLayc/RZMm3uC06CCE+qzMz6lW+jGvzBwHGo3Zt/Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730332779; c=relaxed/simple;
	bh=XyJo54bZnUeDdLK2htC7dEPEg6nr1pl1BVv+6qo5yqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b/Tf6Ni/NzzQ9BeE8bhdgbCy7w7goNV0dNtFy2U5gJAPGzUNVeKLCC+WckTBXXAQhkMeolliqiLaq/mBi+1DN1ymp5KHcU/i6Tj9pl5KXk+K7pFRh35+YGHvhm9wKYgL4F+rK2GVP9YOYidYOcP472mUFIbnEbeQ4sdocEFQjyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bqp484sK; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20cf6eea3c0so3771495ad.0;
        Wed, 30 Oct 2024 16:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730332777; x=1730937577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hx8PLp0KmK5Ef8nEXimindw8ITLi6grS73quNsCgGKs=;
        b=bqp484sKwIsLbqu6lv+x6ASIPOkUPTKSGwwpIKQGcILXpuPE8JhjTOkdSuJ26RXYG5
         8Sks7wNqdRwg2AupP/QQsWsXsmcE6j2Hg7H0LuOdyi5zoVnLsgMBA/8Tmgu5oRMbW5Un
         4nrefoEJcEJozrXQqnAKm27b8VJjXjLUGoso6wPptOlutoVZ3e4cHA/mxOExoZkmvcqr
         b6Aa6zgZghsRqiPJrgtDYMHvQaVOLXpuDZo0CWE3pXgzMZL92Uifg2refmTOpor+APKJ
         6W5y+XcXKhlHb2LTzDjXeXFk4aas0UqXk6qujmumck34JtoFXPTgPHhpI82Jprc3NWgU
         hYig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730332777; x=1730937577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hx8PLp0KmK5Ef8nEXimindw8ITLi6grS73quNsCgGKs=;
        b=Q90yR45vCjDKKs1/boweL/UEbUVx9OBoypRi6TdpZD+XD3/jtu2J53pnBBqSV17D8U
         WsOtyXOxO7pyePQKM7+y1izEtRpyAbUmNVBEupRi2gw5SBbiEAYoq+aeaVAMb+Nky94F
         EKRSHeMD9Z9VCG7mJiVq+crRbYIO6jRn0FNx2EUVkFouhTlVwSJLtvgNLTSNdyyI7Wdz
         /j86eTZG+dPau6YdNXI5TRSPf70inHGNbx2yT9I+dlmn/o7A/TlKS94Mw0yAVwJjcEN+
         BibTeQ+UML9qCvazYH69PMQ3my94/uVP5jZGEFiqyEaPFOqamUsQWBsjyQqvRvQQR5mI
         lj+w==
X-Forwarded-Encrypted: i=1; AJvYcCXbc8O3j3FCrkqaZ+IDBaJvVDA2NfnCW7fwQeN1vfLFnq8jk87lwn5tCHVbxhiDDMXg6Nd2enwnDa6UZ+A7@vger.kernel.org, AJvYcCXr0dXeHIGCj/hn+Qzy7ZXvXdF6AAYN7EjQQPXbqEet3m7IgFEug/QzOZmawmmwKy2uQF62pcRG2xo9fw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/sD7Em8j2xxYTPk4rXDFrR2p3GX7zCmwkV3ZtdiDlwwwrgn2v
	qW1WzUk82PIbMpzRxQCW7TT3JROuf5i3yLy6tzoohNgpsrtXQo/7
X-Google-Smtp-Source: AGHT+IHA4p6kiYcFW8uh1Yyt826sZ7ANBcfx8q0S6g7dmkMXV8cXrEFXbeiyP8VGxH+WnixG+70gxA==
X-Received: by 2002:a17:903:40c9:b0:20c:c694:f6c6 with SMTP id d9443c01a7336-210c6c52417mr207048175ad.49.1730332776831;
        Wed, 30 Oct 2024 16:59:36 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:9bd7:a771:2e97:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057084casm1453105ad.92.2024.10.30.16.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 16:59:36 -0700 (PDT)
Date: Wed, 30 Oct 2024 16:59:33 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Charles Wang <charles.goodix@gmail.com>
Cc: hbarnor@chromium.org, jikos@kernel.org, bentiss@kernel.org,
	dianders@chromium.org, dan.carpenter@linaro.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: hid-goodix: Improve handling of HID feature reports
Message-ID: <ZyLIZXnH1h4snkuB@google.com>
References: <20241023082703.23525-1-charles.goodix@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023082703.23525-1-charles.goodix@gmail.com>

Hi Charles,

On Wed, Oct 23, 2024 at 04:27:03PM +0800, Charles Wang wrote:
> 1) Align with the i2c-hid driver by returning 0 instead of -EINVAL when
> an empty response is received, ensuring that userspace programs utilizing
> the hidraw node receive consistent return values.
> 
> 2) Implement the hid get/set feature report function using a separate
> address, rather than sharing an address with coordinate reporting, to
> prevent feature events from being overwritten by coordinate events.

These are 2 independent changes, they should be 2 separate patches. 

Thanks.

-- 
Dmitry

