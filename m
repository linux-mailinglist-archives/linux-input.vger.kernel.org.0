Return-Path: <linux-input+bounces-1115-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3FD82485C
	for <lists+linux-input@lfdr.de>; Thu,  4 Jan 2024 19:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81BA81F25291
	for <lists+linux-input@lfdr.de>; Thu,  4 Jan 2024 18:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD8528E14;
	Thu,  4 Jan 2024 18:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bernhard-seibold.de header.i=@bernhard-seibold.de header.b="l+AzJt0Z"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FB828E21
	for <linux-input@vger.kernel.org>; Thu,  4 Jan 2024 18:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bernhard-seibold.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bernhard-seibold.de
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4T5bCZ6h7Cz9sqn;
	Thu,  4 Jan 2024 19:46:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bernhard-seibold.de;
	s=MBO0001; t=1704393994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TqMBzj5PsQTbfKMApRhophd15qpAlTlwrtzZwBB4iRg=;
	b=l+AzJt0ZBmLaNIh9rR1smLZxSTdxlZn6709Q3iLWnj51PIyeeJKGDafK0tcNYvTRKgeSI0
	/YktLMiSlomEU3ryFcRbJWm44JqXYhdGuiyuc1HoVSoRxH7cIQQdHh+1MdnPvJkjzwtUI4
	xoRmlAiC/aa/zBccUg7Cw+QK+bWIXC+qAcRPckUYOb9o2ump2iGYnCU4KTzNQUI0z6O3QJ
	17Y4Si8HtjxzR1f0PkrCoENf2dgoLUwlUwWQEYkVXnT/EFdEuRRO6z0qHoseKeNtWND3BD
	OdAjogsu2uBDWg2STo9JlJ7sMdAsDGdk8JtSjB3w+9ObU5EdoQN6lAbWTJWaCg==
Date: Thu, 4 Jan 2024 19:46:32 +0100
From: Bernhard Seibold <mail@bernhard-seibold.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, Hans de Goede <hdegoede@redhat.com>, 
	Jamie Lentin <jm@lentin.co.uk>
Subject: Re: Re: [PATCH 1/3] HID: input - Add microphone mute LED support
Message-ID: <fm6z2zok4ndbke3zqvrm7zbmkukul65n5unl5xkgmlccswz3hl@ycpnx2ii5wu4>
References: <20240104154941.6919-1-mail@bernhard-seibold.de>
 <ZZbxHpibdyNY_zUt@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZZbxHpibdyNY_zUt@google.com>
X-Rspamd-Queue-Id: 4T5bCZ6h7Cz9sqn

Hi Dmitri,

On Thu, Jan 04, 2024 at 09:55:42AM -0800, Dmitry Torokhov wrote:
> No, please do not add new LEDs to input subsystem, and instead use "new"
> LED APIs that are much more flexible. That is why we built the input
> leds bridge in direction of input->leds and on the other way around.
> 
> The existing input LED definitions are grandfathered because they are
> exposed to userspace (via evdev), but we will not be adding new ones.
> 
> Thanks.

Sorry, I'm completely new to this subsystem. Did I get it right that
what you're suggesting is to add something that is similar to
hidinput_setup_battery() and create the new LED there directly,
skipping the input subsystem and input-leds completely?

Regards,
Bernhard

