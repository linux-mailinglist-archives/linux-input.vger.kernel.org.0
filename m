Return-Path: <linux-input+bounces-7983-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0CA9C1CDB
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 13:23:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76CEE1C20EDF
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 12:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 440731E47CC;
	Fri,  8 Nov 2024 12:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kl.wtf header.i=@kl.wtf header.b="XjWuwM5I"
X-Original-To: linux-input@vger.kernel.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D651E7C19
	for <linux-input@vger.kernel.org>; Fri,  8 Nov 2024 12:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731068628; cv=none; b=b8d0m//S0HpGpUaUM2gzsqw5RVpEG0x4LWIYCa1JibZBcpZ9xW2o+ivhPzeKiHxwIXO9YlamOENgIU299Xm8Zrz3Gct59kQN2SZC5YQ/HndJo55uWJuj9eQZCAIEtSdrbX5xzlsW0FlDlM+TFe3MHMhCNl07UywiAweU1sBI+gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731068628; c=relaxed/simple;
	bh=CxAX+ftHiHOYNZkNuuSSAgp8kd8Iur26QQPuw4GGQ9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FG8KeBm/W5M2AXH447URTeZK56vBc2gcXCU5lC1NpV7vX94cUSxeQXhFGQzgAfbz6GEhMvHxekTcaRESDecJ+XujFUqFhSxTCZGj0owlVCahjrM2eJoIrg9c063ILknsj/XzWlL9SdUREy61WEbKw5qzBgTdQvnARbsF5yaTH/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kl.wtf; spf=pass smtp.mailfrom=kl.wtf; dkim=pass (2048-bit key) header.d=kl.wtf header.i=@kl.wtf header.b=XjWuwM5I; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kl.wtf
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kl.wtf
Message-ID: <75ada7e6-3796-4ebc-b824-fc8a57b0c1df@kl.wtf>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kl.wtf; s=key1;
	t=1731068618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+5CCKhytgIkae+gQjhjyhlBk8FNw0/8qyWw+tKaCwZI=;
	b=XjWuwM5IyIqzJ/We390ypdPH42KS5sRcmEAVIMyPt2FS76fXcLHHU3wqMBJLpO9a3nx5c+
	S8jN8PYlJQjFZre3EblBxgJUGdMxQUFzYZjVlmjykr6phxdP1Fv3R0gVYuFWgmX+9iQArL
	980QxE86ewLLCsJarCHLHroIeu9DpqTg2HzVUApLTmZGTAGh97VNkcXrWpnGqfCqlM+nW+
	T3+S+lRWVnOMQZRdBMvGgvf2S104qO+/sWH3UUKM51rctsYQ0h1u1I1vIi5iKehFBdBwiM
	hXn76cibxkZQOQ3jvVgBnAIChlIJPSHjmir8l2mUESn1DztmdJnfc9R9wnVEEg==
Date: Fri, 8 Nov 2024 13:23:13 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [regression] Bug 219440: Touchscreen stops working after
 Suspendi: i2c_designware.1: controller timed out
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Michael <auslands-kv@gmx.de>, LKML <linux-kernel@vger.kernel.org>,
 Jiri Kosina <jkosina@suse.com>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
References: <d5acb485-7377-4139-826d-4df04d21b5ed@leemhuis.info>
 <5373bbfb-5242-4a95-9075-412547a73675@leemhuis.info>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kenny Levinsen <kl@kl.wtf>
In-Reply-To: <5373bbfb-5242-4a95-9075-412547a73675@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Thanks for the heads up!

> i2c_designware i2c_designware.1: controller timed out
> i2c_designware i2c_designware.1: timeout in disabling adapter
> i2c_hid_acpi i2c-WDHT1F01:00: failed to change power setting.
> i2c_hid_acpi i2c-WDHT1F01:00: PM: dpm_run_callback(): acpi_subsys_resume returns -110
> i2c_hid_acpi i2c-WDHT1F01:00: PM: failed to resume async: error -110

Hmm, that's interesting. Michael, would you be up for testing a debug 
patch or two? The "dumb" solution of just re-adding a retry of the power 
command (always or as a quirk) on resume and crossing our fingers would 
probably work as a regression fix, but I have a vague suspicion that the 
issue could just be the change in timing.

As an aside, do we have anything available for testing/analyzing quirky 
i2c_hid hardware other than hoarding laptops on our own? Do some 
maintainers keep quirky devices around for re-testing, or are we mostly 
relying on user regressions? Getting feedback - or better yet, logic 
analyzer traces - would be really helpful when touching drivers for 
quirky hardware, and I haven't had too much luck on finding reasonable 
deals on affected hardware myself, halting some of my i2c/i2c_hid 
improvements...

Best regards,
Kenny Levinsen

