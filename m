Return-Path: <linux-input+bounces-4058-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A44BD8FAC82
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 09:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D41A11C20F09
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 07:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45ACD1411CA;
	Tue,  4 Jun 2024 07:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VzC8td35"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C43913FD9B;
	Tue,  4 Jun 2024 07:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717487419; cv=none; b=cruc4W9pSTzRLubHv4ybX3r2ttucLXYWP4R7Z4evNidWXKhSHjZW658w84o0KRaIKcsKZDGx4u9CZTZZ3zORmeMY/OoB9fCy7akVzVbIbOnakgRiUk9Ioz5vJzoE+VKfw9RBC6Fj0cyUuP6PuXOQNM/AFWpnLArusgxbPya+6FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717487419; c=relaxed/simple;
	bh=CYiHCznNrYVF2mfPgnIV/nPZVLc+CZ3quRbhg61G0TU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NT2VHlLjxjxhtYcB4udD8lo4hwqINOaBY156VoRKPWAgHpZCZ/+3KpL22S/1DOxzevUmZ7lh9xjDseT2458Lxb3ThvByrbtSo8vYH0mdKI6hj/LG3vsl9Yctr/EaVAjjpUtUFU01f3pWiCEUTa8+FBqtNLP4uS6OVmOzWFFcf+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VzC8td35; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16D48C2BBFC;
	Tue,  4 Jun 2024 07:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717487418;
	bh=CYiHCznNrYVF2mfPgnIV/nPZVLc+CZ3quRbhg61G0TU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VzC8td35o1lkH89Wd9QkG1Ov7TI3VXXrSeDzkZTU6I8rBxZtGky6Ys2WL8laGzdwr
	 CIk8j/RCoJQbttLHXuSqmoi7s0reG8iHY0hGp/MsNRUVu47xSmbCJgGAV+Sbl54SWc
	 Rtt1dv0kIT+ee+mP16Bic10J6Xk3KhV/mbQ+5lfglMq2b0iB4xcJ0dzKOCM3E+0ZA3
	 xArTxYGVoKWt289itVhquCnlh8jRpbl3nGzSfIZL8nXsH1KFYSe+LQNLUFyIdjpNeF
	 /rWElhQLhCgeWXy3wc0x7Sj4AC8lY+u2FM44KdB1fYRMSOCjkTWWRTCU9sGc3QxFa+
	 DaQpF2XIxhLUw==
Date: Tue, 4 Jun 2024 09:50:15 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
cc: Benjamin Tissoires <bentiss@kernel.org>, 
    Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
    Douglas Anderson <dianders@chromium.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, 
    syzbot+5186630949e3c55f0799@syzkaller.appspotmail.com
Subject: Re: [PATCH] HID: core: remove unnecessary WARN_ON() in implement()
In-Reply-To: <20240517141914.8604-1-n.zhandarovich@fintech.ru>
Message-ID: <nycvar.YFH.7.76.2406040949170.16865@cbobk.fhfr.pm>
References: <20240517141914.8604-1-n.zhandarovich@fintech.ru>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 17 May 2024, Nikita Zhandarovich wrote:

> Syzkaller hit a warning [1] in a call to implement() when trying
> to write a value into a field of smaller size in an output report.
> 
> Since implement() already has a warn message printed out with the
> help of hid_warn() and value in question gets trimmed with:
> 	...
> 	value &= m;
> 	...
> WARN_ON may be considered superfluous. Remove it to suppress future
> syzkaller triggers.
> 
> [1]
> WARNING: CPU: 0 PID: 5084 at drivers/hid/hid-core.c:1451 implement drivers/hid/hid-core.c:1451 [inline]
> WARNING: CPU: 0 PID: 5084 at drivers/hid/hid-core.c:1451 hid_output_report+0x548/0x760 drivers/hid/hid-core.c:1863
> Modules linked in:
> CPU: 0 PID: 5084 Comm: syz-executor424 Not tainted 6.9.0-rc7-syzkaller-00183-gcf87f46fd34d #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/02/2024
> RIP: 0010:implement drivers/hid/hid-core.c:1451 [inline]
> RIP: 0010:hid_output_report+0x548/0x760 drivers/hid/hid-core.c:1863
> ...
> Call Trace:
>  <TASK>
>  __usbhid_submit_report drivers/hid/usbhid/hid-core.c:591 [inline]
>  usbhid_submit_report+0x43d/0x9e0 drivers/hid/usbhid/hid-core.c:636
>  hiddev_ioctl+0x138b/0x1f00 drivers/hid/usbhid/hiddev.c:726
>  vfs_ioctl fs/ioctl.c:51 [inline]
>  __do_sys_ioctl fs/ioctl.c:904 [inline]
>  __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:890
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xf5/0x240 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> ...
> 
> Fixes: 95d1c8951e5b ("HID: simplify implement() a bit")
> Reported-by: syzbot+5186630949e3c55f0799@syzkaller.appspotmail.com
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>

I've added

	Suggested-by: Alan Stern <stern@rowland.harvard.edu>

and applied. Thanks,

-- 
Jiri Kosina
SUSE Labs


