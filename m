Return-Path: <linux-input+bounces-5076-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 270DA9347EE
	for <lists+linux-input@lfdr.de>; Thu, 18 Jul 2024 08:17:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5824B1C215EC
	for <lists+linux-input@lfdr.de>; Thu, 18 Jul 2024 06:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33AA16BB4B;
	Thu, 18 Jul 2024 06:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dxQ0VIpc"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5F06A8D2
	for <linux-input@vger.kernel.org>; Thu, 18 Jul 2024 06:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721283442; cv=none; b=la7JFvsDy/OWA63VVmScQtW1PtFzyolFk/vQ0qTAXUuCpE6yFi1xVI3lrz3RvoV6bvKfq9ZK8b171ZjqYN8kVHNRhQ8Hfo21Jy/2JUc6uUn242zPckNt9fHXhDRMIdcbI2xZFcFQJvKZcQuG2ADK959a7a74y7P3nRDMhBvTjuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721283442; c=relaxed/simple;
	bh=L6O4zzMSWkGhL/OcM5pQdpaoXlWRGewbfS5bqAlrdKo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=U5DZRqQxaBS+V54l5L0EOFLHvSiJmoPppFVxkqBmGvhI28Am7kFeudMsxXCSETreVxwUr36y25OBzs0al5U52zKpxsoQPL/JjCX5NThOLAGUjr2csBqmuuB8q0xk1amrNBV0xqcaGwvzG+nBQCWNJ4bI5djV6MKtxrASpcr25HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dxQ0VIpc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA16C116B1;
	Thu, 18 Jul 2024 06:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721283441;
	bh=L6O4zzMSWkGhL/OcM5pQdpaoXlWRGewbfS5bqAlrdKo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dxQ0VIpcyPrGUq4K0ZtmK98jP15i9boJAPy8z8hOwlm4pO/IKMOV+z6UFoQ8LH126
	 U9h5uE3eX7opvI8Twzannf1N7erwxqM3d+ZjUu3uio3fCaQ7QLhGhWnkotXGijHleB
	 B7+yatJQxnPNn3Duq1sfpSt3WCvaAvMGzgSxXkXB3gTHtMPYx6nbodAJADo4yMw5e4
	 syuvoZq9x+8MYhfHtrgaLwqhxnLieXOnlfFJ+Uqfr0i2DW0fBsuqL9efyqB/8bYA+q
	 hOMAJFx3A//ukO/RnlKDaqcN1Z+29HbzC18OT+Wx1tqQj7XWow5jUnPnCM0iVOasnH
	 Tu5rK+Q8c2Vdw==
From: Benjamin Tissoires <bentiss@kernel.org>
To: linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <bentiss@kernel.org>, 
 Tatsunosuke Tobita <tatsunosuke.wacom@gmail.com>
Cc: Ping Cheng <pinglinux@gmail.com>, Jason Gerecke <killertofu@gmail.com>, 
 Erin Armstrong Skomra <skomra@gmail.com>, 
 Joshua Dickens <Joshua@Joshua-Dickens.com>, 
 Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>, stable@kernel.org
In-Reply-To: <20240709055729.17158-1-tatsunosuke.wacom@gmail.com>
References: <20240709055729.17158-1-tatsunosuke.wacom@gmail.com>
Subject: Re: [PATCH 1/2] HID:wacom: Modify pen IDs
Message-Id: <172128343883.604474.16435274096325819656.b4-ty@kernel.org>
Date: Thu, 18 Jul 2024 08:17:18 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 09 Jul 2024 14:57:28 +0900, Tatsunosuke Tobita wrote:
> The pen ID, 0x80842, was not the correct ID for wacom driver to
> treat. The ID was corrected to 0x8842.
> Also, 0x4200 was not the expected ID used on any Wacom device.
> Therefore, 0x4200 was removed.
> 
> 

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git (for-6.11/upstream-fixes), thanks!

[1/2] HID:wacom: Modify pen IDs
      https://git.kernel.org/hid/hid/c/f0d17d696dfc
[2/2] HID: wacom: more appropriate tool type categorization
      https://git.kernel.org/hid/hid/c/9c2913b962da

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


