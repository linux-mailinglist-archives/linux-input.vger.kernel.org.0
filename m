Return-Path: <linux-input+bounces-17184-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2D0D393B6
	for <lists+linux-input@lfdr.de>; Sun, 18 Jan 2026 10:59:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC63E300BEEB
	for <lists+linux-input@lfdr.de>; Sun, 18 Jan 2026 09:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163E8285CA8;
	Sun, 18 Jan 2026 09:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aswe04TH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E63191F98
	for <linux-input@vger.kernel.org>; Sun, 18 Jan 2026 09:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768730363; cv=pass; b=tZ+TXhsCdTHXXO2QGpABM6n7xM4Dz3gmUpMptkRYOEncbPVhkdudSND+BLO/Sv9G/A2uY5AXpYiy7CcpeUCxtdKwI0YYjh5ze7QKlw82+qMkfAEkHUynV9Yo0hisxTMbkXPG0PT+V6jBTUvHnW3p28DwEKlIBbMfxmzzz4lGmds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768730363; c=relaxed/simple;
	bh=iSoaxKucymioKOatdJMHI8aTiRmhOpIJ+OtJLJv/RY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IIMnJf5gnwwKvnEzgMOK0ZSVw8oc7VKkDw75wrmSxqmzB4eOcSC0VrRsp1h81meUwA+4ETTlnyH49nIn4+qfjVzQ681MOTK1qEmo+mmyA3FRSXmmDYTUGrzeAPL0DHLFQIzKsFKLAwNNB3obh+zQWGhWfdeBIJtSen2zzhR4Jjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aswe04TH; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-121bf277922so4585539c88.0
        for <linux-input@vger.kernel.org>; Sun, 18 Jan 2026 01:59:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768730362; cv=none;
        d=google.com; s=arc-20240605;
        b=WQs71/j3At29jn9ns6D+4/XyLsQ6nGd76uwkZ0pDxm7cgoiCP+G52spg6PdELGHMY5
         kI3ACIEJwX/HYQxQQ9SohsZ5C6XpXe4124rwvpLPmnZ/pGBDRfhUythDdrE0622XBiTg
         f8gUaLlV0iBCOzukRNh9q0WHhRGSJcMKKvi4AShDlClS11eYSRtcDt50gY8a95e+gcpS
         dYJhT+LYxWQDYQkQVvtR6e+cXKcAUWWnfzk1XWRpcY9lNS5wNbN2667bGU7WbG50PuRE
         Yu0oG6iypHWCFoZBMao6+OgC3GUmDP7khaOPl7GPRPpDxvS5SnjqxSOVPhIt83UCORX0
         qWiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vC9WWdMeXz4PlYV4yOfR0q8AydRuBZYQWx+WuodNMqs=;
        fh=ZQMtgBY5Bqg5HD9WPnSOO39eDwrgnfmPtyDmvjqeZco=;
        b=fpPUxV0fVO1KGp2/yOuPua8M2MueLEIOdPlcfr3unh8W97xpgKXFeSpmIVW9hYxnJC
         n6jslY2M/kGm4NzS16L0WMjeF0DS+yZ4upf8X0WfaPFbxvMIbOnOUjcfI8VbkWtQhwjo
         cFB/oNzy6gXxDjeZy5wMnkVK1vHNK0TqLC1Nmc6UP2yi7yScsY4F5xjRHoilV6jFmm0D
         hvPLkqmuiDvpfuSwS3X1zONzVb90s6N3LLJ0tEKgdjQg9lM4XWlBMM3F3X/vDsE4yolU
         SpAru4RcnvKR+BSGvnnuKpkHcTBuIfpK/TdcPzgwNjclvIqxnqtmLHVBFCpjNiZzfe7R
         zh4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768730362; x=1769335162; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vC9WWdMeXz4PlYV4yOfR0q8AydRuBZYQWx+WuodNMqs=;
        b=Aswe04THxstqG+SBIG194si1AdHnPb415V+qJliS7pf5I+zLMGIS8dWZzFmFD5pSEE
         eTmH20YO+VC+tV91ej73gNAva1cwoQazBajKucZ1j6/k7PSNLMLE7mkC5DkUoV9DmEnf
         RJlMcU49cvddCfgDvIYLtYlRwYfD9dZYHV5LZpG/2XlAWUsFq0lGf2uHosCK6WJDkh7P
         YsWfjkDhjpd3nfOZfywsZbOyt3upPRdSK4vs0haiJtGVDVbSn5L0mPdStc1sshyYgYcy
         8RJp7SA/et0p35+vVwQRbsXcEuI8y0PyFD5jVleqt0KRSt8t96gmCnR23sFkq62zwsVc
         42ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768730362; x=1769335162;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vC9WWdMeXz4PlYV4yOfR0q8AydRuBZYQWx+WuodNMqs=;
        b=BAlq/xdb7p+Q+y2/Ax7aBayJpV64IzegksSyq1pCw0UHnfRzKPdD6oioGX4Wjhqurh
         EevBf1+V0F+L0zKiemnR6XRag5+z9EOHWS3YO30cP0ixYgDl+W4ujM5+wKYpx/OcxBAz
         lFO3HA+1qSEwnZYWr7zgWXsSteNxdRw2kk2ip3zoEpCwLwVGHoBLa1grmGD4LP2fDbJo
         fxmVr91tqzBIn1rDB91naQxKNTWy+GGWnSrnTXHuKd/y9PFNWB+dmDW2LIEFJ6upxFrV
         3ltrKrbqVay2vbBAqYVavv6t6QsctQ7cum4PWN/nnqBpn4gJ+GvnGKiTpBJ9eYipJ2dy
         jTiA==
