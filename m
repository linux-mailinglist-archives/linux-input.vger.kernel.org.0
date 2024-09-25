Return-Path: <linux-input+bounces-6720-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAD19867DB
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 22:51:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADB6C1C2370E
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 20:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64671142E6F;
	Wed, 25 Sep 2024 20:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JuLbMVFD"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378AD130E58;
	Wed, 25 Sep 2024 20:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727297467; cv=none; b=ZhcUS+3jUltxHxVSDd9uqAeFvi6KQL12vX8RV8edxDrQcAhm3BabJjEIO0ZYHRjBorzSN4Z8k1tXOzm1pwQ8QffrR5g8As2h/V2xl4yzkVHOZMYdofwVD5aN90kNZJADjvYlZ4MyNoQcg/64Up0VUvsBxjNWmv/mLb7yDI5vKPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727297467; c=relaxed/simple;
	bh=qlNOe+qn/Ih8XUFiyDGvR6ThhF6SmLlkMOkHMZ1MnNo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sPKEJoIkEaw1OHRqGKf60JZjmUItgebNPmyvVR+V/Yg8osyWwBChdRd44ZrryUMrcFVJOKjYcEC9DF+ZXBb6DYg8ysIxYf2EFslc3aqGT/yQmarYrIHI2riK9CINfSIujDrAISHrjet+ioG6PyeuHaoBlFhAjE5lO/gqYUFRqqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JuLbMVFD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A619C4CEC3;
	Wed, 25 Sep 2024 20:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727297466;
	bh=qlNOe+qn/Ih8XUFiyDGvR6ThhF6SmLlkMOkHMZ1MnNo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JuLbMVFD5V8Pf4ELlUfOk42/PSwr5/GvUNSrDNrWBIqlr2hT0oAex80mOUcVO6elF
	 3KVT9DN1kK+eaA+mkCuzIFIU59UFMLDRZAabfyMmFb/AcQUa1wUX20qlH5Pd/b8vON
	 EHOZRDY4o8IPiuPvUFz3U8GYEka33rPR0e2JF3ZjM6eRC56naBUT5doDml5YL9qkOz
	 AilTwOfvjE+gwC4pTsRvkjTb/xQTe505Olw7zOpKvrsWeFXHGcjVpB8jLQgFe/GbO4
	 6zI3y7Bm2e+zPMGCOCz54vZxE29pk6fJ92U/uPo9Kug8QqWbi1bSqsM++hriUoNw3N
	 gqpGTs9a1AW+w==
Date: Wed, 25 Sep 2024 22:51:04 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Rob Herring <robh@kernel.org>
cc: Charles Wang <charles.goodix@gmail.com>, dmitry.torokhov@gmail.com, 
    dianders@chromium.org, dan.carpenter@linaro.org, conor@kernel.org, 
    krzk+dt@kernel.org, bentiss@kernel.org, hbarnor@chromium.org, 
    linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
    linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v7 2/2] dt-bindings: input: Goodix SPI HID Touchscreen
In-Reply-To: <CAL_Jsq+6fvCaxLexo9c6zs+8vwyfPAOCCVsejw_uKURVU-Md9w@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2409252250330.31206@cbobk.fhfr.pm>
References: <20240814024513.164199-1-charles.goodix@gmail.com> <20240814024513.164199-3-charles.goodix@gmail.com> <CAL_Jsq+QfTtRj_JCqXzktQ49H8VUnztVuaBjvvkg3fwEHniUHw@mail.gmail.com> <CAL_JsqKUDj6vrWMVVBHrDeXdb3ogsMb3NUbV6OjKR-EhLLZuGg@mail.gmail.com>
 <CAL_Jsq+6fvCaxLexo9c6zs+8vwyfPAOCCVsejw_uKURVU-Md9w@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Sep 2024, Rob Herring wrote:

> Still an issue and no response. Please fix or revert the series.

Reverts are now queued in hid.git#for-6.12/upstream-fixes and I will be 
sending them to Linus ASAP.

Sorry for the delay,

-- 
Jiri Kosina
SUSE Labs


