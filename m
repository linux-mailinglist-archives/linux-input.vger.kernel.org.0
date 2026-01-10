Return-Path: <linux-input+bounces-16933-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9408CD0D3E6
	for <lists+linux-input@lfdr.de>; Sat, 10 Jan 2026 10:23:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE0B3301989A
	for <lists+linux-input@lfdr.de>; Sat, 10 Jan 2026 09:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E455E231836;
	Sat, 10 Jan 2026 09:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aBKeqjIp"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF90F50097C;
	Sat, 10 Jan 2026 09:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768036972; cv=none; b=bQaNG4lC+74PqugFKfmuPdT0HoyFGS5fDiB44lMBEdif8NEnDL+QfkVJa4cgPKZnsMQppoVmKP2RngiTn3Y8wP3m3TODl4NXXvjLRcTwelFHB7GnVszbqudFRXLK9020G5P/sCR00gUp1Z4lKnBE6eFGpmxAAJ7pJcfB3juGd9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768036972; c=relaxed/simple;
	bh=QbIlpcbsjBNbIQhkp2k/YXPOEBkVBxnERNX2Ic9IQts=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=C0okM4qZS8qwT1lhuB64oDdIhVTHU95xBcd2laTMLUdRxzGL6IutgkQ6Pzac9fqtmZRKDguUyy9bWud0GHsXiTcijSdvwWiXS8qCYmc+GC0/jr6IgUcd1WqqNRart1yKHpnT190aTpHh1z5lFjOjDSzhM8j57LezyBNIVbmuq1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aBKeqjIp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE708C4CEF1;
	Sat, 10 Jan 2026 09:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768036972;
	bh=QbIlpcbsjBNbIQhkp2k/YXPOEBkVBxnERNX2Ic9IQts=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aBKeqjIp6LcrrP0Bo/39ynTbIBTENluOt31YefnPrJ8C0Gzmc/iYJmoxNmcwNvW56
	 FUZfZWLYFv9X3IoRZKmMAnbP82QeyW03UJg4eBpfjIgETcTkbMi7vNbHbOMaBOE8tO
	 kdbKs8d/SkLcrJ0zJR21k4dl22rCRrb05Xr3439/nnKDTCllL0Us3n/QklYQXLDXPt
	 01WW5V8CpZGmmDUcySdroobejLR0YPMeCgZPS0LojoSWQmFyP6RcC32UrS2J31+a0k
	 TVIVynBz97j0okm/l9Fvs8vRPyW5av0bAlxulhqEt1Juo7Ao3MagEi/OZoo1k4pQx/
	 000nlaN6peMKQ==
Date: Sat, 10 Jan 2026 10:22:49 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Rosalie Wanders <rosalie@mailbox.org>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: sony: add support for Rock Band 4 PS4 and PS5
 guitars
In-Reply-To: <20260102211228.82324-2-rosalie@mailbox.org>
Message-ID: <o8s467n6-r859-pp5r-s849-o640rq7s6pps@xreary.bet>
References: <20260102211228.82324-2-rosalie@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 2 Jan 2026, Rosalie Wanders wrote:

> This commit adds support for the PDP RiffMaster and the CRKD Gibson SG
> in both their PS4 and PS5 modes.
> 
> These devices aren't mapped correctly without these changes, they also
> lack support for their whammy and tilt functionality which this patch
> adds support for by binding them to the left and right triggers.
> 
> Signed-off-by: Rosalie Wanders <rosalie@mailbox.org>

Applied to hid.git#for-6.20/sony. Thanks,

-- 
Jiri Kosina
SUSE Labs


