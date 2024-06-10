Return-Path: <linux-input+bounces-4304-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94632902A3A
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 22:50:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DAAC2822E0
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 20:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558024DA09;
	Mon, 10 Jun 2024 20:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CT0d8IAG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD80D17545
	for <linux-input@vger.kernel.org>; Mon, 10 Jun 2024 20:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718052651; cv=none; b=rXcdy0Jr0SB0/FJpQwN1m2AqyASG2p22DOKbSbLh2bnLIy9vn2oK5k9nELGD/UPNeWxdKxTHyAMIYJR9gXYppEkDzshIVS7Y8qgx3myFNTbAG/ZFDSpKSVthBRGLi6cTharkWYO2fqPPXXMC883qskFcqg4Sn0MuwJmqKDFL97E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718052651; c=relaxed/simple;
	bh=E/a42XWSrOneZ6DLYzwc0Uxt7YbBDjH8f4MJTZBG4Vo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=JdoxFH+xNv3zi/VLgWNZ8hpVZ3oQNujPGkmk8QDVhFHj0J2HyWJGavWVyEKRrcyTdD7VoD7CCwxmlHryNffDyHiwjZW5N+oMP/qJi/Vqkf0QC9nBVM26LqM2CA9eqM151LUbRjEuVqbW5vjLLcHA/XnQLh7lpel4EgLGXU4pRTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CT0d8IAG; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-df771b45e13so4970567276.2
        for <linux-input@vger.kernel.org>; Mon, 10 Jun 2024 13:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718052649; x=1718657449; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E/a42XWSrOneZ6DLYzwc0Uxt7YbBDjH8f4MJTZBG4Vo=;
        b=CT0d8IAG9B1l4L7/dWCeN0kKZRbfnxGV8Ngru0RGjvOBpG9KaLjsMd7p5ywoChVkEk
         sbPz8HbrMvhlqShAQeOMQ6NDBojm94gDuAbGHzlo+Aj3xuVjs7Bruten6fKl2AqbB7cm
         /V32dSMWvuSPZl28TVEKPc1Rme3LrNy9Qhb+/9Qj2BeLcHBg4vfFPeuqXIa1B6KqJ+15
         /U1tOX0ulDLkw/oggikGzYjYrdMLn5fx6ypQ2uxfI+K3teR9XoMpPLXUAGjqts3Q91UX
         QI3KK3pri059tcbWnWztT6fgWqcZXS4FQigviU1M3PDnGTMUs7N6SAqVj2wP7OPSdbzR
         O2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718052649; x=1718657449;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E/a42XWSrOneZ6DLYzwc0Uxt7YbBDjH8f4MJTZBG4Vo=;
        b=VRc3IIs9XWP/DBFBlQJivZRYYNlOxsOokfr5sZvJGStGiLS6XOev8D9Muii3wrMB75
         4I7dGjvOlC4f5TxboYaQheHnhST2G4VIlYr7oy+aMCc3sxq1f0c3/lhjA6sSQMoYpcN3
         HaqJjKHEF0ZQkwa+YNSxxSCGuuiSsFzXIyDB1xdmEXN5vV8GoL5fYfAZLbZbtsIueaaC
         AJpa5MnHkQBT9IlQRCgzREzg7FwUaWsKJCwmi3DmVfL+zgN5bZbXpcR+zF9/iPXnVuOw
         cFTMiCgrBVNu56B6AIWC72q2/ycLpOGiCc7WeXRSNsCsXA3Wrz4A+iVx28Yh2l/6mUGB
         4zrA==
X-Gm-Message-State: AOJu0YyUD0c4JfvaFNgrNfnBpzWP5AJkkG0HXdwyoqp/EVHOXa7MX+mp
	zIhYwBDjr6AoV9/Jg1eheHZDSp1OiweCr97McXM97P3EJ1zF0IpKAsEvQWlPzabABSg9FFh9rHt
	X/KeSb9dyrHojsLEasTEbg5dZGAw1FVLT
X-Google-Smtp-Source: AGHT+IEkqoogwGxjsaOFpJnVFxPK3yWBZijLNkSQXHeDiU8DYdXsKExNluCFnOw013d1W0u3ESZEvqNspmNSgseDi7E=
X-Received: by 2002:a25:c7d2:0:b0:dee:7fc3:ad6a with SMTP id
 3f1490d57ef6-dfaf670aa2cmr9081321276.56.1718052648545; Mon, 10 Jun 2024
 13:50:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Markus Rathgeb <maggu2810@gmail.com>
