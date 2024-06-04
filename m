Return-Path: <linux-input+bounces-4068-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8F48FAE4A
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 11:06:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A9AE1F24150
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 09:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9204143893;
	Tue,  4 Jun 2024 09:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PU9asgye"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EA3652;
	Tue,  4 Jun 2024 09:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717491947; cv=none; b=WIyRy9qyutiCGuSCsK1v8Jbdq5Up/ZiZLsGPx9KyHVj7aS9MLMPrZA3VIeCjQHkCte1iXeWzX63RPp1E4xLCIVwdQmXpW9fXQ0JnuAp72arohoSANSRJWdg6gW+GT68N2rNCd5mB6NHmRNy1yjvSh75OStD5+k8mEcxc2b3rpPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717491947; c=relaxed/simple;
	bh=HF9C4tP0DgrqQfP3WI0DBh204AtPw8xLNHQwLz/tONk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=BWz411BAfBeGORYJVhGuKVFlGiYVn/2XFRZwUkZbiRrdds9deAXZhoJREEitHh5Mh1FFeWKa0jV9m1wst7BHAcCscZe4eadShGaJdE8vyrjyhOHVrg+j2DN5uQVFRKt/TndUyVZr7c12PvogXU8cLHpRQQDGbYt7dAzRNQ1kgf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PU9asgye; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D29BAC2BBFC;
	Tue,  4 Jun 2024 09:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717491947;
	bh=HF9C4tP0DgrqQfP3WI0DBh204AtPw8xLNHQwLz/tONk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PU9asgyeuhv/jbHQlmjA2PLiJogkeHO2JFQxyqmkP+MCUr5eN9jcArBU61Av2rtZh
	 6VcHIwp3uPvKLKjMPN8FuCqylltL8mrVbHfpcxkd1GvYrjBn10wjuyYNYjIQ7ojv95
	 tNL7YJNc+fsDf5VUJsB+VUnVMPAMVXlvMDrMQ5hEOq50apM8SKAb4UY5+9nBWqK0sa
	 elUxJcYbof9upT1LBtKTBiNkvnGpNXmqVV+/QG76igyttOWydDMtPKx0iNPQkANiv+
	 yvISwk9ybf4FPAk30VfN+CRYvXjh4s64KfLWjjapUlQgzOnj8ZfEP7l5Dv7URu+88n
	 2F3cftLZEh+iQ==
Date: Tue, 4 Jun 2024 11:05:43 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
cc: djogorchock@gmail.com, bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH] HID: nintendo: Remove some unused functions
In-Reply-To: <20240531085559.129085-1-jiapeng.chong@linux.alibaba.com>
Message-ID: <nycvar.YFH.7.76.2406041105360.24940@cbobk.fhfr.pm>
References: <20240531085559.129085-1-jiapeng.chong@linux.alibaba.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 31 May 2024, Jiapeng Chong wrote:

> These functions are defined in the hid-nintendo.c file, but not
> called elsewhere, so delete these unused functions.
> 
> drivers/hid/hid-nintendo.c:672:20: warning: unused function 'joycon_device_is_procon'.
> drivers/hid/hid-nintendo.c:682:20: warning: unused function 'joycon_device_is_snescon'.
> drivers/hid/hid-nintendo.c:687:20: warning: unused function 'joycon_device_is_gencon'.
> drivers/hid/hid-nintendo.c:692:20: warning: unused function 'joycon_device_is_n64con'.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9265
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


