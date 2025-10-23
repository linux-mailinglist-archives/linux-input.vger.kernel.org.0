Return-Path: <linux-input+bounces-15684-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A0188C0387F
	for <lists+linux-input@lfdr.de>; Thu, 23 Oct 2025 23:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C8F004F95F0
	for <lists+linux-input@lfdr.de>; Thu, 23 Oct 2025 21:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C3F292B2E;
	Thu, 23 Oct 2025 21:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJHxIYtQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F59279346
	for <linux-input@vger.kernel.org>; Thu, 23 Oct 2025 21:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761254772; cv=none; b=hBfOfI33uOvsOn6v1AmmYRE7w/AnIGxzazirgDTOvd8BwT9xo/UL5Bj4tSj6nzpNvBI/nCpypu9535C4G2+TdPBbPqCp2cErU18jihsoRuvWSWitqH5v3zkDMfe1MtYAQNcl/h3wwKm01k+viFhKP/Ft5kssOmLytb3fSCQDVTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761254772; c=relaxed/simple;
	bh=EW0ub3RZ0IeR5T8+wBKSKZLvP+eFUz3WJJfXdcStf/8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=IkQEroCPdGW+CbYSZ5QNVi4bJAVMxgwqxHabUNoukN0XTJSFACWLTQP0+t6X1XTEknhS6DhAlfS8YzY40FFFwsvg0H+2tUcsS4a7uI5qA0Q2IHI/nizkfbyHsqVcxK8BKOnWAh7Ue13FnFKr3r9jepxsSgYtNDjLbbyf2q/6i18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJHxIYtQ; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5db2486c870so636740137.2
        for <linux-input@vger.kernel.org>; Thu, 23 Oct 2025 14:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761254768; x=1761859568; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=llKd0qdO/C+Y7SgZm28pzArskhry689Ba9VDZYaEpHE=;
        b=XJHxIYtQw4rhkv2f4kFxkWYzOOheeQEpO536cnaEpmEfYkMadKknzdun57O5XBU3wB
         ddG8E9Gep4/eeC7nAQLaClZkUL6KdBABV75NBJN+yTCb/j/Z1818HJoi8/mAGhpv7kwV
         Gv87XGYhpIbCvTPvRhFQ70lwRK+QmkEmgzXkBvRSk3f2xyr9g33neOsBaKovbKKjOLIT
         H7w9HeytVypgsF17tidtLWdRMAo4CM6T62Jz1E1bY5guusK95+zXBbsvQx4EorNEqk1Q
         eOuPPZVnkn7TXWbTiMcDFx/1RzrFZ+3MyrSjGvnkbln8tW8asMwTsJ569WXYEC/Jkd6x
         cceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761254768; x=1761859568;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=llKd0qdO/C+Y7SgZm28pzArskhry689Ba9VDZYaEpHE=;
        b=JQdkScy+O4kyJ0LJBwkobsJ50amafQAw1Vv3uXvqdHI1L5oz07vnUgw87b+ap9Z1rs
         hp6CwAwJdMraL5U3gaujLAGEpNaP75yG1sdoSEzexvd7cmuFKJc4i3R8wPk1tviTQmsk
         9RB8ghMA6KetE4zQakaoeiJdNFBDPd8SiHED7p7mB0ekwype26wFg8klmz5umHflmCzx
         2WT03O90KW0xuwgyEL0qzGvji+jU2d77JBKPdY0gdCkxOgpdivwUo8AcT+MIIbDfWQl+
         LWcpvMLy8swfMsgVXaiVhpsTjw9kGhoekUHi40bEpL7AEX/UK78K/BF735WC+7UwSCCx
         0HyA==
X-Gm-Message-State: AOJu0Ywza0f9yk82nQfafh7eibMXJEmkQ2lnjcFehBX7oMJyOR01OE/x
	79c82tvS0VOaC5Jr3X4TMHWX3K9IqEvNBaG10MJnccPqiMLxo6YR/URf9zSPmZSrxiFBVIOe5na
	g08lCm8AuvTMwh0xUO0mXSauc4vaS0RNvWaAa
X-Gm-Gg: ASbGncsV3NGMBFDOuU4C9w9Nnfp8zrM7Y7jo+k+MIVWUn/17hIv3HIDJP49kSmT6YXW
	Hy+eerg9DNLJqAz73Zuybh2JjuiU02AUqfXMZUa/iv9W7P5coZ09+DlR8fEDsjUv3Z0OV36/3K3
	tR4uMJqZ+Ofu3q7Bk8gmfXj26akOQBqo2aYJv68NPYDNQQNTcjmgbsoJFEwJRwm8W0LQzfA2A6H
	I1t+MECdNwPbAWjcnGAleybRDxxu3oa+jn/xhNUOOqbxuAY0STDgH5cdBTmg+GH3kZ5LO9zGA==
