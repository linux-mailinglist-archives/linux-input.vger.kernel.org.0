Return-Path: <linux-input+bounces-6858-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0118C9893A7
	for <lists+linux-input@lfdr.de>; Sun, 29 Sep 2024 10:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 332512830CF
	for <lists+linux-input@lfdr.de>; Sun, 29 Sep 2024 08:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487451F95A;
	Sun, 29 Sep 2024 08:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="BxSgDh5g"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8DF17580;
	Sun, 29 Sep 2024 08:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727596969; cv=none; b=otYpX1Ej+CqtcDr6zCqEVPv3g3HFnuK+JrcUcj8PAakWF/dH8mkc/HE/9y/7MGD+hWqlsxgpz/mTql4OZ9tKGoR/F+Fpm4ZhG1W9L1BK/Hp4GT9dQDnF5V8Y4Zr2MWwd3KerKl2nAti/EpI6/GBaf93qmLuTEAGoRemXwCIZN24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727596969; c=relaxed/simple;
	bh=dPI6Sb0f9BLgjZvLqXr84eJtwNNeT/rjViIkLsStDJc=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=a2g7pFQUFi4fgCCdM1JigZGn83/3OCOHQYrXX0XG36CBh7KEymFWCbv8g5nIDiynS/GhVvDgSn+rJxhVG0zj2dlIpnKVSbIPYFGTD+mDjAAW6rtlMH/wFrXuygivmo9X+DSivmFr1V9TGJX6gEzI+Zlcwo52mnHvHy4wnApFJpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=BxSgDh5g; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727596951; x=1728201751; i=markus.elfring@web.de;
	bh=dPI6Sb0f9BLgjZvLqXr84eJtwNNeT/rjViIkLsStDJc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=BxSgDh5gt2asj/UbpBG5mAg2kTb3qdKNlSihMoWsm0cQyMqA5UPubgi4TvRFJxwv
	 ka7myT0lapme2HOy/I1Hs+LRU/b1/B519PHp275BPU/h9DcElZRKzwUPIvrJEz0+Y
	 2kHoYkhQ42droJpoxpCBUXZpQsgzXG6DDWCGFd+Ns9U9Vk34p4ksLezLi+y+/88Yg
	 xmehNIpX1VVDfb1FLUP9o4SqJpki9On0HkVHBi9SCCea/UG3/d2kMcw+1ahautEyO
	 KvACuw+lteSrJ69budn7IC8g/HHa1J4EnE9e99TrzSEg5G/uNnnN9+4vqT4cINrZk
	 r3vdV4B2QrzbG1mYHA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MW9ra-1sOUCD1B5W-00Y66Q; Sun, 29
 Sep 2024 10:02:31 +0200
Message-ID: <7d5b10b3-0e6a-40a2-998f-370422138023@web.de>
Date: Sun, 29 Sep 2024 10:02:14 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Manuel Quintero F <sakunix@hotmail.com>, linux-input@vger.kernel.org,
 Erick Archer <erick.archer@outlook.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <SJ2P222MB10432CABF7A18C3A7F7ED9FCBC752@SJ2P222MB1043.NAMP222.PROD.OUTLOOK.COM>
Subject: Re: [PATCH 100/100] Input: joystick: a3d: fixed multiple coding style
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <SJ2P222MB10432CABF7A18C3A7F7ED9FCBC752@SJ2P222MB1043.NAMP222.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:040nZxzgWMp8m368387M+yA31MF0qxlumfOncf2WvFbNw2gIQsf
 pH3mf05k3dwRdxDS6oSGeWBabLs85FGkIMpMiCHHvkj6MaUgCvy2wPsQXS5AoneLu6mNO74
 dAOBH4/YCqNz7jk+phPwDW9WUcm7cJ61voD+dfeXRDUv1T6JOXjoUdkFTLDl96OfIRKQSeM
 yLJZ6JIOQjdMdbIPPfu/g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FcMTH1fkjyg=;3WKfXoZJYcz6yYE1ulxPsIW/yIC
 5LAD9ZFe9IDGuAHs33TmdD9eaE1aEuB1F9e1VrseAh21AIK790BYYbtEJF8gLrLrl/5p5JBI8
 q4/pHu83D7Meu4GvEo1rQANcgYPLPwlbntIau/VpDmNpp5O4TMx+YcRciCzqohxbte0iOs9PB
 V8iMf5ZPFajl/2+OjUnDYnbFQbdWo0SLHxHEg5cEqDaxcrrsWHeko4lfOp28mgai4A8dROD+h
 K5qImY0DRXVUudzsdyQjD6hizVmyvfXIuaJYU8IVV4fria3XTTLBxrSlsQKJkdvEKQxYsJu1L
 QnahC3jb0CJGu8O42U9I1OFjSo4vvHJ5xGu1oHrdHLYRbFyOSaOnmAHbl3r5gXnefdNoGs0cY
 KSaMcGVWPKlXqpdg39Gn/RWDdd4lsiD4RTusaiCaIWKZHH0CLWbDORqMALhJSJt3GUy66dGHF
 xU1BzC9UvSkWowPxzmle8ZXKqasUKeVodyg4MIht59Ux2eTtjCDpexrbu5O3kAHyCWWWcZnxl
 FnLRz4QB7TQoORFWLmCjn9WK71QU0mzylfm+B1/xofyDtC+kM6unpC23Nz5wBmAQ4Fem3TbvF
 sRnHhKGrUey1j+yfvZY+zVFRH37L0AjI0N/b+6q3HADAgxgCj8VXTyPqPW1Ceh3Wai6NTzzls
 8pFKZ13KuBADZDnJlW2kEhLkYnWEfaxkPM4m1/z1SJL7QKPYwtrV/HE+BgYv9/ay8+DLORPtg
 mXmgg3lGhj6rmxMBSjD8soybI91q2W+k+qLG9ATyD7BEx9J/mJ432PhFAH+PZyTg+ND4IhqHy
 Xl1L8ye9hYfKg2A37klmj7Ag==

Does this adjustment belong to any patch series?


> Fixed multiple coding styles issue

Would you like to take any further development concerns into account?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.11#n81

Regards,
Markus

