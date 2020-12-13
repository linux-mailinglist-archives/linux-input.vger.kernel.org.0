Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D96582D8C83
	for <lists+linux-input@lfdr.de>; Sun, 13 Dec 2020 10:27:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405588AbgLMJ1V (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 13 Dec 2020 04:27:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405251AbgLMJ1U (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 13 Dec 2020 04:27:20 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9130C0613D3;
        Sun, 13 Dec 2020 01:26:39 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id r24so22562336lfm.8;
        Sun, 13 Dec 2020 01:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yuNhmmHmnglR4+a849l/Qpk6FKUo6KZWZdXCsttzh9E=;
        b=PeGuXDOrYS4nVsTauwj71NseymVT35P9SOOXpvL0VLpjm9MvDXBQ3v3Bvkvqp8AhGH
         4s/2q4MahhotRRHjfKpq+s5GUftd8+LOa9javhX0+EzIOpfz1JWQesWiyFSBSJE1YBDy
         jMo0PxouXS8Atf7oG8jlmIdRaAPWboqcghMSoWL0pHnXVlPhw2tfm+Ina5iyRXTn+GpR
         OduH0LVF0zxcLB1sqtMG+xTgtqroPxmiJPOVLdUwJKiNeBsZr+L/UxB2g+xfKxlggGX0
         AlXdpKWwwlYEcETI9KK6/7mPlhyc801rRqJY4V8/yvRBN0KFW0ojMIScrv5aipuTtaTB
         v/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yuNhmmHmnglR4+a849l/Qpk6FKUo6KZWZdXCsttzh9E=;
        b=VHCLgEynVvfzNqr3axaC9YIHWxnHz0Gpg0T8xtzfGvxZ5umBvZceeiY92fF0TUjUrN
         +lrskXAkhLHUTIr6TsP5jd60R+YdbS1amKqTnbhDyOau/VHbdnK/CrKW+7yJXtRJQ+Bk
         FRbx0MCbc8uH8KWIWeDQPPOZr3MwIKTg4rkvrfKqu4fab9b3B0lTZVZyIRp+kMKmAXZZ
         GmvK9ddL+2Jf57uCxzns05j0zZSEkFTIKxg20yEkwaE/AoJj4aCufSuTZT/cF01ZH3TJ
         ngNNGEzBUzdLMxdW492Z9ENJXqpegkN/yPCl2D4wHyMHQPUNgQWEwCCj3bJ7DgzEa1cu
         4Ymw==
X-Gm-Message-State: AOAM530bktGlpDZIbKxbvfaPBzQT3m/Gk1U6IQV6eixVgIoIPF7ACuyK
        8G6FDVC4plC2KprAwxwuxGSCKsPv/Ps=
X-Google-Smtp-Source: ABdhPJzFnWwYAEFQsppb5AFp5+KVlOF+k6RxFv8P+4ehis/Tsvd+bgl/yWe8ZoPJRsBbVcrMtefqaQ==
X-Received: by 2002:a05:6512:38ab:: with SMTP id o11mr3844397lft.132.1607851597841;
        Sun, 13 Dec 2020 01:26:37 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-205.dynamic.spd-mgts.ru. [109.252.193.205])
        by smtp.googlemail.com with ESMTPSA id a24sm1888952ljn.85.2020.12.13.01.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Dec 2020 01:26:36 -0800 (PST)
Subject: Re: [PATCH v3 0/3] Support wakeup methods of Atmel maXTouch
 controllers
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Nick Dyer <nick@shmanahar.org>, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jiada Wang <jiada_wang@mentor.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201206212217.6857-1-digetx@gmail.com>
 <X9QuTuGEicUnlaJp@google.com>
 <3577ed5b-feff-5915-7d70-5fa8fe4a0a82@gmail.com>
 <X9WblR19HZPZ5XtY@google.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6b515373-e7b3-4700-7d34-4413a630c461@gmail.com>
Date:   Sun, 13 Dec 2020 12:26:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <X9WblR19HZPZ5XtY@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

13.12.2020 07:41, Dmitry Torokhov пишет:
> Thank you for the logs. I am confused where these calls to put the
> controller into deep sleep are coming from. Does something constantly
> open and close input device?

Input devices are re-opened multiple times during Linux distro boot-up,
a regular Ubuntu 20.10 in this case.

> Do you have any additional patches?

No, I'm using next-20201211 + this "wakeup methods" patchset.

> We definitely do not issue deep sleep request in mxt_start(). Do you mind
> putting dump_stack() into mxt_set_t7_power_cfg() to see where the calls
> are coming from?

Please see the log below, I added it like this:

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c
b/drivers/input/touchscreen/atmel_mxt_ts.c
index e3342fdfe9f3..bbc5a5ee158a 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2271,6 +2271,8 @@ static int mxt_set_t7_power_cfg(struct mxt_data
*data, u8 sleep)
 	dev_dbg(dev, "Set T7 ACTV:%d IDLE:%d\n",
 		new_config->active, new_config->idle);

+	dump_stack();
+
 	return 0;
 }

