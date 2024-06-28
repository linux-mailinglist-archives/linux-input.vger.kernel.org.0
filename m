Return-Path: <linux-input+bounces-4702-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD1391C0C6
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 16:24:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EEE8BB24B26
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 14:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D165A1BF326;
	Fri, 28 Jun 2024 14:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+UrNScO"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F601E517;
	Fri, 28 Jun 2024 14:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719584633; cv=none; b=Uck08rSET7Bx6h0lEeRmliKmfdQ4zO1WsGiLhlGT/r0h2DtSBFDVgNVe3BQfpr9nBhAyTYY4Ootx4Ek0SOPG/+VagwEDOTN+nZzlp+7hUAes2enQmFLT3YJHkuJ9233G7lHHaYFAse8eIScWsy/+R62Lk3DOcAm1TczGWPyqpEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719584633; c=relaxed/simple;
	bh=dSAzEhDO1Gae2NO13lpY5+95zUWJJdZJ5tNKaWjgOZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sKRhtUI2rTKOCy1pBtL4LUT6NW+kN1Vy/jhD0VaFzhaALwXCo5MizRRblO83jlPr0Sg/Y7lIdhCd5ADUS8vnn7pcRmUpcJr8+Mi9rcCzNthrkk7AtL2Ild2GpzvBWb21N5ibU1+nI7n5LowgnhIQFNyCX+blKCQu3nur1VkYHFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+UrNScO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6D1CC116B1;
	Fri, 28 Jun 2024 14:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719584633;
	bh=dSAzEhDO1Gae2NO13lpY5+95zUWJJdZJ5tNKaWjgOZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V+UrNScOc+11hsj3dWbTn1U8HYKKi0rjp2oEJtQjwU7jE2+/s0WnyLFXEMOQQdm0Z
	 ADF04P2nhV001qvjNLyqQCfn0MWzBZqP62ZM4bcpUKvsL4huyPbPxe2JxXykX0+L0h
	 KBUrIRFpDXl0oIkD7lsERf1TQD4tnNVf+buhujEoKx8ynnyfm4Ds0PEIc587SW22SA
	 1AB8P+HRRcA3LarY/6PfGh3LQS1cmOfRkyQYEam7QLC7/Z9bBHJW2TLD7lMvn0vbDL
	 xsX2HC85TNMVetEGAem2qNOjxw56v1u7Y9RjYIVlvuyXQsICfV9AwsGuXhgvnYeE/3
	 cYpNWofQGXU7A==
Date: Fri, 28 Jun 2024 15:23:48 +0100
From: Lee Jones <lee@kernel.org>
To: James Ogletree <James.Ogletree@cirrus.com>
Cc: James Ogletree <jogletre@opensource.cirrus.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
	Jeff LaBundy <jeff@labundy.com>,
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH RESEND v11 0/5] Add support for CS40L50
Message-ID: <20240628142348.GL2532839@google.com>
References: <20240620161745.2312359-1-jogletre@opensource.cirrus.com>
 <20240620165935.GT3029315@google.com>
 <21975F67-D71D-4D5D-8042-8EE64E8864CA@cirrus.com>
 <20240627071258.GE2532839@google.com>
 <C8C41985-E19A-400C-9DF2-720BCDE984E1@cirrus.com>
 <20240628080653.GJ2532839@google.com>
 <531E5C17-B55C-4548-97F7-B0B494AE7B16@cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <531E5C17-B55C-4548-97F7-B0B494AE7B16@cirrus.com>

On Fri, 28 Jun 2024, James Ogletree wrote:

> 
> > On Jun 28, 2024, at 3:06 AM, Lee Jones <lee@kernel.org> wrote:
> > 
> > On Thu, 27 Jun 2024, James Ogletree wrote:
> > 
> >> 
> >>> On Jun 27, 2024, at 2:12 AM, Lee Jones <lee@kernel.org> wrote:
> >>> 
> >>> On Wed, 26 Jun 2024, James Ogletree wrote:
> >>> 
> >>>> 
> >>>>> On Jun 20, 2024, at 11:59 AM, Lee Jones <lee@kernel.org> wrote:
> >>>>> 
> >>>>> On Thu, 20 Jun 2024, James Ogletree wrote:
> >>>>> 
> >>>>>> Changes in v11:
> >>>>>> - Constified function parameters in ASOC driver
> >>>>>> - Removed an unneeded #include
> >>>>>> - Changed number of max FF effects = 1
> >>>>>> - Minor refactoring in Input driver
> >>>>>> - Reworded comment in MFD driver
> >>>>>> 
> >>>>>> Changes in v10:
> >>>>>> - Minor refactoring and logical improvements all around
> >>>>>> - Renamed and added supplies
> >>>>>> 
> >>>>>> Changes in v9:
> >>>>>> - Fixed empty struct by utilizing cs_dsp's post_run callback
> >>>>>> - Style fixes in MFD driver
> >>>>>> 
> >>>>>> Changes in v8:
> >>>>>> - set_sysclk() -> set_bclk_ratio()
> >>>>>> - Added ID table to codec driver
> >>>>>> - Style improvements
> >>>>>> - Fixed ordering of new write sequence operations
> >>>>>> 
> >>>>>> Changes in v7:
> >>>>>> - Fixed sparse warning
> >>>>>> - Moved write sequences to private data structure
> >>>>>> - Logical and style improvements in write sequence interface
> >>>>>> 
> >>>>>> Changes in v6:
> >>>>>> - Updated write sequencer interface to be control-name based
> >>>>>> - Fixed a race condition and non-handling of repeats in playback callback
> >>>>>> - Stylistic and logical improvements all around
> >>>>>> 
> >>>>>> Changes in v5:
> >>>>>> - Added a codec sub-device to support I2S streaming
> >>>>>> - Moved write sequencer code from cirrus_haptics to cs_dsp
> >>>>>> - Reverted cirrus_haptics library; future Cirrus input
> >>>>>> drivers will export and utilize cs40l50_vibra functions
> >>>>>> - Added more comments
> >>>>>> - Many small stylistic and logical improvements
> >>>>>> 
> >>>>>> Changes in v4:
> >>>>>> - Moved from Input to MFD
> >>>>>> - Moved common Cirrus haptic functions to a library
> >>>>>> - Incorporated runtime PM framework
> >>>>>> - Many style improvements
> >>>>>> 
> >>>>>> Changes in v3:
> >>>>>> - YAML formatting corrections
> >>>>>> - Fixed typo in MAINTAINERS
> >>>>>> - Used generic node name "haptic-driver"
> >>>>>> - Fixed probe error code paths
> >>>>>> - Switched to "sizeof(*)"
> >>>>>> - Removed tree reference in MAINTAINERS
> >>>>>> 
> >>>>>> Changes in v2:
> >>>>>> - Fixed checkpatch warnings
> >>>>>> 
> >>>>>> James Ogletree (5):
> >>>>>> firmware: cs_dsp: Add write sequence interface
> >>>>>> dt-bindings: input: cirrus,cs40l50: Add initial DT binding
> >>>>>> mfd: cs40l50: Add support for CS40L50 core driver
> >>>>>> Input: cs40l50 - Add support for the CS40L50 haptic driver
> >>>>>> ASoC: cs40l50: Support I2S streaming to CS40L50
> >>>>>> 
> >>>>>> .../bindings/input/cirrus,cs40l50.yaml        |  68 +++
> >>>>>> MAINTAINERS                                   |  12 +
> >>>>>> drivers/firmware/cirrus/cs_dsp.c              | 278 +++++++++
> >>>>>> drivers/input/misc/Kconfig                    |  10 +
> >>>>>> drivers/input/misc/Makefile                   |   1 +
> >>>>>> drivers/input/misc/cs40l50-vibra.c            | 555 +++++++++++++++++
> >>>>>> drivers/mfd/Kconfig                           |  30 +
> >>>>>> drivers/mfd/Makefile                          |   4 +
> >>>>>> drivers/mfd/cs40l50-core.c                    | 570 ++++++++++++++++++
> >>>>>> drivers/mfd/cs40l50-i2c.c                     |  68 +++
> >>>>>> drivers/mfd/cs40l50-spi.c                     |  68 +++
> >>>>>> include/linux/firmware/cirrus/cs_dsp.h        |  27 +
> >>>>>> include/linux/mfd/cs40l50.h                   | 137 +++++
> >>>>>> sound/soc/codecs/Kconfig                      |  11 +
> >>>>>> sound/soc/codecs/Makefile                     |   2 +
> >>>>>> sound/soc/codecs/cs40l50-codec.c              | 307 ++++++++++
> >>>>>> 16 files changed, 2148 insertions(+)
> >>>>>> create mode 100644 Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml
> >>>>>> create mode 100644 drivers/input/misc/cs40l50-vibra.c
> >>>>>> create mode 100644 drivers/mfd/cs40l50-core.c
> >>>>>> create mode 100644 drivers/mfd/cs40l50-i2c.c
> >>>>>> create mode 100644 drivers/mfd/cs40l50-spi.c
> >>>>>> create mode 100644 include/linux/mfd/cs40l50.h
> >>>>>> create mode 100644 sound/soc/codecs/cs40l50-codec.c
> >>>>> 
> >>>>> Still needs Acks - ping me when you have them.
> >>>>> 
> >>>>> -- 
> >>>>> Lee Jones [李琼斯]
> >>>> 
> >>>> Hi Lee,
> >>>> 
> >>>> You can take this series now.
> >>> 
> >>> sound/soc?
> >>> 
> >>> -- 
> >>> Lee Jones [李琼斯]
> >> 
> >> Mark has Acked the original v11 series here:
> >> https://urldefense.com/v3/__https://lore.kernel.org/all/a85e09d6-d8eb-4c60-ae83-b4dbf875a926@sirena.org.uk/__;!!DQ3KfwI!0a407iFiKYCsNXJTLf65046j5eBK-mijVgGMYsX8Rg8dCaxttzQAKBI976mPk_AxuVs7n1zqpQmpy7o$
> > 
> > Ah, you just forgot to add it to the RESEND?
> > 
> > Okay, leave it with me then.
> > 
> > -- 
> > Lee Jones [李琼斯]
> 
> Actually it was Acked on the original v11 series after the RESEND had been sent
> out. If you like, I can resend with all the collected tags.

I see.  Thanks for the explanation.

No need to resend again, I'll add it manually.

-- 
Lee Jones [李琼斯]

