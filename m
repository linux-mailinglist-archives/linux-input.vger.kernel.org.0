Return-Path: <linux-input+bounces-5094-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A416E9378DB
	for <lists+linux-input@lfdr.de>; Fri, 19 Jul 2024 16:01:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C66A1F22A8E
	for <lists+linux-input@lfdr.de>; Fri, 19 Jul 2024 14:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9245A84A4D;
	Fri, 19 Jul 2024 14:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZyiG7f3d"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6721E1DDC5;
	Fri, 19 Jul 2024 14:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721397666; cv=none; b=kTEkIWYS/1bXXotYeuX4kHrfZj8honVDLKpof09DpPjTnEAbrxqgeJOR5IYnY9Vaa0khBTrCXC/8CF4xPpTldQQ0+ZrRn+7K93oQzDNcX7BGefyuXxdiPY6oiAnSZE9612RuXSXIjjS9HN6jyVAkHCZQjwHKcacnfLbXaU8kc/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721397666; c=relaxed/simple;
	bh=7uiDhLmzO5sSt2+b9hbbq+lm8FTy6+JtoaE60ZC7JTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XwUC9pZpw0LnmVLH45txAT9t+R5FBGtmgVynT+gcMsfSwqfrW8er1MUcjTRLncy3kC8ZXTcOASTXluPRDKF/ON6YU+PQ3pmsTbmlYVW4ZCHZJqyIRqJAmNTY6duy7sqdLl/25gKWO2jOMTCBaPcsSacwLEPngzyLzvacWBKYnPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZyiG7f3d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4A10C32782;
	Fri, 19 Jul 2024 14:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721397665;
	bh=7uiDhLmzO5sSt2+b9hbbq+lm8FTy6+JtoaE60ZC7JTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZyiG7f3dSbc2IXUA0hAxYbuQaI/ZGhV9Z1UQKUoGpcJcoT5bzaBvCWQPkhnDvkLNx
	 nTTUToqWey2l5Z/iZoqoPjaqHhHBD14fIoxf6x38LnMReheCg3lZp94qq+Jf4YkoPt
	 5KPKllsEMBB/QLy+cmpNV9729vuDaAMFBjkyNyBggFRhBKHENwNfUGCCbiPfNI0RUO
	 5luytdZVhyzQWWcxNRnnn/LW+EQj/GldKbBMsR8l/LMHQAOt8oygOUXxdOrxXU/Uav
	 9JQjCik54rgcM3tY9DHOopqnwFSVwE6K9/zkDfbZuJ7mt6+18/JBrhhf1easNrQltL
	 ooYlBIBa0NRlA==
Date: Fri, 19 Jul 2024 16:01:01 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: =?utf-8?B?6Im+6LaF?= <aichao@kylinos.cn>
Cc: jikos <jikos@kernel.org>, linux-input <linux-input@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] HID: core: Fix parsing error for Thinkbook16 G6+ IMH
Message-ID: <uwn4lccc34xtilwzfbogjor2xrue6ob7ydlywaylvg4a53x7io@bq4nqnkczu4s>
References: <12vo1pesman-12vrviv1rs0@nsmail7.0.0--kylin--1>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12vo1pesman-12vrviv1rs0@nsmail7.0.0--kylin--1>

Hi,

Thanks for your contribution but there are many things wrong with your
patch submission:
- you used html which should be rejected by the mailing list
- your mail client completely messed up the format and the patch is not
  applicable in its current state.
- your signed-off-by is not correct as it's missing your email.

Please make sure to use `git send-email` or `b4` for your future
submissions

Also, the patch in itself (or what I could guess on the email I
received) is wrong. You should not tamper with hid-core for that but
need a dedicated report descriptor fixup in the target driver.

However, the device seems to rely on hid-multitouch which I'd rather not
have report descriptor fixups in there.

Maybe the simplest solution is to rely on HID-BPF and submit a new
driver fix to https://gitlab.freedesktop.org/libevdev/udev-hid-bpf or if
you want to directly submit said fix to the kernel in the directory
drivers/hid/bpf/progs.

Cheers,
Benjamin


On Jul 19 2024, 艾超 wrote:


