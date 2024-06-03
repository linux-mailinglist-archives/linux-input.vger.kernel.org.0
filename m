Return-Path: <linux-input+bounces-4036-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 640128D7AD2
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 06:40:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59AEFB218C8
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 04:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63BF21C695;
	Mon,  3 Jun 2024 04:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iWr54jdv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D40374C3;
	Mon,  3 Jun 2024 04:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717389562; cv=none; b=VpuuYkJk3mK5Ys0WVnwf0cXIXp6MyDcHfC0M/Iaz22SnnerQJozaGz70069j+dE7543Miz4HUK9mpRBoZ8L+qHxVOdKIOZlWSOjh0MqebY1Wx4fbOvXSi2aHMVR6vWUUT9b++pYhN3vrHbFcFl7e2e2s2RP95OvRUkiU0rWk2ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717389562; c=relaxed/simple;
	bh=9bseIH3TlIZnb9psO+ml5b2i6IzrzUo5qqB/y3i+5pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LHet+/4z1YIH5nDdA3GS4a0eFcuO9+JMERygClJNp7BvFevwhvX30U1nZyRDgPMmBz+mTr5jw75sedRFB+nL2xtVsf9bg/2g1FAvB7EMp3Rz6/RMK9i3JQ92p2HBVDlOnLOQkM/keU2HS30Oo/PLZiFmCbglZAuqVn8RVP8MgVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iWr54jdv; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3d1e17dd278so1615651b6e.1;
        Sun, 02 Jun 2024 21:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717389560; x=1717994360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0WvMnHbS4fhEgdVoHgFwcnYZitX1rOcOwh7toDleCYM=;
        b=iWr54jdvavcsdhCdYoZ+ZOLkrhih/Skic/j3AmKypQWp5K4+C1MR9ybpbzKX7V6dLG
         oOot+fY4FH5BzP5O/MuS0Hho/vB73NZQTa8C1CQ5rvfpLxD9y3F7/fO1Mun6Fofyi5Vg
         GDuCVrhgLXZ/ex62K8J38g0KEQijNyuuo4tPFS/stgTB4ONZHoRJUgO+QaZSzWZ4Mu4d
         72p70DsL3iaZkPFDHapKeP17M5inmCmE7fM6l9ydTDi2Cw9ffcj1+KyedgxNXcLF/QMc
         G97TVV+0642fmpmypExhogNcR+OCPNivsnJW31J64y0uvsjrWOGf58HN9dZsn73qmBkK
         VkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717389560; x=1717994360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0WvMnHbS4fhEgdVoHgFwcnYZitX1rOcOwh7toDleCYM=;
        b=RhRwgepOP3NyCXvbqhOj26d0K493ym/djSb4tmSAzcZdHCIFvAXZEDtpcRGtgrF5vz
         9GFHESbB1bAlS+YZWQbY99r1E/r/3Z65Ti73HrtH6iiPp+jYFcLEZyrojbSOZnM9+Pl7
         amnKjZ37i/tPpXOh22ljYECy/n4hQu7ZWf1AyRRBFfXPl3XPChtjczuHWrxF+M8L8I/E
         +BTzAV6T1cq2e27PyzVdQ8F7bsrfO6++eL2HYYZrE10yWkykSM9d+wehZGoOoUg3XJB7
         vFbad4Q9FlwoFGM5HfIoPA1GVbldtJqSP5m3RjzZvGkPKWGjA/T4hrRxlJbGC0k5R8oK
         Xrpw==
X-Forwarded-Encrypted: i=1; AJvYcCUbAULJ487fqXhmhkv1nF0VN7SUQjw8bHvT8RE4hjO8x6WUyqfiiaIHPrAfk5amMwCJFV3SJJ3su7rDHCDAsQKVQrqeIQFskwuiGmmdIDC0hf6rZfhT8STuGLFGqDTU1S+3wAJeBgdwjLrH2JNljRAzwUREfvd+YOIsXnhD/sXSOHywmPCc3c9jueI=
X-Gm-Message-State: AOJu0YwJ97cVAsoKZRdcM5Bqvk2ipr3O2WdPpChSk0QU35IhIRnTiroQ
	UQOH4KHaul9CVg402cPg6gLbtXz29uoFA1ewwLSAU38TQC/JKUDoQ4uWIA==
X-Google-Smtp-Source: AGHT+IHTSOKzDNjubc4BOozRYUxKVHy379G8mOmhSGAKCh6Wo/Rt5xrxYACefPoaJNQV85tM+u/Rrw==
X-Received: by 2002:a05:6808:1a13:b0:3c9:93f1:c787 with SMTP id 5614622812f47-3d1e34858f3mr11030446b6e.3.1717389559808;
        Sun, 02 Jun 2024 21:39:19 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:17fd:ad4d:2690:4ce2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702423c7be4sm4669490b3a.9.2024.06.02.21.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 21:39:19 -0700 (PDT)
Date: Sun, 2 Jun 2024 21:39:17 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Erick Archer <erick.archer@outlook.com>
Cc: Julian Squires <julian@cipht.net>, Hans de Goede <hdegoede@redhat.com>,
	Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Justin Stitt <justinstitt@google.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] Input: tablet - use sizeof(*pointer) instead of
 sizeof(type)
Message-ID: <Zl1I9ReuW22-kiiP@google.com>
References: <AS8PR02MB7237B05083487507CFAF96B08BFE2@AS8PR02MB7237.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR02MB7237B05083487507CFAF96B08BFE2@AS8PR02MB7237.eurprd02.prod.outlook.com>

On Sun, Jun 02, 2024 at 07:10:47PM +0200, Erick Archer wrote:
> It is preferred to use sizeof(*pointer) instead of sizeof(type)
> due to the type of the variable can change and one needs not
> change the former (unlike the latter). This patch has no effect
> on runtime behavior.
> 
> Signed-off-by: Erick Archer <erick.archer@outlook.com>

Applied, thank you.

-- 
Dmitry