> I also do not see additional "waking up controller" messages after
> requesting the chip via T7 to be configured to be active, which I'd
> expected to see if we indeed needed to wake it up again for T6 to
> succeed.

I'm not familiar with what controller does internally, hence no clue.


[ 1.195295] Family: 160 Variant: 0 Firmware V1.0.AA Objects: 18
[ 1.195468] T37 Start:118 Size:130 Instances:1 Report IDs:0-0
[ 1.195482] T44 Start:248 Size:1 Instances:1 Report IDs:0-0
[ 1.195493] T5 Start:249 Size:9 Instances:1 Report IDs:0-0
[ 1.195503] T6 Start:258 Size:6 Instances:1 Report IDs:1-1
[ 1.195513] T38 Start:264 Size:64 Instances:1 Report IDs:0-0
[ 1.195523] T7 Start:328 Size:3 Instances:1 Report IDs:0-0
[ 1.195533] T8 Start:331 Size:10 Instances:1 Report IDs:0-0
[ 1.195543] T9 Start:341 Size:34 Instances:1 Report IDs:2-17
[ 1.195553] T15 Start:375 Size:11 Instances:2 Report IDs:18-19
[ 1.195563] T18 Start:397 Size:2 Instances:1 Report IDs:0-0
[ 1.195573] T22 Start:399 Size:17 Instances:1 Report IDs:20-20
[ 1.195583] T24 Start:416 Size:19 Instances:1 Report IDs:21-24
[ 1.195593] T25 Start:435 Size:14 Instances:1 Report IDs:25-25
[ 1.195602] T27 Start:449 Size:7 Instances:1 Report IDs:26-26
[ 1.195612] T28 Start:456 Size:6 Instances:1 Report IDs:27-27
[ 1.195622] T40 Start:462 Size:5 Instances:1 Report IDs:0-0
[ 1.195631] T41 Start:467 Size:6 Instances:1 Report IDs:0-0
[ 1.195641] T43 Start:473 Size:6 Instances:1 Report IDs:0-0
[ 1.195746] Direct firmware load for maxtouch.cfg failed with error -2
[ 1.196199] T6 Config Checksum: 0x8D7459
[ 1.196212] T6 Status 0x90 RESET CAL
[ 1.196428] Initialized power cfg: ACTV 10, IDLE 50
[ 1.197275] Touchscreen size X1279Y799
[ 1.210563] T6 Status 0x00 OK
[14.866461] Set T7 ACTV:10 IDLE:50
[14.866495] CPU: 1 PID: 209 Comm: systemd-udevd Tainted: G        W
[14.866507] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[14.866523]  (unwind_backtrace) from  (show_stack)
[14.866568]  (show_stack) from  (dump_stack)
[14.866599]  (dump_stack) from  (mxt_set_t7_power_cfg)
[14.866635]  (mxt_set_t7_power_cfg) from  (mxt_start)
[14.866654]  (mxt_start) from  (mxt_input_open)
[14.866673]  (mxt_input_open) from  (input_open_device)
[14.866708]  (input_open_device) from  (evdev_open+0x113/0x134)
[14.866735]  (evdev_open) from  (chrdev_openc)
[14.866763]  (chrdev_open) from  (do_dentry_open4)
[14.866791]  (do_dentry_open) from  (path_openat+0x6b9/0xa04)
[14.866815]  (path_openat) from  (do_filp_open)
[14.866833]  (do_filp_open) from  (do_sys_openat2+0x1bf/0x23c)
[14.866850]  (do_sys_openat2) from  (do_sys_open)
[14.866872]  (do_sys_open) from  (__sys_trace_return+0x1/0x16)
[14.894683] Set T7 ACTV:0 IDLE:0
[14.894719] CPU: 1 PID: 209 Comm: systemd-udevd Tainted: G        W
[14.894732] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[14.894748]  (unwind_backtrace) from  (show_stack)
[14.894791]  (show_stack) from  (dump_stack)
[14.894822]  (dump_stack) from  (mxt_set_t7_power_cfg)
[14.894856]  (mxt_set_t7_power_cfg) from  (mxt_stop)
[14.894875]  (mxt_stop) from  (input_close_device)
[14.894908]  (input_close_device) from  (evdev_release)
[14.894934]  (evdev_release) from  (__fput8)
[14.894958]  (__fput) from  (task_work_run)
[14.894975]  (task_work_run) from  (do_work_pending+0x38d/0x438)
[14.894991]  (do_work_pending) from  (slow_work_pending+0x9/0x16)
[14.898242] T6 Status 0x10 CAL
[15.186570] Set T7 ACTV:10 IDLE:50
[15.186594] CPU: 0 PID: 212 Comm: libinput-fuzz-e Tainted: G        W
[15.186605] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[15.186615]  (unwind_backtrace) from  (show_stack)
[15.186648]  (show_stack) from  (dump_stack)
[15.186671]  (dump_stack) from  (mxt_set_t7_power_cfg)
[15.186699]  (mxt_set_t7_power_cfg) from  (mxt_start)
[15.186715]  (mxt_start) from  (mxt_input_open)
[15.186732]  (mxt_input_open) from  (input_open_device)
[15.186764]  (input_open_device) from  (evdev_open+0x113/0x134)
[15.186786]  (evdev_open) from  (chrdev_openc)
[15.186808]  (chrdev_open) from  (do_dentry_open4)
[15.186830]  (do_dentry_open) from  (path_openat+0x6b9/0xa04)
[15.186848]  (path_openat) from  (do_filp_open)
[15.186863]  (do_filp_open) from  (do_sys_openat2+0x1bf/0x23c)
[15.186878]  (do_sys_openat2) from  (do_sys_open)
[15.186895]  (do_sys_open) from  (__sys_trace_return+0x1/0x16)
[15.210404] T6 Status 0x00 OK
[15.229106] Set T7 ACTV:0 IDLE:0
[15.229132] CPU: 0 PID: 212 Comm: libinput-fuzz-e Tainted: G        W
[15.229148] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[15.229164]  (unwind_backtrace) from  (show_stack)
[15.229208]  (show_stack) from  (dump_stack)
[15.229237]  (dump_stack) from  (mxt_set_t7_power_cfg)
[15.229273]  (mxt_set_t7_power_cfg) from  (mxt_stop)
[15.229294]  (mxt_stop) from  (input_close_device)
[15.229323]  (input_close_device) from  (evdev_release)
[15.229350]  (evdev_release) from  (__fput8)
[15.229370]  (__fput) from  (task_work_run)
[15.229386]  (task_work_run) from  (do_work_pending+0x38d/0x438)
[15.229402]  (do_work_pending) from  (slow_work_pending+0x9/0x16)
[15.322473] waking up controller
[15.357423] Set T7 ACTV:10 IDLE:50
[15.357450] CPU: 1 PID: 216 Comm: libinput-fuzz-t Tainted: G        W
[15.357463] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[15.357476]  (unwind_backtrace) from  (show_stack)
[15.357510]  (show_stack) from  (dump_stack)
[15.357537]  (dump_stack) from  (mxt_set_t7_power_cfg)
[15.357566]  (mxt_set_t7_power_cfg) from  (mxt_start)
[15.357586]  (mxt_start) from  (mxt_input_open)
[15.357604]  (mxt_input_open) from  (input_open_device)
[15.357632]  (input_open_device) from  (evdev_open+0x113/0x134)
[15.357655]  (evdev_open) from  (chrdev_openc)
[15.357679]  (chrdev_open) from  (do_dentry_open4)
[15.357702]  (do_dentry_open) from  (path_openat+0x6b9/0xa04)
[15.357721]  (path_openat) from  (do_filp_open)
[15.357737]  (do_filp_open) from  (do_sys_openat2+0x1bf/0x23c)
[15.357754]  (do_sys_openat2) from  (do_sys_open)
[15.357773]  (do_sys_open) from  (__sys_trace_return+0x1/0x16)
[15.373658] Set T7 ACTV:0 IDLE:0
[15.373683] CPU: 1 PID: 216 Comm: libinput-fuzz-t Tainted: G        W
[15.373696] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[15.373708]  (unwind_backtrace) from  (show_stack)
[15.373744]  (show_stack) from  (dump_stack)
[15.373770]  (dump_stack) from  (mxt_set_t7_power_cfg)
[15.373817]  (mxt_set_t7_power_cfg) from  (mxt_stop)
[15.373856]  (mxt_stop) from  (input_close_device)
[15.373904]  (input_close_device) from  (evdev_release)
[15.373947]  (evdev_release) from  (__fput8)
[15.373971]  (__fput) from  (task_work_run)
[15.373987]  (task_work_run) from  (do_work_pending+0x38d/0x438)
[15.374003]  (do_work_pending) from  (slow_work_pending+0x9/0x16)
[15.375130] T6 Status 0x10 CAL
[26.500032] waking up controller
[26.526733] Set T7 ACTV:10 IDLE:50
[26.526772] CPU: 1 PID: 497 Comm: Xorg Tainted: G        W
[26.526788] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[26.526809]  (unwind_backtrace) from  (show_stack)
[26.526862]  (show_stack) from  (dump_stack)
[26.526903]  (dump_stack) from  (mxt_set_t7_power_cfg)
[26.526943]  (mxt_set_t7_power_cfg) from  (mxt_start)
[26.526965]  (mxt_start) from  (mxt_input_open)
[26.526986]  (mxt_input_open) from  (input_open_device)
[26.527023]  (input_open_device) from  (evdev_open+0x113/0x134)
[26.527051]  (evdev_open) from  (chrdev_openc)
[26.527080]  (chrdev_open) from  (do_dentry_open4)
[26.527108]  (do_dentry_open) from  (path_openat+0x6b9/0xa04)
[26.527130]  (path_openat) from  (do_filp_open)
[26.527149]  (do_filp_open) from  (do_sys_openat2+0x1bf/0x23c)
[26.527167]  (do_sys_openat2) from  (do_sys_open)
[26.527189]  (do_sys_open) from  (ret_fast_syscall+0x1/0x26)
[26.550377] T6 Status 0x00 OK
[26.564628] Set T7 ACTV:0 IDLE:0
[26.564659] CPU: 0 PID: 497 Comm: Xorg Tainted: G        W
[26.564672] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[26.564688]  (unwind_backtrace) from  (show_stack)
[26.564729]  (show_stack) from  (dump_stack)
[26.564759]  (dump_stack) from  (mxt_set_t7_power_cfg)
[26.564793]  (mxt_set_t7_power_cfg) from  (mxt_stop)
[26.564811]  (mxt_stop) from  (input_close_device)
[26.564844]  (input_close_device) from  (evdev_release)
[26.564871]  (evdev_release) from  (__fput8)
[26.564892]  (__fput) from  (task_work_run)
[26.564909]  (task_work_run) from  (do_work_pending+0x38d/0x438)
[26.564924]  (do_work_pending) from  (slow_work_pending+0x9/0x16)
[26.575062] Set T7 ACTV:10 IDLE:50
[26.575097] CPU: 1 PID: 497 Comm: Xorg Tainted: G        W
[26.575114] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[26.575132]  (unwind_backtrace) from  (show_stack)
[26.575189]  (show_stack) from  (dump_stack)
[26.575228]  (dump_stack) from  (mxt_set_t7_power_cfg)
[26.575269]  (mxt_set_t7_power_cfg) from  (mxt_start)
[26.575294]  (mxt_start) from  (mxt_input_open)
[26.575319]  (mxt_input_open) from  (input_open_device)
[26.575363]  (input_open_device) from  (evdev_open+0x113/0x134)
[26.575398]  (evdev_open) from  (chrdev_openc)
[26.575433]  (chrdev_open) from  (do_dentry_open4)
[26.575469]  (do_dentry_open) from  (path_openat+0x6b9/0xa04)
[26.575495]  (path_openat) from  (do_filp_open)
[26.575518]  (do_filp_open) from  (do_sys_openat2+0x1bf/0x23c)
[26.575540]  (do_sys_openat2) from  (do_sys_open)
[26.575566]  (do_sys_open) from  (ret_fast_syscall+0x1/0x26)
[26.577569] waking up controller
[26.656736] T6 Status 0x10 CAL
[26.662621] T6 Status 0x00 OK
