Return-Path: <linux-input+bounces-7049-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8E798F2BD
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2024 17:40:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF352281D51
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2024 15:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4451A3AB6;
	Thu,  3 Oct 2024 15:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dIr2HCSY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8271E19B3EC;
	Thu,  3 Oct 2024 15:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727969997; cv=none; b=qPixDUWrknNGBVAmRDX6AqU+54a5o2rp2pUdJloZSy+ICKTT/oL4EmPS0lt9fLaOO12vu6DwRut1RtoKfbMdlD2sxfZbITJECoRl94CgTFa9Tg3PQDfWyokcYzMBa0WI/kbWbfcEFY1ylxBZ6rlsxJZjIhAaumgj/eWmj3xXO/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727969997; c=relaxed/simple;
	bh=F6Jgeh9aEVah+NqR5CHAPr9cPZfntJOu2oi6djTooUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfwUTQKVAV655TmN/6r/Ws8RM0evMSRZKksIq4vQX4JvKCSOZBjMGrvBYOgEzXDAjb0hF/6n6LYaY5LjN/+/ugqkGzNW/WamO2hA3aP+fF8Qj21EbI0XPArNqW96R2QpAfjjc/uprbJQDon50bWpFtPeLypg4OEDFnnT1zFRR/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dIr2HCSY; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71dba8b05cbso1130500b3a.3;
        Thu, 03 Oct 2024 08:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727969996; x=1728574796; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BOHsWDIAC8FcFJGs6lDsNX6YECywaHSAwBR9Z8NoG+g=;
        b=dIr2HCSYZVOMrDXf0HPwY4r7TyFDshbKgMwL5wOshYBxLZU9oFLKuBTdbtcuUfzmdD
         XmsVz+puHZGKAXMCYiWiL5Ylzz0ld0OW8Tj5pXZKCvhTii+qwccq2HTQPziQNmxOoKoj
         8ueRvlctVcB7mDitdXXN9NbR0gIz0MYCA0qG5r/BkqjrS9rmh4TmmUVJSC7Ih4inYln+
         8vb7ivQPSBV2GWn9lRVmnnaxmZau89wjnIP9wERE2b+HopwlvcZXbY6QPnoFYOElrxZP
         SQCwwlYWJHjHs01ZisSO5Gx2gXM7oNklxDAnxDgggnMhRKRxajI30uTva6w3/AADI+r9
         NX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727969996; x=1728574796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOHsWDIAC8FcFJGs6lDsNX6YECywaHSAwBR9Z8NoG+g=;
        b=HoceiBucrPuohwgX/b+WVHZHFaT638J0swa0JG32YRf2b/kDvmC3wYlJnOJJ/omzDb
         PwrGPJeMeW8aKYuk1nK6uChCGh85qWu2KFQg2LeAGWORtyOsyiM3cE2lH6UgUFrCHANr
         UdXB/TMl8oN51mDjQM5rAkyFF97k6urqdShyCFShHgTzXcDlkrxIYb62cy8YOv3W21FC
         8SzUl+02DSaSQ/TcQbzRUOtQBlD2MO4ZbNrskclMdebgViaPZtxNyk9HU4wv86A4sXTJ
         KIk24Nr34CippT9k4Iaf/OsMGF5qeSVG32YhisWM1zwljbVynBKR2df1czI6aYCVAwKd
         elpg==
X-Forwarded-Encrypted: i=1; AJvYcCXXI48PHgVtlFl5JpMem6VxsR71gloQSRGvdq/MPxex6/ngAsnLd38VBq6UXZ0Uu16cRkZKD/OcLq9Oi9M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9BBrGf8AJHDrjzcPaBX5PvrSA5vgMNFQCgtTgOKlZj4kShYkf
	gM/BMvXpF2fIOpMtkSjE5wHeJTwDxtS2jSJqUKUnek/DsZ7MbVNuqkaU/Eqt
X-Google-Smtp-Source: AGHT+IFVw1EpontmCBXFCtrym5MhAYiXy0WW4tFmEaWv/OvRnKC2UXkQCLtNr34TKGrcPgE5l1Eeyw==
X-Received: by 2002:a05:6a21:6e41:b0:1cf:4fd9:61db with SMTP id adf61e73a8af0-1d5db1a4425mr11335446637.8.1727969995645;
        Thu, 03 Oct 2024 08:39:55 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:fba0:f631:4ed6:4411])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9d6e62esm1467902b3a.34.2024.10.03.08.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 08:39:55 -0700 (PDT)
Date: Thu, 3 Oct 2024 08:39:52 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: psmouse-smbus - use guard notation when acquiring
 mutex
Message-ID: <Zv66yGPTkwmViTN8@google.com>
References: <ZsrAa9XcDvHeIs9T@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsrAa9XcDvHeIs9T@google.com>

On Sat, Aug 24, 2024 at 10:26:03PM -0700, Dmitry Torokhov wrote:
> This makes the code more compact and error handling more robust
> by ensuring that mutexes are released in all code paths when control
> leaves critical section.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Applied since there were no objections.

Thanks.

-- 
Dmitry

