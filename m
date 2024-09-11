Return-Path: <linux-input+bounces-6428-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3B09753E4
	for <lists+linux-input@lfdr.de>; Wed, 11 Sep 2024 15:30:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8447B2A9FB
	for <lists+linux-input@lfdr.de>; Wed, 11 Sep 2024 13:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B276719E98A;
	Wed, 11 Sep 2024 13:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UWaz+yrq"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8949419AA75;
	Wed, 11 Sep 2024 13:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726061255; cv=none; b=RZkFImBm3z3k832OTXWW/rlQWZRMSvD28AqawbQIwzbjhQG+K+6v/U8X6RUc3Cor43eZuehcTol3dS5xNa2csqEh9N9Bhdy4cdvlAY4mJ3g9/p5wynNJ3bH2e9QGfCqKfBIKAgK/jHS23unjve2G8fpqjwGUh37GB13Ns8hXzqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726061255; c=relaxed/simple;
	bh=hF9dYVCS3vly2WlFPc10Cns5wqCjgWCSMSafGcZPa64=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bD3BQunsi1jmd3c7OURinFYYCVGcaVtZIvyaow50h0Y2b+IoP/GN5d9eajFOX24QcZSsoUsFKD+mVavc0U6JSxQ2TMoz/rsMCiMd/Zfm8+dXZ73BxT4xcM3uclEsfXeNt/Em/JwTbzARm7GcHWD4Kq64qkMdTjYyCEn2D3/pSxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UWaz+yrq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF9EEC4CEC7;
	Wed, 11 Sep 2024 13:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726061255;
	bh=hF9dYVCS3vly2WlFPc10Cns5wqCjgWCSMSafGcZPa64=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UWaz+yrqT2XvLE4jkeXeE8WI6AD8saXYQC3mSNUbWm5gZdtC4jobDTrIZzaa0N70C
	 Ej4ftboWidIGh3MhmujgNCVzwDdJ/S7zLjXRZdNhhJDs74F7V0vaboKmZJYadro7Kz
	 nrsUmFar6yjK/RDuX3NUv3Y9CjIh8oE5AvPM3OA3w+aiSf0VpCXTWlodSA2TEPHuDz
	 akNq2xseGMogjRUg4n976PjJkHorS6fpBnY5ePFRPeTkdk2viGo5SQxUbWLB6Pdx1E
	 TZlrNBDj+YY35DCelAjM2t99vt4m8vRjKRH3WMnC/B9XkvjOq89uQqtk17Rfu1KWfs
	 V6eaVqhPLIGuw==
Date: Wed, 11 Sep 2024 15:27:32 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc: ". Benjamin Tissoires" <bentiss@kernel.org>, 
    Douglas Anderson <dianders@chromium.org>, 
    Hans de Goede <hdegoede@redhat.com>, Kenny Levinsen <kl@kl.wtf>, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: i2c-hid: ensure various commands do not interfere
 with each other
In-Reply-To: <Zt9clAu04BinzIcd@google.com>
Message-ID: <nycvar.YFH.7.76.2409111526450.31206@cbobk.fhfr.pm>
References: <Zt9clAu04BinzIcd@google.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 9 Sep 2024, Dmitry Torokhov wrote:

> i2c-hid uses 2 shared buffers: command and "raw" input buffer for
> sending requests to peripherals and read data from peripherals when
> executing variety of commands. Such commands include reading of HID
> registers, requesting particular power mode, getting and setting
> reports and so on. Because all such requests use the same 2 buffers
> they should not execute simultaneously.
> 
> Fix this by introducing "cmd_lock" mutex and acquire it whenever
> we needs to access ihid->cmdbuf or idid->rawbuf.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks for the fix, Dmitry. Out of curiosity, did you find it by code 
inspection, or have you actually seen it happening for real, making the 
driver misbehave?

Thanks,

-- 
Jiri Kosina
SUSE Labs


