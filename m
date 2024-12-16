Return-Path: <linux-input+bounces-8605-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3931A9F3697
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 17:52:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B740818805BE
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 16:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9FF206261;
	Mon, 16 Dec 2024 16:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="P2J1K/a5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uwUiR8FG"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D889220898C;
	Mon, 16 Dec 2024 16:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734367518; cv=none; b=tYMoy2v47hRaiGg6QEUHht8IQgNx0xf6IcHu+Qh/FEYmC1d1QwTHU40aP4eLLLaEquLuYUYaN3O/Mm5hSqDvUQURQfffg5x7fnbzvHYYaN9wFloA18CRF8gODbRGAPxa00T3eCC0/9EgbVEzgF939nEX6PqjM72alktFZF8wj+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734367518; c=relaxed/simple;
	bh=CbxyEfceeA74vA5n978PKHNKNzB51SNaNB6+XIHqdNg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=DLBvGjFNk3tUaPEbu2cdZ02cg8YA1MryttytA6U+YIGQ/9PDt2hKYhL2uMDw8mKcq4dR+FJpaky4UP6L0efPK75mZ7lDHrYd4J99ksY5FOE/v9TyDk0FB+bGZvw2HeeP0ZPBbf9fvYKDqsZaTPhR77t35IZOpXfWW+mOGYomYYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=P2J1K/a5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=uwUiR8FG; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7A89C2540171;
	Mon, 16 Dec 2024 11:45:14 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-02.internal (MEProxy); Mon, 16 Dec 2024 11:45:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1734367514;
	 x=1734453914; bh=uTiNRTCtUd6G92MhqAcPIyZ7ztea6pMEB+/8c5/WMLQ=; b=
	P2J1K/a5C6SXEfVb2YWLMZrIUgB3Vcwg/2Eulf1pnKEyoffm3QOcP5hSXExLnQZQ
	th6SKJ3Z8KF/9JgQeEXa1i0YBz+7x2bV02Y8/rV22wlPpDwoGaApQ6ot+F5jl87V
	sfeIjJCkal9Sx+rIgRBrRgTUvbEy/jUiojhyMsrS846FaoSEwumLKockzP8XVrWi
	l46kBo/ojKoiLDMw7AkGz6waXGWZiuK5FgW1Nfb6oBhz/PFfdvZYzqtp1+1iOg3w
	qDd6zNUKYcZjvPvuq44yXQ77sYXYskfn42JvGCCZ3SZxTNHxYT/Y7MSIWwIKpSHg
	bstB1n/llVGnLy3rmK7cJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734367514; x=
	1734453914; bh=uTiNRTCtUd6G92MhqAcPIyZ7ztea6pMEB+/8c5/WMLQ=; b=u
	wUiR8FGiIo/RuLzu1F0VZ2w7GfX2C27xj+s1IfcTPdyOU90i/qPBjDhAGSFJuhae
	2LenISYQxYzRrtVgO0MZ/yvKVU9sW6EoqM62VJ/y9OsDBmH7TgWinCOIX3gNvY2A
	JYMQu5jczY86VGWMj/p4KEeza4C+USu/3rQKSYUgD2pCdqjZpj6WgawpnYYU6h2y
	7yzHlw08ujSGft94/mUM8P3USQuQO0MTP5M4ahcsZp100YeDLuxXVYAfkDjSoUya
	jtfBC9iDjU6NPVnTAwZdQhPW9XopH8EmNPeRYCYk/YA/P8xfjvFGZ6NcWREMSDsr
	6gyBa3fBUauQS489BXPwg==
