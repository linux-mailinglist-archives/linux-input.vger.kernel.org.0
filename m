Return-Path: <linux-input+bounces-6275-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C74B96E945
	for <lists+linux-input@lfdr.de>; Fri,  6 Sep 2024 07:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 463C71F2479F
	for <lists+linux-input@lfdr.de>; Fri,  6 Sep 2024 05:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5771A49638;
	Fri,  6 Sep 2024 05:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBpUlW94"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6460819;
	Fri,  6 Sep 2024 05:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725600664; cv=none; b=Lz4VoRFGtIyGxdvkY+0cqq0Y4gz75bVVXVq7tgwChElNmhGPfoac5xuIgPmdPASuZTJv+YcsuDgPZ7g9lLJpKL8wh2yS8/BvRsgUJpCmSLlbYkUnm9Qhvy3rssKeVNUaMusC7U5qIKNhV5CZ/UnJxeGksallZMfBHlN91dwpmKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725600664; c=relaxed/simple;
	bh=xYRDfR7w4cvg0JE/SSRywsqcsK0ZVzCAWzanLbugdKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ozeSsn/uQUIKJytVJvS3nCEOJ+sarkK8UQuuoMS8qlZvo2OSmZsVVdac3ZLrsn/1pCBIT9EYl9ZkAIVs0B5kq2KXnQ1j4GnfRW/lgYJab3uBwPIpMo1KyH01Mdfa4nPzeDwlz1wEBKRel9TK8i7VCX5wlF8I6Aj30sDQ2/qFnto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBpUlW94; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-27051f63018so807246fac.3;
        Thu, 05 Sep 2024 22:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725600662; x=1726205462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6rlojunx8GHInoLGCMntB+ZOAAQdHr69FYIGEn6wPK4=;
        b=jBpUlW94u2O00FJBeUjV2kg8BXGjxNNslSyhgHzr3RO8etnGQnxEMFC/8pW4CpemXR
         yORi4qbRdk252AITaiWtlkpchRMr8H6S/uAuI8MsQyKJapTntKiXcnZv3jCm14yl+8lX
         +Nc9OZSNGlQUzG0W1ygjpoJqMWl9i1GCYwtcxl3KktCdrEx6Z6tpgYyxYqz0j3h94VwJ
         oPg/xQv1uzQLFrxh4BIj75wGAPL6APXnlKKJH/Xn2FA6zPNovGjV11COnZg34Fk3MN1a
         iHjNDqYS6yI8li5pDtKlLzy+NmxyJ9xFsaDVWdB7K5NZ4euK5TAUiXqUNSSkjLRFzO68
         Wa0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725600662; x=1726205462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6rlojunx8GHInoLGCMntB+ZOAAQdHr69FYIGEn6wPK4=;
        b=a82bvOdAnp12TFRuTF+EIYjROxRyLL52xKj9aWWmhJ4mdwcZUK5bj82M/yiXdKoMLM
         22LEKXIUChCaHmYeMFwDyFyCIh9bCM//051i2PJCJ2+FILfxmPJHSNgxnQYI1XWAvXBd
         ajNEmPZDWygonpyV/Sd2NKTb9r4Sg1Kwh4l+8br5KtbPhfrI/5z2A3iX77XIqEVe7sIB
         ZN5f5VmFQGQ+kfuDDu9qluALgDXNSmIX51x1ml3cEnZ3hlhP5lF8Evxaypif3RGi0zud
         MI2Bss3ryIDVG2T0elAEM2fvH7HRuMFTlSw3zOginmhFtFeqVkdgaz4DnJ/UHXb+hLmN
         KarQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9YS5PTcJZfn1NQBuFoD+FBAoUApf5HPRBCJnLANkjb4FaE2VC4QgP+B1s0OMY7iox1SqUARFA08L+IPmh@vger.kernel.org, AJvYcCWMhiOFukfpPSTydgS6WKCKGRgrg6a9m8fZQ5tyQ2HyviDfOcdKZMzcF/80J1EFUniIn4YpVO94DnDR1Z4=@vger.kernel.org, AJvYcCWVTqoKx0lcXMDP4XQ0PdTwEZnFRhV+RSkryuBzgZBYPnGQ3ap0KgLJJVDq9zr1QJKSXUY9ah1n5B0Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1qi9YulzCGmo30zNECKEoegWiD4kQsLIWukBrGy/ZSqebTXCr
	FGCFDmChosqIlbx20nVDgLshrvW7K9GSLAn/VHd/JWIFAbzy3Sf9
X-Google-Smtp-Source: AGHT+IGJhDHSeGSMTpCmO/BHOqkArJRSxKtV4pDbBAprpmrun6J+Xrj7nn6JiGoluHx0bZKiryy6YA==
X-Received: by 2002:a05:6871:580f:b0:260:e4ac:72e5 with SMTP id 586e51a60fabf-27b82edbfb5mr244718fac.25.1725600661782;
        Thu, 05 Sep 2024 22:31:01 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1de8:3062:3230:1a45])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d770499e7asm532882a12.91.2024.09.05.22.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 22:31:01 -0700 (PDT)
Date: Thu, 5 Sep 2024 22:30:58 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: input: convert rotary-encoder to yaml
Message-ID: <ZtqTklejytV9n74t@google.com>
References: <20240811214656.3773098-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240811214656.3773098-1-Frank.Li@nxp.com>

On Sun, Aug 11, 2024 at 05:46:55PM -0400, Frank Li wrote:
> Convert binding doc rotary-encoder.txt to yaml format.
> 
> Additional change:
> - Only keep one example.
> 
> Fix below warning:
> arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: /rotary-encoder:
>     failed to match any schema with compatible: ['rotary-encoder']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry

