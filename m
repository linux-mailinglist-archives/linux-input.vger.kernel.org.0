Return-Path: <linux-input+bounces-2359-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DF28794C6
	for <lists+linux-input@lfdr.de>; Tue, 12 Mar 2024 14:05:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 579FA1F22696
	for <lists+linux-input@lfdr.de>; Tue, 12 Mar 2024 13:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F3958AC4;
	Tue, 12 Mar 2024 13:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=khvoinitsky.org header.i=@khvoinitsky.org header.b="V8At0smJ"
X-Original-To: linux-input@vger.kernel.org
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C244258112
	for <linux-input@vger.kernel.org>; Tue, 12 Mar 2024 13:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710248736; cv=none; b=B3vFHpFb5wLzHmGodip174aOUqhEHZkdrI44rmUM8DlnsfxK7d4sQHCdaKb+wtcdyCuSL/xmNn6eLVuJlPPSJNcByvt4wZ5DXmkqfXQpCaveuYmAzvNiZmhVL+/rwvvzL8EKO5NtiN+Y/MolG2OPOcZsj6NdR0RV1WtPyTwwE20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710248736; c=relaxed/simple;
	bh=LtUpf8o4cRDws08hBEsHiAvXVpFfY7ndPUFj4Qdryug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VODm7zzvp4wQcqqg1jEe6hnvAmJZhapaJeC52RjmLl7Sji9Msxumfz0MedfQ/jsN/k5Q9wkTrldfKTdGO+jwKcGk2we1rYbGu/Xv9AEVMewf9YzUzXu+ioKwoQoEK0vqanqthCEHrWRBzv8Ll4jHA7RoBrfqmGK/9xkPuY2Fq8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=khvoinitsky.org; spf=pass smtp.mailfrom=khvoinitsky.org; dkim=pass (1024-bit key) header.d=khvoinitsky.org header.i=@khvoinitsky.org header.b=V8At0smJ; arc=none smtp.client-ip=95.215.58.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=khvoinitsky.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khvoinitsky.org
X-Forwarded-Encrypted: i=1; AJvYcCVNq0CM3JINqsRCDCRPmiQ6Y8uKmLv7+aEQphSQ5nIE9xX+ae4yjw+j8OWN3RjTi5ZuRnuhIvdobRP5TaJ6yj+r1kRmqTp69K8CU+7eNj6zfmywCBd6fBnbqHqvvHk3fYFPH0w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=khvoinitsky.org;
	s=key1; t=1710248731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LtUpf8o4cRDws08hBEsHiAvXVpFfY7ndPUFj4Qdryug=;
	b=V8At0smJG2pyIIg1cJAl/sd2t33YxgAtVA/swgU63NwkxYnQV+qK3FE7/t9NRCfINadqV5
	MNGQZSWNxcab/Twb4GcglkOcl3wNfDPAHTaa/J3wTwkYz5+a5kfs9MYX73M++QAenFqAUx
	j5DE9p9r9AYaThQ2rzgbG/WbQF8JpUU=
X-Gm-Message-State: AOJu0Yzvg6jAKsVT/uoENdVBPpy3ojBBClqVVqHO2y5++P+kD82kbnMl
	H54CxALyNCKZ47zFNlMQxQK+nz4ThjQcbrFYMOV78idHn058aXXTkAqLVfPplUTXptDRBPLR3pA
	c+LNb3zCP+4doG+7AKpvmQeYVcRE=