X-ME-Sender: <xms:GVlgZ49vC242r7oXCl7Q0f23kIufloutd7HfVsZ3Am2W_MMeQ5bCGg>
    <xme:GVlgZwsW40LdrtawySX5II6JWszoUH-4lmJbddAnQ-UpHefQMBlLQoLmoV_1rRt-m
    uqu1bEWH7zOVnCb4R0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrleefgdelfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdforghrkhcurfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvghnoh
    hvohesshhquhgvsggsrdgtrgeqnecuggftrfgrthhtvghrnhepudefgfelhefgveffheeh
    uedtudefffetiedtvedthefgvdeuvdefgeeiiefhieegnecuffhomhgrihhnpehgihhthh
    husgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhnsggprhgtph
    htthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprggrrhhonhdrmhgr
    segtrghnohhnihgtrghlrdgtohhmpdhrtghpthhtohepsggrghgrshguohhtmhgvsehgmh
    grihhlrdgtohhmpdhrtghpthhtoheprhguuhhnlhgrphesihhnfhhrrgguvggrugdrohhr
    ghdprhgtphhtthhopegvvhgvnhdrgihusehinhhtvghlrdgtohhmpdhrtghpthhtohepsg
    gvnhhtihhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhikhhosheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpthhtoh
    eplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehl
    ihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:GVlgZ-CcAlQEddU_S8eJMqifZ0Poe1euQgrsziJFQS7t9dMEQnIttw>
    <xmx:GVlgZ4d3cUECRXFoBdecb9cv1drZ6iLTX20SLF9N9TEt1nRUsCfRgQ>
    <xmx:GVlgZ9Pyak1q45It3hI2M9EzfWHERK-wGTgXrA0iYCyhPFmKQseo9A>
    <xmx:GVlgZymSHWKCYO7OSw--OB6_aFIxcNCelb2yUzbMgMSIR4ObLcL9YA>
    <xmx:GllgZwqI_2YBdhsE5XyD8TgBSapdSF_c3Xifkkcm0KVFOYpnxWpXapPA>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CD6F83C0066; Mon, 16 Dec 2024 11:45:13 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 16 Dec 2024 11:44:53 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Even Xu" <even.xu@intel.com>, "Jiri Kosina" <jikos@kernel.org>,
 bentiss@kernel.org, "Jonathan Corbet" <corbet@lwn.net>, bagasdotme@gmail.com,
 aaron.ma@canonical.com, "Randy Dunlap" <rdunlap@infradead.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Message-Id: <fc72c31b-b1df-482a-966f-f81459a733f2@app.fastmail.com>
