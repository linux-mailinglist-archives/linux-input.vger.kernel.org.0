Return-Path: <linux-input+bounces-13934-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 822ECB21EC6
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 09:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7393217CBB0
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 07:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C158D2D6E6F;
	Tue, 12 Aug 2025 07:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ewhac.org header.i=@ewhac.org header.b="jXE/ZqBv"
X-Original-To: linux-input@vger.kernel.org
Received: from dog.birch.relay.mailchannels.net (dog.birch.relay.mailchannels.net [23.83.209.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C74311C19;
	Tue, 12 Aug 2025 07:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.209.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754982421; cv=pass; b=jUxdcl1oELTR/iZJACWm9wi3XIpn2UKbRqb8EpvNVV9sopa1e/8T2XsRt7Zfe4+6VfUr5oYorOWSxtoP72rOVihLIIOMPUDVm9tiI32sfa5iHlgKgnm/vjXHDVzqE/Nxw6Ij32wc6r+g6BAsE6mhBhnSJfPGATncCMt8ZYfrF8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754982421; c=relaxed/simple;
	bh=ZQ0okqKGDJVVm4Nkk1XqJHtZmMRv7bgVvv+UZcX7ZIs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=V8p2eF/aNRlZfShxPfUsNUV5kd1lZyuLAEiDv2IHnA87X/mQwCn7Z3Hhckflp3p8S4pevs3QPtWkZWNrd9b5ezjIClGc6G/nj7QSelQIKCJtYoFb8qtBDqd0btpMS6eMQ7LZwZguVU7dO1XwGF5iGSS+UdoqCMkyt2RG2xXq5SE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ewhac.org; spf=pass smtp.mailfrom=ewhac.org; dkim=pass (2048-bit key) header.d=ewhac.org header.i=@ewhac.org header.b=jXE/ZqBv; arc=pass smtp.client-ip=23.83.209.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ewhac.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ewhac.org
X-Sender-Id: dreamhost|x-authsender|ewhac@ewhac.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 0F2EF84736;
	Tue, 12 Aug 2025 06:51:36 +0000 (UTC)
Received: from pdx1-sub0-mail-a238.dreamhost.com (trex-blue-7.trex.outbound.svc.cluster.local [100.96.10.77])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 9975F831EA;
	Tue, 12 Aug 2025 06:51:35 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1754981495; a=rsa-sha256;
	cv=none;
	b=C8dnRZ8qS87AKhdDyo9p9kBxtKPwNgw0zZg6fI9HWQmi1K+0fw82FIpaaHKNq0/Bd9EWCk
	uJWvaBAiLEASQsEHBsPw7E8TV5LXeyvhzEscY7xebkTz9dLmZ95XdLWgfVQk0DN7pjl0Kr
	J+NMrKN61WXczfCJXar/GoF3QF0sE1txbzesj/XYYe35RVqekAbzPRD9796JNzEpu8o6Zg
	K0MdEESjylcNTdxsbmy4WkmMUv49QvxaPZejUKS1YhAquKBreJ5Qo5NaVHp/7iTxMdwlRV
	SmeXaG5RBf2ZvsdalflSRLXcH6B+7zWj8L1T3uEXBlVPXmBdw8y4UhtMGtWQ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1754981495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:dkim-signature;
	bh=kRicNxBu0/BNrlEnKXrl0+QWeet/sW5wMlvda/7vxUw=;
	b=FO1oP/qnfAqFKBd6wld+pHNebaBzjFmTVcU+kE4+yT+Uca/0KAe5eS7E5lq1rSqPoVLMbx
	etETfbWPYcVta4i4MEU7YrlK2T5+gmKCDDMJIE8UR1y3NWXvUory1QkMzDj3RkKCAiRaeV
	Htyh7th3xI6/z6PK2TFCEmQBuR3OuEYoVCySexLsqKF5iM1mleUbHvElnBFLhInUgTMYKE
	wXagUasX8Pf8E27h3zs6XyykChr8W0/LEha4vUYmPbru9dmg923MG+F1AtFLpaoubqpXVT
	jR/6qQa+DIXrZ2dNjzWmRFRSHR4AQf9Jgsu2warpzRN/HyouVQhZz3agDNgoVA==
ARC-Authentication-Results: i=1;
	rspamd-7c5968dc44-zd5gp;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=ewhac@ewhac.org
X-Sender-Id: dreamhost|x-authsender|ewhac@ewhac.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|ewhac@ewhac.org
X-MailChannels-Auth-Id: dreamhost
X-Eight-Illustrious: 7e53320657b34859_1754981495884_3580620071
X-MC-Loop-Signature: 1754981495884:1929241158
X-MC-Ingress-Time: 1754981495884
Received: from pdx1-sub0-mail-a238.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.10.77 (trex/7.1.3);
	Tue, 12 Aug 2025 06:51:35 +0000
Received: from ewhac.org (unknown [135.180.175.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ewhac@ewhac.org)
	by pdx1-sub0-mail-a238.dreamhost.com (Postfix) with ESMTPSA id 4c1Mc73419z4B;
	Mon, 11 Aug 2025 23:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ewhac.org;
	s=dreamhost; t=1754981495;
	bh=kRicNxBu0/BNrlEnKXrl0+QWeet/sW5wMlvda/7vxUw=;
	h=Date:From:To:Cc:Subject:Content-Type:Content-Transfer-Encoding;
	b=jXE/ZqBv0rGhivCxTn9hasaILo7mHtfwoX1hzTV4bLyYFkbmGoonsR32C4M2p/kVM
	 qHrUOLvHOSVHty9xGEDT8CGGDS4eKnGgM4t32VUhfs9/j1Ltc8CswCf5p6eJmlt71k
	 64tp3uTs4tbxJoleE7ksFj9yCRmeO9AuLAlwgqyFiMoOqTyJEVYN6k3+hIYNCRWBz0
	 gomFhNpzM2Tc41JuHXcIqmFDzEDvyHDEzBqiCKTDFBsVUErP5T7GGYWUjVzq+lc+eF
	 /Ennz1jpi3HivlZXdw0mxxrdFYfY++/qzXinKTWoyuin5Etn5CzKz1LYPsk1Z/E3oS
	 7XF7pCHrQVblg==
Received: from ewhac by walkies with local (Exim 4.98.2)
	(envelope-from <ewhac@ewhac.org>)
	id 1ulir8-00000004crC-3yVV;
	Mon, 11 Aug 2025 23:51:34 -0700
Date: Mon, 11 Aug 2025 23:51:34 -0700
From: "Leo L. Schwab" <ewhac@ewhac.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Hans de Goede <hansg@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Kate Hsuan <hpa@redhat.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] HID: lg-g15 - Add support for Logitech G13.
Message-ID: <aJrkdqrCG2FQZr53@ewhac.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202508120615.TGJUom52-lkp@intel.com>
 <d37e7ccd-1d5d-4237-8a7e-a0eb10ec069d@web.de>
 <92a3486e-f101-4ca4-a611-a5c1c6afa6ca@web.de>

On Mon, Aug 11, 2025 at 07:00:24PM +0200, Markus Elfring wrote:
> See also once more:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.16#n94
> 

On Mon, Aug 11, 2025 at 07:10:46PM +0200, Markus Elfring wrote:
> Under which circumstances would you become interested to apply a statement
> like “guard(mutex)(&g15->mutex);”?
> https://elixir.bootlin.com/linux/v6.16/source/include/linux/mutex.h#L225
> 

On Tue, Aug 12, 2025 at 08:00:09AM +0800, kernel test robot wrote:
> kernel test robot noticed the following build errors:
> [ ... ]
>    drivers/hid/hid-lg-g15.c: In function 'lg_g13_event':
> >> drivers/hid/hid-lg-g15.c:703:68: error: 'struct led_classdev' has no member named 'brightness_hw_changed'
>      703 |                 (!!TEST_BIT(rep->keybits, 23)) ^ (g15->leds[0].cdev.brightness_hw_changed > 0);
>          |                                                                    ^
>
	Thank you.  Updated patch forthcoming which will hopefully address
these concerns.

					Schwab

