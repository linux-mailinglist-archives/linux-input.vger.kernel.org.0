Return-Path: <linux-input+bounces-126-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CF07F066A
	for <lists+linux-input@lfdr.de>; Sun, 19 Nov 2023 14:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0ED271F20FE7
	for <lists+linux-input@lfdr.de>; Sun, 19 Nov 2023 13:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67FED748F;
	Sun, 19 Nov 2023 13:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=catboys.cloud header.i=@catboys.cloud header.b="JhJMp7fU"
X-Original-To: linux-input@vger.kernel.org
X-Greylist: delayed 397 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 19 Nov 2023 05:25:55 PST
Received: from mail.catboys.cloud (mail.catboys.cloud [IPv6:2a03:4000:24:c2:1820:f0ff:fea1:a4fe])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37E7FE5
	for <linux-input@vger.kernel.org>; Sun, 19 Nov 2023 05:25:55 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 78563C01A6;
	Sun, 19 Nov 2023 14:19:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catboys.cloud;
	s=dkim; t=1700399954; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7LtC/bvzMI0v0YZiXT39yHcKG9tQFDME2f3QAeNmr1g=;
	b=JhJMp7fUJfa0HSbJdc1wGCf6lhw4aEP4rZ9zgh0ykX9/59pkokyMVVJOdzdOQqGkaDcz2D
	z2XVJxLVGROktzTYpps9CZvol9B8uFMCIcjW5L/myOO/BhLp+jZ44y48nPUQIz+eKzXZPz
	QVDzIFSC4lArZEwiILP+rDl7y+YzILdGRK/V4Lv7Gv07J5WrpAiys1D9p+PElQLNesfgCi
	IJ1B7eHVV+tNPIBYidlaj+gE8cTd61CtsnAxwobUoewH3b8eQqOjB5qztubA5bWJSidKpH
	050wmg06gnQbV3wmcLgjXF1LROqvwllFds3FUbbnH/cUnj0ArNozVhQahNtTVw==
From: tom@catboys.cloud
To: linux-input@vger.kernel.org,
 Basavaraj Natikar <basavaraj.natikar@amd.com>,
 Steven Presser <steve@pressers.name>
Subject:
 Re: amd-sfh bug: Accelerometer will not initialize on Lenovo 300e 2nd
 generation
Date: Sun, 19 Nov 2023 14:19:07 +0100
Message-ID: <2306055.ElGaqSPkdT@toms-envy-x360>
In-Reply-To: <744f43e1-93f2-97c8-03b8-f9025386abe0@pressers.name>
References: <744f43e1-93f2-97c8-03b8-f9025386abe0@pressers.name>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Last-TLS-Session-Version: TLSv1.3

Hi there,

> I have a Lenovo 300e 2nd Generation, a "2-in-1". This device uses an
> accelerometer via the AMD Sensor Fusion Hub to detect laptop and tablet
> mode. Despite being attached to the (supported) AMD SFH, this
> accelerometer does not function. When the system tries to initialize the
> accelerometer, it simply reports:
> 
> [    8.850222] pcie_mp2_amd 0000:04:00.7: sid 0x0 (accelerometer) status
> 0x5
> [    8.850240] pcie_mp2_amd 0000:04:00.7: Failed to discover, sensors
> not enabled is 0
> [    8.850276] pcie_mp2_amd: probe of 0000:04:00.7 failed with error -95
> 
> The device works correctly under Windows, so I know this isn't broken
> hardware.

I have an "HP ENVY x360 Convertible 13-ay0xxx " and the same problem. The 
sensors work on Windows, but on Linux I can't get them to work (running kernel 
6.6.1).

I'm getting a similar dmesg message:

[    3.353367] pcie_mp2_amd 0000:04:00.7: enabling device (0000 -> 0002)
[    8.154761] pcie_mp2_amd 0000:04:00.7: Failed to discover, sensors not 
enabled is 0
[    8.154793] pcie_mp2_amd: probe of 0000:04:00.7 failed with error -95

I'd also be happy to help with debugging this. 

Thank you for your time!
Tom



