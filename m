Return-Path: <linux-input+bounces-14034-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A7EB27029
	for <lists+linux-input@lfdr.de>; Thu, 14 Aug 2025 22:27:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBD395E6C4B
	for <lists+linux-input@lfdr.de>; Thu, 14 Aug 2025 20:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C2DF258CF7;
	Thu, 14 Aug 2025 20:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ewhac.org header.i=@ewhac.org header.b="aw4tTbAC"
X-Original-To: linux-input@vger.kernel.org
Received: from iguana.tulip.relay.mailchannels.net (iguana.tulip.relay.mailchannels.net [23.83.218.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4188B1FF60A;
	Thu, 14 Aug 2025 20:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.253
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755203241; cv=pass; b=YE0bHgcOGu4UtJxz9XFWJnFDtKVyaRFuIrSJAKCWLu92ih6CdI4NSUec61aruGmpmINAghFSitmK2xNUVr6GRL/0h0V/0Z6E1f33BbQ+vuoHe+NnnyyzgcsltOkZ6rFU+USBnJEpr11nVlI12fljjFAw34x9LFmcVAudA45ANN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755203241; c=relaxed/simple;
	bh=nRlGCCJCEYe988/EJMXA2bn8aYuuWN/aly6RkZI8q7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uKsrnRjv8y5ZS9lUDc9tLXY3Mfp/7zcry7CbYYrw2+R3D+JAsslzUopXrowUL7lZwtEO1gTon7ewl30cSuCCdxYESTb6rEYVTltv9ddx4CdM4YsxIOkYea0AX2HXUkzqC7VDmdvAGDS7ikxtaJ9CfCwOzjeQg1zUvwlreAFOF0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ewhac.org; spf=pass smtp.mailfrom=ewhac.org; dkim=pass (2048-bit key) header.d=ewhac.org header.i=@ewhac.org header.b=aw4tTbAC; arc=pass smtp.client-ip=23.83.218.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ewhac.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ewhac.org
X-Sender-Id: dreamhost|x-authsender|ewhac@ewhac.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 02314162C4E;
	Thu, 14 Aug 2025 20:27:09 +0000 (UTC)
Received: from pdx1-sub0-mail-a258.dreamhost.com (trex-blue-8.trex.outbound.svc.cluster.local [100.96.56.14])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 8C3B4163971;
	Thu, 14 Aug 2025 20:27:08 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1755203228; a=rsa-sha256;
	cv=none;
	b=ZEWp4FLqZD5whrpn9IcswqasGEptv/7+S2eJml45Ld1w98Vmt0Ohy0FKGPa8+/Cotyjg4N
	LVNOpjRBUSHmirLnNU/eAhYNb+eAZNpGac1m8YIIIOXqoR0L//RN7CXpLPyCku3m9I4GYi
	ZhnSBFldy8KUgKlQYM/XaJpGNCp8mcO7tJln/C0604SeSm5CTkwxHr7umYTBjBViMgbiWg
	EXT6KB2C063GmwAltzVVnxpNc/8w9of9E/dDVWlgkGxtydjai1ZT/+AzXK66jpmHw2GmG6
	AOtD6foJUblyICLhL0B4qFlUiJ5BcbmyHD2VVwlEqLLc6BinbT10a9IYsVtxTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1755203228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=Ht4Yilg24DjWd+8Xf45zZ9kAMEuvotKdSx04jUYmF38=;
	b=HUJpOLXWr6M/G/foUNx/8FXHBHXWRriQ4feLTvG06WQCdqYHYuV5Zf1Ykgz9/UvA4KcRgU
	HIsrsNqtdUrMlucqqWFjAQ50uSIKoqx9CcVbESmQnGSGaIHI6bQUhTxCxvCaD1CdY7Xa55
	DkTEN97+erpaTUR2UHwurXyUxhEH8Ce1R8S/P/+qH5GNGzPTgrLb408PTgvdmFPpWRl8pB
	fiKsENtMfh3E3NX7m9k7/cNva5Fz9PhzGZFvO3Ui6aJShv+6YwG78gOLF9w6kTVD9Jsdmx
	9YSskhyVsfwBGMVe7gvYFsaM+qZJd8sQb8oTtUTPfZiaHH9h5AhdyHcUdkdb+Q==
ARC-Authentication-Results: i=1;
	rspamd-865b9ccc6c-jwf8c;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=ewhac@ewhac.org
X-Sender-Id: dreamhost|x-authsender|ewhac@ewhac.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|ewhac@ewhac.org
X-MailChannels-Auth-Id: dreamhost
X-Industry-Trade: 3605f0b77398cca0_1755203228839_1202641544
X-MC-Loop-Signature: 1755203228839:294781078
X-MC-Ingress-Time: 1755203228838
Received: from pdx1-sub0-mail-a258.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.56.14 (trex/7.1.3);
	Thu, 14 Aug 2025 20:27:08 +0000
Received: from ewhac.org (unknown [135.180.175.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ewhac@ewhac.org)
	by pdx1-sub0-mail-a258.dreamhost.com (Postfix) with ESMTPSA id 4c2xcD2dqNzCW;
	Thu, 14 Aug 2025 13:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ewhac.org;
	s=dreamhost; t=1755203228;
	bh=Ht4Yilg24DjWd+8Xf45zZ9kAMEuvotKdSx04jUYmF38=;
	h=Date:From:To:Cc:Subject:Content-Type:Content-Transfer-Encoding;
	b=aw4tTbACC9BkZEuADf+iedQBY3MrT+dr56yGWpcJ8TdIvCKYm5RvYBT/oEvqtsUYz
	 vD9xci53Gv6bI7wRDX/YK3bPF+6S7fa0goGbbB0Y6FMXXpZZPQhQTYuDAoICSNCnfl
	 rNKbyxqUCYx1b2q5OMTxw1g9llOiok4/NNR/95rkcKPP/VAKBOsLn5umS6VQzoItdG
	 oQ0uk15tIgrenLmzrBd64hr+C21Y0eoBtWtdraKyD7A2CfkCr392t9fajVGum4LGvF
	 PbsGOrz4A8tjMPPtGMZJ8LkDBgoHsS/z5ANQY5Vjqwl0LuJu265xS9E1xh6WTFfXas
	 uBadEnOYHiuRg==
Received: from ewhac by walkies with local (Exim 4.98.2)
	(envelope-from <ewhac@ewhac.org>)
	id 1umeXT-00000004yYX-1G7z;
	Thu, 14 Aug 2025 13:27:07 -0700
Date: Thu, 14 Aug 2025 13:27:07 -0700
From: "Leo L. Schwab" <ewhac@ewhac.org>
To: Kate Hsuan <hpa@redhat.com>
Cc: Hans de Goede <hansg@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: lg-g15 - Add support for Logitech G13.
Message-ID: <aJ5Gm5AaLI6iJ4le@ewhac.org>
References: <20250812065327.515098-2-ewhac@ewhac.org>
 <CAEth8oEf3c9quzL2boHo=dJg6+p8scSsq5hL7j2LLjdtREsQxw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEth8oEf3c9quzL2boHo=dJg6+p8scSsq5hL7j2LLjdtREsQxw@mail.gmail.com>

On Thu, Aug 14, 2025 at 05:09:09PM +0800, Kate Hsuan wrote:
> Thank you for your work.
>
	Thank you for your feedback.  And thank you for collecting all your
comments into one post.

> On Tue, Aug 12, 2025 at 2:57 PM Leo L. Schwab <ewhac@ewhac.org> wrote:
> The comment should in C comments, for example
>  struct input_dev *input_js;  /*joystick device for G13*/
>
	Will sweep all those up.

> > +static int lg_g13_kbd_led_set(struct led_classdev *led_cdev, enum led_brightness brightness)
> > +{
> > +       struct led_classdev_mc *mc = lcdev_to_mccdev(led_cdev);
> > +       struct lg_g15_led *g15_led =
> > +               container_of(mc, struct lg_g15_led, mcdev);
> > +       struct lg_g15_data *g15 = dev_get_drvdata(led_cdev->dev->parent);
> > +
> > +       /* Ignore LED off on unregister / keyboard unplug */
> > +       if (led_cdev->flags & LED_UNREGISTERING)
> > +               return 0;
> > +
> > +       guard(mutex)(&g15->mutex);
> guard() can be moved to lg_g13_kbd_led_write() to ensure the code is
> protected by a mutex lock when lg_g13_kbd_led_write() is called.
>
	I was mimicking the existing structure of the G15 and G510 code,
which I assumed was set up that way for a reason.  Will move this.

> > +static int lg_g13_event(struct lg_g15_data *g15, u8 const *data)
> > +{
> > +       struct g13_input_report const * const rep = (struct g13_input_report *) data;
> > +       int i, val;
> > +       bool hw_brightness_changed;
> Remove unused variable.
>
	I will be slightly restructuring this.

> >         switch (g15->model) {
> > +       case LG_G13:
> > +               /*
> > +                * Some usermode libraries tend to ignore devices that don't
> > +                * "look like" a joystick.  Create additional input device
> > +                * dedicated as joystick.
> > +                */
> Nit.
> Improve the comment and describe the hardware and the variable
> settings below in brief.

	I'll wordsmith this.  It'll get a bit wordier, though...

> Some style and comment style issues are pointed out, and I'll start to
> test this work after I receive my G13.
>
	If anything explodes, please let me know right away.

					Schwab

