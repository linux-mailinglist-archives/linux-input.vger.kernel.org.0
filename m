Return-Path: <linux-input+bounces-14694-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B12ADB5649F
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 05:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A9A2420DA6
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 03:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A552BAF4;
	Sun, 14 Sep 2025 03:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AJwdbfr/"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948E12DC776;
	Sun, 14 Sep 2025 03:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757821641; cv=none; b=TNnBWP4lTW1Fe80B4HP3jzl53boyF2Z50uXihl1X0KPo5ve9jy7bHUAEAw9FV2Bcl5+txOwbCxKeFKmCzKxTnzwQeub2GHGIaFOEwGNI0NCJ4dnhHs42QVYH3S9jteWbTaDrg4NStHoLzukQedeCzdxBQQ0cbQ3vWRwwoLIAhOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757821641; c=relaxed/simple;
	bh=hVUvXH2zJr/yk9Bd0Pu0XUl9d5dYaw1JGxAPZxs8vM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hOmmvXfjOzqHe+xQ8wg+Py8gvs6LGt9ynXd0h6uthAr9oywgIZIztmFAMw/0f4WYp4C2ji/dCfYp1wTlUkCqE8Zqv1kzg1B/zqpXag+MEJe73tMf6hf4WWlB902nGgyXoE4WBfM640xJUUEQTFUMnnqcorI1d+q6w/0YAo/uD/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AJwdbfr/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A13EC4CEF0;
	Sun, 14 Sep 2025 03:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757821641;
	bh=hVUvXH2zJr/yk9Bd0Pu0XUl9d5dYaw1JGxAPZxs8vM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AJwdbfr/kjvJS3WuSeY77N7nN3D3SuBKhLs0HW9VT2faIq8zf+6tn/t+syfW8T3YZ
	 4OsJrJsNBz/4SfeejzEb2YYQOeyRoRJ1L5j6jNZMPv/5t6eOvBmjtQpw7DQ57KwxQ5
	 9idvq845ju9+bFKc5eHdiRttlOLJ8vUJSO7XtXpskYZHUG9LaYKKgbZSBntcbm2jv4
	 BKMP38vxslmTHfOvj0JajzaDpXElnMfwxcZLtUw9X8RR9BRhNWruRzdaA85ojQkPUY
	 g1l2XakIXPDQKaPl4uvtHMCvOFvka/HtuJfasd4YS/GrrrwPsQY1sJbuKZtwCF0OtV
	 KzrTgGSSrrftw==
Date: Sun, 14 Sep 2025 11:47:17 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Benson Leung <bleung@chromium.org>
Cc: linux-input@vger.kernel.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH 0/5] platform/chrome: Fix a race when probing drivers
Message-ID: <aMY6xeh-RSiaWDc5@tzungbi-laptop>
References: <20250828083601.856083-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828083601.856083-1-tzungbi@kernel.org>

On Thu, Aug 28, 2025 at 08:35:56AM +0000, Tzung-Bi Shih wrote:
> A race is observed when cros_ec_lpc and cros-ec-keyb are all built as
> modules.  cros_ec_lpc is cros-ec-keyb's parent.  However, they can be
> probed at the same time.
> 
> Example:
> 
> + -----------------------------------------------------------------+
> | Some init process (e.g. udevd) | deferred_probe_work_func worker |
> + -----------------------------------------------------------------+
> | Probe cros-ec-keyb.            |                                 |
> | - Decide to defer[1].          |                                 |
> |                                | A device bound to a driver[2].  |
> | Probe cros_ec_lpc.             |                                 |
> | - Init the struct[3].          |                                 |
> |                                | Retry cros-ec-keyb from the     |
> |                                | deferred list[4].               |
> |                                | - Won't defer again as [3].     |
> |                                | - Access uninitialized data in  |
> |                                |   the struct.                   |
> | - Register the device.         |                                 |
> + -----------------------------------------------------------------+

> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/5] platform/chrome: Centralize cros_ec_device allocation
      commit: 918856986014142271a70a334d300994b9c41720
[2/5] platform/chrome: Centralize common cros_ec_device initialization
      commit: e19ceeb1c0f63e3e15b197c5f34797134b51ba0e
[3/5] platform/chrome: cros_ec: Separate initialization from cros_ec_register()
      commit: 7a79b0bfd8b3995a39d25bffcf57273635c0e542
[4/5] platform/chrome: cros_ec: Add a flag to track registration state
      commit: 56cb557279d70397cefb497e0f06bdd6fd685f8e
[5/5] Input: cros_ec_keyb - Defer probe until parent EC device is registered
      commit: 48633acccf38d706d7b368400647bb9db9caf1ae

Thanks!

