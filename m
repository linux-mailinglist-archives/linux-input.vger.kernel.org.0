Return-Path: <linux-input+bounces-2220-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFB6871A11
	for <lists+linux-input@lfdr.de>; Tue,  5 Mar 2024 10:58:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9754628232B
	for <lists+linux-input@lfdr.de>; Tue,  5 Mar 2024 09:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E5C537E5;
	Tue,  5 Mar 2024 09:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OKAs4tdi"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6B250246;
	Tue,  5 Mar 2024 09:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709632705; cv=none; b=r12kvfq+PWD5V37ABF/D0xyt63hLVhDBPajOyo35c0JJHeLkQ2EoADUqB+AjE/ED6qzQqUe2J5FsN7ly1jWt0IwUt3Wg2LxW90yQu60l9jfsh/o+v/95ZVmGaaX7g4A5rQ4LYW6CAioQNldKyWICrdY/7B2bpxcSeM4OIBxVr/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709632705; c=relaxed/simple;
	bh=fnR+luoWHm+i4tZfvjY9XCu/TOV28rP68PqIbYEukWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UL5v1+ZVKp/2KaAwBOzrBMcwcEm9UK27E1YPywI0Jn9BeXtx4nMsG9t0NvMopwy4EuEy0flZ25/1QLOrGZDaoCMx50wKSYiN8YWWFMq0rfq16nlLKU66XEZqxAmDhR/YbJwQiW6kENLaNZ+cINjcMu9bGFaD97qyybxZqx7symU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OKAs4tdi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5C18C433C7;
	Tue,  5 Mar 2024 09:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709632704;
	bh=fnR+luoWHm+i4tZfvjY9XCu/TOV28rP68PqIbYEukWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OKAs4tdiua2caGpFS7z42L5An0+i5Q6XeleHGh6C0F2W6LGgsRiMeX2ofJ1/Fj6rc
	 foyZZXcRFIlkcRwGSEsVDV8vSy+JnATlntsgcZ2jGPDXM/COMDG497hMEon1/e36WE
	 ACWbg1GQjB/inxBSYkuchBFcAVV6x7vgYyu8BcUDl2cEnKl90QN1fuyQZM86iwdIwg
	 LIxU1lrKQ5tC8FNQH8YwkK60b5MnApy9y4MODWSEa3SsFDHzQB1+JbadhnJKjaM8Vv
	 4UVfsspKvZv4FlXmrMclb3xXPbAPRjcV+ZNto8dKCX9kUPTmIHrB2kwcw2eukE+aH+
	 GQUWf5wNBhZ4A==
Date: Tue, 5 Mar 2024 09:58:18 +0000
From: Lee Jones <lee@kernel.org>
To: James Ogletree <James.Ogletree@cirrus.com>
Cc: James Ogletree <jogletre@opensource.cirrus.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
	Jeff LaBundy <jeff@labundy.com>,
	"open list:CIRRUS LOGIC HAPTIC DRIVERS" <patches@opensource.cirrus.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v8 3/5] mfd: cs40l50: Add support for CS40L50 core driver
Message-ID: <20240305095818.GF5206@google.com>
References: <20240221003630.2535938-1-jogletre@opensource.cirrus.com>
 <20240221003630.2535938-4-jogletre@opensource.cirrus.com>
 <20240301091716.GA1688857@google.com>
 <6DD14CBC-FAE2-4768-AD77-347229FE9AC7@cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6DD14CBC-FAE2-4768-AD77-347229FE9AC7@cirrus.com>

On Fri, 01 Mar 2024, James Ogletree wrote:

> Hi Lee,
> 
> Thanks for the review.
> 
> > On Mar 1, 2024, at 3:17 AM, Lee Jones <lee@kernel.org> wrote:
> > 
> > On Wed, 21 Feb 2024, James Ogletree wrote:
> > 
> >> Introduce support for Cirrus Logic Device CS40L50: a
> >> haptic driver with waveform memory, integrated DSP,
> >> and closed-loop algorithms.
> >> 
> >> The MFD component registers and initializes the device.
> >> 
> >> Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>
> >> ---
> >> MAINTAINERS                 |   2 +
> >> drivers/mfd/Kconfig         |  30 ++
> >> drivers/mfd/Makefile        |   4 +
> >> drivers/mfd/cs40l50-core.c  | 531 ++++++++++++++++++++++++++++++++++++
> >> drivers/mfd/cs40l50-i2c.c   |  69 +++++
> >> drivers/mfd/cs40l50-spi.c   |  69 +++++
> >> include/linux/mfd/cs40l50.h | 142 ++++++++++
> >> 7 files changed, 847 insertions(+)
> >> create mode 100644 drivers/mfd/cs40l50-core.c
> >> create mode 100644 drivers/mfd/cs40l50-i2c.c
> >> create mode 100644 drivers/mfd/cs40l50-spi.c
> >> create mode 100644 include/linux/mfd/cs40l50.h
> > 
> > Mostly fine, just a few nits.
> > 
> > Assumingly this needs to go in via one tree (usually MFD).
> > 
> > I can't do so until the other maintainers have provided Acks.
> > 
> 
> Yes, understood.
> 
> >> +static const struct cs_dsp_region cs40l50_dsp_regions[] = {
> >> + { .type = WMFW_HALO_PM_PACKED, .base = CS40L50_PMEM_0 },
> >> + { .type = WMFW_HALO_XM_PACKED, .base = CS40L50_XMEM_PACKED_0 },
> >> + { .type = WMFW_HALO_YM_PACKED, .base = CS40L50_YMEM_PACKED_0 },
> >> + { .type = WMFW_ADSP2_XM, .base = CS40L50_XMEM_UNPACKED24_0 },
> >> + { .type = WMFW_ADSP2_YM, .base = CS40L50_YMEM_UNPACKED24_0 },
> >> +};
> >> +
> >> +static void cs40l50_dsp_remove(void *data)
> >> +{
> >> + cs_dsp_remove((struct cs_dsp *)data);
> > 
> > Is the cast required?
> > 
> > Where is this function?
> 
> Seems that the cast is redundant, so I will remove.
> 
> The function cs_dsp_remove() is exported from linux/firmware/cirrus/cs_dsp.h.
> 
> > 
> >> +}
> >> +
> >> +static const struct cs_dsp_client_ops cs40l50_client_ops;
> > 
> > What's this for?  Where is it used?
> > 
> > In general, I'm not a fan of empty struct definitions like this.
> 
> From the same cs_dsp module as mentioned above, it is a structure containing
> callbacks that gives the client driver an opportunity to respond to certain events
> during the DSP's lifecycle. It just so happens that this driver does not need to do
> anything. However, no struct definition will result in a null pointer dereference by
> cs_dsp when it checks for the callbacks.

Then check for NULL before dereferencing it?

-- 
Lee Jones [李琼斯]

