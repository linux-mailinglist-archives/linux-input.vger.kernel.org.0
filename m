Return-Path: <linux-input+bounces-10525-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 303F8A4E397
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 16:36:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA6FF19C14BE
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 15:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2621424EA9D;
	Tue,  4 Mar 2025 15:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EeEmGMRu"
X-Original-To: linux-input@vger.kernel.org
Received: from beeline3.cc.itu.edu.tr (beeline3.cc.itu.edu.tr [160.75.25.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2996724EA90
	for <linux-input@vger.kernel.org>; Tue,  4 Mar 2025 15:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=160.75.25.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741101507; cv=pass; b=VV885AA187zZ8fPJpxSIJkZKFhK++G5/uSOmXQ2NZcwzgypP7eCELFz5Qqcl70dP1b3JotNNqSPX7pvb5JaFhFXSqrnTSbmXYgSeUKAG9G8iq/NhgIaLLPFxRWvifLbfkN52FwI9GoygX7DeySk77kq1ETJMKcoiR1KkTi2l6vY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741101507; c=relaxed/simple;
	bh=drQ0NcaIMsfTKB8JBITxEr57F74h1+2an2c5LUxLz6s=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=SdK8WDvHGw7HicL1TSraHRWZDRSwwyFr1ThxUwnof+GNGyurVzYYxrlm6hYeA3o5ObVxQifO6u1QFYEhmSqr9MJXuzj9RHIvhCJeF17sMWPA83zRdjS6OAcXyQEguAei8AwB+8aMLeCHQFT7GIPDmG7UNAvcPvX2uNpc72Fg9qU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EeEmGMRu; arc=none smtp.client-ip=209.85.210.42; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; arc=pass smtp.client-ip=160.75.25.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline3.cc.itu.edu.tr (Postfix) with ESMTPS id 1EE1540D0C8F
	for <linux-input@vger.kernel.org>; Tue,  4 Mar 2025 18:18:23 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EeEmGMRu
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6fS55c4ZzFyQP
	for <linux-input@vger.kernel.org>; Tue,  4 Mar 2025 18:17:25 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id D625642740; Tue,  4 Mar 2025 18:17:22 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EeEmGMRu
X-Envelope-From: <linux-kernel+bounces-541209-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EeEmGMRu
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
	by le2 (Postfix) with ESMTP id 6393241F76
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:56:24 +0300 (+03)
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by fgw1.itu.edu.tr (Postfix) with SMTP id 3B5293063EFC
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:56:24 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED1911893415
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 08:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E7D1F3BA9;
	Mon,  3 Mar 2025 08:52:50 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4961F37C5;
	Mon,  3 Mar 2025 08:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740991967; cv=none; b=VrRFrND/gWaK9KYL9+EZ21DVEd2o41LXvRP+z7HWqWJZCTQuX+MlNBTIXX7+R4IBjv2n1Ev55ZXlaxUp6Nc/3hetstfKoW/Dlm5cgYcl10TZarhbUHMebASabhq8ojVYYvbSiZtjvBchwZeAkKy1IJbOKXf7WS3VAsG6WHLxOfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740991967; c=relaxed/simple;
	bh=drQ0NcaIMsfTKB8JBITxEr57F74h1+2an2c5LUxLz6s=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=WISIGZMb/wbrLOGMW+mZX8OgtelL47kp83OnuehJAB9VzOKRR/95FvzWISiaG7NjSL9QjSeW7ZFG4N44RUy7b2BWUvTwYKmelSVCqrQLkrSJiozEtmx5GEFeZhU4Hkw/bVZBeBZzgDJpxAtLc14dA4Kvf3VbxeLBP0VG6k9TPDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EeEmGMRu; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7272f9d216dso2284930a34.3;
        Mon, 03 Mar 2025 00:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740991964; x=1741596764; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l3apEbB5XmEDlQN1GZTf5UAqshLkDwzJqPRGdkDFXaI=;
        b=EeEmGMRu3cSkc+A4/nY2/llbDpK8+4XpQIs4hOO9m1hMtgM4Psv6qkd8olZFpjI/6r
         ICaEQA0/hcTz9Uab0L0zU7POys9PM0GZiCUigdfMdX5dwSNYwx8rBiLHJJqF+IfxRl5y
         Q9aAHvpr/vUaAaPp1HICq1czQqaNCuQqNPuukOPteeNaw0Xv2WDdxvcOX5Aa4i/wOdc4
         H+uUgQ/OVJrq7aUTuOr102phUW/cZCs1Zq9uM9lL9HPpMtBCfJTbZrmoQwAZbMuK+2Z5
         kEaX9uppQPCAygQwszKGea/0bY5r4tBCt4+xIWu/ay+HwKuHQGzwj7lpPxNjseMZSX+t
         0FBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991964; x=1741596764;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l3apEbB5XmEDlQN1GZTf5UAqshLkDwzJqPRGdkDFXaI=;
        b=VdlpiWOqhuefJrlopXv4loTeYVt44DIQV/DAup9GLXYTA8dh0n1d/vI+hbKmBGym8k
         XdnGK3TBTx+f/yBIWhuRvHXIDS4BW4BiSxDORuEHFdmT4YDlIOOSemNVToJNFMKi+Qrf
         2U+8Tx/9en2CF1yQcuveoR1UNUNX+OuPF+beQ0jj7tbQZw0yorilXMDvcdWsn0qPy2/B
         iYfMDDbKOkUNVH1fOWnFAbUzVvjiwaC53l/KfxorqPLNzAkrgJ5I0PvHeK+L7dMGXkov
         K6HWLC2qBXVpKWiBJjPZ6ggcgPiR4V2gvyRM8y6IRalN5cAPH6QWCkv/7NqBASlfeMX4
         KruA==
X-Forwarded-Encrypted: i=1; AJvYcCUh6D4KAUGvl2jr8NWxyaYUClxsE/+hXNpkXHTshb3ZQI/mxMwOVsQNh4jjL5ODDRgtmEKvYKOLnYUBFngx@vger.kernel.org, AJvYcCWaiY7GNWwHqwSXqo5Ltp92wtzpb2qI0ij98SIrWUvycNciL9S8iA0/xUOthc26mIXtNysc+A6Eb9kG@vger.kernel.org, AJvYcCXjQLRrWJ//nJnvTbUym2AtVinJhis/1Cf94NdaEtIqQMfGZxr1EDWLJzVt3Eb2rHP7VdjuKDiJ5iKYxA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+KTk7OVDWCQYCpEsRV4QMcsFv3D7rmI9IcTMm0THc3JcSDTH0
	teLjKn1QVikkqrNEz2GSdgk/SJLyw0Ehn4WjrwqQQ9s238bShX4+7Ut0Si+LfoMVURZIQnPxN4U
	8RM9+f40tlBuNZqzWaefgdhw1Wtotc+PR/AwjiA==
X-Gm-Gg: ASbGncuJaOyOC65hneezNPzkj/+IR/WAUfIuZSyKsDAvWN2sBRJbRNxWVFUQOzhl15J
	ikAKl/J//CgLeAusCGPfsoUntouE1OeAqEXA2hGaYrPGsDNTJlhDJMyYzBxssWuQDfp5xx64moJ
	nBwjsbeXhuu9i2RvJtdrHbXFee6Q==
X-Google-Smtp-Source: AGHT+IGVw/xJYQA906dGaO2+AaOusBSJUMAjNkCzF49gdrArCYWq6L9wwEYN61Kf36dyc8ic6/ICgpx5E/hW6yrJVvQ=
X-Received: by 2002:a05:6830:2801:b0:726:fca9:bab with SMTP id
 46e09a7af769-728b827570emr7635281a34.2.1740991964435; Mon, 03 Mar 2025
 00:52:44 -0800 (PST)
Precedence: bulk
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Strforexc yn <strforexc@gmail.com>
Date: Mon, 3 Mar 2025 16:52:33 +0800
X-Gm-Features: AQ5f1Jr_302gzLK2k61JcHxbnXykQb8ALHoLNT99PGA7rQZs-ybQ35Sv4Y0ZQ2w
Message-ID: <CA+HokZreT4LYLbru4cc0iU4jKkdf40YnVunaGX0hFV2GAnnuEg@mail.gmail.com>
Subject: [BUG] UBSAN: Array-Index-Out-of-Bounds in usbhid_parse (HID) on 6.14.0-rc4
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-usb@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6fS55c4ZzFyQP
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741706253.78917@0EKdWui9crBdgLt8CM9cnQ
X-ITU-MailScanner-SpamCheck: not spam

Dear Maintainers, When using our customized Syzkaller to fuzz the
latest Linux kernel, the following crash was triggered.

Kernel commit: v6.14-rc4 (Commits on Feb 24, 2025)
Kernel Config : https://github.com/Strforexc/LinuxKernelbug/blob/main/.conf=
ig
Kernel Log:  https://github.com/Strforexc/LinuxKernelbug/blob/main/array-in=
dex-out-of-bounds_usbhid_parse/log0
Reproduce C: https://github.com/Strforexc/LinuxKernelbug/blob/main/array-in=
dex-out-of-bounds_usbhid_parse/repro.cprog

I=E2=80=99ve encountered a UBSAN-reported array-index-out-of-bounds issue i=
n
the USB HID driver on Linux 6.14.0-rc4 during device probing, likely
triggered by a malformed USB descriptor. Here are the details:

UBSAN detects an out-of-bounds access at
drivers/hid/usbhid/hid-core.c:1025:18 in usbhid_parse, where index 1
exceeds the bounds of hid_class_descriptor [1] in struct
hid_descriptor. This occurs when parsing a HID device descriptor
during USB probing.

Location: The fault occurs in a loop: for (n =3D 0; n < num_descriptors;
n++) if (hdesc->desc[n].bDescriptorType =3D=3D HID_DT_REPORT), accessing
hdesc->desc[n].

Cause: struct hid_descriptor defines desc as a fixed-size array [1],
but the loop iterates up to num_descriptors (based on
hdesc->bNumDescriptors). UBSAN flags n=3D1 as out-of-bounds, though the
underlying descriptor buffer may be larger.

Context: Preceded by a USB descriptor error (-22), suggesting a
malformed HID device (likely Syzkaller-crafted), triggering the loop
with bNumDescriptors > 1.

Impact: No immediate crash, but a code hygiene issue flagged by UBSAN.
Runtime safety depends on descriptor buffer allocation, but it=E2=80=99s a
potential source of confusion or future bugs.

Could HID maintainers investigate? Suggested fixes:
1. Use a flexible array member (desc[]) in struct hid_descriptor and
adjust parsing to rely on runtime buffer size.
2. Add stricter validation of hdesc->bNumDescriptors against bLength
to reject malformed descriptors earlier.

Our knowledge of the kernel is somewhat limited, and we'd appreciate
it if you could determine if there is such an issue. If this issue
doesn't have an impact, please ignore it =E2=98=BA.
If you fix this issue, please add the following tag to the commit:
Reported-by: Zhizhuo Tang <strforexctzzchange@foxmail.com>, Jianzhou
Zhao <xnxc22xnxc22@qq.com>, Haoran Liu <cherest_san@163.com>

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
usb 1-1: string descriptor 0 read error: -22
usb 1-1: New USB device found, idVendor=3D080e, idProduct=3D4eb9, bcdDevice=
=3Dd7.f6
usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D3
------------[ cut here ]------------
UBSAN: array-index-out-of-bounds in drivers/hid/usbhid/hid-core.c:1025:18
index 1 is out of range for type 'hid_class_descriptor [1]'
CPU: 1 UID: 0 PID: 11382 Comm: kworker/1:5 Not tainted 6.14.0-rc4 #1
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/=
2014
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x180/0x1b0 lib/dump_stack.c:120
 ubsan_epilogue lib/ubsan.c:231 [inline]
 __ubsan_handle_out_of_bounds+0xdb/0x120 lib/ubsan.c:429
 usbhid_parse+0x9a4/0xa70 drivers/hid/usbhid/hid-core.c:1025
 hid_add_device+0x193/0xa90 drivers/hid/hid-core.c:2870
 usbhid_probe+0xf43/0x1440 drivers/hid/usbhid/hid-core.c:1431
 usb_probe_interface+0x30b/0x9e0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x252/0xaa0 drivers/base/dd.c:658
 __driver_probe_device+0x1df/0x460 drivers/base/dd.c:800
 driver_probe_device+0x49/0x120 drivers/base/dd.c:830
 __device_attach_driver+0x1e3/0x2f0 drivers/base/dd.c:958
 bus_for_each_drv+0x14c/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1f2/0x4d0 drivers/base/dd.c:1030
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0xc5e/0x1490 drivers/base/core.c:3665
 usb_set_configuration+0x11a5/0x1c50 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xbf/0x120 drivers/usb/core/generic.c:250
 usb_probe_device+0xed/0x3e0 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x252/0xaa0 drivers/base/dd.c:658
 __driver_probe_device+0x1df/0x460 drivers/base/dd.c:800
 driver_probe_device+0x49/0x120 drivers/base/dd.c:830
 __device_attach_driver+0x1e3/0x2f0 drivers/base/dd.c:958
 bus_for_each_drv+0x14c/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1f2/0x4d0 drivers/base/dd.c:1030
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0xc5e/0x1490 drivers/base/core.c:3665
 usb_new_device+0x8f4/0x1430 drivers/usb/core/hub.c:2663
 hub_port_connect+0x1122/0x2730 drivers/usb/core/hub.c:5533
 hub_port_connect_change+0x27c/0x7f0 drivers/usb/core/hub.c:5673
 port_event+0xe3d/0x1220 drivers/usb/core/hub.c:5833
 hub_event+0x517/0xca0 drivers/usb/core/hub.c:5915
 process_one_work+0x109d/0x18c0 kernel/workqueue.c:3236
 process_scheduled_works kernel/workqueue.c:3317 [inline]
 worker_thread+0x677/0xe90 kernel/workqueue.c:3398
 kthread+0x3b3/0x760 kernel/kthread.c:464
 ret_from_fork+0x48/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
---[ end trace ]---


