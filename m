Return-Path: <linux-input+bounces-16860-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B02A2D013BF
	for <lists+linux-input@lfdr.de>; Thu, 08 Jan 2026 07:20:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 863943009A96
	for <lists+linux-input@lfdr.de>; Thu,  8 Jan 2026 06:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FBC9244660;
	Thu,  8 Jan 2026 06:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pp7sYNKB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DB714A91
	for <linux-input@vger.kernel.org>; Thu,  8 Jan 2026 06:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767853186; cv=none; b=QhY8pFV9xRcep47fHP2dAOsQrEbbvpJO0WfQ6Tt6nZlnnZvkiLnKWT5k/fB/Bt9IPqVFzLYXIIpEq3aW2A/PqAai4ZlFbHKEAakV6pD+JKkzYvt9s6EukFEerjT8IKS0fDGmQy8Thj7hM4S3RSMgunzO7tv1zfXe6l/dxFo3420=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767853186; c=relaxed/simple;
	bh=HYnffbKyuaw6XHySFOtr9UCz1xVuy8BZRe0bwkFF+Yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VZSwe4eqpGXi/5HR+QKC5F0IyHBGnFpc8adDW4aHMstWsNvx2d/D3tHI+OLYYde0JRcsfBNlQKe9vb2bgtEhF35W/C+8dKBP9tKDJAUlwIuHRhhQC+6gp8XJVjHXsfno/gPs22GLrlijdP2k42AzAaPxfQN/n08D5OJN8winfG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pp7sYNKB; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2ae24015dc0so849106eec.1
        for <linux-input@vger.kernel.org>; Wed, 07 Jan 2026 22:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767853184; x=1768457984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=17ei/xNbhYmcpPww+lpD4Z557zYGxCMUl9YLUhJSdwo=;
        b=Pp7sYNKBfkooichFjYL0dop1b8l+xjVJ9bETHrpCHFWJwn2EzfFS4NJfnFRwMrjcXu
         +5UWUd4yLAXEu96npyQ3BCuxsmc/qlTwClx+x+sZatU62AbiYxydd4FRONEWjCMFFURm
         Qc4yKgAkXCoRn9GbgT9akbicqB0ePuJC+/Xzho5ycAiMPoVQE7b7hd/aDBfz8ns8JY+U
         d/Obmvp3UKeJIQpGAyhJRT/UXQHMTCe/SqB+oUFC1droSfBbE7Kd+DzrlyzY2SNExKLN
         xwrEHqdR4mL13I56t4CVUqzwCqOiwIxtiiz92gidIIbg4aq/u678lXmnTZ9NRJt+b/qw
         4PBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767853184; x=1768457984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=17ei/xNbhYmcpPww+lpD4Z557zYGxCMUl9YLUhJSdwo=;
        b=uag91WaGC/wlLhw1DhnWo+A2GnSKDCpZCxcjkqhHI5t5+KWpYuU7uChQ5gLDY+ZkoV
         hIA5gI386jnz5mIzB32mGK8Sexjmk4MgfSqMUPcS+knzp9WwT7r3KpRckP+dZIquqN3h
         g3q+GjDmCf9Wq+La3j4zOxH+WuSeqxW6o7lmmYgXZSeXFNvL4W/0ondebAicQ6+vuvjB
         6/GSIh2PBl1KyONe883zJhJBQU7tQmnovIc1o7vHPGTG6Ny4R6hk3faH7ftwJJB3bLoG
         5OD91UrgMMXJtKP4fP3zkyOEYgR10Xt9ATsOxd0ElZKO7Yr6Llfd8Zt8N2237mzKNsR+
         mtZQ==
X-Gm-Message-State: AOJu0YwbdlQhbEbOK6o3Zc74ANvDSyWUxMEp632i3jpZluAmQL0J7kdG
	RE9EMImEthZJfi01h9plD43IpIBSYKba13smJTNsXh/JHNlsx0A3nOQT6Rl+kg==
X-Gm-Gg: AY/fxX7WvzEHY4mtYcgBuMjDPz9WSgPYcQX/e3jed7eKGNCSW7llx0oAcn2r74yyo2d
	DILHioXE3QmcwWeWfe+5TguMCToNXi7aGzn/fVoNBh8phGJ6bvf2tIcLHGjDwtr2dopwiGuMVIu
	b2lmR/2E77Rr0/a7jQddx7Uwrn/bsY6GrOIM9lHfO6oxfy4brG+UqThqyJ3x4BopQJqSJrv5m00
	sc6TRjRMyXbPAcYqfzf99ovTiJe44HwNwhuLC1bOWUxNtf4Agc1vT++py9rBapiLlLhi4oDpetR
	j0gEM2YoVSq54Mt6PhfcXN1y5McqNOfcwG+dKzLr5l/sEY3kyMm0mBlqPuRV6XjqzM51HMheJ5X
	VVJn2u4see8U7G96dVrCgXC/+gQd2oc4SOq1cHI+8Gw7WWjV4xFE7c5DHrzqTJpznwDbPJThL1h
	tDXg+Iqqj4SNegurGgDzY+pOCoZbek8d//fpjqL4MDCbCLGyHS+yUr
X-Google-Smtp-Source: AGHT+IG4qJ4BHuBHU5Jxx4pdXH69VYlhOZ38sMDGmnkXIoUdhWlNzmCsqFRaS1wsP4MpJ3AJaqu7Ww==
X-Received: by 2002:a05:7300:d111:b0:2b1:4380:8be5 with SMTP id 5a478bee46e88-2b16fe5a4c0mr4456878eec.12.1767853183393;
        Wed, 07 Jan 2026 22:19:43 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:9ba6:5756:408d:48e0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1775fe27dsm6261313eec.29.2026.01.07.22.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 22:19:42 -0800 (PST)
Date: Wed, 7 Jan 2026 22:19:39 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] Input: twl4030 - fix warnings without CONFIG_OF
Message-ID: <cfpoqqua6iv4gtpm6jyonl4tjkdtzz5r6vlwttd3o6tlwwnprq@vclmvb4cyrp3>
References: <20251227115918.76969-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227115918.76969-1-andreas@kemnade.info>

On Sat, Dec 27, 2025 at 12:59:18PM +0100, Andreas Kemnade wrote:
> There are unused variables without CONFIG_OF:
> drivers/input/misc/twl4030-pwrbutton.c:41:44: error: unused variable 'twl4030_chipdata' [-Werror,-Wunused-const-variable]
>    41 | static const struct twl_pwrbutton_chipdata twl4030_chipdata = {
>       |                                            ^~~~~~~~~~~~~~~~
> drivers/input/misc/twl4030-pwrbutton.c:46:44: error: unused variable 'twl6030_chipdata' [-Werror,-Wunused-const-variable]
>    46 | static const struct twl_pwrbutton_chipdata twl6030_chipdata = {
> 
> Fix that by avoiding some #ifdef CONFIG_OF
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512220251.jDE8tKup-lkp@intel.com/
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Applied, thank you.

-- 
Dmitry