X-Forwarded-Encrypted: i=1; AJvYcCXiI/yUfh/hnfFhl1RxZzN0ec1vPb1euwYMxC2VFlGbLwGHAhpBEKm/qJsJ8iPg0yB9BX8VKmBH3QyiSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/C1ms5WHdKQWTv9BKn0mYIhHeUWH6LJiTH2JRqmZcDABZKbN8
	5Q5IWl2j7eLH8CXMu0ZEui2Vzn56PNcjatojRAyBReFZgfh7FAT8Elw50TkQIwLa3kPmlz2RIuh
	j1qnTHnve2T4AplSNyyhuSf2m0IuwDtE=
X-Gm-Gg: AY/fxX5kygcM9GIjZHf429n9ZyXs3oQEVXQsFALAj9SUrLyGVaGA4vpOQhW3vgi+HPX
	RgP7MzZewO5iWbhRr2ODJFaib3WkPKi0SC+Cs3f8K9Pb1WmXaXzbWvubDyfLwnUwVQAb0AmU7+U
	B1+WxDGORJ1qpMCtGRNWdw08QF+hu7s5+XrDR+Zpk1cAxTl7Ze2BeWs1OW3QUk+WPA6+w/Wjo/h
	7pPLgv+5dvprUNQ/3My67nOjsyrqnA3/Z+eJo+SPpYNo4jUHMDCDxFiXO0JFwNzvE1hL7djpjwC
	roPHxb9lprL5o+cD4KmdFnPuI1Cm
X-Received: by 2002:a05:7022:608d:b0:119:e569:f620 with SMTP id
 a92af1059eb24-1244b35acf4mr6110965c88.25.1768730361433; Sun, 18 Jan 2026
 01:59:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOQ1CL4+DP1TuLAGNsz5GdFBTHvnTg=5q=Dr2Z1OQc6RXydSYA@mail.gmail.com>
 <38ea07c1-50ce-4342-aba9-fe2f4bc6c503@bitmath.se> <CAOQ1CL6G6eDcX+Qth3D531h72wW3RmvecCWjr5nAT-UdDWg40w@mail.gmail.com>
 <6880b5ba-ee76-4a9e-a116-16843a737b34@bitmath.se>
