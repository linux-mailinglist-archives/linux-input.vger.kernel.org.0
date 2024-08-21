Return-Path: <linux-input+bounces-5728-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2578F959FF7
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2024 16:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D247A1F217B7
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2024 14:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD4601B2518;
	Wed, 21 Aug 2024 14:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HfzvmN//"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842111AF4F3;
	Wed, 21 Aug 2024 14:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724250798; cv=none; b=N4373ahd2VEYc953NcTWJo4HADBCd3CdDodpi/5eP/+mfTb3thxKzs7H+2x/opzxd6quF5DBNT3ryh39H3wAD0YHqvE+cFI4OcKDQm8peeKDvVhzcaTs4sPnXpxN5jQR+kBbnOR85BrsYywtML/9SQRf6v51ybZHrTdTXDnYtHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724250798; c=relaxed/simple;
	bh=X8JOxSvEgYVbrK3j4/Xqr7CjDPt7qcuUM5gWl3PyeZs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HAGeKbUxJuDBkt732N1hyDW8O5gWc1gfP5rDaDFta3LOfDl3GfcTKgfze8NnhnDkupcES1lF/WO/ihTYoOlXcxuE66vtHB8WufySiYqz/4AFvv8J1ZaB+v9FHGoAuaVx9D6GQ9Nep5u4CujuQAyBzhQiLr4kbNgiZJzSGdgGjXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HfzvmN//; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0299C32786;
	Wed, 21 Aug 2024 14:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724250798;
	bh=X8JOxSvEgYVbrK3j4/Xqr7CjDPt7qcuUM5gWl3PyeZs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HfzvmN//9NzBMx9qn81UvxYYnUo3+VYYJ4ZyTdv7TVwtaZ9aq/keisfhnNU3FJbIj
	 6VojIYbXE+ytp/fEmKaEgsKOPXh/wAOzw/m2xriG+UTqgv0DVO47xeluII+/f5Dd6a
	 K/hOTnGjKbzmv1BzGvqXp15Gdd36Xe+u+qPooqeHGUrJagpQ5cYbGuFXOiyhS7yJRD
	 D5pZebPQN41VnsVFPXziMtbhaWLySTUO/xDCBXUSAB3eF8ctPxx3br9Q8vw+F320uT
	 KDp08wu6ZVhT1Juyo4xPSsN3XwXEb0n8hOQSqHJlzxE8RkxVgxXu+UHbjoZDXKGZtZ
	 NLlSwbm6OaNLg==
Date: Wed, 21 Aug 2024 16:33:15 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Max Staudt <max@enpas.org>
cc: Roderick Colenbrander <roderick.colenbrander@sony.com>, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] hid-playstation: DS4: Update rumble and lightbar
 together
In-Reply-To: <20240820142529.9380-1-max@enpas.org>
Message-ID: <nycvar.YFH.7.76.2408211632590.12664@cbobk.fhfr.pm>
References: <20240820142529.9380-1-max@enpas.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Aug 2024, Max Staudt wrote:

> Some 3rd party gamepads expect updates to rumble and lightbar together,
> and setting one may cancel the other.
> 
> Let's maximise compatibility for these controllers by sending rumble
> and lightbar updates together, even when only one has been scheduled.
> 
> The quirky controllers are matched by a known CRC32 over their HID
> report descriptor (hdev->rdesc), since they seem to share the same
> descriptor, while pretending to be a Sony DS4 v2.0.
> 
> Signed-off-by: Max Staudt <max@enpas.org>

Roderick, does you Ack from v2 still hold?

Thanks,

-- 
Jiri Kosina
SUSE Labs


