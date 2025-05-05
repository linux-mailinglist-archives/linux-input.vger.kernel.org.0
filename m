Return-Path: <linux-input+bounces-12161-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD10AAB80D
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 08:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D5EB1C211B3
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 06:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE38E351E6E;
	Tue,  6 May 2025 01:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hnajkUdd"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98A43CDBAF;
	Mon,  5 May 2025 23:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746487711; cv=none; b=RsCi02EJIe+yCsHQd0SHrn7qr0H/t7aZCwuh5k5lUW6F3VVyHCijaREIA7u/CVHcb1ZEXj1iicSv+uTGcVWFXi9E5aecOQs4GTd4gNZBT17a+595I69heJbyH5FhfxH20pelWBJq3ghs0ovmFF6ZgOHXYNlZFB/JD+xbvDGsWmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746487711; c=relaxed/simple;
	bh=PMkULKPnL76CVvnkINCH5UAgOKKcrPy7sySizplK0s0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uS2bCOWmjZB/2rfTG7S4zj2GTQ0zK0S459O4UHGoLew+kRx05OCSIS6oyAoQzc8fkdVDECctCUHYpSuqdTfCs1z+c49ii0Jg/jmfA1et6fIKPW5sdodeDABDMpiZrVN7bh/dYb6HtSH3hVXQIAB25ATNm8tbx/MB33vdSn9fNow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hnajkUdd; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22e09f57ed4so46818975ad.0;
        Mon, 05 May 2025 16:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746487709; x=1747092509; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W1pGqOV8L2Fodxq/7yWgm0zy6CYYnoDl0wucj9k6D38=;
        b=hnajkUddzsj6dYNcd4pt5ueaB5MbH3EukaOEGgQ1SDqW22L5532ZUAKXsPCurQHJAg
         nkCVgv4kVYylmyThmWZ6jqLcouaDwQPssA4VGob3nCRMJcvejxpISUg7FHVG8D0OD7om
         R0BpBUhbs6ADlR64ofrgTBKeIdemgoM7wf5RTEhMzrV5M0PjnN+nqtMtFN6moHOYxmgO
         TWveNPRZzhpBAgbGTku2PX7fkEYULzlJQQYt9ahC+0nuvne17Ave4VmrYu41PxYgNzVG
         j/X21k1uXIe8cwOJHsqJkWjBkMbvKU/d7HZ4gwXR9eOewmgYUuDxhGL+vXyhs6f2Gehc
         KJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487709; x=1747092509;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W1pGqOV8L2Fodxq/7yWgm0zy6CYYnoDl0wucj9k6D38=;
        b=bFeV+5UZob2MtQbd9O2GMz1Kiv8+ijmSLe6te1G/3W1xr4spATDIoMHGroz73ovOmp
         iyFrQSiw9hJpgPnm5yTtm4+UJmmNqxzppEDy/hzEbj3/uJdoxjW/MWwiz8GOURP4usZx
         d7hlX6UjZlPu0ULJVMzkgGu6bcnqkF5A2Bqu2dK/Qt3ZNX5ZGxK4bMGfXhbo2GB4/ED0
         AKZmauNBcD5dFAXEZIk86OhgASdUSSPXG1dEhoALlurTQ5GAKqJzRMvBFB/3RDmFu3S5
         64B6CPfjYqqU0VWg7cTMKdwvJdoDUp9u+1h7+VRJXireUD+zHuAPNkMH0n4I9WvcQK6S
         /DzA==
X-Forwarded-Encrypted: i=1; AJvYcCXLJ0J31Th6ck1qyYGwXh9BCcz1da/pUhy3gGHz/5o/nhyv0a6DCHMLs6q6PiyGa0KXbAEvx6uKFvImxo8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi2E0YoKWeusL0pMTvxX4SATZ8wIH89/Og7qBswRQdv7XhK7ZC
	/grJaWgsW5AZtHoRyEyHdjBIGqugOwwoLgISAh7OAQeUPgynaA8T
X-Gm-Gg: ASbGncvk8g6rhn4e4MdLDKAWxDYKju435VG+wwklV6xCvzRliZemWjm4Q113R2KDXwd
	tlgPDngywwgOayPqQgq/u7wwBXyysEJjPChBUsZl672XHUOKBEXTvcUwIRouk+BOgL9oalozhbz
	yh372aFhixrgfKrfOsKxM9BeRaJF1Bh0asjVP714QyLh1AS+I1auwYzz43P40UxuK6DG5GAwio3
	QteVg4S6SvMtJXuxNKZ9vRS1GMT8I/jWH9XjA1HNXyZLiHyDsFm06BMCSoHrzd0Bccz1oDHCM/L
	YP+SI436MiCGWI9c406NaWKBRJ8jjIV6vXqb+jQZ/g==
X-Google-Smtp-Source: AGHT+IFGokMjjGy4Haio3D+bRbk8pboJV1fYH0ZWDSzBfFtwtHLYyuwsNNl9mbIHbiNFpuGz45m9tg==
X-Received: by 2002:a17:902:e78e:b0:216:271d:e06c with SMTP id d9443c01a7336-22e31f7e2a8mr11895075ad.4.1746487708847;
        Mon, 05 May 2025 16:28:28 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:6c50:1878:74d0:c0be])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522f1d7sm61047475ad.222.2025.05.05.16.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:28:28 -0700 (PDT)
Date: Mon, 5 May 2025 16:28:26 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hanno =?utf-8?B?QsO2Y2s=?= <hanno@hboeck.de>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	david@ixit.cz
Subject: Re: linux/rmi4 driver: "BUG: kernel NULL pointer dereference" when
 accessing update_fw_status or bootloader_id
Message-ID: <47raihg6bjitnwsqbl3uja4vfnwggunyjjzxdr5ppzicvwain2@ggaoaotuxd76>
References: <20250430213816.7527e190@hboeck.de>
 <u7x6ckgtetuvgxaalqcxwsv25xvvcjdcehpsysbvxjqygzjokz@bwogeb2ne2cw>
 <20250501095049.156c5d8d@hboeck.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250501095049.156c5d8d@hboeck.de>

On Thu, May 01, 2025 at 09:50:49AM +0200, Hanno Böck wrote:
> On Wed, 30 Apr 2025 20:03:11 -0700
> Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> 
> > Do you have anything earlier in your dmesg referencing "F34" by
> > chance?
> 
> Probably this?
> 
> [    3.297406] hub 2-1.2:1.0: 4 ports detected
> [    3.324410] rmi4_f34 rmi4-00.fn34: rmi_f34v7_probe: Unrecognized bootloader v) 16 (\x10)(
> [    3.326641] rmi4_f34 rmi4-00.fn34: probe with driver rmi4_f34 failed with error -22
> [    3.350673] rmi4_f01 rmi4-00.fn01: found RMI device, manufacturer:
> Synaptics, product: TM3288-011, fw id: 2812761

Yes, thank you. As I expected, if F34 does not finish initialization for
some reason we are leaving the device in a bad state. I CCed you on a
patch that ties to plug the most glaring hole (but more work is needed
in that area).

Thanks.

-- 
Dmitry

