Return-Path: <linux-input+bounces-15066-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B383B99831
	for <lists+linux-input@lfdr.de>; Wed, 24 Sep 2025 12:56:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D01F23B9F53
	for <lists+linux-input@lfdr.de>; Wed, 24 Sep 2025 10:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73E32E1C65;
	Wed, 24 Sep 2025 10:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YpMNKkal"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7ED2E1746;
	Wed, 24 Sep 2025 10:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758711380; cv=none; b=aSxyMuDv3JwnsDCk1ia6XUiXoKOBBYhp0tf8YZ3XbVccDFmH1r+xpSEFx7k+Uzqj5zkAUpmE/qj8SBOsjYst/cLlFO2uEx2WPXzs3iBmqB8RhaA7u7IT/BWGzREmoKI0iqbCqMiJCpiIU6tm3xF95n9puKTox6yc4wAKGneoREo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758711380; c=relaxed/simple;
	bh=76i0+329ATIkj0i3cFoTgQOCp61nFyqRSdjigAjCKdM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MCqXfa5DvNmwMkFVfmOoZLGgUSLekjxb4eAHYDZWjHJ4ariTyB0E83IfZJwn5Yoa62UWxWgmx/0P8b9T5sWaT5eNJ6b65J1jX7PI2EY54qneF7j5D42NwZKeCqAIfnz4SWseZnKfaaw8jpmYDn2p8Rc/2diLvM2pvu6nTnMemaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YpMNKkal; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73575C4CEF0;
	Wed, 24 Sep 2025 10:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758711380;
	bh=76i0+329ATIkj0i3cFoTgQOCp61nFyqRSdjigAjCKdM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YpMNKkalaEMaddYhnw7BYgLUjstgVDkzWvSC/Phase/Xb3ytaMJmcj45zYUx7j5P+
	 /l+AV0kjH6MpHBAuSJo/eFhrZVvpH6bkOzV5aBPqiiEBegYbrQqbVnINthbPG4pvMT
	 +pTlhY//PohkQiAjg3cx01tu0yOwGWv3J4IHsujJQCtLKODcdDW/w0OgOYI7MxxzIe
	 F6ZRGGWyDahaftgc9F5hcQjI05JcUwPMizergsHr2VvCV7Nwr9gj1HULAi9XM+5Qgb
	 AqZzgCX62hIOIdD78vBZAjV9uwAl0u8Fk+LGUfupqRKvKEt27P8PXQGHKjt065/vhI
	 vlBb2Ep5cxQWA==
Date: Wed, 24 Sep 2025 12:56:16 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
cc: Roderick Colenbrander <roderick.colenbrander@sony.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, kernel@collabora.com, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Trivial fixes for recent HID playstation changes
In-Reply-To: <20250923-ps5-hid-fixes-v1-0-4b994c54e512@collabora.com>
Message-ID: <184776rp-o981-7p6o-41nr-3p1394q31p98@xreary.bet>
References: <20250923-ps5-hid-fixes-v1-0-4b994c54e512@collabora.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 23 Sep 2025, Cristian Ciocaltea wrote:

> This patchset aims to address a few trivial issues reported on the
> recently queued series [1] which added support for audio jack handling
> on DualSense PS5.
> 
> [1] https://lore.kernel.org/all/20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com/
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Cristian Ciocaltea (3):
>       HID: playstation: Update SP preamp gain comment line
>       HID: playstation: Silence sparse warnings for locking context imbalances
>       HID: playstation: Switch to scoped_guard() in {dualsense|dualshock4}_output_worker()
> 
>  drivers/hid/hid-playstation.c | 270 +++++++++++++++++++++---------------------
>  1 file changed, 137 insertions(+), 133 deletions(-)

Applied on top of hid.git#for-6.18/playstation. Thanks,

-- 
Jiri Kosina
SUSE Labs


