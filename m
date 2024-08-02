Return-Path: <linux-input+bounces-5281-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE89945C39
	for <lists+linux-input@lfdr.de>; Fri,  2 Aug 2024 12:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48F48283522
	for <lists+linux-input@lfdr.de>; Fri,  2 Aug 2024 10:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EA6C1DD387;
	Fri,  2 Aug 2024 10:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T3YJaIw7"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BD81DD380;
	Fri,  2 Aug 2024 10:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722595409; cv=none; b=nGbAbsWCZ8a6XAyUL3auJA4FFyIw/zCaQHJlWNyAhttjxIkZ+EEMyy88rxYSBgPA2DhgQRGfITJKeNyVxXKGpXl5Fwf45NNuLWyATgaWxJnpxj7HnqR8coGg4tFojVJ5uc/Qe4R9bD4xAK6pDbGEX0pXN+D6SqufGBaR9A3xwgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722595409; c=relaxed/simple;
	bh=2zM06nc2TA90n+LwF5XaupMyigVTtm59VfJhw2dTozE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FanJDQwttaCX2rSbr/exSaNf7jV1orcpkOya9Gwh93ufRy70xRBzMZAhS3RQ7IFmBSKf1szs5Wo6vFmzI8o2k+ueCvmIOiSQNA0v4BRBsUDMO3jEGwkhA0iAAa7hm1D2DS5HaDXfqBUNZJjTIrwubtNY1aXfxhxq1fpoenWKDjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T3YJaIw7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50E3DC32782;
	Fri,  2 Aug 2024 10:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722595408;
	bh=2zM06nc2TA90n+LwF5XaupMyigVTtm59VfJhw2dTozE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=T3YJaIw7yTcRkOsMAdzk5aTO0OWkHrkizITPjQQuu1ocZpLwsMbvJiQ1wwQMJFACX
	 z6NnJKjuLlhUh3qzoeqJH0+rNnAySccVoUvpQrSQrqIIFjRtDeYDnpSQXYZdTAiAtN
	 WOrcbZ6Wai8gl8aQ1YPbYUAcjKoQRflvN5YcVzCkEHaBXG0o8GLkvoaqdlrvcFGDU6
	 S5Wl6RD8Kyqtv3CuZ4e9qFTHUFq8BkMh2+skxIo/MTJDbc2/Wf4ugzF8ZvJKUaVc85
	 /+HI9czBQ3N/v1oZitDkta/rgsd5KygkAZ8oUfpjS/41SEdAL6ZpDB6/y2rsu9eIsH
	 Je0thQ9CxHHFg==
Date: Fri, 2 Aug 2024 12:43:26 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Aditya Garg <gargaditya08@live.com>
cc: "bentiss@kernel.org" <bentiss@kernel.org>, 
    "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Orlando Chamberlain <orlandoch.dev@gmail.com>, 
    Kerem Karabay <kekrby@gmail.com>
Subject: Re: [PATCH] HID: core: add helper for finding a field with a certain
 usage
In-Reply-To: <3EA8F21F-2C0A-49DB-BD23-224CE9D65A0D@live.com>
Message-ID: <nycvar.YFH.7.76.2408021242550.12664@cbobk.fhfr.pm>
References: <3EA8F21F-2C0A-49DB-BD23-224CE9D65A0D@live.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Jul 2024, Aditya Garg wrote:

> From: Kerem Karabay <kekrby@gmail.com>
> 
> This helper will allow HID drivers to easily determine if they should
> bind to a hid_device by checking for the prescence of a certain field
> when its ID is not enough, which can be the case on USB devices with
> multiple interfaces and/or configurations.

I have extended the changelog with the fact that google-hammer driver is 
also added as user of this API, and applied.

Thanks,

-- 
Jiri Kosina
SUSE Labs