X-Google-Smtp-Source: AGHT+IEGxZPeuIrBaE4CLCblBDR97BiEb2NEkQHE4xgtmFPAz2PczEDeM1V3GhySV6iQEVY9OxI1bSHNU5TAwdPcbtY=
X-Received: by 2002:a05:6102:4194:b0:5d7:de09:524a with SMTP id
 ada2fe7eead31-5db2e44676bmr1468400137.1.1761254768158; Thu, 23 Oct 2025
 14:26:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Luis Cebrian <luiscb4@gmail.com>
Date: Thu, 23 Oct 2025 23:25:57 +0200
X-Gm-Features: AWmQ_blebApmP453x6j4ZLPmY5xl1G58EXryH_8l6P86p0kmDZf-iOQ8qMFOQIo
Message-ID: <CAJYES18taTbo2U7DjA0C_k0nz5bgJHfwoEgavxD5yf_KN5e=DQ@mail.gmail.com>
Subject: Touchpad needs psmouse.synaptics_intertouch
To: linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear linux-input,

I was having some issues with my touchpad on my Lenovo Thinkpad X390,
after reading some log messages, I noticed something among the lines
of:

psmouse serio2: synaptics: Your touchpad says it can support a
different bus. If i2c-hid and hid-rmi are not used, you might want to
try setting psmouse.synaptics_intertouch to 1.

Both of the mentioned modules were not loaded by default.
So I decided to set the intertouch option in the grub config, and
after a swift reboot I verified if the intertouch value had indeed
changed:

The touchpad is now noticeably more responsive and less jittery, hence
this email to report my findings.

As for the details:

- Hardware: Lenovo Thinkpad X390
- Distribution: Gentoo
- Kernel: 6.17.4
- Touchpad:

I: Bus=001d Vendor=06cb Product=0000 Version=0000
  N: Name="Synaptics TM3469-010"
  P: Phys=rmi4-00/input0
  S: Sysfs=/devices/pci0000:00/0000:00:1f.4/i2c-7/7-002c/rmi4-00/input/input13
  U: Uniq=
  H: Handlers=mouse2 event7
  B: PROP=5
  B: EV=b
  B: KEY=e420 10000 0 0 0 0
  B: ABS=6f3800001000003
...
  P: /devices/pci0000:00/0000:00:1f.4/i2c-7/7-002c/rmi4-00/input/input13
  M: input13
  R: 13
  U: input
  E: DEVPATH=/devices/pci0000:00/0000:00:1f.4/i2c-7/7-002c/rmi4-00/input/input13
  E: SUBSYSTEM=input
  E: PRODUCT=1d/6cb/0/0
  E: NAME="Synaptics TM3469-010"
  E: PHYS="rmi4-00/input0"
  E: PROP=5
  E: EV=b
  E: KEY=e420 10000 0 0 0 0
  E: ABS=6f3800001000003
  E: MODALIAS=input:b001Dv06CBp0000e0000-e0,1,3,k110,145,14A,14D,14E,14F,ra0,1,18,2F,30,31,34,35,36,37,39,3A,mlsfw
  E: USEC_INITIALIZED=3357289
  E: ID_INPUT=1
  E: ID_INPUT_TOUCHPAD=1
  E: ID_BUS=rmi
  E: ID_SERIAL=noserial
  E: ID_PATH=pci-0000:00:1f.4
  E: ID_PATH_TAG=pci-0000_00_1f_4
  E: ID_FOR_SEAT=input-pci-0000_00_1f_4
  E: TAGS=:seat:
  E: CURRENT_TAGS=:seat:
...
66: PS/2 00.0: 10500 PS/2 Mouse
  [Created at input.249]
  Unique ID: AH6Q.TdKqTm3XMU4
  Hardware Class: mouse
  Model: "Synaptics TM3469-010"
  Vendor: 0x06cb
  Device: "Synaptics TM3469-010"
  Compatible to: int 0x0210 0x0001
  Device File: /dev/input/mice (/dev/input/mouse2)
  Device Files: /dev/input/mice, /dev/input/mouse2, /dev/input/event7,
/dev/input/by-path/pci-0000:00:1f.4-event-mouse,
/dev/input/by-path/pci-0000:00:1f.4-mouse
  Device Number: char 13:63 (char 13:34)
  Driver Info #0:
    Buttons: 1
    Wheels: 0
    XFree86 Protocol: explorerps/2
    GPM Protocol: exps2
  Config Status: cfg=new, avail=yes, need=no, active=unknown
...

If there is more information required, feel free to ask, I am happy to help!


Kind regards,

Luis

