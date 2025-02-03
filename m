Return-Path: <linux-input+bounces-9735-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D22F9A26609
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 22:49:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A77641883D42
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 21:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C59201246;
	Mon,  3 Feb 2025 21:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="amCHLEdh"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A9D1FF1D8
	for <linux-input@vger.kernel.org>; Mon,  3 Feb 2025 21:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738619351; cv=none; b=rKzETpMOzl5kAPYkUtGarhn1CoPQW94BlvSQQT3uMQg7cVEgdSfsw+G3Mrb22fO2QKd++gXwluMLEgbxRoF6mtpu+vJD6u6DJO8kGCGcE8dTgyOcwjsKU6jU7GhUQL5OpxU5w0BwNjiX3XHOiQFgwuAyyoNwXaTxmZUGlhrzvdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738619351; c=relaxed/simple;
	bh=y+GqEuCK+VOPy15JWft195M/QeGe3a/+FNxpmc8Aijg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Y3qhIJt6Bf7jkH69ps/BDavkAL5szDWYdC5kt5QjaEY/HjVSTBZE/P1/11Er6pjCEy+hgs1ajPq7zttIXlf/bwsck6lOmG22FYGi3/eYtwpukOH4YCsX4JXOytbI4iuXSG0IckCUMtb4FCVJcRgYgUmsKg8pTTXHnHLsaJl4TdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=amCHLEdh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87346C4CED2;
	Mon,  3 Feb 2025 21:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738619350;
	bh=y+GqEuCK+VOPy15JWft195M/QeGe3a/+FNxpmc8Aijg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=amCHLEdhZu4ELoJNdg/HDiJEzhE8QOeBvEQQS2Gbu+fuznpw3vpogsMQwpVehftv0
	 NzTEZVDZM1OX3/WnwTjQ3qp6nohWloPKICwgZwytI2FgEj9Hv0MJIZKbP2EbpUxreI
	 PZ4D7LR+kvYFMyUwvjQiG0doFJZ6YPmipoWgSh3fGN876tqetxbkx7ERMiPXhMf6qu
	 TOZDKSOSCXgCx2k2JoBr/8VkOWquXTSum/De/w3/NZYtz2OkYr1H7afuHMyCKFUfzg
	 xeVp1V/WdBc0v3qPKi6RCjSqYOQBkb5aa89QBo80ZsrRr8uWoUrN3wypm5lXTMpT5Z
	 KzvznSRGflkbg==
Date: Mon, 3 Feb 2025 22:49:08 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Charles Han <hanchunchao@inspur.com>
cc: bentiss@kernel.org, mripard@kernel.org, sergeantsagara@protonmail.com, 
    linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: multitouch: Add NULL check in mt_input_configured
In-Reply-To: <20241115062621.18679-1-hanchunchao@inspur.com>
Message-ID: <6on16n73-007r-p286-r5n6-950p4288q5oo@xreary.bet>
References: <20241115062621.18679-1-hanchunchao@inspur.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 15 Nov 2024, Charles Han wrote:

> devm_kasprintf() can return a NULL pointer on failure,but this
> returned value in mt_input_configured() is not checked.
> Add NULL check in mt_input_configured(), to handle kernel NULL
> pointer dereference error.
> 
> Fixes: 479439463529 ("HID: multitouch: Correct devm device reference for hidinput input_dev name")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