Date: Mon, 10 Jun 2024 22:50:37 +0200
Message-ID: <CAOcK=CMO2YKouZkDz=9oCfEjeYp-uB51trovG3Wru7J++eT31A@mail.gmail.com>
Subject: reporting: psmouse.synaptics_intertouch=1 for "PNP: DLL060d PNP0f13"
To: linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,
my kernel log tells me I could try to set psmouse.synaptics_intertouch
to 1 and report it.

kernel: psmouse serio1: synaptics: Your touchpad (PNP: DLL060d
PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi
are not used, you might want to try setting
psmouse.synaptics_intertouch to 1 and report this to
linux-input@vger.kernel.org.

As i2c-hid and hid-rmi modules are not used I added
"psmouse.synaptics_intertouch=1" to the kernel command line and reboot
the system.

After that the message does not appear anymore.

AFAIK my touchpad works before and after that change without any
problems. At least I did not realize any.

Without enabling intertouch the kernel message looks like:

May 01 18:44:01 m3800.localdomain kernel: psmouse serio1: synaptics:
queried max coordinates: x [..5660], y [..4646]
May 01 18:44:01 m3800.localdomain kernel: psmouse serio1: synaptics:
queried min coordinates: x [1386..], y [1252..]
May 01 18:44:01 m3800.localdomain kernel: psmouse serio1: synaptics:
Your touchpad (PNP: DLL060d PNP0f13) says it can support a different
bus. If i2c-hid and hid-rmi are not used, you might want to try
setting psmouse.synaptics_intertouch to 1 and report this to
linux-input@vger.kernel.org.
May 01 18:44:01 m3800.localdomain kernel: psmouse serio1: synaptics:
Touchpad model: 1, fw: 8.1, id: 0x1e2b1, caps:
0xd00123/0x840300/0x126800/0x0, board id: 2733, fw id: 1515627

and another one

May 18 21:27:26 m3800.localdomain kernel: psmouse serio1: synaptics:
queried max coordinates: x [..5660], y [..4646]
May 18 21:27:26 m3800.localdomain kernel: psmouse serio1: synaptics:
queried min coordinates: x [1386..], y [1252..]
May 18 21:27:26 m3800.localdomain kernel: psmouse serio1: synaptics:
Your touchpad (PNP: DLL060d PNP0f13) says it can support a different
bus. If i2c-hid and hid-rmi are not used, you might want to try
setting psmouse.synaptics_intertouch to 1 and report this to
linux-input@vger.kernel.org.
May 18 21:27:26 m3800.localdomain kernel: psmouse serio1: synaptics:
Touchpad model: 1, fw: 8.1, id: 0x1e2b1, caps:
0xd00123/0x840300/0x126800/0x0, board id: 2733, fw id: 1515627

After adding the kernel parameter it looks like

Jun 10 22:18:57 m3800.localdomain kernel: psmouse serio1: synaptics:
queried max coordinates: x [..5660], y [..4646]
Jun 10 22:18:57 m3800.localdomain kernel: psmouse serio1: synaptics:
queried min coordinates: x [1386..], y [1252..]
Jun 10 22:18:57 m3800.localdomain kernel: psmouse serio1: synaptics:
Trying to set up SMBus access
Jun 10 22:18:57 m3800.localdomain kernel: psmouse serio1: synaptics:
SMbus companion is not ready yet
Jun 10 22:18:57 m3800.localdomain kernel: psmouse serio1: synaptics:
Touchpad model: 1, fw: 8.1, id: 0x1e2b1, caps:
0xd00123/0x840300/0x126800/0x0, board id: 2733, fw id: 1515627
Jun 10 22:19:03 m3800.localdomain kernel: psmouse serio1: synaptics:
queried max coordinates: x [..5660], y [..4646]
Jun 10 22:19:03 m3800.localdomain kernel: psmouse serio1: synaptics:
queried min coordinates: x [1386..], y [1252..]
Jun 10 22:19:03 m3800.localdomain kernel: psmouse serio1: synaptics:
Trying to set up SMBus access

So, the SMBus part is new.

Hopefully the report is helpful for you.

Best regards,
Markus

