Return-Path: <linux-input+bounces-1708-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5189C84B930
	for <lists+linux-input@lfdr.de>; Tue,  6 Feb 2024 16:19:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0145A1F24CA1
	for <lists+linux-input@lfdr.de>; Tue,  6 Feb 2024 15:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF77D133292;
	Tue,  6 Feb 2024 15:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e0s0MkHE"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EB61339A1;
	Tue,  6 Feb 2024 15:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707232353; cv=none; b=Xv8nW/CiqFuyTXxesWiHSOZbd9UC4HllBjvrplFgJuiX1oGNpc6DtUtzlgtlmmrG3/2n2fDGpeQoswpok2SwfVz5pUz2ELLA2YnekIbzXkAG7qEn2Pj+nIZZgY4RpH4SyvHZe5l8h+489pVWc/VRA7NO1cEGMZYFvwiJ6MagNho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707232353; c=relaxed/simple;
	bh=BcS7L1q051yZjkZXOVLmCtb7S6nHcDqDk8UPIddb5qU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=h8EGuI2UcW1TgjfTvaFNjPQIwxJJWh1DTt6qNm8EO8NyfzXHwBflevV8/F0NNHmqrjXgOKDbgD5My6/MInWx29tD7NVUf5X0wSpTtraOY+CN7poLH8kU22lZT0brwLFEew93jfa5o/cRwXXmSJ+VtisLKtt1XbeXUy/Sd2XgOKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e0s0MkHE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A57A5C43390;
	Tue,  6 Feb 2024 15:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707232353;
	bh=BcS7L1q051yZjkZXOVLmCtb7S6nHcDqDk8UPIddb5qU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=e0s0MkHEMvXFZCoXwxjCCIAIJYdMFEaMhUh26TOwJDLPiq3QXPR2T4J1a1dpOKfSl
	 oLBsKB/QytDhtVNORinAlzqadYY0dVTLB3fs+dOvfnXRWDJsSh3eZnkQ89B2CVAeNZ
	 VLMcCjm9my5NFhbbiDIp1L3KbMVB9XMYhluiUNauO4clmnHq0IZ0rAf23eXlHf8tKW
	 Dkzp4wrWNxR2caFyLEYyX/CF2m8DiB2cH323rUxpe1oswyR2J3UqVHAQ3lMWty1vdu
	 EojM/r1m/dIivMnTW8hPQuOik2GTjcWeReGHFEu6VRjAtHq3CEdSFWvNR/ljp9daLg
	 qbsbegFpKEr1w==
Date: Tue, 6 Feb 2024 16:12:33 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc: "Gerecke, Jason" <killertofu@gmail.com>, linux-input@vger.kernel.org, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Ping Cheng <pinglinux@gmail.com>, 
    Joshua Dickens <Joshua@joshua-dickens.com>, 
    Aaron Armstrong Skomra <skomra@gmail.com>, 
    "Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>, 
    stable@vger.kernel.org, Jason Gerecke <jason.gerecke@wacom.com>
Subject: Re: [PATCH] HID: wacom: Do not register input devices until after
 hid_hw_start
In-Reply-To: <Zbg8yxO91S9_DZl9@google.com>
Message-ID: <nycvar.YFH.7.76.2402061612250.21798@cbobk.fhfr.pm>
References: <20240129223545.219878-1-jason.gerecke@wacom.com> <Zbg8yxO91S9_DZl9@google.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 29 Jan 2024, Dmitry Torokhov wrote:

> > From: Jason Gerecke <killertofu@gmail.com>
> > 
> > If a input device is opened before hid_hw_start is called, events may
> > not be received from the hardware. In the case of USB-backed devices,
> > for example, the hid_hw_start function is responsible for filling in
> > the URB which is submitted when the input device is opened. If a device
> > is opened prematurely, polling will never start because the device will
> > not have been in the correct state to send the URB.
> > 
> > Because the wacom driver registers its input devices before calling
> > hid_hw_start, there is a window of time where a device can be opened
> > and end up in an inoperable state. Some ARM-based Chromebooks in particular
> > reliably trigger this bug.
> > 
> > This commit splits the wacom_register_inputs function into two pieces.
> > One which is responsible for setting up the allocated inputs (and runs
> > prior to hid_hw_start so that devices are ready for any input events
> > they may end up receiving) and another which only registers the devices
> > (and runs after hid_hw_start to ensure devices can be immediately opened
> > without issue). Note that the functions to initialize the LEDs and remotes
> > are also moved after hid_hw_start to maintain their own dependency chains.
> > 
> > Fixes: 7704ac937345 ("HID: wacom: implement generic HID handling for pen generic devices")
> > Cc: stable@vger.kernel.org # v3.18+
> > Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
> 
> Tested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Applied, thanks!

-- 
Jiri Kosina
SUSE Labs


