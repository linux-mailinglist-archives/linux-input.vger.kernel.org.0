Return-Path: <linux-input+bounces-11471-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A57FEA7897E
	for <lists+linux-input@lfdr.de>; Wed,  2 Apr 2025 10:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 596B9166460
	for <lists+linux-input@lfdr.de>; Wed,  2 Apr 2025 08:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88E99233708;
	Wed,  2 Apr 2025 08:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="WZ0r+nuy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qcJ0CwLz"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5A51A5BB0;
	Wed,  2 Apr 2025 08:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743581262; cv=none; b=Xlu2eWSmehrpSVelxMCjT3JfD8wPdG35l6smUxt4zVMuC40qONlgj9RAbAE5lp0h/hvv5MMjG5lrOWId5AEgNT0XDVy7gaKb1A/XV0ahmmKOTq70tIikUJazin2e6rzUt+K0bZ6ZEBFHC8IPfbd/zwyRp4IeDbR8jje5CZvmRv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743581262; c=relaxed/simple;
	bh=dILsRyul19rRohUBWYDTKQTUeRSXe9LRlKp+uzuo8to=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ow4Ggtwb8yMectilK10FMGYV1UiYH9LJ51MhREMMzE6+/ugqA8lFap9E8xZKLKLGCMTC0eYIqkZRREdCSa4mA+uWW3wagaDrxY5IjXK0xCkCzRIwccvqrT7hISM3oPmC2nazrbZoS5xwmaMrGfw/9UAJ0XqRI43TIkAhxauGfR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=WZ0r+nuy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qcJ0CwLz; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 317BC13801E1;
	Wed,  2 Apr 2025 04:07:39 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Wed, 02 Apr 2025 04:07:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1743581259;
	 x=1743667659; bh=AiQWnnkwVCft+VdCJ47zJgEAcjD9KFU9Ll8SRROiTHo=; b=
	WZ0r+nuy/zKfN+f/tfyiflR/qMtPUfnSJGU5+WMUfZFIpVl3NodzWmdxBSmjQjpy
	h2jfbL1Gl2wX9GiZVdLrH0f1aXER6oRcowRsGLasgPBWLQ6mbXtnKeRy+YwIdCCu
	PQZCRLuiWNrxBASZtIb7PImhANASsxMssvecKnQUmCvB41N4Sbel84BrvQ1Xww5m
	qWVfD3PQDizPibdrJHhwLbc8hufI/Sb8mfGsE+iJphodtYaaFGz0PAqu/K+cr1mO
	LF3rLQnvrnu5RJ2qkyXvTzsqDRxHVv4ZSwl5bMCCC3qb8gxS06RYyc8TXjN7aX6G
	6kARneTKjpY8XmipERzc4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743581259; x=
	1743667659; bh=AiQWnnkwVCft+VdCJ47zJgEAcjD9KFU9Ll8SRROiTHo=; b=q
	cJ0CwLzvPFZYr6PvejgvoxUn4WC6sq11eJf31xD7XVPKxQfykc4rzr1erRurgJGh
	swqn5zAwiqjvmJzNUlShb493vrLEURCoM9UnHIrZ5OOdayruzxbUnhOrqAXotBje
	FKLX1i760RJrDnOkU7aFAU+v79MsSalhy2Hjwtk5bsauR8MDJvaMguB3ey0mbm5Z
	ORyujnU+R2peMh/ZAu6zEGhRMcX3wfmEdGQSGWHeBJ/nvKsn0pejicE76mtP9lvQ
	JqoQTWViJ/XMYQyigRShv/jkUJBrELnQmMFnPcCiWsXPkT+sGQq1fR8Q3TT8gV9y
	/Oq4GpgdfY1HIvXcYEm4g==
X-ME-Sender: <xms:SvDsZ83E-eGyaFokdheVlblRV3zkKFIgyJTx_Z3uQQxej2KXzChcRg>
    <xme:SvDsZ3EVGxkY6leuxLcaKptaktqcPvrzZqN_IZI71IOcijRsEGhoKNCMSy1DSZvGF
    TYVtFVrfe5RAw>
X-ME-Received: <xmr:SvDsZ07_V7-ndsczdCI6x-Unftg0vF_XPznuc4dGDpnZIa_S4OifbvdkyUY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeehudegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeelkeehjeejieehjedvteehjeevkedugeeuiefgfedufefgfffh
    feetueeikedufeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgt
    ohhmpdhnsggprhgtphhtthhopedvtddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    epmhgrrhhkuhhsrdgvlhhfrhhinhhgseifvggsrdguvgdprhgtphhtthhopehqrghsuggv
    vhdttdesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhinhhpuhhtsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshihiigsohhtodguhedvtdegtggs
    sgguugelvddufhdufhejtggrugesshihiihkrghllhgvrhdrrghpphhsphhothhmrghilh
    drtghomhdprhgtphhtthhopehsthgrsghlvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopegsvghnthhishhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehj
    rghsohhnrdhgvghrvggtkhgvseifrggtohhmrdgtohhmpdhrtghpthhtohepjhhikhhosh
    eskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:SvDsZ100o8xkKJ9wsMArBEJaHJe7mgI7ojaGpo-4bFn8iy3BM-yjzw>
    <xmx:SvDsZ_GdiOrF0aZj3SZlWgHjjd64BvDRZYtTR-BE13g7nR9cO3Ghvw>
    <xmx:SvDsZ-9hJLMmJWWNZwTFgWG1dg-Csl7sxotaYq-dNOAZYqM7xokiYA>
    <xmx:SvDsZ0n-a_NQ_0hBnFaKC39RQcOueZsHr6apxYuFispc7hiBr8aWMw>
    <xmx:S_DsZ_nbQHsgkUhVffWcD5x_93c5jGKtWG8P5zk4-o8S_87JBXes6lZU>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Apr 2025 04:07:38 -0400 (EDT)
Date: Wed, 2 Apr 2025 09:06:06 +0100
From: Greg KH <greg@kroah.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Qasim Ijaz <qasdev00@gmail.com>, linux-input@vger.kernel.org,
	syzbot+d5204cbbdd921f1f7cad@syzkaller.appspotmail.com,
	stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	Jiri Kosina <jikos@kernel.org>, Ping Cheng <ping.cheng@wacom.com>
Subject: Re: [PATCH v2] HID: wacom: fix shift OOB in kfifo allocation for
 zero pktlen
Message-ID: <2025040200-serotonin-equivocal-b264@gregkh>
References: <20250401214703.7809-1-qasdev00@gmail.com>
 <1f6f6fe9-ae81-4154-8553-dfb4ca2b1cd2@web.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f6f6fe9-ae81-4154-8553-dfb4ca2b1cd2@web.de>

On Wed, Apr 02, 2025 at 10:03:25AM +0200, Markus Elfring wrote:
> …
> > To fix this, we should handle cases where wacom_compute_pktlen()
> > results in 0.
> 
> See also once more:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.14#n94
> 
> Regards,
> Markus
> 

Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot

