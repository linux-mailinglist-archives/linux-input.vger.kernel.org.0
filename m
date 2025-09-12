Return-Path: <linux-input+bounces-14654-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C872DB551E3
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 16:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C653F1C23A32
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 14:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9175B31C572;
	Fri, 12 Sep 2025 14:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f27FcqYp"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565C2311974;
	Fri, 12 Sep 2025 14:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757687519; cv=none; b=GoK6aN7N0xUVsG1cmMfs2tNjzXsew5gOZsGiOq3N49IGaiCjgOpKu45OZdpZ47+oA/500XU+eVbL44IfUgguSoBeV3guAFVb5ETgoI0rMnFaJaSNF5MGyo4tgxvubhQKkOcmdTYWUfgNsESEuvhLEcTdbWGw6LZ4uw9wPX7Z46c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757687519; c=relaxed/simple;
	bh=pkUfGkCmaT3RWgdS9J7jfl3CH8SCGQ7t0IFRJROM9Xo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Z7wx9REIdrNHT4TU91pvlpn66m4xAXYSWUsxYMCNhsry4IKv0DnKQ+NSyihMOWtEK4VrPOUqXmMh+ZlDcvqm+gTyTkMoPaVoSndM8NCk+SGo85Ma+R7gF9HVEmVj5fiB9kQxWsw5vDXVPjutYOFP8fQFnBoat7ulrS1/rhubvSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f27FcqYp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38065C4CEF5;
	Fri, 12 Sep 2025 14:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757687518;
	bh=pkUfGkCmaT3RWgdS9J7jfl3CH8SCGQ7t0IFRJROM9Xo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=f27FcqYpUt0PLnZfEphVydhQ/iaYIgawdxJxq/bZM6JLqzU5obg3zr18Pv5Fj+OKy
	 u6aMgxB7gxM1F6Ixbm/LVJQf0b2FTna6AfMoRvpUbdn+Ezv5vPI2X8c+JzGU4B2rVz
	 FxFazTvj6lFHsNp5s6XvRJKay/pH8AQcy/zmKatCmg26BuWbOLV6q9LEXFcVqk2uGD
	 1/VHy9ppha/dEJkqNH6O6oqgDrsyVrghoRYAlwEr/ahFsU0ExGF69BbzM92IBLstgW
	 xfQIj+sIvkSimqvSLFpflL89Su2DRW31q2jTOM2IH0ELgfpsOsAPBQygCjgHiZtdEf
	 OzRoqJfaEqXww==
Date: Fri, 12 Sep 2025 16:31:55 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: kernel test robot <lkp@intel.com>
cc: Jeongjun Park <aha310510@gmail.com>, llvm@lists.linux.dev, 
    oe-kbuild-all@lists.linux.dev, Benjamin Tissoires <bentiss@kernel.org>, 
    linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH] HID: steelseries: Fix STEELSERIES_SRWS1 handling in
 steelseries_remove() (was [linux-next:master 1042/7110] drivers/hid/hid-steelseries.c:599:1:
 warning: unused label 'srws1_remove')
In-Reply-To: <202509090334.76D4qGtW-lkp@intel.com>
Message-ID: <r1np627r-0734-23o1-s9sr-7pnqq0qn577o@xreary.bet>
References: <202509090334.76D4qGtW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 9 Sep 2025, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   3e8e5822146bc396d2a7e5fbb7be13271665522a
> commit: a84eeacbf9325fd7f604b80f246aaba157730cd5 [1042/7110] HID: steelseries: refactor probe() and remove()
> config: um-randconfig-002-20250908 (https://download.01.org/0day-ci/archive/20250909/202509090334.76D4qGtW-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7fb1dc08d2f025aad5777bb779dfac1197e9ef87)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509090334.76D4qGtW-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509090334.76D4qGtW-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from drivers/hid/hid-steelseries.c:13:
>    In file included from include/linux/hid.h:29:
>    In file included from include/linux/hid_bpf.h:6:
>    In file included from include/linux/bpf.h:31:
>    In file included from include/linux/memcontrol.h:13:
>    In file included from include/linux/cgroup.h:27:
>    In file included from include/linux/kernel_stat.h:8:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:11:
>    In file included from arch/um/include/asm/hardirq.h:5:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:12:
>    In file included from arch/um/include/asm/io.h:24:
>    include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>     1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
>          |                                                   ~~~~~~~~~~ ^
> >> drivers/hid/hid-steelseries.c:599:1: warning: unused label 'srws1_remove' [-Wunused-label]
>      599 | srws1_remove:
>          | ^~~~~~~~~~~~~
>    2 warnings generated.

[ adding CCs ]



From: Jiri Kosina <jkosina@suse.com>
Subject: [PATCH] HID: steelseries: Fix STEELSERIES_SRWS1 handling in steelseries_remove()

srws1_remove label can be only reached only if LEDS subsystem is enabled. 
To avoid putting horryfing ifdef second time around the label, just 
perform the cleanup and exit immediately directly.

Fixes: a84eeacbf9325 ("HID: steelseries: refactor probe() and remove()")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202509090334.76D4qGtW-lkp@intel.com/
Signed-off-by: Jiri Kosina <jkosina@suse.com>
---
 drivers/hid/hid-steelseries.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-steelseries.c
index 8af98d67959e..f98435631aa1 100644
--- a/drivers/hid/hid-steelseries.c
+++ b/drivers/hid/hid-steelseries.c
@@ -582,7 +582,7 @@ static void steelseries_remove(struct hid_device *hdev)
 	if (hdev->product == USB_DEVICE_ID_STEELSERIES_SRWS1) {
 #if IS_BUILTIN(CONFIG_LEDS_CLASS) || \
     (IS_MODULE(CONFIG_LEDS_CLASS) && IS_MODULE(CONFIG_HID_STEELSERIES))
-		goto srws1_remove;
+		hid_hw_stop(hdev);
 #endif
 		return;
 	}
@@ -596,7 +596,6 @@ static void steelseries_remove(struct hid_device *hdev)
 	cancel_delayed_work_sync(&sd->battery_work);
 
 	hid_hw_close(hdev);
-srws1_remove:
 	hid_hw_stop(hdev);
 }
 

-- 
Jiri Kosina
SUSE Labs


