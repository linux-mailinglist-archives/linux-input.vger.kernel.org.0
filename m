Return-Path: <linux-input+bounces-11967-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4FBA9A938
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 11:57:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 112247B2F62
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 09:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A10EF510;
	Thu, 24 Apr 2025 09:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gkpdPLXS"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6CB2701AA;
	Thu, 24 Apr 2025 09:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745488622; cv=none; b=KDsTrUgcbeZAz7LMtkchB1dF30lfVnvVm0P61m8LfxjK6E5o5MAZfzVXkjop3Sa9usji2Nd14YMWar98H7a8R811s31AZveZuslpAfpXKRsusVLoUX5BcCCqMxH81Mpqxi9yrAj6tZZrPrtHxO8p+IxE5YL38VBdPun/NAepaj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745488622; c=relaxed/simple;
	bh=6cy8Z5qeVjpdzqiP9qJHUMY9DOr1pULBN4js7HY8s+8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rUNZC6Fojz5Q/UyG50XhphgqIG0WyOmXIEbxNh4Dweix587LaUPwDW+3ZTY/ifQ5S6LZZsX/+D7L+NyVzbxx4h0b3pIq+ZOQmWe994OsL9yBDKFA62mZPwogbGoHmZb4+o+TlZtegFVQNLLkKVtVhQItPAPN3pZnpkXmBybDndg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gkpdPLXS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64C1BC4CEE3;
	Thu, 24 Apr 2025 09:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745488621;
	bh=6cy8Z5qeVjpdzqiP9qJHUMY9DOr1pULBN4js7HY8s+8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gkpdPLXSAbbAa17We6aXi0jTkRgkQQ92EkH9dwQHhB162SfezEkcbFESe1bMFqyoV
	 pd0s++mReERMPEeI1M7D0EePq61Yv20ljVecvjR1DJIqboUtyf/qSaXnZ1dFq1MrrO
	 Hwsji1AQN+oAdjJdlygMugBIwjBe5qU7yNVJb9+wpp3ZEEhjCzSQ2Nm7sIMpRIcDHw
	 vuI8QBUVaoEx6jtHU5qO3VUrhX2KcXF8ChakjBlKIZ1YlYMQedyhQ3YD89zikj/VPN
	 96NNGKsPm2c94SadW/JENmOPDSbWmsxORCXC0nk7Xe/pJAQSXCaegMKYXEP6IqQfFO
	 zPZmORYtYOYmg==
Date: Thu, 24 Apr 2025 11:56:59 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Chen Ni <nichen@iscas.ac.cn>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: corsair-void: Use to_delayed_work()
In-Reply-To: <20250414073955.3954020-1-nichen@iscas.ac.cn>
Message-ID: <r77oqs75-p29q-sr64-r619-2023n151q2s6@xreary.bet>
References: <20250414073955.3954020-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 14 Apr 2025, Chen Ni wrote:

> Use to_delayed_work() instead of open-coding it.

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


