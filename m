Return-Path: <linux-input+bounces-14445-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 79010B41558
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 08:41:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1D6504E17CD
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 06:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD9AD2D7DFF;
	Wed,  3 Sep 2025 06:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OV6nFWG/"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA8619DF4F;
	Wed,  3 Sep 2025 06:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756881661; cv=none; b=daNagusF1oIxQ31prGzIOQsLrvcaZCuaVE9RxVYTPtfWrx6FWB/py3/gjF2DueVwrsmKMENc/FsV9UHxwnY9Yz48SCnzNmSqGyz5tWxd+JhQ4A0t5wyQWVwIKihCGaCcrGqRIxnAbLUO+U1X4JCoB80W4X3Vk2PGpSl/SixXp64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756881661; c=relaxed/simple;
	bh=LgGp13SDlt6Ivvmn8YGd1v3TpCceWjDtQMhF5H6UTRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKaweLiKaUS1GL1np7qz+qpE7mMgtwDkNa/6CBzBxOQ976EmBB1MJLjTXoN/JwaiZZJ3W2ZmrfwLr/XNOGzkFkqwR0oW3RWEDWAeA1mmfLIrx8FAKTDsuYsh6Af+diL64NH65hVzGDVSCcJD4h1XGv5A3CfCkoIngEs5GXl421s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OV6nFWG/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87B21C4CEF0;
	Wed,  3 Sep 2025 06:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1756881660;
	bh=LgGp13SDlt6Ivvmn8YGd1v3TpCceWjDtQMhF5H6UTRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OV6nFWG/tx1n4lMA44G9BjByryO8PCvPp7ANmWCmBuLDpMvQdQJVzZKnF4UDIq3VG
	 XxrWYJ6IgU677ZpTZuhr0UftSd+NbatVsDuAUs+E3hb/UWJrFHknUUAqxXNAvuE0NW
	 Mcjk4uzsAdShFJoOnAdGw6VpE4Rv3vQmhqX0wzPA=
Date: Wed, 3 Sep 2025 08:40:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
Cc: rydberg@bitmath.org, dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2] Input: bcm5974 - Driver cleanup by replacing dprintk
 with dev_dbg
Message-ID: <2025090330-unruffled-slip-86a1@gregkh>
References: <20250903061908.41910-1-bhanuseshukumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903061908.41910-1-bhanuseshukumar@gmail.com>

On Wed, Sep 03, 2025 at 11:49:08AM +0530, Bhanu Seshu Kumar Valluri wrote:
> From: bhanuseshukumar <bhanuseshukumar@gmail.com>
> 
> Debug printk messages are converted to dev_dbg based logs
> for better control over debug messages using dynamic logging.
> 
> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>

Does not match your "From:" line :(

