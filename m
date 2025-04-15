Return-Path: <linux-input+bounces-11761-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53644A894A0
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 09:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C78216329A
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 07:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAEE9279900;
	Tue, 15 Apr 2025 07:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="wNPJoLnx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gs4dXQ+Y"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E742797B9;
	Tue, 15 Apr 2025 07:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744701307; cv=none; b=MjM2ZPYV0Fit+7A/8CpgPTo9H6yPfYi4m6MFe57nm+Ut3TWi3sTfTnVTQjibif6DLpLr7r6TfLwR12hxSfhhVSWwAMeOquuHgKFZGWRvWaXiKqBzUc3/3t3++PZmnzK6CSlcr4mjcC/16s+NluClR/lATipsox3juI80zNB6EDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744701307; c=relaxed/simple;
	bh=fC4GGICMp4e/34Sx8YGA+Cn9f/T4F1YJIFnZxvRp94Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pa9u57pQ7/hwhqkivNClQ9gkVsmiZb9Stc0weYIoOKYT9CLhL3Ze87fv5GsPthRmeNlHousj23rxjquOGtIXZlU5IVgCBrI7ZUdrp/Lc5yQJYUv1ClLMaryeuS1KvGQf8rYRC1iea/mzYNw1omndfahUHQsDicfdAW+pJIJu0I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=wNPJoLnx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gs4dXQ+Y; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8DF491140353;
	Tue, 15 Apr 2025 03:15:03 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 15 Apr 2025 03:15:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744701303;
	 x=1744787703; bh=xRM0r5r9UR2YYgGREXp7/fO/5vEbzPU1DqGtMjuTMdw=; b=
	wNPJoLnxEBi8A7hQIrodPcUETDlKfewmQlufBgI89w+Zbxo1rZ4ZpPMk+RHDFh1f
	gspy2T6vL8K+DE+6oW96nUvO1VJ0XwINHWBgksL3au6CSz4y20yt1SEn5MZZd7cR
	JsAe3O5XRaBsU2zpn5p0xHL83jCu+ta9i2l57xxlrt9bixx9589EJLb3vNXCv+FC
	VtEG0LHzi0TN0RDkHB1nnNBju1+k5trk0aprW84o6FQMhG7N1DqW8+14ZYypFnlY
	4kKBvKjxj4ScHALWpQ/VrS+ayYE1vOmA7ZfTmwHUsi9MuG6+659cBBeZAtSGWXBR
	46hgiXdLGThyrparWPMJig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744701303; x=
	1744787703; bh=xRM0r5r9UR2YYgGREXp7/fO/5vEbzPU1DqGtMjuTMdw=; b=g
	s4dXQ+YJN1oq4q8o6ewsFCt+qvoDjuzINqDQhisH8o6uspl5xQhFljqcyJPNXSKa
	9Yde8EuhZjvdAmyKxkSDGxgluaK9WECoS8+qrO1TmUUc04wCHxpKcIqiYjASM4dk
	CqhTs/cQTv8vRNkP+YLkPpYY5xe8HbmMGkFkpMlSAsdtjczipS1gjxLS/pKaadJK
	JHZBWwGNBBf2K0qg3ngvDKPuJYbDjLRHiQe6dRhns92Ij3VR/vthz1KTxp/KSmuV
	Ei2z9NjDOU4DsxS424jQHg3Oik7/QOqAhFMo68EaYpBVO/dYuzSkMOpE6a4KPmKX
	9N0tF4hP4EMGEiGoAKEKg==
X-ME-Sender: <xms:dwf-Z7K08rC6cfm_NdXTRaKvcyb9VVClIeydXhOKvFGjQ9WUcs8Ozw>
    <xme:dwf-Z_L3vJ2UvxiE3HS6DL8UputmntifwGkR7b278fQ4qi2v3ZK7r-hodF98vlfVc
    vrcbmAbfANgaQ>
X-ME-Received: <xmr:dwf-ZztWsVaCdYuecGi_ZzScvhTGeeaV4CmBmZzbVurG5-Ue0tts4DuS9t2YXum9Cj7EKFMyFCxWYk3qija6zoZmjUXAp9U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddvkeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhf
    fvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepifhrvghgucfmjfcuoehg
    rhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepgfekffeifeeiveekle
    etjedvtedvtdeludfgvdfhteejjeeiudeltdefffefvdeinecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhmpd
    hnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthho
    mhgrshiirdhprghkuhhlrgdrohhfihgtjhgrlhhnhiesghhmrghilhdrtghomhdprhgtph
    htthhopehjihhkohhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsvghnthhishhs
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopeholhgvghesmhgrkhgrrhgvnhhkrdhooh
    hopdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehlihhnuhigqdhushgssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:dwf-Z0YlQipB_teTO_tqDJZYUMQxPosdd1K0MNKl2Z_oYZxMfTp94w>
    <xmx:dwf-ZyaHcri1csVldJ_mFUUT3ThFxkdK-loVnVuFug3Fs8fVQsX03A>
    <xmx:dwf-Z4BLHnqd2oFR_sXMR1CoKMH-LjRcn1xvunaxZkIru-l1ddfR8w>
    <xmx:dwf-Zwa3WEM0_2ZP8OkumN3QQeAwQRvtdEOilyNqDoNTfwJ9yCZB-g>
    <xmx:dwf-Z75xNCQnZE7-kc7mS4KZxMh8xLDpRvki0J2jaOOdKseBo3oXHbaZ>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Apr 2025 03:15:02 -0400 (EDT)
Date: Tue, 15 Apr 2025 09:13:26 +0200
From: Greg KH <greg@kroah.com>
To: Tomasz =?utf-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
Cc: jikos@kernel.org, bentiss@kernel.org, oleg@makarenk.ooo,
	linux-input@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH RESEND 1/2] HID: hid-universal-pidff: Fix errors from
 checkpatch
Message-ID: <2025041501-unblended-reliance-b4d7@gregkh>
References: <20250414230818.957678-1-tomasz.pakula.oficjalny@gmail.com>
 <20250414230818.957678-2-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250414230818.957678-2-tomasz.pakula.oficjalny@gmail.com>

On Tue, Apr 15, 2025 at 01:08:17AM +0200, Tomasz Pakuła wrote:
> Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
> ---
>  drivers/hid/hid-universal-pidff.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)


Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

