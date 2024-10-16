Return-Path: <linux-input+bounces-7500-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EA19A12BB
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 21:39:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47DC21C21632
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 19:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 374C12141C3;
	Wed, 16 Oct 2024 19:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FfeRRokr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35881865ED;
	Wed, 16 Oct 2024 19:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729107554; cv=none; b=MbVu4ICkIYjuDUCUilotXZZfALxCcj4GvwRJLJ2/MBwg2pqvXqaVaVJidQ6gHovrmvbBefPlAG6SnGsuDo2qsTa3MygIB5jgvWgpe6QwugMsK8ktCkd/dtdeF0TdB2R4SQp03Bpz+zKbnj87KXziO6qYFQ8Ill/tUAYDcu+MENQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729107554; c=relaxed/simple;
	bh=PcNNE4XfZIdmp2IFC5sHiGZRBiiGWJ+nnBbjvsKUyUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gpGYvtICTHcAiTPvkXz4WwY1cw9cA4q3z8aR2ufhGhdFn4Ij46Z76h4KWlzNcc0/P01CuWkYaNuDd7KQobFtSn4aEQL/pReM9SdARdIsQibdpa2fs7rSh01jyOg0hpCVmHmAgExJ3R/Rm+SkcSEJ56gbGNuLPCPz93uWqp4eoxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FfeRRokr; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20cb89a4e4cso1311635ad.3;
        Wed, 16 Oct 2024 12:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729107552; x=1729712352; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EujvR8UZv6fq/KZ41h4ely4TKRRUWvkl8jFr37A8UVY=;
        b=FfeRRokrAgaCsM7TIXimIG9pfU8J0lFDQbktLIvdhJWJeKhwpeQr119xkZnCfZPvUp
         lUnb4rxUZBsQR8FISaObz/fGlXFfO7kzaMvdt91I39I0UGteUl+ARzoM6dzvLY/TE7Gi
         0WGTi3mG0Th2bYTDe1KZ/spqdqmQzXcAO8X0DyPWZ572Sqvu9GpmxQh7E05ITMA7/cQc
         sJ4fjSAYN8SQ6u6oN6PUi6fsZNA1BtM6cCYGW5gV9M35p7Y7sVMXYlltS5HQPErE3PrF
         xfub1/blQnX2dd1YS5IKwZer1DSprOYgQYWqyHB+l+tjlFbmK2HsYxoDyGcdHTw2ss9u
         +XiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729107552; x=1729712352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EujvR8UZv6fq/KZ41h4ely4TKRRUWvkl8jFr37A8UVY=;
        b=oxhNs2aMauLfBC2zabbJ6oRAH5aiR/sFD7vOV9gnGv7fDPrHWdzfBSFJUKVfbjO+eE
         TBMDseABPQg/6p7b2PYaM+NgXzu/yXsIitsek2TlDKeWPG1DLTGL6qaGJGLqsAbGLaQr
         lpUCSZsGIWE+R7MnFF0b9qQ1RExfa6i7WzZKdcVN7FYRVSkFqp0TREt6Fm4vFfSHEdhP
         DorkGr1q4k0LcgJXoP6cdMmsbzO7rzdlPvdK7zinq8sH6QbHD/4Jkivf2+PblAdIUuMH
         dVxGoMLCoPnOECW5Zqx4qua6Xqatxrv8oAhb6zm3TodA0YGjnAlxmAs2rLLxv5AStld5
         y4kw==
X-Forwarded-Encrypted: i=1; AJvYcCWKzCltg4QAd7kNZe0QtLkwDgOvD8WDTvGk29oUH/eek3+aA+WZCvLGIV2+VaJCqb/3BRP3kL7q8AyWZX8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV/qYtlnV836IPamxpXMfX47YyBVGx8t7e2nIYEtKubbH3zWE2
	T4el5e7z+EXcPy6AET9uAGXnTjSP7Y6G7Bb04a0tQ08ON7F9mWyj
X-Google-Smtp-Source: AGHT+IHr878Zqk6KsJIO/ADybO9REMAQEIlidAKMSTdIhh5Ex9SEdskdwvYJNPqNIqfRE9dwA7u3rA==
X-Received: by 2002:a17:903:1211:b0:20c:f648:e3a7 with SMTP id d9443c01a7336-20d27f20cf6mr59608885ad.50.1729107551843;
        Wed, 16 Oct 2024 12:39:11 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:4888:6c27:1c88:6106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d17fa492asm32420455ad.95.2024.10.16.12.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 12:39:11 -0700 (PDT)
Date: Wed, 16 Oct 2024 12:39:09 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Stefan Kerkmann <s.kerkmann@pengutronix.de>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] input: xpad: add support for 8BitDo Ultimate 2C Wireless
 Controller
Message-ID: <ZxAWXX_3ymrv_ex0@google.com>
References: <20241015-8bitdo_2c_ultimate_wireless-v1-1-9c9f9db2e995@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015-8bitdo_2c_ultimate_wireless-v1-1-9c9f9db2e995@pengutronix.de>

On Tue, Oct 15, 2024 at 10:00:30AM +0200, Stefan Kerkmann wrote:
> This XBOX360 compatible gamepad uses the new product id 0x310a under the
> 8BitDo's vendor id 0x2dc8. The change was tested using the gamepad in a
> wired and wireless dongle configuration.
> 
> Signed-off-by: Stefan Kerkmann <s.kerkmann@pengutronix.de>

Applied, thank you.

-- 
Dmitry

