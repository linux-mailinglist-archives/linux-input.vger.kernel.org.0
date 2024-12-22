Return-Path: <linux-input+bounces-8719-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1AF9FA822
	for <lists+linux-input@lfdr.de>; Sun, 22 Dec 2024 21:18:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F8F51886473
	for <lists+linux-input@lfdr.de>; Sun, 22 Dec 2024 20:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22B3193073;
	Sun, 22 Dec 2024 20:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="yKvAsPUK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pMc/rXUS"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1799192B69;
	Sun, 22 Dec 2024 20:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734898634; cv=none; b=eb6FfwAzZgh/mgYC1ziC14SvFZyxN6cQdftsONZwyAAnMLEiTLLPaJCQdXTx6lns8T6v4D8vQ+sBJ9hupP3ZB9dVAxO73xXFm8RWbQ6RUAjn38A4C9CXg9ANqiq98bsnW+26a0xuiSI/Pi4O2Mg922y7fbNOr5TjyzlrS4PDuLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734898634; c=relaxed/simple;
	bh=n+1ctkvsrbfqtz09+hpORo7fKBpo0VjMBvh5DzL13ng=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=C0zpFseOXiW939u6FPG6JCr+I5NchWkTR2wiXW1S69J4YKH76YYd4+fCwwOrzIdjwtqXLkdxBF6ZyVBzMgZghNuBLicZL2W/2DqO2rPtSjDqn5kMXGDHI8g9e1XjKuof5+Qurq1nUpVEpF0Brx5mDDRhHn+2ldvsrbXdc/Vbiqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=yKvAsPUK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pMc/rXUS; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 82F0C138013C;
	Sun, 22 Dec 2024 15:17:10 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-02.internal (MEProxy); Sun, 22 Dec 2024 15:17:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1734898630;
	 x=1734985030; bh=8gpt36bCr0dYHOEhoCxr6Rw7JuBAOxZejQ4aP2qS058=; b=
	yKvAsPUKNxfAr6OHjedx2Spu6hFWL0Fp5DpGg4Q4S4J8Nb7MmLYHJkXMvGI0lMeZ
	fk9uvTY4J34HrL8O7sfRvrtX2w32eB/fTtcRNYBDbu7/UDfz1+/TPLBZX1iM3whp
	ZUcYP4sU7lElH5Xkl44aJm0+8lNZXcRP4aBl4bFaO42wqVXZHuNLHBoLfZGCcmYn
	/RvW/41kU9IQs75Gk83oswJdtoQuSGKBHzykcbUG/gCHhmYu40ZqBoDaHo/9hC90
	w+RGHHiarCUyyJ8joHWpQeeTkOwtmBFKjrnYFNvRe/0ELmhzf88iYPQtreL8yDBb
	O/+frkJtreN1k2LUVzzaSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1734898630; x=
	1734985030; bh=8gpt36bCr0dYHOEhoCxr6Rw7JuBAOxZejQ4aP2qS058=; b=p
	Mc/rXUShGL0Pjn4+HcOWgRDMDA7aoq+y0UG1n3vhpXobR2HFXW7TeVFANJS6oETr
	pMULPBkTQIJyFLqFAh3DL+Lt6f4mIcAlThniy5PIAlapY97UIxA2JQf3zGzfhTAB
	hw4j+uDyL/x8wgsc8GSiqqoBJLtSylYeKOiNR/6ZGlAzvM3cnQWNVRtAPy95wJxB
	msuvhaqRmtp0yn/4vG08gdC+WSeFldDUi0uXhm/aXVwH33AaxJBkRb9BAGDt/cb5
	rMUvsuc7usndEE8Puvxypj8iN1HKuWa9K5gubgRNJ9zPBqKgVd9mW8CI6v6cdH6C
	sFm9F5XWtQ0GLu2ntSOCg==
X-ME-Sender: <xms:xnNoZ4id3TXuvnIZx55CkWXiBCaJlzXk1AWUwCYchUhC_RTNR2308w>
    <xme:xnNoZxBfOnwki9DuKPghyiH7EYXeRCJpKlhUtNGyXz4hRCOE_pGQZqTIG0TumVGM7
    jZRIRH4A0AbV1Ixv0c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddtkedgudeffecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdforghrkhcurfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvg
    hnohhvohesshhquhgvsggsrdgtrgeqnecuggftrfgrthhtvghrnhephfeggfdugfefueef
    ueeuudejjeehhfeiueduffevtdefhfegkeffiefhfffgleegnecuffhomhgrihhnpehmih
    gtrhhoshhofhhtrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgdpnh
    gspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepughmihht
    rhihrdhtohhrohhkhhhovhesghhmrghilhdrtghomhdprhgtphhtthhopehhuggvghhovg
    guvgesrhgvughhrghtrdgtohhmpdhrtghpthhtohepphgvthgvrhdrhhhuthhtvghrvghr
    sehrvgguhhgrthdrtghomhdprhgtphhtthhopehlihhnuhigqdhinhhpuhhtsehvghgvrh
    drkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgv
    rhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:xnNoZwEyY9DPIJdxNj1mKsij3D61Z2m5aU_iGXJf0T8h7pF7OS__Xw>
    <xmx:xnNoZ5Sc-BSGPPOuPNRpjMWpl4XASjMgDu-80zJHKM-uF6IfXCDL7Q>
    <xmx:xnNoZ1xnOzcrZi2OdvfnVE_lJbDjo2vAJgRv_AUMXpb6afOijFJlmg>
    <xmx:xnNoZ35G3nSHZn91wng1q1_xSqboJVWuhwSIYTUOEO9iUVcdslgb5A>
    <xmx:xnNoZ3vR13t2tKAaPHu31rl7tNLkN0QZ08hIedHa5JM0ctx3LudJA3C8>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 335933C0066; Sun, 22 Dec 2024 15:17:10 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 22 Dec 2024 15:16:49 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: "Hans de Goede" <hdegoede@redhat.com>,
 "Peter Hutterer" <peter.hutterer@redhat.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <65fbce93-5f73-4b09-af55-c5d782691773@app.fastmail.com>
In-Reply-To: <Z2RxW6K-_Ujrxeim@google.com>
References: <mpearson-lenovo@squebb.ca>
 <20241219151910.14235-1-mpearson-lenovo@squebb.ca>
 <d2a2abe2-0739-4277-8803-73220be6fc3a@redhat.com>
 <223e3b07-365c-436e-9439-25cd3a490e5e@app.fastmail.com>
 <877c1672-744a-473f-a4dd-45fd10cfee11@redhat.com>
 <Z2Ri3cuiRYDap2f6@google.com>
 <25e87314-4524-495f-8313-1c318a8170eb@redhat.com>
 <Z2Rmj6V0FFbWUhCd@google.com>
 <e16e0f6f-9eb0-487f-8c71-3023a17f8afb@app.fastmail.com>
 <Z2RxW6K-_Ujrxeim@google.com>
Subject: Re: [PATCH] Input: atkbd: Fix so copilot key generates F23 keycode
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On Thu, Dec 19, 2024, at 2:17 PM, Dmitry Torokhov wrote:
> On Thu, Dec 19, 2024 at 01:40:24PM -0500, Mark Pearson wrote:
>> On Thu, Dec 19, 2024, at 1:31 PM, Dmitry Torokhov wrote:
>> > On Thu, Dec 19, 2024 at 07:26:19PM +0100, Hans de Goede wrote:
>> >> Hi,
>> >> 
>> >> On 19-Dec-24 7:15 PM, Dmitry Torokhov wrote:
>> > And mapping to F23 as I said should be done through udev. I doubt they
>> > will get all OEMs settle on the same scancode.
>> >
>> 
>> I'll see if we can find a way to check on other vendor platforms what scancode is used.
>> If it is a common scancode, across multiple vendors, would the patch be acceptable?
>
> It is currently unmapped by default, so maybe.
>
> FWIW:
>
> dtor@dtor-ws:~/kernel/work $ grep KEY_6e /lib/udev/hwdb.d/60-keyboard.hwdb
> KEYBOARD_KEY_6e=wlan
> KEYBOARD_KEY_6e=left                                   # left on d-pad
> KEYBOARD_KEY_6e=search
>
> That 2nd entry is actually from one of Thinkpad models ;)
>
I got confirmation from the keyboard team that 0x6e is the scancode from F23, and is common for all PC vendors for Windows.

They pointed me at this page as confirmation: https://learn.microsoft.com/en-us/windows/win32/inputdev/about-keyboard-input#scan-codes
(F23 is in the table of scan codes)

Does that make this patch valid again for consideration, in your opinion?

Thanks
Mark

