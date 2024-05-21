Return-Path: <linux-input+bounces-3752-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1D98CACF6
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2024 12:59:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7647F285709
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2024 10:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1584B6CDA3;
	Tue, 21 May 2024 10:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="ZJIrVmtr"
X-Original-To: linux-input@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48A01CD32;
	Tue, 21 May 2024 10:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716289031; cv=none; b=ZBhFIBbOlz2FaNrHFiTucttK8H7EC4gRE7qeEZ3xSZ89F1Qf5PUkgL4hn+4Aun/oXVEjMjkuc4aoSADsbtD9l5qFgcNPcVcms3O5tUR3r9EmhzdN1c0+ifb2MWfDUc5ixpJd6vt5HercmoZLDZAeSs0aKXmrC+5xcHmcUbrtTHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716289031; c=relaxed/simple;
	bh=C76g32JZyonj7kusR4KfExhstVUSnL0VE3jMmI65sF4=;
	h=Message-ID:Date:MIME-Version:Subject:References:From:Cc:To:
	 In-Reply-To:Content-Type; b=EfGd8GszhJ9gE5iL4Ic9eq5TyumKdf59mnbrwL8Mm48dlpEGaZvEiuNShzK3fEQhcOwQPNlDlWxIbVd0lZpTPzXMwg03m18p9rnQ9Ge0qecqOENFBH1MbFMmRGbj5MKcGEOy6QIaw0QNtyL0stUg6mY/XCDn/9ZLnNPKV/qRqqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=ZJIrVmtr; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:To:Cc:From:References:Subject:Reply-To:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=Yu4PqY2jiCO9zCIhoBU/ypd2qMuUu6ZRn4ftLnmzACw=;
	t=1716289029; x=1716721029; b=ZJIrVmtrwcRcuVH7P1nJOzIoJhNKf2lI+T1QeYKJXAN3c8F
	sJgg3V6L2JQ9wfpjXqGzm9B0Attpv87HxBXJrlnwPxVtiSn6ByY0a66WOewYNAr3NhlugsSpILGzp
	OkqmJKDt5ZCzrktOQR8BJpoZ9pSftuQqvozVe3xDs9G2q38bVsA1S952KoqJQ4fP9NqcbQ9JPKCNX
	ITmr0udB3Ju32GHN4Ju88xrRk1wMlGYSiUR78XwY5BsYry/nENWeinbOI+Js9tqYUF1rx/wuEW4CY
	OJgRPAi2Gel+IfjsxTpJTEK6wpeNmVerlvt8cn/Rj8AujGv60zWXilRfIVfVDGjw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1s9NB4-0005CB-Lm; Tue, 21 May 2024 12:57:06 +0200
Message-ID: <f0dd90aa-78b0-4253-96b0-3241e8b2a11b@leemhuis.info>
Date: Tue, 21 May 2024 12:57:06 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: BUG: Framework Laptop 16 i2c-hid Based Touchpad Sometimes Fails
 To Initialize Properly On Early Boot
References: <0111018f7508efb1-1206661a-d4b5-4bd1-b54f-ccb8504b8b4a-000000@us-west-1.amazonses.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
Cc: Arazil Songweaver <arazil@arazil.net>, linux-input@vger.kernel.org
To: Linux kernel regressions list <regressions@lists.linux.dev>
In-Reply-To: <0111018f7508efb1-1206661a-d4b5-4bd1-b54f-ccb8504b8b4a-000000@us-west-1.amazonses.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1716289029;1cd30929;
X-HE-SMSGID: 1s9NB4-0005CB-Lm

On 14.05.24 04:57, Arazil Songweaver wrote:
> We are experiencing an issue where the touch pad on the Framework Laptop
> 16 fails to initialize properly when the "i2c-hid" is loaded early in
> the boot process. This issue is especially prominent when "i2c-hid" is
> built directly into the kernel. When the "i2c-hid" module is built in,
> the issue occurs roughly 50% of the time.
> (https://community.frame.work/t/touchpad-not-working-since-update-archlinux/50304) Moving the module load to later in the boot process appears to resolve this issue by making initialization more likely to succeed. (https://gitlab.archlinux.org/archlinux/mkinitcpio/mkinitcpio/-/releases/v39.1)
> 
> Kernel version: Linux artemis 6.9.0-1-git-01560-ga7c840ba5fa7 #1 SMP
> PREEMPT_DYNAMIC Tue, 14 May 2024 01:49:25 +0000 x86_64 GNU/Linux
> 
> I'm using the standard Arch Linux AUR "linux-git" package with the
> following kernel configuration changes:
> 
> CONFIG_I2C_DEBUG_CORE=y
> CONFIG_I2C_DEBUG_ALGO=y
> CONFIG_I2C_DEBUG_BUS=y
> CONFIG_I2C_HID=y
> CONFIG_I2C_HID_ACPI=y
> CONFIG_I2C_HID_OF=y
> CONFIG_I2C_HID_CORE=y
> 
> We tried reverting the following patches without any behavior impact
> (good or bad):
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.8.y&id=fb49deec375aa5beca4a5d71d7a74ec951872f28
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.8.y&id=418c5575d56410c6e186ab727bf32ae32447d497
> 
> Impacted devices seem to include: "PIXA3854:00" and "i2c_designware
> AMDI0010:03"

Any news on this? If this is still unresolved I'll bring this to the
attention of the right developer, if this is a recent regressions (it
sounds like it, but it's not exactly clear; and from the first link
above it sounds like it's partly due to a change in arch's approach to
the initramfs).

Ciao, Thorsten

