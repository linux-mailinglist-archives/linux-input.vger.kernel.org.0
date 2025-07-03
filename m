Return-Path: <linux-input+bounces-13355-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1645FAF6BDC
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 09:45:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99D72188B6FA
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 07:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6E5299A85;
	Thu,  3 Jul 2025 07:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cMTJ0L/2"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D16299A9C
	for <linux-input@vger.kernel.org>; Thu,  3 Jul 2025 07:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751528698; cv=none; b=gksUSNOkFWB508wesAw3cw/r3/xCLbH6eNe2ee4O6itvorup8fQ7rE0pZHDrgbq4896FF2pDpEsDDNB539VjkcRc6vewOc+qNPD4WPM8VOtA/7BafBQP9rqn5vM2urZXoOAxcW38QbttyQlgG042jgMcQg3GbC6AgyeZw0Fr06s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751528698; c=relaxed/simple;
	bh=VjOXSSpc7yo0IyhbhDNReCULEK0q24KSVFdyfMcp08o=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DZU3RIpW4h4KjTxWtg9BOi7RYw0scRqEHtF8Bn15SEhMB2DhtK22ij2f0Y1PgubM8lFzx+kQY4yCS3g0m6LLxjDjh7n9zmt3gBwtT1oNETtN/Lq9fC7A7BsHYgfeIiOcBBi5WbapuI1eDd2Ou0aU6EBC/Ywip2QPzm7EyLtLkRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cMTJ0L/2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FA10C4CEEE;
	Thu,  3 Jul 2025 07:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751528697;
	bh=VjOXSSpc7yo0IyhbhDNReCULEK0q24KSVFdyfMcp08o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cMTJ0L/25DDIGDWrFQ/E5RIEgbLCP6hpsCBQQ2I/PVHQNpckN2C0GkdNC7WL9KnyI
	 AGPLv1Qnh78D8UEw+4wzY7N118u3jxzplTExjwe9w8+DXfviisUSuQoMeP/lSE/bTx
	 e4iPVDca35yP1D9IIDcupfBKt659obMG7frK3ExNQXacT6yeX1o9e5pC2maDyp9l36
	 Vqnt/JZ6+55J2sFz5vs46NAxXyhJ9OceuiPNU2p96fJAUSLboNl204QZgTy7fkQ8is
	 oulg0W2Y7UQfLSa7kUYPrCUo94eq7k/GsPD3DQR2F/B/CJVkjC7TnMJ6F4JoLByqeD
	 SSOJYyYDtf12A==
Date: Thu, 3 Jul 2025 09:44:54 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Vicki Pfau <vi@endrift.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: Fix debug name for BTN_GEAR_DOWN, BTN_GEAR_UP,
 BTN_WHEEL
In-Reply-To: <20250702034642.124791-1-vi@endrift.com>
Message-ID: <r8831n3q-n077-p703-p73n-9o981r077rp4@xreary.bet>
References: <20250702034642.124791-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 1 Jul 2025, Vicki Pfau wrote:

> The name of BTN_GEAR_DOWN was WheelBtn and BTN_WHEEL was missing. Further,
> BTN_GEAR_UP had a space in its name and no Btn, which is against convention.
> This makes the names BtnGearDown, BtnGearUp, and BtnWheel, fixing the errors
> and matching convention.
> 
> Signed-off-by: Vicki Pfau <vi@endrift.com>

Applied to hid.git#for-6.16/upstream-fixes. Thanks,

-- 
Jiri Kosina
SUSE Labs


