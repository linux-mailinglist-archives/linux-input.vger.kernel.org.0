Return-Path: <linux-input+bounces-16554-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE90CBA7AF
	for <lists+linux-input@lfdr.de>; Sat, 13 Dec 2025 10:34:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 938C4300D54C
	for <lists+linux-input@lfdr.de>; Sat, 13 Dec 2025 09:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF082DA777;
	Sat, 13 Dec 2025 09:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRfmIEqj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE9F1FDA
	for <linux-input@vger.kernel.org>; Sat, 13 Dec 2025 09:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765618457; cv=none; b=G/maZhHKYVi3T2MDpb12GfjlDfcpR7Bk/Ida37097t3y3SCS/n7vcu+7TfuS1+XRmnLeZfXRFvUOzBlbCdpfcUbzA4CuuZLCY86WuoqM+/U+MJc3aWZbLsekRGh4QUzMl8yaAda4wvFjFD6rYOlA1sNL+10+Egt+moHLMpTvMjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765618457; c=relaxed/simple;
	bh=E1BfB7a6p5PuuIvAgq6HgJEOSBswAFgtnmWdF82t2AQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lBzqxoCyRKjdsk5ieGED3takzLvVyrcMDzQLDRC/cpj7rw5CXjZ5FpPg9b1C/fN6aN4WFx0SxJgg1Ib4VkigwrMWanAOvW8nWzSro58yv1yY8YpAnPREjl4Yb7wui+UU5uhqRCiXKzUbl7liW6FA47AXGzAhQ+W5DsSbgcuUPwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jRfmIEqj; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34c21417781so929996a91.3
        for <linux-input@vger.kernel.org>; Sat, 13 Dec 2025 01:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765618454; x=1766223254; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uXB95f4jiQdJGCxFO7KbNjfP7t04rPzHuSyFu4yS3Ts=;
        b=jRfmIEqj3NPfVpM1c29Vh7ESwEYMHP1z9H+BgGG0dvubWyxIRXMs4tPMh4QYR8QR7S
         Y/DSlYyfadhQurm1nVFQFV72r6GQ922jVayFgFgazH7rTLHerDQ+NbfqyLLW8LaeLNes
         Ed1otdXOJ/wtC02RED0b6HFhJTSTSL563cIg7MfTYN0U9Wt1az6sSAbzFBFqSPDC1xwI
         ClBgzKHSgs+9bqJHs47ipIhYOxrX0T4MXmNMsEvFIqgTiw34w7IpWAehKxs2DnDQxJ1k
         /giVvW9FLmEvU87az9XzG0lJJv/rcbLF1xA2selR3H9cjfXP+RWz+oYp5+NNdnZWxqMD
         AjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765618454; x=1766223254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uXB95f4jiQdJGCxFO7KbNjfP7t04rPzHuSyFu4yS3Ts=;
        b=jIQwa9MO/lOoXML9nU3D5490qSjDJ5x3tUF5IVe/xfCtDVIRYIoakUWcjz4zi9O+oC
         FexgCK9fFyQ5gl6iiSx+7DbYlvxyP7KR+tKvg9wJIThm1d9yXtt5doufFApocQdrBD60
         Ai9uardqG67XN7B4vuQBSVXPLl0emHqyUWdxvS4ZpvN2DJuu6htqdoz6TpzpZHMHpnqe
         DBmgcpF2zKVuo7SVu0X2vUxxzOrt+FbfaG5NYPBN4bLjgYgoH4kO6mcs/8vODJ7jGN18
         fKVbpmtUG4xO0DbAXBFp8wmTMhG+jG5crxTEJcKW72mr6qcTrj55jbpKv7ytODGzZQQP
         EN/g==
X-Gm-Message-State: AOJu0Yw0JTo0DP0/HwjMR6p61JB/mhCRMVFVdvlK9qO3kjXEJd5CMlGv
	uT967kGpuGWf1nwZ5vqdo9JcF0rmAXXUNImEra/NufshLGGIry5pSCOH
X-Gm-Gg: AY/fxX57Y+BEeZg/fWfdFzhOUmHZJC1jcXmYshHsWose/W5hG0fvxNOyQPwr87DStSL
	kWHR/qR345V/ysOxo2ApDoDJeDLqUhH5T6mv27AWvNATCXrdnIi1CTAE7Q0YTxmkVviqpstLKgM
	sGkbIrIHG8RFUM1XwVs2mCgkvIaIrjMXeOAZFbMX17l0KC6Cib1vORICHu3ozG3EclJ85C69NCY
	f1h+nB/XAIEfVA3KJxgcSdOSlgXC+I7/b+lC2RlGmMsmJiMvXP6nFP0nGoVOQwWEpeQWRlQojKi
	JZtSiNQUSGVi9eh3N2W8qcznRw96ukUoSZRwZ+8xt2k8NybQrpt13plug70DXwIhksYKrztLCGn
	jF/l/zWheAQaiDCYu1GaeNy7IeUx7UEW8y9wUVs9t/JiponLeUwOlCL87QeGr8XVJhzZEWuctUm
	KzKUs4xBYvyXu/7+EVXh429F/X99A8upQOtZ2shwpWYr2mMDjtYJvY
X-Google-Smtp-Source: AGHT+IFVhUYLtiOfmkmrYMUC0DpKjoBlXToZ1KBfZam8IHPzP+zes6Hjg9oRLqhKqQBVSOwMcT+DOA==
X-Received: by 2002:a05:701a:ca0a:b0:11b:7970:ea3f with SMTP id a92af1059eb24-11f34c4c93fmr3849721c88.25.1765618454057;
        Sat, 13 Dec 2025 01:34:14 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:3478:9150:d4be:149f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2b4867sm26085756c88.6.2025.12.13.01.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 01:34:13 -0800 (PST)
Date: Sat, 13 Dec 2025 01:34:10 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-input@vger.kernel.org, 
	James Ogletree <jogletre@opensource.cirrus.com>, Fred Treven <fred.treven@cirrus.com>, 
	Ben Bright <ben.bright@cirrus.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, patches@opensource.cirrus.com
Subject: Re: [PATCH 1/3] Input: omap4-keypad - Remove redundant
 pm_runtime_mark_last_busy() calls
Message-ID: <gnlzgprc5laaph6ik5x723qapccvzyglpkswnwmq6hlbuku5gu@3clkiqwx2zpk>
References: <20251027115823.391080-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027115823.391080-1-sakari.ailus@linux.intel.com>

On Mon, Oct 27, 2025 at 01:58:21PM +0200, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Applied the lot, thank you.

-- 
Dmitry

