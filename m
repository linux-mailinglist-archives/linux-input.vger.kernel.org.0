Return-Path: <linux-input+bounces-6045-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7159681B9
	for <lists+linux-input@lfdr.de>; Mon,  2 Sep 2024 10:27:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19C611F2216A
	for <lists+linux-input@lfdr.de>; Mon,  2 Sep 2024 08:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E97A185B65;
	Mon,  2 Sep 2024 08:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="lvE9wbgO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B8917A5BD;
	Mon,  2 Sep 2024 08:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725265654; cv=none; b=KDgc1HkI3uEL9dz5ykBnfu4eutApq5OSy0aIIFJ0Mpt/R3Pe+p6aNoglRSOd0KnVagc+mAKptluT7W4+hjX2lGEnP/BxNfELGHqJq2o1hK4NRi6c+LxhCDn9wRp/YOP5b7Y+RIoo5s1xJMDMLTwJEtGz3/fPnDVnty9J0GYnK20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725265654; c=relaxed/simple;
	bh=067Yigajm/Ie87GEvqMGn5qqfEtpvaRPy8BH4eBmsFw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BPzaz0cZamq0aDAG7I5OTg91Cbf84yM2VA+/NhTe/xPGWTOxMkwvMZ/s4l6dreWIstGy42NSc3KsIKanwoPYYJzegtQYfu3M92c/1r0FhgSveMgWSspDo7oElDHA2UuPWJLLQNR0B+5mT3kjk3cA188mj8Lp2cRiiE4DaUWueGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=lvE9wbgO; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zUxGLZzgJRBb41LllXp0i8xbGv2sRSy1/y3XNwT6iaQ=; b=lvE9wbgOI4RmS8P5mn/frwQzSi
	7DsnOBmL16smnDMuxBvOyws7qE5b8+t10aS5ZkdImC8toi2s6i9iHf0mcL1zJsCHaEWm8oj8hrASv
	cYmb9ckgipfIvixPpJAgawRa8tNg38IhOuMhEcv3kxtP9Wv8H5/zdpVMcr3LHCb9lO0e4yGsPpb44
	Bb7XOK8S29yjZowoqWnA33+8qxxjE31Lkz+zX9QahtDIuxmlJu8gszqpYLiITC5yyBBYSs1R1Tp1I
	lAeYgNYEXXRkbx0v2rMPp9BCJUqI42gGznyrJ7LoM/l1d6fqOxmEVeRA6Sm+XvCeEj1AvoRvXomoi
	i2Y59c1A==;
Date: Mon, 2 Sep 2024 10:08:05 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/18] zforse_ts: assorted cleanups
Message-ID: <20240902100805.2148ccea@akair>
In-Reply-To: <20240824055047.1706392-1-dmitry.torokhov@gmail.com>
References: <20240824055047.1706392-1-dmitry.torokhov@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Dmitry,

Am Fri, 23 Aug 2024 22:50:24 -0700
schrieb Dmitry Torokhov <dmitry.torokhov@gmail.com>:

> Hi,
> 
> This is a set of somewhat random cleanups for the zforce_ts driver. 
> 
> Heiko, Andreas, if you still have access to the hardware it would be
> great if you could give it a spin.
> 
> Thanks!
> 
nice cleanup,
I tested a bit on the Toline Shine 2HD without gui (have not rebased my
other stuff to 6.11 yet)

A short move on the touchscreen gives this:
Event: time 1725264307.093542, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID), value 24
Event: time 1725264307.093542, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X), value 1159
Event: time 1725264307.093542, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y), value 596
Event: time 1725264307.093542, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR), value 11
Event: time 1725264307.093542, type 3 (EV_ABS), code 49 (ABS_MT_TOUCH_MINOR), value 11
Event: time 1725264307.093542, type 3 (EV_ABS), code 52 (ABS_MT_ORIENTATION), value 0
Event: time 1725264307.093542, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 1
Event: time 1725264307.093542, type 3 (EV_ABS), code 0 (ABS_X), value 1159
Event: time 1725264307.093542, type 3 (EV_ABS), code 1 (ABS_Y), value 596
Event: time 1725264307.093542, -------------- SYN_REPORT ------------
Event: time 1725264307.096361, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X), value 1039
Event: time 1725264307.096361, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y), value 607
Event: time 1725264307.096361, type 3 (EV_ABS), code 0 (ABS_X), value 1039
Event: time 1725264307.096361, type 3 (EV_ABS), code 1 (ABS_Y), value 607
Event: time 1725264307.096361, -------------- SYN_REPORT ------------
Event: time 1725264307.112426, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X), value 934
Event: time 1725264307.112426, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y), value 637
Event: time 1725264307.112426, type 3 (EV_ABS), code 0 (ABS_X), value 934
Event: time 1725264307.112426, type 3 (EV_ABS), code 1 (ABS_Y), value 637
Event: time 1725264307.112426, -------------- SYN_REPORT ------------
Event: time 1725264307.131523, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X), value 859
Event: time 1725264307.131523, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y), value 661
Event: time 1725264307.131523, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR), value 12
Event: time 1725264307.131523, type 3 (EV_ABS), code 0 (ABS_X), value 859
Event: time 1725264307.131523, type 3 (EV_ABS), code 1 (ABS_Y), value 661
Event: time 1725264307.131523, -------------- SYN_REPORT ------------
Event: time 1725264307.150540, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X), value 795
Event: time 1725264307.150540, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y), value 671
Event: time 1725264307.150540, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR), value 13
Event: time 1725264307.150540, type 3 (EV_ABS), code 0 (ABS_X), value 795
Event: time 1725264307.150540, type 3 (EV_ABS), code 1 (ABS_Y), value 671
Event: time 1725264307.150540, -------------- SYN_REPORT ------------
Event: time 1725264307.169589, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X), value 760
Event: time 1725264307.169589, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y), value 675
Event: time 1725264307.169589, type 3 (EV_ABS), code 0 (ABS_X), value 760
Event: time 1725264307.169589, type 3 (EV_ABS), code 1 (ABS_Y), value 675
Event: time 1725264307.169589, -------------- SYN_REPORT ------------
Event: time 1725264307.188157, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID), value -1
Event: time 1725264307.188157, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 0
Event: time 1725264307.188157, -------------- SYN_REPORT ------------

So,

Tested-by: Andreas Kemnade <andreas@kemnade.info> # Tolino Shine2HD

Regards,
Andreas

