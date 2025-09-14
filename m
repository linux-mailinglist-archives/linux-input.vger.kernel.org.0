Return-Path: <linux-input+bounces-14686-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAF0B5641E
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 03:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 117DC7B2A9D
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 01:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 792DE1DB95E;
	Sun, 14 Sep 2025 01:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iyu5u5jY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B77B1D79BE
	for <linux-input@vger.kernel.org>; Sun, 14 Sep 2025 01:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757811759; cv=none; b=SsGiWvE8q0XuDmXiG4aWfwP9C5Y8v9MUSF4qjM/XrbLhzVDqLtLA65775W0qhExVDWNCUiLYaR2dk6xVVpuWXEYdRICnYH6FRWJP8bvQR/qXQzNB1BQm/GHLGsWgemdBU4N7MGLvBk/8hDpFgPtDcGCPZBhR3O0IcH+xFhWEMSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757811759; c=relaxed/simple;
	bh=YcKYuOsHQiDmDHla6Xc9HOipmRbCz7uiQeIiuNrHhNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j42++Tir2H+88f5XiGQWo7raHvtdA68GfCKcT72gEIez9i9WqEcww7Q/jRpJ+VNmWUN4iF8eDoOrdHxIOobOpOTt6Bru/GoP+fY7KNbaC4Ag5s1gHsVpKwFRCBn54tK1/FzB4i/yyiKW6R0N7nFL00DR8N5FOmUyoELhH9zOJCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iyu5u5jY; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2445806df50so24911365ad.1
        for <linux-input@vger.kernel.org>; Sat, 13 Sep 2025 18:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757811757; x=1758416557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U3tFCttzaSkqmy6bwSxlBN+tHDcFNxwADclbMsDDT+0=;
        b=iyu5u5jYxzEeJuSktwBJGH9fXc//pmvM052H+KsPQ3F51JhhYk5mu69WFxnoj16vsr
         I24Tb+QF19R4w81muZtAdQ8CIikps/a42aNpmw5ip0cIi7K2Iv1Ec7NuiAstHFDzDBk0
         z1EKa+bGv8rwpAav61zktX7J5EmnmrqWDEsGXD5CVJY/BO8ioCJgA+ij5SxNwkn4f4EZ
         QcUoysVyP6wsasG+1bWCp7i6mpc0quAmWoJHUuZHrm2YD9f1Byq35jOjlVtwQsLGDn7c
         99/4JeVwJXO/2HqcxGfFKKn9RatObRRZgSZicKRk/O8PSWX4/0tSztxP8+mWIeF70b18
         5VxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757811757; x=1758416557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3tFCttzaSkqmy6bwSxlBN+tHDcFNxwADclbMsDDT+0=;
        b=MedDttM5WwGWV0QdSc2YN8+fDvZ/BCo82QLXgw/4m5k34QusLrZ3Taucq7OFgFfuHC
         9Xx55zyFpT9s8SpCfxA9Jt5/uhGTlHZnC3MvV7BL2mczzh5MPeUEIsQ+6QJe7/VWSlXg
         G/cJImyBaL676aouXwvxT6GE+hKajXMDOOIuunv0CbzIfB5h8Hi87VSidfzjgDWpR1RW
         g/BJAHtNHFS8Qzy+R2A3FudvUzNeAX3uHmMe9wVhCGwY0S7DGSB7WcO7NP7vSv8aeh7R
         9uIRliZ7fLbJxAWNuJxReY4sto9jjfKRxLXbSu+MzjlFbDkC+Rg+Ya5eVT/ZMEca7E8R
         XFuw==
X-Forwarded-Encrypted: i=1; AJvYcCXbcWNbdwb4V8zLO4YbvMJRKdGPfTooHOYRJCmxCuXRapDyNEmDH+IqEqmp9g6YY/blwtiKxPtMA0s88w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYQyKfrCcRCPK+FVz03kahIStvdOtDPYWSEisLCEPRB91oZiGp
	Ra2LleX/KiBznu/HAGuybN/iUOvAtcT3ROqNA3urrXnTD2zjro+G9O3XOVNBfQ==
X-Gm-Gg: ASbGncsQn9VqLIlyLcrBN6xrxrJSlxVCt1Ow8oD6Q65Ewc13gDCW2eoHSOcJvGsL0Ws
	tLRFBQutyI5qaQNKtq1ZgIjl7jycDq9mfOjkR89S+niVtLuLvhfUmS1NESRriHlsgbmkkj1Qz+R
	45zM7oYGm1lOoQj3X3BWNEuunbd6SNFWQ2pT/v47e005MbTUpD8vP04SFkZG9j7FNmj7qfY0PA4
	eBFhFn2E/I5c+q+PiXwPITU7OfOopQf15GDWWwDzLMkDFmsKDymtR/cRcruTyl9G1tarpyATZDT
	JesVqLtjcBFLjDlQR21Gp5p2185o70GGz78URnzytRabtqgnXMeXIaI/Gt77NBfRx5jOxOLYvmh
	PzvzqrSfqKdxr4vTSTReSi1KJN6+CVYvm
X-Google-Smtp-Source: AGHT+IFasP1HhTVqhnuZkW+GMDcgc2NkUjSJYBWWtUuBHkU3lows+k2RPUZ75ndHMNEh3G6ASPvbfg==
X-Received: by 2002:a17:902:f707:b0:25e:78db:4a0d with SMTP id d9443c01a7336-25e78db4d35mr62051075ad.36.1757811757158;
        Sat, 13 Sep 2025 18:02:37 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:81bf:abc:6590:f690])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3b20e01esm88107345ad.126.2025.09.13.18.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 18:02:36 -0700 (PDT)
Date: Sat, 13 Sep 2025 18:02:33 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jonathan Denose <jdenose@google.com>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	Sean O'Brien <seobrien@google.com>
Subject: Re: [PATCH v3 02/11] Input: add FF_HAPTIC effect type
Message-ID: <u2g4fikyekkk3yku5aqcntk34zrefg6tr5yaqygrqosr3elh47@oexr2zrxkza6>
References: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
 <20250818-support-forcepads-v3-2-e4f9ab0add84@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818-support-forcepads-v3-2-e4f9ab0add84@google.com>

On Mon, Aug 18, 2025 at 11:08:43PM +0000, Jonathan Denose wrote:
> From: Angela Czubak <aczubak@google.com>
> 
> FF_HAPTIC effect type can be used to trigger haptic feedback with HID
> simple haptic usages.
> 
> Signed-off-by: Angela Czubak <aczubak@google.com>
> Co-developed-by: Jonathan Denose <jdenose@google.com>
> Signed-off-by: Jonathan Denose <jdenose@google.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry

