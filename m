Return-Path: <linux-input+bounces-4067-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A608FADC0
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 10:41:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A2501C2325D
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 08:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B301428E7;
	Tue,  4 Jun 2024 08:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mL1kwb7Y"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D4D1422D8;
	Tue,  4 Jun 2024 08:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717490458; cv=none; b=RBPT9rtfKj6hBg+OihhiibDqbySiJjphIxx2wR0v2TH5AZN/v3O8t7dc+Lwl3aiPF1tJGH8SW6yWt99tvUWBjfmsbA+81QzeehcuhO5wvz5FiTOMRtrN7ImzhyMBzAiKMWFLLrbfMYZMRtDiIGI4GljLaWeJCSgmjytUO08k3xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717490458; c=relaxed/simple;
	bh=QGgZbW90IOBxyw0tPgck/VovxBWLuXnIo7I9R9vrkWM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lJzj58QeWI+uXFRVHZ/0eF77JTG2h0t4jjRw7RVnG6StfMZXzS22NEZNqrwSztotmFpzGoHFosb8JIQjBPnIqiP1bN7ii7YFH2Q8pYQz+jLYXLOR94ftfey8c7mUHDeoobkMRXfiOtQb0p3PsUgtgYHlE4w/FIZst5vTrrhj4Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mL1kwb7Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D9CC2BBFC;
	Tue,  4 Jun 2024 08:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717490458;
	bh=QGgZbW90IOBxyw0tPgck/VovxBWLuXnIo7I9R9vrkWM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mL1kwb7YL3z9nRa8E2dhMl5HxHLW6zK6to0FNXh/py4c8mARAgIie9EVwnLbczAtp
	 fAtW6BnCHjREZK00l1LUWB2IxeYjz7OVK5dCsT1AR6atr6415nhnU8EbPlcBHlzzLs
	 HNJ8J4sD727+Eb92g2P5Rx6pNmoRutzbnBkFInLTKYjnrCVOHedUZ90qZ/BBugMm/U
	 mx9PRGsEPKdQwX670Ys3R62n3w6FnNOrlMCFkkavdqihKGVjXvAaogoNX7bvzL2IVO
	 kbJhR+RWH+qgcmZRWZwL4/NynPtkNlHoX3YKPwL0Hz0IXvmuQ4kFV8M5LsyMNi4z6m
	 9/FsCoE+23xYA==
Date: Tue, 4 Jun 2024 10:40:54 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
cc: =?ISO-8859-15?Q?Filipe_La=EDns?= <lains@riseup.net>, 
    Bastien Nocera <hadess@hadess.net>, 
    Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] HID: logitech-hidpp: add missing MODULE_DESCRIPTION()
 macro
In-Reply-To: <20240603-md-hid-logitech-hidpp-v1-1-060f06e4529f@quicinc.com>
Message-ID: <nycvar.YFH.7.76.2406041040470.24940@cbobk.fhfr.pm>
References: <20240603-md-hid-logitech-hidpp-v1-1-060f06e4529f@quicinc.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 3 Jun 2024, Jeff Johnson wrote:

> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-logitech-hidpp.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


