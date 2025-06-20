Return-Path: <linux-input+bounces-12980-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B8FAE149E
	for <lists+linux-input@lfdr.de>; Fri, 20 Jun 2025 09:10:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4851119E1754
	for <lists+linux-input@lfdr.de>; Fri, 20 Jun 2025 07:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D18BC2253E0;
	Fri, 20 Jun 2025 07:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ndIy9O1+"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7753A923;
	Fri, 20 Jun 2025 07:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750403447; cv=none; b=tdJnqd/gvzgiYIzxigrDgbEm5qZcVyeQ4mhnCGus8Resix1N5mTSOJi/iR/W3uvnP0+TwPLIRbVWfxM7qpFa9/ElzroJtP0025BjrMCTIUv7ZGEHtAwmG0JKBMVRXI0lWaBttuc43EUYIVaFeMSKHmYQAfNaXgvIWmDWjA6ad0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750403447; c=relaxed/simple;
	bh=3GSX6YXAI0S+M3oMEaj3CQTfqG2WzPNo2PRLr43C2U8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fJc38p1t53fFZbHRwanLSWBeA0Z/OqJPtvPhS8BZ7ZpfcKQjynnXOY4AKEmBdm/6gf6N/M9vzsLW3E/Y2pRXuUqY/Ni7Jqua/35rKkROxQuEgxuRNxK1HofA67s8PLQxrXrJN+5CRi7jSvJZ9I7C9KPaaGtsSOsZz5mcmPSgnkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ndIy9O1+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB868C4CEE3;
	Fri, 20 Jun 2025 07:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750403447;
	bh=3GSX6YXAI0S+M3oMEaj3CQTfqG2WzPNo2PRLr43C2U8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ndIy9O1+9pzmj0Om3fnJmwRk8T98H7Bc56jj4Fogx0XYe4BVYXPhpGkrKrvwUDfAm
	 kreZm6nNkJu9hdxfM9bwjjFLiB7Ed1P580rT8rH8ORBzgu82qWtLRrICipysV6GUv9
	 n2GUxuQORgl/wRUMhiKcsfi3i3iwLDKTSQR8hRThEzqF7HAouM0BnSZ5K51kruQNdb
	 e8GNVaGp+YgJoOGOVGoHc4KcBB1bPUd2I91bvAo2Ul09wB4ZDqcn6wI98Gw5JgYVzx
	 lX0eWAIkR6aoBCZE7EMuFqpiKyw+qnlKST4XovkLGLGoYeKmwfnrQJPbmzEyN5Mwic
	 iihAvN/mVpLDw==
Date: Fri, 20 Jun 2025 09:10:44 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Akira Inoue <niyarium@gmail.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: lenovo: Add support for ThinkPad X1 Tablet Thin
 Keyboard Gen2
In-Reply-To: <20250612043439.1914003-1-niyarium@gmail.com>
Message-ID: <p79o696p-2n02-6qs3-rsr5-40n8o2s38492@xreary.bet>
References: <20250612043439.1914003-1-niyarium@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 12 Jun 2025, Akira Inoue wrote:

> Add "Thinkpad X1 Tablet Gen 2 Keyboard" PID to hid-lenovo driver to fix trackpoint not working issue.
> 
> Signed-off-by: Akira Inoue <niyarium@gmail.com>

Applied to hid.git#for-6.16/upstream-fixes. Thanks,

-- 
Jiri Kosina
SUSE Labs


