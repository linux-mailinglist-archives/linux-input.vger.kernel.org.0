Return-Path: <linux-input+bounces-14688-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5BAB56422
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 03:04:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25E057A4005
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 01:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2D422747B;
	Sun, 14 Sep 2025 01:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cYBkNmZz"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D28B1D79BE
	for <linux-input@vger.kernel.org>; Sun, 14 Sep 2025 01:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757811849; cv=none; b=GfDsbPeH4lePpUfc1VqL1JwOgcMaMuVB3+3GSsDEpj8l6VnsHdkTiL/cXaA6kGOsneDZRoL7LC2zVv6GOHXcEYKgSIyB5QON9MumDg7VW4Ugr7xzWBg1ZzQj5RSxVF9GJtrL5iSxEZln6/2nGKNn7eD8s/uKTq3lg/AmbEcNNeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757811849; c=relaxed/simple;
	bh=sXDskx1pHKUhsyRk4wnDL5fpcdP5rYakGAvizdofSKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I/lE3f2hSeZeFFYB9lz1G3Lo+8ZrZ9kpYobcZ8CAeMRuTjVQJFXY7CqvXQjB+m19/m0mfM29rYzTmQ8/99yDyaHzuPLJhaFA7vnOCopPKT9SIk6vLbu03V06gdeK9tQaiJc7OG/JIfs9mAESAiwMGoONYS9foGBpxV8AuVRy9ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cYBkNmZz; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so2921446b3a.1
        for <linux-input@vger.kernel.org>; Sat, 13 Sep 2025 18:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757811848; x=1758416648; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1pS2DRBcNvFIKJohLTH8vUf3BrBi5wwLcfUnLVRJuUM=;
        b=cYBkNmZza8YaDWKJEScw63owql9iY1zoXjPf+Aeo3pX+CvSvdU+21QIed2y7LWX3aN
         p+nKkysLhyc62v7gsv35DevyBbnwMf7QJHtvH69XpOZgW74XTuhe26yju2HP69wioIFr
         dWtmc4lcPd9uHiJs33Jn9sT2LLCQfsjQKvi3FnrZga4OL1kNMRoXshtMfIephOp6oDWf
         /m6WXPyhsd0PphRtMjYB81PoQt2LDhD8Q2Ne4+yNOCEQGKUIm+FQgGgQRzBTnF7oZoTf
         8SXWAY83GZRG6z5nx/BQ1fIhwiHAT5iRgD7z4wKUIM3wQ06OIM1SrCVwyXzVIHNgqFO/
         40uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757811848; x=1758416648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1pS2DRBcNvFIKJohLTH8vUf3BrBi5wwLcfUnLVRJuUM=;
        b=i1p9lVzbsORto9MwSt7iAcxIXhcbA1/uHXnvW0IMSWkiAxEs6nV6wa+jKsqgaXfh0T
         6pGTdyOdJjpOQx0FowqTHR4Fwu0EH4Jj1zBPdXjipVH1mEx2mf3liVVjLaiC4kVRtAgV
         luApl6qdfUaiQbMDuMQw3+0FNF62jHi7mcaUqlSKMCY7YmUx5ZXcp97ASkIwfN6/Uqm7
         y4OL4zW5oCt1n0nfaynLnSudh/7BvIbpTq9FUTJ3ufmoDUjkEx55SptVDnrOWYg0IAPR
         XoyHDq+ZY3k8PwZyjS42kakb0gsIsqz1i3JMMIN/VV+fGKCpp9UzzR8GKHtVXNYoNC+2
         NIgg==
X-Forwarded-Encrypted: i=1; AJvYcCU+od8l+bYTTcFZmJ6SIXMuuV1JCW3TlS4xR3ApAlLsn2omxsyioWJbY+wVi7+4CqjudfmrlySwiWKZ9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4xVAGcWG6BZ5gUtfxkHImNVlT/Uz2PkgvC5zsPVGnMbR35S3V
	vbWcPlESRkAuRvs7yUUUPpi5t+yiXDNfIRkUgbSB8idLxx75M9hFWW76
X-Gm-Gg: ASbGncvxxKX57Hi+a5E4dpexqPDKetGAhx4aSn6CRDVuC/qWfE3hMP4gxaI13i9XU2/
	mHFeBK9A31mNifZHyDb+b8qZ+DMX2at3oV/5h2o+bSaCBfPiPlRqI8lTh8AQj8gHFoOD0Cm4YxH
	Eyuqt4Tg8xMkmdkZw+K1k8yb6D6cB1ZWB22eXQi4F1BvX2HyEhIMTcTWuJs31ydH5uwRhvOZ9Ae
	6rxmFznmMIL1Y0d0ce38qTsryRa4IloWDtUdBwP9rk6gb9evjEjP5RQq5k7Qauu7go1XzDe58Gd
	smVhyKB6SMRPhbpg7SsXTO4zN1skJH6VJmMwLc0G0CTDInE+jFMF/ykVTpm/lr0pcWMDFxUDAUS
	K5C7KEqtsRnbR0pPFeo4gvg==
X-Google-Smtp-Source: AGHT+IFdV6SKq+TGgyDQArsbIgWlBA9pxvOaDnkpzT+VbVAP/25LeqPRmkZTK555qqZNaCRxU5POZQ==
X-Received: by 2002:a05:6a00:1881:b0:776:1d55:55c8 with SMTP id d2e1a72fcca58-7761d5556f1mr5467317b3a.4.1757811847675;
        Sat, 13 Sep 2025 18:04:07 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:81bf:abc:6590:f690])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607a47310sm9078733b3a.27.2025.09.13.18.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 18:04:07 -0700 (PDT)
Date: Sat, 13 Sep 2025 18:04:05 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jonathan Denose <jdenose@google.com>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	Sean O'Brien <seobrien@google.com>
Subject: Re: [PATCH v3 09/11] Input: MT - add INPUT_MT_TOTAL_FORCE flags
Message-ID: <rksu7ejddh4n5ojqsihqelyvc5m3cx5tc5zspdsa5ke72yxyye@gq2osygbtxsx>
References: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
 <20250818-support-forcepads-v3-9-e4f9ab0add84@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818-support-forcepads-v3-9-e4f9ab0add84@google.com>

On Mon, Aug 18, 2025 at 11:08:50PM +0000, Jonathan Denose wrote:
> From: Angela Czubak <aczubak@google.com>
> 
> Add a flag to generate ABS_PRESSURE as sum of ABS_MT_PRESSURE across
> all slots.
> This flag should be set if one knows a device reports true force and would
> like to report total force to the userspace.
> 
> Signed-off-by: Angela Czubak <aczubak@google.com>
> Co-developed-by: Jonathan Denose <jdenose@google.com>
> Signed-off-by: Jonathan Denose <jdenose@google.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry

