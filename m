Return-Path: <linux-input+bounces-11558-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 79842A7DC7D
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 13:39:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D13C2175A53
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 11:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF9023CEE5;
	Mon,  7 Apr 2025 11:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="XXwebaJ6"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E4D23A9B6;
	Mon,  7 Apr 2025 11:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744025921; cv=none; b=YpuGYLd7hW7Mr+dRCogfIY3U5qg2RPNyCGiFhyXkAqOjV78m6E+DSN1A8FFKJc0mOeL12zMZG1gn8LFvaZ2tUn5RNn3H+As+8nyE2uJG72IoE/FefeFFymFoFT/t0wyndz3v2/qhlMz9W18u1SEvyjg6/pdY+0Qaa3r7LAVdfHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744025921; c=relaxed/simple;
	bh=VOPErnxtLORQUappvnEZwwAIyuoyRROHIYTRcdWB/e0=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=i+QFQcLYHmvYa3XJAPu/8u/h9JwZzrmIgf8lrTBtdGKGMh0aK3dHUqe9hs5gZ3JR4FJUP48l74qSoweQ7xtzBL+QtTCM8cnhC3e4OKLa05+AqsMwqztFetHjr3Ng5ce3Bvdm2avYPEM2HBhs24KfAwLFeM8QpLNKgDAsTNaew2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=XXwebaJ6; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1744025917; x=1744630717; i=markus.elfring@web.de;
	bh=7BpszykP3a8TgXiCiFnrLPKvDXMJeEZXi14t+noJhAg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=XXwebaJ6g2otca99erTdOKqgrr8wdPMKcSJGjYO8sFXrDVlp6LvYz8uOtAGgrB7L
	 6xs7eBLxbiBp3iJfKQHmktD6Ec4bodRdCV+OIIWc1dE1pCTiG2NBJUqvOWALW0xny
	 ooo7c/QlEtNW3LOvX/x6QIqukBofE3BJZZQjiiC+/ROLyyVlEpG6GXolH8a9VfyM9
	 +IdofeQb7rkL7wQ4pzx1LVnNWi1RTfoctCpjAWzyXQW5HrWX3B5a9xfsEqrIKXfs9
	 orKLC/xoAqcjzwC8cmYGjIRgemtvQIw6+gNywm+F5B3P/TARbSEk8D8fEt/n/BrGi
	 4+CJcXBGskXI2XO4tQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.4]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MumJF-1tA47z47z1-010NWl; Mon, 07
 Apr 2025 13:38:37 +0200
Message-ID: <5d8d6101-1a4b-4832-b263-e0f56840fdcd@web.de>
Date: Mon, 7 Apr 2025 13:38:35 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qasim Ijaz <qasdev00@gmail.com>, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20250406133551.4576-1-qasdev00@gmail.com>
Subject: Re: [PATCH RESEND] HID: thrustmaster: fix memory leak in
 thrustmaster_interrupts()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250406133551.4576-1-qasdev00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7yBflSxGGeWdw7bVzYWFg7LDXkghO2FiIafj3/KBPQ0KK3LFSE6
 rUn4X4ZhrwNVxZ6nBDP2tGow1+98ZomcmoJLr5stRtCAVjXWd3LbI7HnZOuS/MUHou5NSje
 Zdle4XiyzsUdu8sgG8VyHHfeq69uRV8tUwRbaJ1TowZACZgZlBSznwewxMA9xbAX/HcWyem
 HDrFii6zNxo/tqIjm+jEQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gjRTKgY1ReI=;b6/mK2dG3AeTU/SDylEZwv+v2qR
 Sa8UWWlf9Waf1XPKaaoxzSlHAvt5AT6SZAeXHcaqTF1nCFP1Ep3wDnsOn1gTuS9HlSQIuMgs6
 XAn0aNo93EsOvCAapbXP/yg+m9saqNbikQOhA0lB7R2E/8KJ7B8JSCa/+FnDnWbtylrNPyLgl
 Qa/aBH/GMwg0P3E4quhWHUNuICIbPQX23Vi4yDrEmKQj/vLrAD+MmJ+h0X54yBO9T7gvq+Qhn
 TQPTMLeGWoei4vlv7YvHKpUr+RHDq87Q5gdFg+z0ICmayROM/R8HCfCV/pD3OCNGV7qg/x4d0
 /wY8eC6rKlOzqnwoSHKFn7OJ/EucV3+B60oAU3mIVzkbgdkP8Twno8ILkxOHSyvlLuMO/RFWE
 lUUv2n5vw0LXZl3U0BiNuPMRnrc2u/EsdnVfwQFagNo4ZxQVTKUZTO6/XTZoWnwW9MiCcfisg
 GwVYlhbExyMpaQAGHWyJVpLc+R6vZX5qNMnUtzRoywQYdJGCEt8dsjL/AfJW+oezjdcQqemaE
 AC7OkNYESfHANkzbCRP84mHhRL+KOnt3UgO+UIlybXbBxuurXiatis7Oy0xCv15fDTq1WHb8G
 jNvPBLP9g1g4VHs8NaR0JyVSqrffI/p1n2UePSlZbcvAJFkZhSPAQQohah91D5EHHbqeV873c
 GH58MChwSl5cZ7dKSiWwKdIeAxfR2QsQAm8/zNBHuNAwtGbxFH9IAK8gL+Ti46Iar+6pqApcK
 4BCYYcXoBHBwvWKsPD5597LNc7KKIKEHvvwRsfIwL68cSWzJ2jriL/bEbbAKRFJtQrsvpSLCi
 HvIEUCjmfjxAZsjzPEBlfXH28ChJptlTRXAs3N88jWN6MPkP2Hl6/+Dciugf8b+ueuZmCoqZB
 9m7L1UuyA8MR8MPICKhkWF1M+jFjr3MWV2uC0w1YvmOxa+9YV6H+C29WCts05nlapo1xPZiyG
 fYGBp2yTgq8CUnLLiEOdzrMu9WOdH2XzfV9egf0G64Nt/AUgqGvxy6iTiHzhhEEI+I1VSpmHq
 wiUnrBYBIfbTfr8KAD1HhtktrZ0H2nn1lY6hK5CtCJCzQYggcCZwtw3FmzHcFVi5kjVKsvnZp
 RTsN3oB18mSMTp979jawGqA9ttK6bOp3XDtSuTPR+p9EbsOU9xjZ1zbhvV++pc3Wdsz4/OZbz
 KiLKa5PnAuNpjailDaz5VrbijUSbWmW6Pq3TOwD+n66+RvHUpq5dDPuxv0dDljWzSup7XkEeK
 9VAiJfA8/6OqCEHrWXPKZzil0/2ygL8Lx3BmgnSpg1y8DiMwKkzC5d88IuVkX0WfpdZHCIWP4
 f6d0FLPr7JfgME92AnC6emu5mZ0g6Ohv1SVyLfY/ZDDRRhBN4m4jwVkq5FhBAj35BUuqN6PeR
 XmQL3akHCIGqRZ0y/AeaWzTHbTRPVn6RngKyuA6wputxoMyDLLOlmcOfRcWulu/sEYAf0EK6x
 k5Tfq4FjotKRJOhQ3KyLJiO/H3urRstTPz+x0hI098S9fDihRtu6ZXCXUqTeouHSHA2pBSw==

> In thrustmaster_interrupts(), the allocated send_buf is not
> freed if the usb_check_int_endpoints() check fails, leading
> to a memory leak.

Will you get into the mood to make word wrapping occasionally a bit nicer
for such text lines (which may be longer than 59 characters)?


=E2=80=A6
> +++ b/drivers/hid/hid-thrustmaster.c
> @@ -174,6 +174,7 @@ static void thrustmaster_interrupts(struct hid_devic=
e *hdev)
>  	u8 ep_addr[2] =3D {b_ep, 0};
>
>  	if (!usb_check_int_endpoints(usbif, ep_addr)) {
> +		kfree(send_buf);
>  		hid_err(hdev, "Unexpected non-int endpoint\n");
>  		return;
>  	}

* You may avoid such repeated function calls by using another label instea=
d.
  https://wiki.sei.cmu.edu/confluence/display/c/MEM12-C.+Consider+using+a+=
goto+chain+when+leaving+a+function+on+error+when+using+and+releasing+resou=
rces#MEM12C.Considerusingagotochainwhenleavingafunctiononerrorwhenusingand=
releasingresources-CompliantSolution(copy_process()fromLinuxkernel)

* How do you think about to benefit any more from the application of the a=
ttribute =E2=80=9C__free=E2=80=9D?
  https://elixir.bootlin.com/linux/v6.14-rc6/source/include/linux/slab.h#L=
472


Regards,
Markus