In-Reply-To: <6880b5ba-ee76-4a9e-a116-16843a737b34@bitmath.se>
From: Liam Mitchell <mitchell.liam@gmail.com>
Date: Sun, 18 Jan 2026 10:59:10 +0100
X-Gm-Features: AZwV_Qhz6WjM3n0dzXkZYBf3M0Tj_Ic8MICRY7e3qY7D4sOaFvXhzmas5O8G-1Q
Message-ID: <CAOQ1CL66c6fua8u4O3yU1XTjg5aVQ2yPvArAbmBjohb0TA=JLA@mail.gmail.com>
Subject: Re: bcm5974 trackpad broken after USB reset
To: Henrik Rydberg <rydberg@bitmath.se>
Cc: Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 18 Jan 2026 at 04:32, Henrik Rydberg <rydberg@bitmath.se> wrote:
> Here is a completely untested patch which tries to verify that the mode
> is properly set, and dumps the control data in the process. With a bit
> of luck, this will just work because of the added delay, but if not, we
> might be able to figure out the status change.

No luck there. The control data is always exactly as written. I've
also tried logging the control data after longer delays but didn't see
anything different.

[  391.262674] usbcore: bcm5974 4-1.8.2:1.2: forced unbind
[  391.264601] bcm5974 4-1.8.2:1.2: trackpad urb shutting down: -2
[  391.265182] bcm5974: control data: 01 05 00 00 00 00 00 00
                ........
[  391.265992] bcm5974: switched to normal mode.
[  391.290770] usbcore: usb 4-1.8-port2: not reset yet, waiting 10ms
[  391.352802] usb 4-1.8.2: reset full-speed USB device number 5 using ehci-pci
[  391.364919] usbcore: usb 4-1.8-port2: not reset yet, waiting 10ms
[  391.447757] usbcore: usbhid 4-1.8.2:1.2: usb_probe_interface
[  391.447771] usbcore: usbhid 4-1.8.2:1.2: usb_probe_interface - got id
[  391.447779] usbhid: drivers/hid/usbhid/hid-core.c: HID probe called
for ifnum 2
[  391.447820] hid: drivers/hid/hid-quirks.c: Found squirk 0x84000 for
HID device 0x05ac:0x0259
[  391.449301] usbcore: bcm5974 4-1.8.2:1.2: usb_probe_interface
[  391.449329] usbcore: bcm5974 4-1.8.2:1.2: usb_probe_interface - got id
[  391.449692] input: bcm5974 as
/devices/pci0000:00/0000:00:1d.0/usb4/4-1/4-1.8/4-1.8.2/4-1.8.2:1.2/input/input16
[  391.482694] bcm5974: control data: 08 05 00 00 00 00 00 00
                ........
[  391.483487] bcm5974: switched to wellspring mode.
[  391.493648] bcm5974 4-1.8.2:1.2: trackpad urb shutting down: -2
[  391.494169] bcm5974: control data: 01 05 00 00 00 00 00 00
                ........
[  391.495142] bcm5974: switched to normal mode.
[  391.508166] bcm5974: control data: 08 05 00 00 00 00 00 00
                ........
[  391.509157] bcm5974: switched to wellspring mode.
[  391.514674] bcm5974 4-1.8.2:1.2: trackpad urb shutting down: -2
[  391.515205] bcm5974: control data: 01 05 00 00 00 00 00 00
                ........
[  391.516241] bcm5974: switched to normal mode.
[  391.536717] bcm5974: control data: 08 05 00 00 00 00 00 00
                ........
[  391.537626] bcm5974: switched to wellspring mode.
[  391.545669] bcm5974 4-1.8.2:1.2: trackpad urb shutting down: -2
[  391.546175] bcm5974: control data: 01 05 00 00 00 00 00 00
                ........
[  391.547089] bcm5974: switched to normal mode.
[  391.557783] bcm5974: control data: 08 05 00 00 00 00 00 00
                ........
[  391.558488] bcm5974: switched to wellspring mode.
[  391.568627] bcm5974 4-1.8.2:1.2: trackpad urb shutting down: -2
[  391.569033] bcm5974: control data: 01 05 00 00 00 00 00 00
                ........
[  391.569722] bcm5974: switched to normal mode.
[  391.584744] bcm5974: control data: 08 05 00 00 00 00 00 00
                ........
[  391.585475] bcm5974: switched to wellspring mode.
[  392.181559] bcm5974: bad trackpad package, length: 8

Liam

