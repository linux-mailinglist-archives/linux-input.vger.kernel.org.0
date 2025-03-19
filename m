Return-Path: <linux-input+bounces-10963-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53950A68647
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 09:02:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96A1A19C2615
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 08:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6BEE552;
	Wed, 19 Mar 2025 08:02:14 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91B6801;
	Wed, 19 Mar 2025 08:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742371334; cv=none; b=CMyC5lGSkQbOwqd7nAaYUUnrol1Ka4Y38leC8tziThZ5W3sSiZhhmWp5vqXOyh9CDVheo3gIs+dH0WtRrjgSQ697pyFAX++U0RBEba4NQnnEYMPjZhZgtse4SWQdZmA1NYSQfTfDkmy7lFz0AEy2AmM/OL419270UYru3JE8cbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742371334; c=relaxed/simple;
	bh=uS79caWa81NSdZ0jpSgTKUOYgTKaiUefA2Fi3y73Sys=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=LXiR8Ty+SLWXjG1oHyHyKhXgA9EJBPum/bJwNW70i8b4q84A08o8dTksuBl395pl4sMkixj2Eq4/SuSHe9oURukZm9Ybyf6/lkJZ7OoyooJn93Wu80Wmsnxc9d+rQ4c3g4NnyJaUub7ChDKWOsKLTuJMw3v/1a25iZtAq6pOXFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4ZHh4t0vRhz501bt;
	Wed, 19 Mar 2025 16:02:06 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl2.zte.com.cn with SMTP id 52J81a4v057960;
	Wed, 19 Mar 2025 16:01:37 +0800 (+08)
	(envelope-from jiang.peng9@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid31;
	Wed, 19 Mar 2025 16:01:39 +0800 (CST)
Date: Wed, 19 Mar 2025 16:01:39 +0800 (CST)
X-Zmail-TransId: 2afb67da79e37b8-3feea
X-Mailer: Zmail v1.0
Message-ID: <20250319160139161M5v1ERrZqTRfyixTQV7bU@zte.com.cn>
In-Reply-To: <e9c3eca1-5dc9-46e1-a356-87643434cee0@kernel.org>
References: 20250319101242304iR6PbYo3hAvFto8weR2Ps@zte.com.cn,e9c3eca1-5dc9-46e1-a356-87643434cee0@kernel.org
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <jiang.peng9@zte.com.cn>
To: <krzk@kernel.org>
Cc: <xie.ludan@zte.com.cn>, <bentiss@kernel.org>, <jikos@kernel.org>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <xu.xin16@zte.com.cn>, <yang.yang29@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gSElEOiBhcHBsZXRiLWtiZDogUmVwbGFjZSBtc2Vjc190b19qaWZmaWVzIHdpdGggc2Vjc190b19qaWZmaWVzIGZvciB0aW1lciBzZXR0aW5ncw==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 52J81a4v057960
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67DA79FE.000/4ZHh4t0vRhz501bt

> > From: Peng Jiang <jiang.peng9@zte.com.cn>
> >
> > The variables `appletb_tb_idle_timeout` and `appletb_tb_dim_timeout`
> > are already defined in seconds, so using `secs_to_jiffies` directly
> > makes the code more readable and consistent with the units used.
> >
> > This is converted using scripts/coccinelle/misc/secs_to_jiffies.cocci with
> > the following Coccinelle rules:
>
> Why do you need to paste here contentx of existing cocci script? It's
> already mainlined, no?
>
> >
> > @depends on patch@
> > expression E;
> > @@
> >
> > -msecs_to_jiffies
> > +secs_to_jiffies
> > (E
> > - * \( 1000 \| MSEC_PER_SEC \)
> > )
> >
I intended to refer to the source of the modifications. Therefore, removing the Coccinelle script is appropriate.

Thank you for your feedback!

Best regards,
Peng Jiang

