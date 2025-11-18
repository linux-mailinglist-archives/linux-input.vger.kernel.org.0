Return-Path: <linux-input+bounces-16178-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6769AC6AD03
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 18:06:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 10EF34F7D0B
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 16:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22E735E555;
	Tue, 18 Nov 2025 16:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BI/XAXK+"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8952320CA7;
	Tue, 18 Nov 2025 16:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763485088; cv=none; b=LnMIDtIusJ//Ry9t2HM/mHp/60P2GjXw8HkauE0lyUDcnk0QYtIOSuXkMz55PxRWDdAfpiqkyaAJdV34rB8iqstMzZ6DsONJZgpHQGdj/zZzVF/rYOSD/k5uV3l/rinhZNcXghf1RYcA2MM83FuUTjWOvZx+feYOHaJTSrlsZXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763485088; c=relaxed/simple;
	bh=w9rzopfLSYZr1vXSXbMKP6Uqe6NeeW5fMoZozFFxj+4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qVEEB0oybnNQC0rNu8nn6NO8daHP0H1pPAhDlIBav9OqHeaOU93frY7yniOVFY3vDHEoLi8HsQUxEI+0Db7EOyNOZKrmSV8+vlELPdbuGWb9Rf8lts/nAlSThzMRPVl0Nz/pIgSYvKxz/8Uml643KnNvkuzbc9e+iH5paOwyNSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BI/XAXK+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87BCBC19423;
	Tue, 18 Nov 2025 16:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763485086;
	bh=w9rzopfLSYZr1vXSXbMKP6Uqe6NeeW5fMoZozFFxj+4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BI/XAXK+zd5AFwVfqNeQgg/QfK0HnwCu3omhXKi9c47Fg3mlQj2DcJpal/HQXt1Yx
	 uu9TnhjNhIYqaOLMBj7T5avN4xumFFU8uXKotQFKzKYpyamVsY/zjYEEd27bO3x5+F
	 Gq9UdIBSffDT5Q2kS8UdSJaL7Pr/hxtulr6xJVjune4/IGhv8UDmKCiC99F4uyI5kt
	 u/eqF7EauYUbJjMglQUYqGRpB/YGUc7y+7PM3yi8WvNtzJ/qdLiP+vRbp5AyPHKpoC
	 +gFFv/IWl5aIPkb1PW3rMXvAwU29VG/waRLNAZNtICSTNm3UmZTjNz4v9X9y89RLud
	 /2KjioGPdmcnw==
Date: Tue, 18 Nov 2025 17:58:02 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
    Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH] HID: corsair-void: Use %pe for printing PTR_ERR
In-Reply-To: <20251103142120.29446-2-stuart.a.hayhurst@gmail.com>
Message-ID: <9pp0526r-0p20-36p4-12pq-s7o9q77368o1@xreary.bet>
References: <20251103142120.29446-2-stuart.a.hayhurst@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 3 Nov 2025, Stuart Hayhurst wrote:

> Use %pe to print a PTR_ERR to silence a cocci warning
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Julia Lawall <julia.lawall@inria.fr>
> Closes: https://lore.kernel.org/r/202510300342.WtPn2jF3-lkp@intel.com/
> Signed-off-by: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


