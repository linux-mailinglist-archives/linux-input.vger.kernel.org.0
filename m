Return-Path: <linux-input+bounces-9835-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CDEA2C315
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 13:53:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AAAB16AA48
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 12:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFBB71DED54;
	Fri,  7 Feb 2025 12:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rm0CZCqC"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60E02417C9;
	Fri,  7 Feb 2025 12:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738932807; cv=none; b=ahIeCEcckxxW7HfJdTq6UfzTq1Y+U2gcv/T26aAS1GNFUQcv9vCTiKeFQ817GO3pbdKFC9X/kmv53Cduj2Rc09Tz6c9Y0p5jSQWui+qPviVh/LCN11+2wxcIJg5wFTUfXOYjgsdjdyo68/EtArPWIHsnQTsD7T/OPOzo8NktK2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738932807; c=relaxed/simple;
	bh=k04RPwsmTcsvvy3E4I3d8fzWMPRzRo8r9205m3ptnWM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=BomLqS2TnFaqGi5j4aRDW0nhaegm2yTVLZZwS2hnjnbeDJgvxypsW4VAzwriSS63pW1RpeuLto7e6YCHjIFk/usV/4i3KpxKC8Hvev2zzcrq9ejDZQ8PDkO40ECMXljmDF8kF2QIO8zNiQA5JeJSc5ai/YCuMaQBei+HevrHbrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rm0CZCqC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A777C4CED1;
	Fri,  7 Feb 2025 12:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738932807;
	bh=k04RPwsmTcsvvy3E4I3d8fzWMPRzRo8r9205m3ptnWM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rm0CZCqCgshy5c/bLVPLikN8tS51zXT6PJ0Bdp032EHrlaI9XheivPFD5wgk8jUVB
	 XWFm+zMle9eihVI4jc+bA+f8+WPUNxWQAyqHBOy6ofckTekEPqAGcKToEcPKEiq41P
	 Oa+5NhtOTBkbRArUS2WFXzjej2/YKutSWLzjEA3GCuHggb7Z6/mX4UN8RegtVynom7
	 tgiemlu4fV3ltmkmbzP/cCdMCoGCrNHdEpZoRkZT4MPr/KAaGzP/AhYvlCxEwfEtB3
	 5mnuA5zqfVokeLdUT/vZSNEa/oglrIQ/egfbM9N/g4JTRufD0eS6ZpknbZPFSahVh3
	 t+AtiK2BInhjA==
Date: Fri, 7 Feb 2025 13:53:24 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Aditya Garg <gargaditya08@live.com>
cc: "bentiss@kernel.org" <bentiss@kernel.org>, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <thomas@t-8ch.de>, 
    Kerem Karabay <kekrby@gmail.com>, 
    Orlando Chamberlain <orlandoch.dev@gmail.com>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH RESEND v2 1/4] HID: hid-appletb-bl: add driver for the
 backlight of Apple Touch Bars
In-Reply-To: <PN0PR01MB8288DA05B1DEE461C605348DB8F72@PN0PR01MB8288.INDPRD01.PROD.OUTLOOK.COM>
Message-ID: <qnpr84r1-78q1-8n61-r705-r64q220p7222@xreary.bet>
References: <PN0PR01MB8288DA05B1DEE461C605348DB8F72@PN0PR01MB8288.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 5 Feb 2025, Aditya Garg wrote:

> > Sorry for being dense, but does that mean that it's either 
> > hid-appletb-bl or hid-apple, but never both to make a good user 
> > experience on those devices?
> > 
> > If so, can you please point out what exactly is the reason?
> > 
> > Either those have different VID/PID combination, and then it can be easily
> > made conditional both in code and in runtime.
> > Are we talking about conflicting VID/PID combinations, some of them
> > needing current hid-apple, and some of them needing (in a mutually
> > exclusive way) hid-appletb-bl?
> > 
> 
> Just to clarify a bit more,
> 
> The touchbar backlight device is 05ac:8102, in all the models with magic 
> backlight, that is, with as well as without touchbar. The MacBook Air 
> 2020 is the only model with this device but not having a touchbar.
> 
> This device is responsible for both the touchbar brightness and the 
> keyboard backlight, the 0th interface being responsible for keyboard 
> backlight on Air and 1st on others.

Ah, wow, ok, then it's indeed really messy. Thanks for the explanation.

-- 
Jiri Kosina
SUSE Labs


