Return-Path: <linux-input+bounces-13006-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDA4AE63EE
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 13:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4D2B3AD169
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 11:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06B482376E1;
	Tue, 24 Jun 2025 11:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwD7iGie"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A20022AE5D;
	Tue, 24 Jun 2025 11:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750766208; cv=none; b=h6FRK9JB/eqh6pSK1VwiY/ISEiwZlEYUR//Oy2BOf6C4TCYwgxxHKrosFHpriTd8PmaqiuPa0SmDI3b6Uni/346PB47trmEICIY+4xN3G0BrvHdpwLuvLdcZ9lyN5H/YjoWgiO7ECNMKciY30OtPbx3N1WlerxzMtNuIlOcmh+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750766208; c=relaxed/simple;
	bh=4Gb8SOZItbW+wIwmtb5Q/gL4wOxUhzrF5mJlDtp1XkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PCipwto2n7Rn7l9Z4QFktvtDYeS9yF6YuSAczea/GNei7X3o7wWLwS/xmeSXBVwI313808ztF+2maGPQuKe3Nf0d0/RFssbg99xuDD1zmP0qO1T2PQ91q+z8YTGDNi/oMwNrIxPWZUYqXh+n7FjiAsHBDmPIybYqCAltKT1nH/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RwD7iGie; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4537deebb01so3099615e9.0;
        Tue, 24 Jun 2025 04:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750766206; x=1751371006; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R5eEIvr9JcE4paU6Nr7MR5Mat6t5/855zPOooiaqaHM=;
        b=RwD7iGieh2vDByYikIUEcnAZ0R1Rp8sSNqmXOTJcbqJqk3jwLrR9LafHeDv5tXS1du
         UG+gdkIX95iXO7426UkvHOvl147ISJU7YeAWkiTMoZ2PEjosoqTRUR+H6DPSAz2ZZmps
         951LVqJJL4ToG9KP34t9Ve4nMsWEGQKeY/BUaO5Ch//uQQ4BLrrO1wMIXXgb3bqL48Tf
         pQGs5FbdLpqMK07NiQQJhWPPrIVNhTcJtE1bZbXlOLUGMvv8pUPhpwBIKuQwc7rrjQ/I
         loRsI4Px8aeYcTEqaaFwgRhahFEyrDwXZPRtfeePzFq52wSuf2WLApUs71mKvRcg5gbJ
         mtHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750766206; x=1751371006;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5eEIvr9JcE4paU6Nr7MR5Mat6t5/855zPOooiaqaHM=;
        b=cNmRfSVYyEIVOsh3YY9c5pbRo70hoc91oHCzoTQrzXAkbOuGEqshBLfuanvD8eewmD
         Qj6ieUGrI9MRSegMwzq6rG6msQq2BySHt6V6eS8FwXjy1A0hEDP3qRYhlH0Gx+rqRoZf
         BR+NZU+wozKq09Os2MJwP2x+aeJS3c0d5F/OeJFRhS+V672as8Pt4P6qVyhFLEN/vWsX
         ImozVmj4NtrG6u0OYh7MqG5PvbRAbQ+i3XYRvUrflz/yKrMP2PyJQ3UUjv8HhuKhH/lG
         fXVCXe0+0kreysEF4HMpm5CcVDpZHDou1qwx9QC2X9IuVyCVaGzJT3UexCFNkaRARWk2
         97ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUla4F40IJj33aCBmm9yqM/fPbvO7NHbjRafUjTGU4xFAt5T7FX+B7ARVYx5g/0NYS1s4w1UeC4@vger.kernel.org, AJvYcCVbBWsZGUdJVZVSQiGuN+1rgi7wpPs5UeWdhSiYfPXmRgXDVRMYniY5+shYWVUkKELIv57WrF/gbKvunrD8@vger.kernel.org, AJvYcCWm/5IHwP2vS8aDGiR071yunG32aX0mJDXydf4vRExB/nLPFJrt8J1DhW/AYRWJcKMngt3xr7KiZjgntQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxK4S+M4fF/NxigfhjPB+SUMkt4yoDzDIls+kKnbrktiCv3XuT+
	HjXaaEl9CP72ia+BEVbcyNSOvpSatX2WdURS8Ly45NKMdY1qdRfvZ+Kg
X-Gm-Gg: ASbGncvrLU4eU/zOF059kxLEiWL3izXDG+bv8ZdyCmyl/i2hfNepbnBJyDdEIQC7GeE
	e3e4Yi6i8tAh2htrQg61ezM9dbHZ+9f8IYtA+8hdVrQcWU/x2f4VOvLNdhYQiLMKQSSyceUF9tD
	X1OqqSkVExbvOGFgtV2V5pGbB8zInx2QhY8BV10LXZX3ZXYQ5T8EQFFITOUA2VVKraOqlB3/GMT
	yWhMvSfYBakE21CP1KvIXK04PtALeCZhRHU9R/fiWESxEvrtE2tpnsQKYe/dRR7gZt340TqJ4CG
	/4A5sdqjkUyrHU41cjSD/ywp/VJke16e2myGUC8goQE/msY5qcrvw5NQjw==
X-Google-Smtp-Source: AGHT+IF5uc4Crgzm9C/NUWTssWPsc1rQwpNZ40qhHDiLYTtLtTW3bFcM2LE+mpuBnDDXgWUMAWxfWQ==
X-Received: by 2002:a05:600c:8b37:b0:43d:fa59:cc8f with SMTP id 5b1f17b1804b1-453657bfda0mr145918725e9.33.1750766205354;
        Tue, 24 Jun 2025 04:56:45 -0700 (PDT)
Received: from gmail.com ([2a02:c7c:f4f0:900:7f3f:914:11c0:78c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e98b4bbsm171329205e9.15.2025.06.24.04.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 04:56:44 -0700 (PDT)
Date: Tue, 24 Jun 2025 12:56:40 +0100
From: Qasim Ijaz <qasdev00@gmail.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: jikos@kernel.org, bentiss@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] HID: appletb-kbd: fix slab use-after-free bug in
 appletb_kbd_probe
Message-ID: <aFqSaznWWrxkEs1b@gmail.com>
References: <20250623230812.31927-1-qasdev00@gmail.com>
 <PN3PR01MB95977E7AB0C3A8E3EFE3DA7CB878A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3PR01MB95977E7AB0C3A8E3EFE3DA7CB878A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>

On Tue, Jun 24, 2025 at 10:57:05AM +0530, Aditya Garg wrote:
> Ok this makes sense. Probably execute time_delete_sync only when there is kbd->backlight_dev in appletb_kbd_remove as well. Currently it is being executed unconditionally.

Good point, will resend v2

Thanks,
Qasim
> 
> > 	hid_hw_close(hdev);
> > stop_hw:
> > 	hid_hw_stop(hdev);