In-Reply-To: <20241216014127.3722172-1-even.xu@intel.com>
References: <20241216014127.3722172-1-even.xu@intel.com>
Subject: Re: [PATCH v3 00/22] Add Intel Touch Host Controller drivers
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Sun, Dec 15, 2024, at 8:41 PM, Even Xu wrote:
> Intel Touch Host Controller (THC) is a new high performance input IP
> which can benefit HID device's data transaction, such as touch screen,
> touch pad, stylus.
>
> THC IP now evoluates to V4, it can support 3 different modes: IPTS,
> HIDSPI and HIDI2C. Here are upgrade history:
> - THC v1, for TGL/LKF, supports intel private IPTS (Intel Precise Touch
>   and Stylus) protocol ( IPTS mode)
> - THC v2, for ADL, add industrial standard HID over SPI protocol support
>   (HIDSPI mode)
> - THC v3, for MTL, enhance HID over SPI mode
> - THC v4, for LNL, add inudstrial standard HID over I2C protocol support
>   (HIDI2C mode) 
>
> Linux Surface community (https://github.com/linux-surface) already
> implemented IPTS mode. These patch series provides THC HIDSPI mode and
> THC HIDI2C mode support on Linux.
>
> These patch series includes:
> 1. Document for THC hardware and software introduction.
> 2. Intel THC Hardware layer driver which provides control interfaces
>    for protocol layer.
> 3. Intel QuickSPI (R) driver working as a HIDSPI device driver which
>    implements HID over SPI protocol and flow.
> 4. Intel QuickI2C (R) driver working as a HIDI2C device driver which
>    implements HID over I2C protocol and flow.
>
> Change logs:
> v3:
> - Change tables in documents from literal block to table format
> - Change symbol namespace to string literal according to patch:
>   cdd30ebb1b9f ("module: Convert symbol namespace to string literal")
> - Refine Kconfig description
> - Enhance Quickspi and Quicki2c driver by clearing THC hardware interal
>   state before doing initialization to avoid BIOS impacts.
> - A fix in Quicki2c driver when does set_report
>
> v2:
> - Fix document format issues
> - Add THC device IDs for Intel Panther Lake (PTL) platform
>
>
> Even Xu (13):
>   HID: THC: Add documentation
>   HID: intel-thc-hid: intel-thc: Add THC DMA interfaces
>   HID: intel-thc-hid: intel-thc: Add THC I2C config interfaces
>   HID: intel-thc-hid: intel-quickspi: Add THC QuickSPI driver hid layer
>   HID: intel-thc-hid: intel-quickspi: Add THC QuickSPI ACPI interfaces
>   HID: intel-thc-hid: intel-quickspi: Add HIDSPI protocol implementation
>   HID: intel-thc-hid: intel-quickspi: Add PM implementation
>   HID: intel-thc-hid: intel-quicki2c: Add THC QuickI2C driver skeleton
>   HID: intel-thc-hid: intel-quicki2c: Add THC QuickI2C driver hid layer
>   HID: intel-thc-hid: intel-quicki2c: Add THC QuickI2C ACPI interfaces
>   HID: intel-thc-hid: intel-quicki2c: Add HIDI2C protocol implementation
>   HID: intel-thc-hid: intel-quicki2c: Complete THC QuickI2C driver
>   HID: intel-thc-hid: intel-quicki2c: Add PM implementation
>
> Xinpeng Sun (9):
>   HID: intel-thc-hid: Add basic THC driver skeleton
>   HID: intel-thc-hid: intel-thc: Add THC registers definition
>   HID: intel-thc-hid: intel-thc: Add THC PIO operation APIs
>   HID: intel-thc-hid: intel-thc: Add APIs for interrupt
>   HID: intel-thc-hid: intel-thc: Add THC LTR interfaces
>   HID: intel-thc-hid: intel-thc: Add THC interrupt handler
>   HID: intel-thc-hid: intel-thc: Add THC SPI config interfaces
>   HID: intel-thc-hid: intel-quickspi: Add THC QuickSPI driver skeleton
>   HID: intel-thc-hid: intel-quickspi: Complete THC QuickSPI driver
>
>  Documentation/hid/index.rst                   |    1 +
>  Documentation/hid/intel-thc-hid.rst           |  568 ++++++
>  MAINTAINERS                                   |    6 +
>  drivers/hid/Kconfig                           |    2 +
>  drivers/hid/Makefile                          |    2 +
>  drivers/hid/intel-thc-hid/Kconfig             |   42 +
>  drivers/hid/intel-thc-hid/Makefile            |   22 +
>  .../intel-quicki2c/pci-quicki2c.c             |  966 ++++++++++
>  .../intel-quicki2c/quicki2c-dev.h             |  186 ++
>  .../intel-quicki2c/quicki2c-hid.c             |  166 ++
>  .../intel-quicki2c/quicki2c-hid.h             |   14 +
>  .../intel-quicki2c/quicki2c-protocol.c        |  224 +++
>  .../intel-quicki2c/quicki2c-protocol.h        |   20 +
>  .../intel-quickspi/pci-quickspi.c             |  987 +++++++++++
>  .../intel-quickspi/quickspi-dev.h             |  172 ++
>  .../intel-quickspi/quickspi-hid.c             |  165 ++
>  .../intel-quickspi/quickspi-hid.h             |   14 +
>  .../intel-quickspi/quickspi-protocol.c        |  409 +++++
>  .../intel-quickspi/quickspi-protocol.h        |   25 +
>  .../intel-thc-hid/intel-thc/intel-thc-dev.c   | 1578 +++++++++++++++++
>  .../intel-thc-hid/intel-thc/intel-thc-dev.h   |  116 ++
>  .../intel-thc-hid/intel-thc/intel-thc-dma.c   |  969 ++++++++++
>  .../intel-thc-hid/intel-thc/intel-thc-dma.h   |  146 ++
>  .../intel-thc-hid/intel-thc/intel-thc-hw.h    |  881 +++++++++
>  include/linux/hid-over-i2c.h                  |  117 ++
>  include/linux/hid-over-spi.h                  |  155 ++
>  26 files changed, 7953 insertions(+)
>  create mode 100644 Documentation/hid/intel-thc-hid.rst
>  create mode 100644 drivers/hid/intel-thc-hid/Kconfig
>  create mode 100644 drivers/hid/intel-thc-hid/Makefile
>  create mode 100644 drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
>  create mode 100644 drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
>  create mode 100644 drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c
>  create mode 100644 drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.h
>  create mode 100644 drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c
>  create mode 100644 drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.h
>  create mode 100644 drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
>  create mode 100644 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
>  create mode 100644 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.c
>  create mode 100644 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.h
>  create mode 100644 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c
>  create mode 100644 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.h
>  create mode 100644 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
>  create mode 100644 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
>  create mode 100644 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
>  create mode 100644 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.h
>  create mode 100644 drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h
>  create mode 100644 include/linux/hid-over-i2c.h
>  create mode 100644 include/linux/hid-over-spi.h
>
> -- 
> 2.40.1

For the series:

Tested on a 'to be announced' Lenovo Lunarlake laptop that uses the THC controller and confirmed it worked well. The platform under test is using the quicki2c driver.
Tested touchpad and touchscreen and didn't see any issues.

Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Of limited value, as I don't know the hid subsystem well, I did do a code review and it looked good to me (only minor notes are typo 'recevie' on patch 6 commit description and 'calcualte' on patch 7 commit description).

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Thanks!
Mark

