Return-Path: <linux-input+bounces-6532-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B95597868F
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2024 19:21:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55A081C24247
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2024 17:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946B863C;
	Fri, 13 Sep 2024 17:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqeAW/fx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355017E563
	for <linux-input@vger.kernel.org>; Fri, 13 Sep 2024 17:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726248096; cv=none; b=eM3l9u74NXbq1Rmf+g/3adxj3Pq6zpTMq5huDk5doNpo8Y6bI17bTmb8NbxpQkDP1wVGnYS5ntl1ZrXF4ShkM2fma45k/lvioLudMzT/dLItn7fiLdyPS86R5lUvoV6/vNQ3cyT5EvFm0h7+KMwvNjYcSW6T6K/AHV5clUae/6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726248096; c=relaxed/simple;
	bh=JfFwAlgHPFZpDF7mFNsvMFI01ljY3S/H0SfyBfEGTUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JOBkWKDMZ+rsKNbZ7DZwUFPbLvYa34QmGbJIxeOnYTknswto6uj4eB02fbPsIAlziiG/g3qcVzPo40uxxNVMSV6CUHhVq/aQjxoXad0l62asTDv1EVFYcJ1UfvWncdtfRQOZKq+RysJnBG2GhHMW/0y/xjEU68DaiuUloZwBcU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lqeAW/fx; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-205909af9b5so11256425ad.3
        for <linux-input@vger.kernel.org>; Fri, 13 Sep 2024 10:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726248094; x=1726852894; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aEMrGsah1xCmpa7lOihAKeMWCwAN5m1xCvYDO+E4f7Q=;
        b=lqeAW/fxP7Hctn83FezSyU8MM0U1OU0h8WUD9c/fnhvMa/ek+o57qFfGjKY7NfuE2B
         mQneBcDI9wNXNm9AhAfuAuTwj4io6+p+saGZoOzUGtE2TagE/zPfPoFj1XIcSKbNnxgG
         QbRNGgF5pHfU0Qt34DptQ6vkwlwIkuP6Zdau/o0ehdgJcWNHBAMv9EZZeNtv7sC3cZWZ
         SiEedQVG+8FRA8JmBOCB33lMGaVFAeTmADq7S3yQUuPEku6gDvBRb4cumKGcpp0PxiKJ
         U9S1C+BFGzXNODlsJt+lDoLB0RkMlpfi2dF2ecMisd9PiUNPDkHXTGDFeigm3PG096i6
         WRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726248094; x=1726852894;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aEMrGsah1xCmpa7lOihAKeMWCwAN5m1xCvYDO+E4f7Q=;
        b=cHBxfZYUmo0a38OkTAkP6cL3Xnh1VGu1gQ9EM89xLdPkPRA3A2SwvjiqDwRUNH/rjQ
         rUsqtOcErsLv82dLvLyaW9nXiKbBvNTf5IzN1zn4+bZa2mbJi2HbkH3qri+gZsKiH54V
         ClntZJqrdNme1f+gDuoEf/Xr0XSfoHJ9liT5i5Y6niCvZ+lfOkEgIBOHV5yWJ+QuTPdM
         CJt2Oi5DR4r2rwX0TjbJWhvGXB9RBJlx3nYFEb8H2Ob3qyTXbwty8EKl5hH877deAiV4
         Z61oBQXO4OW4Vc78S5HTlJlahbSG7t00ngjEAG6q1fjN0hRilA5RtVhWXcdY3y0B3wyr
         FQtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDOKNxEmd95lKQ1OisvnCTYRGF0BLG/b7rXQ0z3STBn6B14bDOKnerN7SskHyE7/I6VBt3nxKQHmct8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeVsQwYlxWyniLj5YpV0r5J2W+KB84LEm9LKdDDQdxucXULYtS
	cqG9v0yS5OECdkZaalWRYV9Mt2d6uBJAchg+5BCtVqNYkJ+mHg9w
X-Google-Smtp-Source: AGHT+IGdTMWBtiPW9lI2petsQZn5vre1X+S0dFbZVcj+WmTxY4aWlKEM+uoPI1xOFBZWsaO1bzNCVg==
X-Received: by 2002:a17:903:234b:b0:207:6e9:2da1 with SMTP id d9443c01a7336-20781d628c5mr53716965ad.17.1726248093854;
        Fri, 13 Sep 2024 10:21:33 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:4c0d:1024:4781:3234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076af47484sm30349745ad.88.2024.09.13.10.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 10:21:33 -0700 (PDT)
Date: Fri, 13 Sep 2024 10:21:30 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: erick.archer@outlook.com, u.kleine-koenig@pengutronix.de,
	danilokrummrich@dk-develop.de, linus.walleij@linaro.org,
	robh@kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: ps2-gpio - Use IRQF_NO_AUTOEN flag in
 request_irq()
Message-ID: <ZuR0mmeVH0lQ8HEC@google.com>
References: <20240912033013.2610949-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912033013.2610949-1-ruanjinjie@huawei.com>

On Thu, Sep 12, 2024 at 11:30:13AM +0800, Jinjie Ruan wrote:
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable when request IRQ.
> 
> Fixes: 9ee0a0558819 ("Input: PS/2 gpio bit banging driver for serio bus")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Applied, thank you.

-- 
Dmitry

