Return-Path: <linux-input+bounces-12976-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2079AE1474
	for <lists+linux-input@lfdr.de>; Fri, 20 Jun 2025 09:02:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64459189935D
	for <lists+linux-input@lfdr.de>; Fri, 20 Jun 2025 07:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B266E220686;
	Fri, 20 Jun 2025 07:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HpggF/VY"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857422045B5;
	Fri, 20 Jun 2025 07:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750402917; cv=none; b=hJSShJCwlFwfukJl5Hph8hdOwfQfPLaSyUMJRT4NCJMmgi5ezZOzQVYqWVTDtasxHVNS1luys9Ih7WOMKjx2Fb3UbhiAi/yffSNkuQaGG6MSxE5gGt6eeojJQiwcX/x9yKQHWj5Ix9PMXDh8Da9LZD+sYqLY1Lf6f+tXo1PTPRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750402917; c=relaxed/simple;
	bh=qeRxRMC63vK7esxYHm7vImv1jfMfKj7T6FnswfwrHaQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WvFyF4QLpVX1/0IV1M/+M8PHxFTHLMcxZMLZLoDB+bCUk+2qV6OLUs/dVOlW6FphzoONPJ6sv8m5DYYD43z74jPvcyQRkOT3TJbDdBz9G3DKx1kKizC7lMfQmJOdq8UV2LVOO2nLU2WE8DPpVLCoNoxzv4wi+WKbx7mvsi0ubas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HpggF/VY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E371C4CEE3;
	Fri, 20 Jun 2025 07:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750402917;
	bh=qeRxRMC63vK7esxYHm7vImv1jfMfKj7T6FnswfwrHaQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HpggF/VY8C+Dsf7DY5i0UzBpXqEzPASrqq7wNsszOz5b7TghTljZxk3Y4L2biSi6g
	 g/8KN28Pvu4Spku6UyvF0yjYTB1bbTzXw4sLIRK7U7/aZH8BqrgdFgCBo6WQyXm8uw
	 txWIZ+iaIJE5C8ls0tmSS6k6UvYirUye9xN/S+RfRhRCWpvRNEM45eBZ5SfL6m6rES
	 qQVSxrXCSNVCzK8VByBgmUNErzvsUDZ6LB2lbTODPO+917cqSewp8WkmMKKXq8SVp3
	 LLNKIoPdHLu1QaBAvN+/Dp6ws8zeVP/uZzy9/Z9W015GnR+fm/bubrm2vjh1jPbMux
	 PvsAT9Y8Oc+JA==
Date: Fri, 20 Jun 2025 09:01:53 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Qasim Ijaz <qasdev00@gmail.com>
cc: bentiss@kernel.org, gargaditya08@live.com, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] HID: appletb-kbd: fix "appletb_backlight" backlight
 device reference counting
In-Reply-To: <20250615225941.18320-1-qasdev00@gmail.com>
Message-ID: <241po3rp-45q2-0pps-n724-9q87o86r4s69@xreary.bet>
References: <20250615225941.18320-1-qasdev00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 15 Jun 2025, Qasim Ijaz wrote:

> During appletb_kbd_probe, probe attempts to get the backlight device
> by name. When this happens backlight_device_get_by_name looks for a
> device in the backlight class which has name "appletb_backlight" and
> upon finding a match it increments the reference count for the device
> and returns it to the caller. However this reference is never released 
> leading to a reference leak.
> 
> Fix this by decrementing the backlight device reference count on removal
> via put_device and on probe failure.
> 
> Fixes: 93a0fc489481 ("HID: hid-appletb-kbd: add support for automatic brightness control while using the touchbar")
> Cc: stable@vger.kernel.org
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


