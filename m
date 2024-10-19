Return-Path: <linux-input+bounces-7549-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B34A9A4A6C
	for <lists+linux-input@lfdr.de>; Sat, 19 Oct 2024 02:13:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54FD3280218
	for <lists+linux-input@lfdr.de>; Sat, 19 Oct 2024 00:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F40136D;
	Sat, 19 Oct 2024 00:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8dWSP0N"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B1F36C;
	Sat, 19 Oct 2024 00:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729296815; cv=none; b=KD/g7fBVEh2poQcRsyunPDG5V31xat1NoY782ko/wCao2bzWS3hxq/N8cnAKRYUM+wgGWeCFmI36ZoVIQ8IgGV4wZjjc2QRelWmDH+NUg1wywV25Iky7pTn4+nKj7sSlPzjG4ChnSzBMwjuuAjPU6/QNdOi/gUUB7ZlG8t5co+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729296815; c=relaxed/simple;
	bh=a1lQs2K/hpzn+qjjM5h5n7cwY2f2IqXCXBqICGsl7vA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LYJcE0biEr5ewuG/EThxvtiA+smrw7/rMSV4d1LDl/jJi6h9zNSwYpI7k5LD6sXecvGfAOrADjYg2pgIy0JSuFOngxdKnNUgZWHvkxXGXzZgtHNd7cDjgxW9w4wbq8ckYPdCLrV8JM5UJdbqcHy9W+7Kta3M8ZEz5shnzkcPORw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8dWSP0N; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e2ed2230d8so2047162a91.0;
        Fri, 18 Oct 2024 17:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729296812; x=1729901612; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KNThpLLIauJj/AYVG1xjo0lEUnE155HUiPRVYaekxaY=;
        b=C8dWSP0NSAoAc07jg6DwM/Bs8tIo/r+pzCzlLa/Muul1Mb2szSiPO435rllVHHvqh2
         efulaRhRjIz6Iw6wTxA/31EiisbYPFnFDjBtp2XL0EDORoD1Ow62Jic5vlKpjKs9VESg
         5crTVkLBLrGpfjxGa2fn1a39T+VptL+WS0BMSDC6VFktDIrCpY4/mhiFvUSqbHVfZ45p
         H0LnlPJFyj7bbfCPMB3ToOGqseBHJRnrgDV5lf/tu/M7lRjrnv3uNfoG7bi6pR83QA6Z
         bBSrOT+onifLlkegx/HgDaxJ3CGyBc5XW1ruRmBq6krHEyaLd/RRSzh9tT6xiVjsd+UY
         p3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729296812; x=1729901612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNThpLLIauJj/AYVG1xjo0lEUnE155HUiPRVYaekxaY=;
        b=VyggonF82+HWsfpZNPCw2+s6uw7OzC5KXbDE0PeJivFljfpmH38wdaB/XwMveIIoAZ
         JZJ3vBBORBxdbkGVUWwI4SPJDaKfoHn0LGT9H+bahEZ3HY2vuzohZf+bp810t8rXQcB2
         UFVll5SMrQ9PwxKzH6xxPJeL3T1a/RXgtnm5171RH7G3P9EokqLho/LKccl7TB+pEaTX
         +bM3++5Xus4qyW6FrN8Bb5w8mUZN6St5kH2BxEA0mVxNpxIBR512Rh+04XPPulxV6Gjx
         W6fFrZEpxgLwCzFT+nX1rgMoF8Iwbx1HQGiGJc3tPLAyzlZAImxpTneN+BaxIWLZh4bL
         jIrA==
X-Forwarded-Encrypted: i=1; AJvYcCVz1ZVJC5+yV7GdFaDEOtZ4Zmy1wPd3Y88KcAVj7szwmqzP3aIATcBjOAu8ot0kBHe6/flbVX4F8bScSNPJ@vger.kernel.org, AJvYcCWGvDesSymXScGf18kmuFBEml6m5W26dczLZW92yFw2eB9dKzabxHgAFSroDohjj7Y1d3mhsIEUDRerdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjt2TQSXtAIRJolXHti6mu1Ng5DeaQqFoP5ad6wJWaMUEcT5DC
	7G5b+5eztThL/hbSxmunWtO5dPLTGwV8gTyOj6XTn+c+BOLBDIzAqcwENg==
X-Google-Smtp-Source: AGHT+IFtgZVwpfUcyAAIT9LMsPFDiCwdmlXXu1X7wwMqlmBDBtEPQpHRAO4HnrR+U6x+uOMpk8V4FA==
X-Received: by 2002:a17:90a:6f84:b0:2e2:bd9a:4ff4 with SMTP id 98e67ed59e1d1-2e56173c1e7mr5102907a91.24.1729296812356;
        Fri, 18 Oct 2024 17:13:32 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:351c:e27f:10e5:484c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e55d7bf525sm2817616a91.15.2024.10.18.17.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 17:13:31 -0700 (PDT)
Date: Fri, 18 Oct 2024 17:13:29 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Nikita Travkin <nikita@trvn.ru>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jakob Hauser <jahau@rocketmail.com>
Subject: Re: [PATCH v2] Input: zinitix - Don't fail if linux,keycodes prop is
 absent
Message-ID: <ZxL5qQGXDrcdEtnR@google.com>
References: <20241004-zinitix-no-keycodes-v2-1-876dc9fea4b6@trvn.ru>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004-zinitix-no-keycodes-v2-1-876dc9fea4b6@trvn.ru>

On Fri, Oct 04, 2024 at 09:17:30PM +0500, Nikita Travkin wrote:
> When initially adding the touchkey support, a mistake was made in the
> property parsing code. The possible negative errno from
> device_property_count_u32() was never checked, which was an oversight
> left from converting to it from the of_property as part of the review
> fixes.
> 
> Re-add the correct handling of the absent property, in which case zero
> touchkeys should be assumed, which would disable the feature.
> 
> Reported-by: Jakob Hauser <jahau@rocketmail.com>
> Tested-by: Jakob Hauser <jahau@rocketmail.com>
> Fixes: 075d9b22c8fe ("Input: zinitix - add touchkey support")
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>

Applied, thank you.

-- 
Dmitry

