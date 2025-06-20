Return-Path: <linux-input+bounces-12981-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CE8AE14A3
	for <lists+linux-input@lfdr.de>; Fri, 20 Jun 2025 09:15:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4016417F4B4
	for <lists+linux-input@lfdr.de>; Fri, 20 Jun 2025 07:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6A87220F53;
	Fri, 20 Jun 2025 07:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQJJAyx4"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834E8225A2C;
	Fri, 20 Jun 2025 07:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750403715; cv=none; b=e5UJ2Vf3GeCexL1i42/11iJBK6uCA8VymSfT2Sb810M7vq1iBI/wAmM9HqL843u9QbVBFn9SxUsDPQO2vYYuX4uxdPHzbuNxQXPzNo/jkP7B+loVbGy+uKMlaVLOSx0GxjoBMX74j7p8vukwVV61DPuThQpfzTPESlxjpr/PR+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750403715; c=relaxed/simple;
	bh=XiVJzwWcli4XMRC3pzo03tNkjfRMnkjglH4BRakPqaw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=BoxAxd9O4RP4SSLNJACwmDF7MwZ4w4YFSJDFzq78tHRVa8xI9Vs2uQfg7Q0LR09XaW0Xqf42qzHbvPxyydSTjwN2XL9ULcbU+UrA24bqr7+i6lyCPLG9rESjtmrPGjuc0HtEILbCDRzeAAzcZsCBa3uGrvbHsZncHE3fo9JXzUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iQJJAyx4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC30C4CEE3;
	Fri, 20 Jun 2025 07:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750403715;
	bh=XiVJzwWcli4XMRC3pzo03tNkjfRMnkjglH4BRakPqaw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iQJJAyx4Cn8yBL2OHOEFTP1iaftNRTsriH8p9qT9GDcDTDGPV0rKffZbvdDPNBJP7
	 jTZBywRmQIKfWvuJbVrzjnAl0kX3iu8a/R/5VbTBlGgcqsRPyethh0RO9dbJ+deM4U
	 Nkx/cAUe/30LRDsJSpXB7/hFj07TpS0DyhdOmloHOUy4k0wC0K6kQTVZC/SERT1S1b
	 PjTMqXz2N7uCT6W121bDa5CMJp2Xw4k2YZcihTxKTJe3hd7w8hBKjaX+HTOx1TAYHP
	 qnlKr2WOHDLCcM4caRknuepXzOUuW/qu242q7ogAuzPjSmfHSvq/twleyfyzgnU97a
	 MAsdvxuoIUZhw==
Date: Fri, 20 Jun 2025 09:15:12 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hid: replace scnprintf() with sysfs_emit()
In-Reply-To: <20250619154627.415368-1-chelsyratnawat2001@gmail.com>
Message-ID: <38r035or-9ron-46p9-32or-q9rnqs9o9684@xreary.bet>
References: <20250619154627.415368-1-chelsyratnawat2001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Jun 2025, Chelsy Ratnawat wrote:

> Documentation/filesystems/sysfs.rst mentions that show() should only
> use sysfs_emit() or sysfs_emit_at() when formating the value to be
> returned to user space. So replace scnprintf() with sysfs_emit().
> 
> Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


