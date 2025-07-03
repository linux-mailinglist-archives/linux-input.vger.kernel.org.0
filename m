Return-Path: <linux-input+bounces-13353-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA170AF6BC1
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 09:39:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 522F33AE55F
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 07:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 031CF295DB2;
	Thu,  3 Jul 2025 07:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J4aiQzDo"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF33F239581;
	Thu,  3 Jul 2025 07:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751528367; cv=none; b=Nz53WZOC2rQWOyz5uwwCdwCwp1x+Qtpo1LbQ4+SLF4s10O79jN+HiQrjEoMCF4PmNF4P31IJwJpMyNeNK5nKmxeqwqgJTJ6c7gnpMHTnBx6GbDt7q6jtVyppm3yKUfhw6hn4aCGhwceT5V5zNHqXDcUMqEee2FeH1RQg4K6r9BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751528367; c=relaxed/simple;
	bh=uW1u/UcsWK3iW/vQ5YbnY4HBDYJ6kRRBPaGGddcAT3c=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GbdnF0y3tYoy5qmAj9csaICr5Vpe7vx9IUPravch4VyJMJ/uspBZOp9qBpD+hkjxNJVLDO61JpWyQgbQrnwjHySfnHVEyETHEe1ix4Fg4O5oy5Aifd5SJQocXMF2T9tz5TKUo3DPzMibdA1cLjp0GoOkdrxUi56k0tqVzOGBgt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J4aiQzDo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AAE3C4CEE3;
	Thu,  3 Jul 2025 07:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751528367;
	bh=uW1u/UcsWK3iW/vQ5YbnY4HBDYJ6kRRBPaGGddcAT3c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=J4aiQzDoX5+XWYXHomRmAIRYthZYEeVip57Nk+oHPoOhPys7XCKXGdiW5mwGs4aIp
	 uOwMwqafnB8ysUL7lPuH1VrvB780ehsR3haf2P11b8LIOKRZ3JmVH/xnmrU0id4Sw9
	 AvvHujTcnmQ3ap+hu0hQJPEiFLZg2GfhOnRkIrUoZTSG0rlp7uMQ6LGnU2sknQu2P/
	 RuVfU2z0k2KaJfwMqRoXl1bHGyNzfW2iz2pmLr3GgL3L/dLrfNqYtIYJnv8YBKNRQK
	 WtAZOnXgN3qW7YZjIOhBwlNGYoCvSaHP4h6nUO+7JR0XcnIaHZYpYoOgVpSJTdypSo
	 i3XsEbBqhqOIw==
Date: Thu, 3 Jul 2025 09:39:24 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Leonard Dizon <leonard@snekbyte.com>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: elecom: add support for ELECOM HUGE 019B variant
In-Reply-To: <20250629214830.30220-1-leonard@snekbyte.com>
Message-ID: <7nn7607o-7n8q-pq68-256s-2690n0p86r7q@xreary.bet>
References: <20250629214830.30220-1-leonard@snekbyte.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Jun 2025, Leonard Dizon wrote:

> The ELECOM M-HT1DRBK trackball has an additional device ID (056E:019B)
> not yet recognized by the driver, despite using the same report
> descriptor as earlier variants. This patch adds the new ID and applies
> the same fixups, enabling all 8 buttons to function properly.

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


