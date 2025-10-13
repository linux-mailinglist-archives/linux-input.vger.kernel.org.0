Return-Path: <linux-input+bounces-15423-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B58BD546A
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 18:55:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4F968503863
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 16:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9645C296BBC;
	Mon, 13 Oct 2025 16:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dYZQfS7j"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EBA284B4F
	for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 16:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760371526; cv=none; b=M0wWM1BvYEWODbLVJrJen4H8/7RI2m8+BC0Z39WKdUsu1Teyn6TLtSh36nLQdq5HiEjdPNHuGITaDEUMmthCEw5zZQMPMnj0Zye0/nBHzIzT/aB9aP9r6tiykTbrOah2dux+phyYnuwjh4gqYKLHtu0NrX74e/4GMClvTShVNqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760371526; c=relaxed/simple;
	bh=/WZ2iZes/FlXVVyMzwUFoWChBG8onTh/NJLcp9lLj+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UiQDrw2fAUP9GuY3Yj23s2iwFfVILzKCgqETb/F2GWeRaAhydJzZKPeM1+5I6rB6TL0Xvpj/wW9TnkjphHX20nxnNt8aW73OgPDSxSoNGIAOrjONSCbiKx/x2y65v8q6ri6SPnw1RZwPI0eD3Yjq43mmajLnOjpq2cpv1n6RbXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dYZQfS7j; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-28e7cd34047so34152885ad.2
        for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 09:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760371524; x=1760976324; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TrAN3NU0vqcbJuaRJ1d2MIegmQseMHGwlXximXGEwl8=;
        b=dYZQfS7jM+4lB4YmvO+ZD4PfwVEQ79LlVARNKjqv6hUYmhGG9vkcxWY64g/xXkf6qV
         fUo+LdfN+d6c881HSZwuOy0lXR/26pmuB/bcY1sQlpLkvhhVrKkb/5Yf6xEnAfr+2G2I
         tBiC9bSohYNfIzImJlV5ZQoLhLnGpJMtD3C0ikovujOydC1lKPLeAFOzBT0D0Yi3lXI0
         GZywYQx82h4B7NTNhvo41mrFepsufUv300aB9gM7M29Ek/RzXgAxIXXjx0AMb49mpyJs
         ykKJgTiOnY/xUhEnQyoOQDCkFXl5UgTDXQa9pemZiJaX2DW1NKbMxxHZ1Eyr9FzXN+w0
         OtFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760371524; x=1760976324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrAN3NU0vqcbJuaRJ1d2MIegmQseMHGwlXximXGEwl8=;
        b=CG34lJReyzIuOpC0tFQqglnAfyP0a9B0O+9gAuzx705KHCOY/Pgteya5SVEMXVyoXm
         VeHZ+UqjTWYT0aH1I5U9LtVO3fwwF8JK9tyGEryPONykQcFO9I85DeRUskHEiq18jex7
         z3cBc+MV7YVxbl6YBZT1xfyUDvC9o/Mh333Hqmry26VJiP4TTvFWrMwwrlrBwMVUmbSJ
         flC5Wpmz+cegcA1rmFMQq+9FVMOLnuwd4B3p1yU4IVVrmPmuvdwFtRkNvH2nCyRR7tUs
         UM1+SV8oE43DzAYtnkYXvkHECFn1wQZOM1uaePQ0EPPpgnc/tzFe3I+o5/cjugnICCNe
         Pigw==
X-Gm-Message-State: AOJu0YwHXvu9B3YQgXlWpPGsX5t7qJkuRVoa1LR8RZG5BnZbb0QnUolx
	K7+ElAZadKwd+ZoriRJMaqHRLWJlDIUtklTULxzjtxdItucQiAbxNKdE
X-Gm-Gg: ASbGncvUEOavdM7mnh8gOZvcX1MuSIcl05MXqQ91FfwfxyPmg6NWS8VrNqKxyOG/dQQ
	D0SgSceijVUwegSisy2R9/nhKZ6iCnHw7uCTNQS7pfl/32VlWxpaqjyz8WogehGqIcgdxl/BjkS
	33ul1GzbWDjI3Sa6UjToBOUQ6VqTkadl2nt45goms4gmJ8kbtJNDWNCAoQX6i+lxKlN4Ok26Fp6
	D8OGXfid/trKEcG9GbZBNGpqMJHIlk0DxpcB5SZPADfDSZ+wgLYgoWzxiM7ruX7vmUqQ/f+HjGG
	/BUYKhyLI0IPAF+47ER3xhePT422Mf7nbnn+EMuuxO9huhKLsFkRE0YaKeQWFUO6V1UMoEJlnAh
	GyTrhoXCoAJKDdvNcW8xoUjPGz65oaT0Y/4qap/o58vEkznQB+L0KPGMOba4rw1WANxHV1giMXY
	2+DX+38VG3ePop474u
X-Google-Smtp-Source: AGHT+IFvfAdODfTPcXlpP1SbDfro+d1+gc2qO3OfakrxvU4VDJJdZcivjZxkr4gBXLeHcfR3g8h09A==
X-Received: by 2002:a17:903:90d:b0:286:74e3:3889 with SMTP id d9443c01a7336-290272f93damr274113155ad.55.1760371524106;
        Mon, 13 Oct 2025 09:05:24 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:2811:1686:ffe6:64d0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f3de4asm137517305ad.92.2025.10.13.09.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 09:05:23 -0700 (PDT)
Date: Mon, 13 Oct 2025 09:05:07 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hunter Moore <Hunter.Moore@garmin.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] input: Add marine keycodes for radar control.
Message-ID: <2rtgkpu7dzfxrnmepwxmxmemiqmmbx4fl6ow336f6spjdgqj7k@fxgfc26vzzkk>
References: <20251013152309.880-1-Hunter.Moore@garmin.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013152309.880-1-Hunter.Moore@garmin.com>

Hi Hunter,

On Mon, Oct 13, 2025 at 10:23:09AM -0500, Hunter Moore wrote:
> From: Hunter Moore <hunter.moore@garmin.com>
> 
> We are looking into adding some additional keycodes to add support for
> radar control. In total we are adding 29 keycodes which seems to
> exceed the KEY_MAX limit set, so we have also bumped this value to
> 0x3ff to double the available keycodes.

No, we will not be adding these new keys since I do not see any users of
the previously defined ones anywhere, not in kernel sources and not in
the HID specification.

You seem to be creating a purpose-built devices where you control your
userspace, and I do not think the new keycodes will be of any use to
anyone but your specific application. You are also unlikely to be
running anything else besides the software that you are developing on
these devices, so I'd recommend simply reuse parts of the existing key
code space for your purposes (KEY_MACRO*, BTN_TRIGGER_HAPPY*, etc).

Thanks.

-- 
Dmitry

