Return-Path: <linux-input+bounces-1970-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C672385B74B
	for <lists+linux-input@lfdr.de>; Tue, 20 Feb 2024 10:26:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66EDEB218CE
	for <lists+linux-input@lfdr.de>; Tue, 20 Feb 2024 09:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72255FDA4;
	Tue, 20 Feb 2024 09:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FYfXiFpE"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A00B5FBA3
	for <linux-input@vger.kernel.org>; Tue, 20 Feb 2024 09:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708421188; cv=none; b=i0hhwouBtCBK9doofBxLwTSmvY7PdtalM3XxMtVYh54GbWak9JYdVuraV6p37j8MwnIgP37kQPQlD3PVImRHBV1sOll5odXGfBNOs/JbYjj3PA4G/7HD9g9kejf5F35X94aUtWv78kqsDH+499afohMy+/VAfTTKcZcKnbSJG/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708421188; c=relaxed/simple;
	bh=Mt08b5IuW5iUmptxH1bjfs6hZbxovlXyK/bnhQFhVzo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=N/IHU1e2l1KnR8EUpuUAhOUemlueO5oBTd9qaJENHSYKytFemVu7Bbk4Q2CYTA+CJgWs9h2ShyX39OjAus4n8kaJXp9ttKN/PUuK207cOju3H8wCsDDmK1yan5/gUbEozjSVUt7duETaJwkzWOtc6cPJJqD3V13sw7CIqGOS3Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FYfXiFpE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708421186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d6/AuLBRasXrm7J2e/EDk+uBFMWPxSsXqB1INo3NCiU=;
	b=FYfXiFpEnw+GmJiv5Fakdwhv/8EEHmQ7YyT9hA7yuLhAs2nTKrsxNvdiEtAr8+kR8H23S4
	qI5LUSjvMwNfc2o1L0JiU9cQBXUa22MfXHTIUQIIexWqaAkt9xorJTBbyz86pgDmghynUU
	PtDqCHkf63ulUyg0saWFWcq8fOcNOG4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-tn7rx8ImM6-hQr5vsSFJvw-1; Tue, 20 Feb 2024 04:26:24 -0500
X-MC-Unique: tn7rx8ImM6-hQr5vsSFJvw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-40fb505c97aso30274565e9.3
        for <linux-input@vger.kernel.org>; Tue, 20 Feb 2024 01:26:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708421183; x=1709025983;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d6/AuLBRasXrm7J2e/EDk+uBFMWPxSsXqB1INo3NCiU=;
        b=CQEMce+h3LX6l5vLPRbLjcQHD1xELd1WT+Jb2UTeasfKL4z/4Qu3NyN6rfVNYMzobm
         wQxuHTNtUxM+A8KqBC5Iy4pKzwcopOhbkOgCG37dUOqJ+0vh0ZvjxSogv4suXiq6obHc
         /hSyfAo630nW5jk02aU1UxyOiUlJ5C9MML24niPQ6Hz1NT3g1xpWTlArJlzE/B7+I0lM
         kOLWJ7W5uNt3XIEcR67dbTlAaO7AigEyXvnj2/yf9FNdfZoAupkXhhQO341hBw9vSVJV
         V++SyRhJcuSdLZ8JmbXTz8UerDYS9baDaPn0RtX5peU6Fbm0YiMKin8lXUxaRfg8Yv54
         9+iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuC42+fs/MPc7GIShgndbZGU0Kxy64te+07hAgzUzVlqBYT5/QalrGZnKE4024FqEDlG8hYrhxyJtPjAfwc4Vq03g8sCk9py+wtu4=
X-Gm-Message-State: AOJu0YzFI1moCoEUTuNqG3OZq1TFq5w2/bSI8pOrfhYnnPy3Pi5ZW4dx
	C3IbFSGUD21zFCjI1B0HDCZFAhIKg8jQk+Bhxx/gEMkRVUH8EqGynFJ1S6vjRHCXNYmlDxOC/OS
	OJOEIQ8pdl/l7txkWWoIRdPL8jxn0HcVkj/1pkp3TOdAKOlZj+06IY1cmtcga
X-Received: by 2002:a05:600c:1f8e:b0:411:e178:2a73 with SMTP id je14-20020a05600c1f8e00b00411e1782a73mr10705775wmb.22.1708421183415;
        Tue, 20 Feb 2024 01:26:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzVg7vZYHc9003vxmP5eEeeGzAiqN8t1ACQZvgD0y3R9j9HKc3efOeyrsGr5LZTSNXF/ALHw==
X-Received: by 2002:a05:600c:1f8e:b0:411:e178:2a73 with SMTP id je14-20020a05600c1f8e00b00411e1782a73mr10705762wmb.22.1708421183102;
        Tue, 20 Feb 2024 01:26:23 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id z17-20020a1c4c11000000b004127057d6b9sm747318wmf.35.2024.02.20.01.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 01:26:22 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org, Thomas Zimmermann
 <tzimmermann@suse.de>
Subject: Re: [PATCH 05/10] backlight/aat2870-backlight: Remove struct
 backlight.check_fb
In-Reply-To: <20240212162645.5661-6-tzimmermann@suse.de>
References: <20240212162645.5661-1-tzimmermann@suse.de>
 <20240212162645.5661-6-tzimmermann@suse.de>
Date: Tue, 20 Feb 2024 10:26:22 +0100
Message-ID: <87zfvvij0h.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The driver's implementation of check_fb always returns true, which
> is the default if no implementation has been set. So remove the code
> from the driver.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


