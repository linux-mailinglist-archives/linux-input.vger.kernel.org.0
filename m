Return-Path: <linux-input+bounces-7168-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CA89959DD
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 00:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 322F2B222F2
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 22:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D70018C34D;
	Tue,  8 Oct 2024 22:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UlL68Awp"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5447218BC3A;
	Tue,  8 Oct 2024 22:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728425753; cv=none; b=ICapeVf7mMjpmAeuydHy2FyIo0Qu74bp24Nn995Qwl9ztlAtGP+iaNQ8zsQj/uxoHMNmHQIStsGYd4l/mNXDXUoB418QLIJQ1JalNRvAP15KzkT79GkRhBjDah2TOLDbHy/hTKDC/fHkOxrQaRjQoresFlHoSNLi8zj9EvoR3bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728425753; c=relaxed/simple;
	bh=Gwgo6o6YrYhuBJyuHXId9soGS+J7UyfszFG+sKL6xzg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YmisaJFjZuZKX/ft0EIJpVjndxX+HG1IJKM0RQUeD37zB6hfX8Ndz3QpJuBdfBfSOTtrOhQ4PhlG9ePsswIuSnzQQRf5QKRLecoY43uOuo5Hvxm8KVDb0vyijtqQcQTBYAKHQdDKbHu6d7uxp2sy5VpYre37IMg4O2/OTraiGSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UlL68Awp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67ACCC4CEC7;
	Tue,  8 Oct 2024 22:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728425752;
	bh=Gwgo6o6YrYhuBJyuHXId9soGS+J7UyfszFG+sKL6xzg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UlL68AwpoKEa8WnqOM3rUP4hY13K3BZPNIbpgCTJecOySJS/25mZLA1DPOx1/krgd
	 XyA2gUYDfqBZTGRR8vK4c4yC3g9g4kYVw4HmvrRngWSqf/PCDXiIr7mLY1kYkHor/H
	 CVDM6o0lk9zpaou7dc3PSs9CCpi1iqJ6bqJ3fBqVQxd7k+qPPCWYOUW3Jv2x+8tRDX
	 fkAUhLitDUROOdHZklTj0rh+7Kgz6/RCsHHWWjJbyZwbla4wGgwfmCr6y0ARBXwY6F
	 puv1lEkaSg0KaraFoTN216R2ngdRlydwh84Zji0I9r/gE74P9kPC+jWPauZpo6WbJP
	 rGHyKDbrp4w0Q==
Date: Wed, 9 Oct 2024 00:15:50 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Stuart <stuart.a.hayhurst@gmail.com>
cc: linux-input@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>, 
    Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 RESEND] HID: corsair-void: Add Corsair Void headset
 family driver
In-Reply-To: <CALTg27=U4bR6shPcQKz5vCm6uYWn68-5=hv0Mm4hAc+9BLK4bQ@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2410090014370.20286@cbobk.fhfr.pm>
References: <20240909184936.32489-3-stuart.a.hayhurst@gmail.com> <nycvar.YFH.7.76.2410080855470.20286@cbobk.fhfr.pm> <CALTg27=U4bR6shPcQKz5vCm6uYWn68-5=hv0Mm4hAc+9BLK4bQ@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 8 Oct 2024, Stuart wrote:

> > As we alreay have general CONFIG_HID_CORSAIR, I think it'd make sense for
> > this driver to be encapsulated under this config option as well (it'd also
> > follow the general practice of HID subsystem, that the drivers are divided
> > per vendor) -- i.e. link hid-corsair-void into the final hid-corsair.ko
> > whenever CONFIG_HID_CORSAIR is selected.
> >
> > Would you be willing to make that small change, and resubmit for final
> > merge?
> 
> Sure that makes sense, but I'm not sure how to do that exactly. Is
> there an example anywhere?

Just do something like

	obj-$(CONFIG_HID_CORSAIR)  += hid-corsair.o hid-corsair-void.o

in the Makefile. There are a few HID drivers there doing exactly that. 
hid-roccat is probably the biggest user of this :)

Thanks,

-- 
Jiri Kosina
SUSE Labs


