Return-Path: <linux-input+bounces-14452-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F927B41E3D
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 14:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E7231892FDE
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 12:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5387927FD43;
	Wed,  3 Sep 2025 12:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J2WbwM1y"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB67127A12B;
	Wed,  3 Sep 2025 12:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756901107; cv=none; b=MYQT5t/Z54bEPwb2/UZDSgDweD1e5w0af0qBr6vjt8MmrGU97igNEa3bC0z13PHzZBXmV5n49T5IQfi4NjqpIHqhVdSv3G/v1DkKte5biKJh810RFYYQjhotHokZ+vpKW/4VwExq82ZX/SomAsXf5u44172WxNuqtqlLq8ybyvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756901107; c=relaxed/simple;
	bh=lMz807MwQuOD9tdmXRfi2nZJg/5mxpz+gvTbzobQpVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LJo46QylGYZ04hM0LliqSqCSSK95wTDRa9IAcSVd2MNqaZeSIiVnZlw2eN2eaw2mg9k0g732kx3efwH+3jl+s5IlDGuLQoerq2SiMIy0RxcZUy8O0Sjw2OHN5l/WZ7KSrT9O3weDpCbxIXA6H23CXzKbVzs1Pxq0qPGOGPPHItA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J2WbwM1y; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-32b5d8bea85so676394a91.1;
        Wed, 03 Sep 2025 05:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756901105; x=1757505905; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MTfwtBv7vFoOGsiKwGVIHhF3Qp75s3ohC4dj48rDlEc=;
        b=J2WbwM1yAkB+e6UVSIa0ysYxiDrN9HJDRR3tKnwCxTIYBbVNSJMzCaUdpX21j4gGGq
         w/WF69QV5jbFgepq6CIuNhbc4KWLqe6oHtgy9H9bD/8r5HLDi6GqaZinv/zFuq5JUmck
         OqofP48xrxV9I1n5VoBE1JpTtM4QreASonu3XrxTubtiGofdHh9JFC49pBUsYXrMBvtB
         8uwCwiLaCe/A9MuTmxyXXqXbU/j+LOvSOTfrLTPJg9jYI/G4P9CU9tf2M/vPUGPT3Bx8
         gKx0srlra08Wt656ebKEishu4OlzUc4E45LR9zFsCOdf93raabIruzB0JmwyxlZcOGvt
         OnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756901105; x=1757505905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MTfwtBv7vFoOGsiKwGVIHhF3Qp75s3ohC4dj48rDlEc=;
        b=fXlNOPMMkluXJgfIaESgcHz4HyNB50iqYHp+xugU5ZCvRPpBtTqiDqwlXFR+mK6sTq
         qKGwtGFQwxky8a7W4EjWx8Z+wlLRLYh0CA0BUJSK+x9JX+zNnAS8F53mDqbK2OigwD45
         WwM+kXWdaflvEJX9xOyL8CSq6ywjPeQ5Jmwi4UoB8/+1BVmMxrwpkWKJyPYrMW07Q3DF
         PaYmHAIDPJWezFJgGiPBjWHWd5cMbzTguf81bvshRv2SGrsllItEZZGwBKhgPV2MNb2M
         KEeccvP9F1sB6+42VHFGdj9eqQuG3nc0/rDLfuN9FMY7hNmn8g3pn/AChyUCxIlzJDyp
         R4wQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQnbNfuW01Yd9TJarhxw7z6cqQo3kbilvWbsUCVgCB7AM5OxJNr18w1Eg+aejDj0jjxgNmGT96+F+H@vger.kernel.org, AJvYcCVl4Um2xVHfQHgYH/JiBddNW2rgRD6uPPOQb+mXgjjfcr17cKSEs+2ocXgoenRb/0dKAtywshwavVMBKHk4@vger.kernel.org, AJvYcCXNvsknk6BDBtd/xsM4x7ASkYSqmF9g09M1irz0OTFZmWPOBvBKopWVl/b+DpNWGpjyLYxmp8E1DTbCH8g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0QPFnLdHaXab1Jys37tZ8rU9fhUw/kBlD/jIeqYEjfXEeiwgc
	9vXdTzAVF1PUEa4mj2hY0xfRbZbB7tdmoANN629JOxIllVDGEoMTJc6T
X-Gm-Gg: ASbGncvxZFguu3q8QD/eUmI6W+i60/3fiPD+Chu+edzUdOm7Ejj22KTe2V3Bc1uUhfD
	BL2C5nwAZdQdD2AUt/c8UL6MYUKh0CRP5lr3w92+6+eKGFaefYJxJSH4tZr63qrgAxTyb3EnhDZ
	80aAZOd2azTt6f3PFXm1EUTjcw5YMAj90UdRctRicoELnuaXmZc/dJEXjkd0/E1u2vs45G/wi+y
	N/+3hZXggfRt2QpAEnB/jP5sWCU3TcX6xcthRFpUUrLWLM6+FRKhR/XafKTMJD1L5s6GPhlkLqz
	QtuH0jMVEfCTpWHWZ7RPNtEOxEoSH5IxvUQFtq4KaCW/6Pv4VeqPnEremAd17ehngnhMZLu95AQ
	FsaxO6AZL7Owgmez5/iVFz+aXvg6cEs+N1g==
X-Google-Smtp-Source: AGHT+IFrPs3+83nE2ufMAS3Rmx6WJmZ3sTnzdo4dWEK3GG1kbsFEpn9/Q5UuoQOp19OEhF38MClIdQ==
X-Received: by 2002:a17:90b:3c8d:b0:314:2cd2:595d with SMTP id 98e67ed59e1d1-3281543c7b8mr18988784a91.8.1756901104231;
        Wed, 03 Sep 2025 05:05:04 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:dde1:b1e1:74ba:18b3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723534c0a8sm14842491b3a.79.2025.09.03.05.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 05:05:03 -0700 (PDT)
Date: Wed, 3 Sep 2025 05:05:00 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: akemnade@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, andreas@kemnade.info, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: tsc2007: use comma in filename
Message-ID: <yrjd3dcadwtvpuatd2nff2rj6x2sehi5vd45hr7l3bh4x4s76v@kqjn7fw54ren>
References: <20250830085326.36120-1-akemnade@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830085326.36120-1-akemnade@kernel.org>

On Sat, Aug 30, 2025 at 10:53:26AM +0200, akemnade@kernel.org wrote:
> From: Andreas Kemnade <andreas@kemnade.info>
> 
> Use comma between vendor-prefix and chip name as it is common.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Applied, thank you.

-- 
Dmitry