X-Google-Smtp-Source: AGHT+IGnOFxOFezHjAmJUlxEr9UulxKpV48algWbNSGjNho00p9nrQZda/a1daNl4tfE0qC6Ts7OMKpXCGv54vGRZkM=
X-Received: by 2002:a05:6512:3af:b0:513:ace2:ed64 with SMTP id
 v15-20020a05651203af00b00513ace2ed64mr2564951lfp.6.1710248729831; Tue, 12 Mar
 2024 06:05:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a29d56d2-c440-4a26-a9ac-014595d2ae8c@gmail.com>
 <21370dc5-94a3-442c-ae04-76f9f94b1b96@leemhuis.info> <c8986411-2bf7-4b7d-8ac1-f702dc7c725a@gmail.com>
 <7a5fc584-1520-4e52-9c77-d67a656524c6@gmail.com> <10022b0c-89c3-43e1-89ba-00e458fe1dfd@leemhuis.info>
 <7a8d9d60-a151-4b25-882b-48e6929339a4@gmail.com> <9db59ae4-be28-4ab3-a2ae-0b0f661f56be@gmail.com>
 <3bb95fcd-65cf-45dd-8d81-1a41b1ae0288@leemhuis.info> <CAMMabwNo_yT4S3LaMV16Rmj6MiWL=TRYtB9wspfs_LWVgM=U8Q@mail.gmail.com>
 <b30dc4a1-57aa-4ff5-ae52-7a01203b8be9@gmail.com> <CAMMabwNVwapthrDkCLOQsWkObzvTKVzDMiod3KPVa1hoy0CzRA@mail.gmail.com>
 <0d2b0c46-4d84-4279-8964-589d77435e6a@gmail.com> <9a55659c-86a6-4d9a-ab4f-94fbfb72e7c4@gmail.com>
In-Reply-To: <9a55659c-86a6-4d9a-ab4f-94fbfb72e7c4@gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Mikhail Khvoinitsky <me@khvoinitsky.org>
Date: Tue, 12 Mar 2024 15:05:18 +0200
X-Gmail-Original-Message-ID: <CAMMabwMDvumbNOvFk3mdqXfprO_xy4gB5R0KangvzJatv8BhUw@mail.gmail.com>
Message-ID: <CAMMabwMDvumbNOvFk3mdqXfprO_xy4gB5R0KangvzJatv8BhUw@mail.gmail.com>
Subject: Re: Regression with Lenovo ThinkPad Compact USB Keyboard
To: =?UTF-8?Q?Rapha=C3=ABl_Halimi?= <raphael.halimi@gmail.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, Jiri Kosina <jikos@jikos.cz>, 
	Linux Input Mailing List <linux-input@vger.kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Linux Stable Mailing List <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

> Not a single spurious middle-click, which is not surprising since, if I
> understand correctly, this last patch just disables 46a0a2c and makes it
> optional, allowing to enable it on demand with a setting in sysfs.

That's correct.

> And I have vertical and horizontal scrolling with the middle button
> working reliably

If you mean my statement in the initial commit that the original
firmware doesn't support horizontal scrolling, I might be wrong, looks
like I've mixed it up with something. But the main reason for the
change was hi-res scrolling.

> (I'm not sure of what you mean by "hi-res scrolling",
> is it about 4K displays ?).

No, it's about scrolling not by a fixed amount of lines but by
individual pixels depending on how strongly you press the trackpoint.
More like modern touchpads work.

> So as far as I'm concerned, this patch should be included ASAP in the
> next kernels releases (both latest and stable).

Yes, as soon as it gets into master (given that 6.8 has just been
released it will be soon), I'll make sure it will be included in
stable (either automatically or manually).



On Tue, 12 Mar 2024 at 13:57, Rapha=C3=ABl Halimi <raphael.halimi@gmail.com=
> wrote:
>
> Le 04/03/2024 =C3=A0 17:09, Rapha=C3=ABl Halimi a =C3=A9crit :
> > Thanks, it's done. I'll test and report.
>
> Nearly a week testing this patch (with kernels 6.6.15, 6.7.7 and 6.7.9,
> following Debian unstable updates) and it's working well so far.
>
> Not a single spurious middle-click, which is not surprising since, if I
> understand correctly, this last patch just disables 46a0a2c and makes it
> optional, allowing to enable it on demand with a setting in sysfs.
>
> And I have vertical and horizontal scrolling with the middle button
> working reliably (I'm not sure of what you mean by "hi-res scrolling",
> is it about 4K displays ?).
>
> So as far as I'm concerned, this patch should be included ASAP in the
> next kernels releases (both latest and stable).
>
> Regards,
>
> --
> Rapha=C3=ABl Halimi

