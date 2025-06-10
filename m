Return-Path: <linux-input+bounces-12779-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADAAAD4317
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 21:44:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FA031899E3F
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 19:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E9CB264A74;
	Tue, 10 Jun 2025 19:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u0Q4RBGW"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55581264A60;
	Tue, 10 Jun 2025 19:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749584643; cv=none; b=WSmcR/phIMXxiuVVxYfoWF2qfDm5cupeuyqU69gr6f5P0GSBTbE5bDrnJXst5aZhRyl2He359tRma8rHV5Wt7/q0M7oG88Nqx7Akbs89q4SJmeLgNhaFg/+NgvSH06P+t/NdGizsxs3Qa3ft4qouzn/r5fdHuoc4byf9dlsrVL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749584643; c=relaxed/simple;
	bh=12a+d4zltJNXEBdqU5/DPXEo5WDoOhzF8MOtZadBGVs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NSFOAQwNqWeSGXBeDbYP6L83l1nY4SFUTdLvj4OGPEO40WGeGu+WGo6/vrS4WK3AVTmigYGkslDwJVU3TYcLMgfuHUaHxTqrZsTBFKKIeBi+a+ew2Q9Me2IuNYIMWxgImMQolN7FjDs9fsVCBF8yESSXuRwqoje00UcEn3vIeRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u0Q4RBGW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D8B9C4CEED;
	Tue, 10 Jun 2025 19:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749584642;
	bh=12a+d4zltJNXEBdqU5/DPXEo5WDoOhzF8MOtZadBGVs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=u0Q4RBGWOiXdJFjsftPl+kTFowDC98kbRfxEP1shNFkmPvXI+hgbq4r745MixQTNd
	 5uxRZjrd+4tz3UrXQs5cvzZDJxH6HvHv8oaka02eknPt9SxeasIhmWgyMDVSqULUoB
	 QKANzMIpSavYiZTjS3nUUQnfTuSnm4Ka1VV9ETsSBVIlxoAa+z20zGvOSCREegRSgT
	 mlC6yoGbrJsF7p/LK9ifwsNP0DvcldjH3xHbDoTXuLYD28Pzrj0JgSz1bQK+NhJfCC
	 8xCIcEAkv5SCdrkPIcJFFcHpnJkFfSfuS4OGc8vmEU4iu2dABjng2a7kSM3BMnCVY/
	 EnUM9xBpXtFbQ==
Date: Tue, 10 Jun 2025 21:44:00 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] HID: debug: Use the __set_current_state()
In-Reply-To: <20250509022554.27001-1-zhangzihuan@kylinos.cn>
Message-ID: <n405o2oq-s9p1-5o80-n2rn-8n7n9n8362po@xreary.bet>
References: <20250509022554.27001-1-zhangzihuan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 9 May 2025, Zihuan Zhang wrote:

> When detecting an invalid list->hdev, the process needs to manually set
> its state to TASK_RUNNING and exit. In the original code,
> set_current_state() (which includes a memory barrier) is used here, but
> it is immediately followed by a mutex_unlock() call. Since
> mutex_unlock() internally includes a memory barrier, this ensures that
> all modifications within the critical section (including the process
> state) are visible to other CPUs. Therefore, replacing it with
> __set_current_state() (without an implicit barrier) avoids redundant
> memory barriers.

Good catch.

Now queued in hid.git#for-6.17/core.

Thanks,

-- 
Jiri Kosina
SUSE Labs


