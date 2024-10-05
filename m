Return-Path: <linux-input+bounces-7100-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A6F991B4B
	for <lists+linux-input@lfdr.de>; Sun,  6 Oct 2024 01:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26F0A1F21A47
	for <lists+linux-input@lfdr.de>; Sat,  5 Oct 2024 23:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 768CE13699A;
	Sat,  5 Oct 2024 23:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DdLKz9Q3"
X-Original-To: linux-input@vger.kernel.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931D438DC7
	for <linux-input@vger.kernel.org>; Sat,  5 Oct 2024 23:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728169280; cv=none; b=GS4+sHwFVBIvPnTxpfwxNKlmfH1HirkY7S8bpugC3HsOJHlX7rJ7tmrT5sJBg2TL9YPyyzqVr46rEkmplysazH7qgIj0PpWJ6LJ/+hN216Vehntwm5Rwbq+d8ku+cllZHdt4+jsnlq2dJdLCugYJCC6J9SqlVCnal7wckhzbOVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728169280; c=relaxed/simple;
	bh=AHqtrUXLnRrR0Ri2ZrDjK/CplQXTk70tmu7zF21/EHU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GN7zvLQ81vFQMDHdw4bHH2SWAplilu3Kow7wJZGSkBRP4XuWYse6m1h8BJJE9pUDXOwaj86Tk5RKUGS89/6f31n/Pl61XUMubuZP2NmAUvQMRZInzH7qmPcjmClDaGgNA1ML3wobUNRj89Kys76yg/3I1FFMJO3EWwHoqJ6Bpuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DdLKz9Q3; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Sat, 5 Oct 2024 17:01:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1728169276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=7X5Jq+AcA+jPDD+/febQkLpikiOOBc5DGkmdTZQg63Q=;
	b=DdLKz9Q31ZbJBeGJ7xn6A8Fhzbjg91gGy7MDDqmRa9Vzzoa4/EoaHqW3mwILIURlbhL5Vt
	bDjnF0JeLIbsUMDqsjNo5IdVwhMtdD/0EY4aX9eI3+RHwY0/uIb3/KSZUA4EHQDI3SCCla
	96v3uMzoQMq0heS6eZsJf5r1NjcBW5c=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jose Fernandez <jose.fernandez@linux.dev>
To: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Hans de Goede <hdegoede@redhat.com>, Kenny Levinsen <kl@kl.wtf>, 
	Kai-Heng Feng <kai.heng.feng@canonical.com>, Johan Hovold <johan+linaro@kernel.org>, 
	Nam Cao <namcao@linutronix.de>
Cc: linux-input@vger.kernel.org, regressions@lists.linux.dev
Subject: [REGRESSION] HID: i2c-hid: Touchpad not working on Thinkpad Z16 Gen 2
Message-ID: <gbvkokf7rpsayfqv4l5mvk347lal72q54jgxfvwu7bmx7olngm@e3tcy6oyaas3>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT

I'm using Fedora 40 with the vanilla kernel built from the 6.12-RC1 [1]. There
is a regression that causes the touchpad to stop working on my Thinkpad Z16 Gen
2 (Sensil touchpad). dmesg shows this on 6.12-rc1 when filtering by `hid`:

[    0.134369] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR0, rdevid:160
[    0.134370] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR1, rdevid:160
[    0.134371] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR2, rdevid:160
[    0.134372] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR3, rdevid:160
[    1.214845] hid: raw HID events driver (C) Jiri Kosina
[    1.214881] usbcore: registered new interface driver usbhid
[    1.214882] usbhid: USB HID core driver

and this in 6.10.12 (touchpad working):

[    0.143812] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR0, rdevid:160
[    0.143814] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR1, rdevid:160
[    0.143815] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR2, rdevid:160
[    0.143815] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR3, rdevid:160
[    1.244550] hid: raw HID events driver (C) Jiri Kosina
[    1.244588] usbcore: registered new interface driver usbhid
[    1.244589] usbhid: USB HID core driver
[    2.291822] hid-generic 0018:2C2F:0027.0001: input,hidraw0: I2C HID v1.00 Mouse [SNSL0027:00 2C2F:0027] on i2c-SNSL0027:00
[    2.349966] hid-generic 0018:056A:5383.0002: input,hidraw0: I2C HID v1.00 Mouse [WACF2200:00 056A:5383] on i2c-WACF2200:00
[    2.357724] hid-multitouch 0018:2C2F:0027.0001: input,hidraw1: I2C HID v1.00 Mouse [SNSL0027:00 2C2F:0027] on i2c-SNSL0027:00
[    2.516529] wacom 0018:056A:5383.0002: hidraw0: I2C HID v1.00 Mouse [WACF2200:00 056A:5383] on i2c-WACF2200:00

The regression doesn't seem to be race-related. I've restarted and re-logged
multiple times, and the issue reproduces consistently.

[1] https://copr.fedorainfracloud.org/coprs/g/kernel-vanilla/mainline-wo-mergew/

