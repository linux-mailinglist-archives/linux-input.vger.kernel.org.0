Return-Path: <linux-input+bounces-13952-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF46B22B80
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 17:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9145F5010BA
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 15:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02AC32F5463;
	Tue, 12 Aug 2025 15:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fZ9GWTw5"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36282F5460
	for <linux-input@vger.kernel.org>; Tue, 12 Aug 2025 15:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755011673; cv=none; b=nz3BkXQAmngWw/Dz+BOAZNafMQtX1+fbiRow1C+Niv+SChCQtjZX9gEEOxg11VUDwJ4g/owNL88kdi0utED0HKZsHoQ7wfpDryFGZcc3bOqCRnTJCP8L3psLXe6U3KsjuCCcjQ4rvVnv2+jJn1+SQoxPvKdgsQFf4YCL0MdhAx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755011673; c=relaxed/simple;
	bh=NeOGmFH9K/WXNoKIzCQd5wqxX7/ytlrv/gzp+iMCEl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HB1mZ0EzC/AEg1FgS9t9uV7QyO3ux0/oBDP6p3lWoWtHcfR5pq0zhnxXGkShC8zvw7bi5OwD9TDjufUgK8zJsaOc0S1yyhjRiksSAwh5wwNPGA3aLR9zIgybykvWH+xd4shZfb+ybpfgTWyh2Y3Omu6A3fs1KsfdF8shaVN2hQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fZ9GWTw5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D51DC4CEF1;
	Tue, 12 Aug 2025 15:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755011673;
	bh=NeOGmFH9K/WXNoKIzCQd5wqxX7/ytlrv/gzp+iMCEl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fZ9GWTw5Cfhaj8iGUeMzjpi8D8g/4GBaLwYVsUqRf0iJ0L/U8mTgRUq2VoZAhhLH0
	 Ybf3wZ7/tdqVNUe9flqkm78fwhvKW0MGPKsqcgeTl4XyBkJKMPv0UJd9domGWBkP0w
	 Y9RgM0sXnb6FS+y2HzlTAWS3/UF74Flu47ffnlODcqmB5yHIvAnkN6das7NwNJ0iQc
	 UN6JieTLciFAW6Wc1ziQHj6+cHgZ2AQLJC6P3SSa0DhYdUpVng05TH8Kfad2Oxm34Z
	 2pyOO2lJqyWM9Oxt9K3N4CeCMPZzHcM++9G+K/olNTzmZSkn8PEpMb8QUwqruvdv6D
	 xZYQSTBgo6dPA==
Date: Tue, 12 Aug 2025 17:14:29 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: "Cheng, Ping" <Ping.Cheng@wacom.com>
Cc: Jiri Kosina <jikos@kernel.org>, Ping Cheng <pinglinux@gmail.com>, 
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "Dmitry.Torokhov@gmail.com" <Dmitry.Torokhov@gmail.com>, 
	"stable@kernel.org" <stable@kernel.org>
Subject: Re: [PATCH 1/2] HID: input: map HID_GD_Z to ABS_DISTANCE for
 stylus/pen
Message-ID: <qylywmhjcciqyqbyyoa5lmgdne3mcfexbzy2lk36mhhindepf7@laz3kov67brd>
References: <20250710212859.7892-1-ping.cheng@wacom.com>
 <29911p88-1n01-s610-9opn-98n874r84srr@xreary.bet>
 <GV2PR07MB9153ED83B6705961417EA1969B2BA@GV2PR07MB9153.eurprd07.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <GV2PR07MB9153ED83B6705961417EA1969B2BA@GV2PR07MB9153.eurprd07.prod.outlook.com>

On Aug 12 2025, Cheng, Ping wrote:
> Hi Jiri,
> 
> Please revert this patchset since I need help from Benjamin to make the selftest real. Patch 2 does not do its job...

Furthermore:
  CC      drivers/hid/hid-input.o
drivers/hid/hid-input.c: In function 'hidinput_configure_usage':
drivers/hid/hid-input.c:863:28: error: this statement may fall through [-Werror=implicit-fallthrough=]
  863 |                         if ((field->application & 0xff) == 0x02) {
      |                            ^
drivers/hid/hid-input.c:872:17: note: here
  872 |                 case HID_GD_X: case HID_GD_Y:
      |                 ^~~~

So this breaks compilation entirely :(

[Sorry I'm just back from vacations, and hadn't had the time to look at
the pile of emails]

Cheers,
Benjamin

> 
> Thank you for your effort. And sorry for the trouble.
> Ping
> 
> ________________________________________
> From: Jiri Kosina <jikos@kernel.org>
> Sent: Tuesday, August 12, 2025 5:35 AM
> To: Ping Cheng <pinglinux@gmail.com>
> Cc: linux-input@vger.kernel.org <linux-input@vger.kernel.org>; bentiss@kernel.org <bentiss@kernel.org>; Dmitry.Torokhov@gmail.com <Dmitry.Torokhov@gmail.com>; stable@kernel.org <stable@kernel.org>; Cheng, Ping <Ping.Cheng@wacom.com>
> Subject: Re: [PATCH 1/2] HID: input: map HID_GD_Z to ABS_DISTANCE for stylus/pen
> 
> Both applied to hid.git#for-6.18/core, thanks.
> 
> --
> Jiri Kosina
> SUSE Labs

