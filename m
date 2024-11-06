Return-Path: <linux-input+bounces-7893-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BB09BEFD1
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2024 15:09:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE8C41F21621
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2024 14:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317981D95B7;
	Wed,  6 Nov 2024 14:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qeh3SpbD"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085F917DFF2;
	Wed,  6 Nov 2024 14:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730902150; cv=none; b=MCi3xotlxM1B9YH4nfY82F7Z1+I5ZNAUcDVEynXG5pOvUqOecMrzLM8M+h+PoEc0CruNh7W+CGFkQ+0+ocyarzufHmV6c8fTis5XwXedRaui/ez+4IEWMejCvFShCcW5IEqhIf5lTLfokDev/3j30zv+EsyjHHaFx5OjMhUFA38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730902150; c=relaxed/simple;
	bh=LgTHwYDXwEaqnuMELUZ3LAcdNpfVmbkZYKfjm8eMO3Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jylN7JS3J7BnAE7OaHMZrWAaGq8gQaMZuqjAu909cOQhCoei24LP5cI7SofT/BQgihspFAB2ys8arCRqbCEkQjU+dMAFQPnjjUlfH2BexDmQtMMYhMMqXEmrVfxufkZhXIlYA9WQgW2z+w+7ooVuThkxsVlElaBbagMnlIki2tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qeh3SpbD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED39C4CEC6;
	Wed,  6 Nov 2024 14:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730902149;
	bh=LgTHwYDXwEaqnuMELUZ3LAcdNpfVmbkZYKfjm8eMO3Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Qeh3SpbDEcsNtdzdCB0dxgYkt/AY1gN1Ff6xuMg+VOD2FOWI5fnEf6q5+5KxHrGxe
	 d6ALEdhsqxHO0QkEa3Is1rO+6VQFXOp/gTWx0aOoE9oN1GdYirsHcnnTVuU0QoDWWJ
	 7UAG6PIAtOJChmSWLaz6/Sofr618/7dYtig/vBdxYkHYEmGETvhjMHnjN7PbYzTOsY
	 4uXspTy5vDKnPLpEikDNoq5E6r0FKi5BNpgImmnJlf/HgYymuZv+Ois8pKx28bDgtE
	 T4uNxUWVt/SJqcU5jUsljka2Ur7lybbsj+OFAZEgN94OwwBQlmQzq3MEK1mGz8QqEm
	 7GuBl/eaVFqeg==
Date: Wed, 6 Nov 2024 15:09:07 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Charles Wang <charles.goodix@gmail.com>
cc: dmitry.torokhov@gmail.com, hbarnor@chromium.org, bentiss@kernel.org, 
    dianders@chromium.org, dan.carpenter@linaro.org, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] HID: hid-goodix: Improve handling of HID feature
 reports
In-Reply-To: <20241031123113.18843-1-charles.goodix@gmail.com>
Message-ID: <nycvar.YFH.7.76.2411061508530.20286@cbobk.fhfr.pm>
References: <20241031123113.18843-1-charles.goodix@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 31 Oct 2024, Charles Wang wrote:

> The patchset introduces the following two changes:
> 
> 1) Align with the i2c-hid driver by returning 0 instead of -EINVAL when
> an empty response is received, ensuring that userspace programs utilizing
> the hidraw node receive consistent return values.
> 
> 2) Implement the hid get/set feature report function using a separate
> address, rather than sharing an address with coordinate reporting, to
> prevent feature events from being overwritten by coordinate events.
> 
> Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> ---
> Changes in v2:
> - Split the commit into two patches.

Now queued in hid.git#for-6.13/goodix.

Thanks,

-- 
Jiri Kosina
SUSE Labs


