Return-Path: <linux-input+bounces-8721-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E3E9FA9C3
	for <lists+linux-input@lfdr.de>; Mon, 23 Dec 2024 04:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88B0618829A7
	for <lists+linux-input@lfdr.de>; Mon, 23 Dec 2024 03:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A764E28F1;
	Mon, 23 Dec 2024 03:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="w7dBSLN5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iUn20Q1a"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930F4179BC;
	Mon, 23 Dec 2024 03:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734924863; cv=none; b=a7635+3gXc79Tk48HG6oHHpLqrQAHruEI/fydBTID5BbBJ9UnnE/ZXMf1co/l28UQAYJUvN1/egQojkO2WZB+DjtqZPGaBpocl0oa293A1sPQcx8ewxZvunfqvvHA0gLtxZa87ACZ9i7ePIid+NThX4qqLZq6+FvjO3tJQfjQOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734924863; c=relaxed/simple;
	bh=hoUpnpOEVtqS1dAq5dUmgBfHXmHKUE5Efnkcy4GQcfc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=K/4+xRjUVYYnEoC547aMeVqc8WZXnvW3gjT311OSTo54OVk2+6FqTHlbBdpikRddvj+3akowNZfWz9avLHtX0HzDGMp/yzVp03DKN3YGwaNZrtHd42YY4lrSEzA5grOg9B9AcpqQLx04xR8C8IaTdAbCB/B2ahYjVafCI+BvgmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=w7dBSLN5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iUn20Q1a; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 816A7254011D;
	Sun, 22 Dec 2024 22:34:19 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-02.internal (MEProxy); Sun, 22 Dec 2024 22:34:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1734924859;
	 x=1735011259; bh=nEH1URNdxSAGRd2hibJQ2pjsuo0FVSMW41bOnF3aA0o=; b=
	w7dBSLN5t7ts3VX+F/Q/ihcVjlvKaYf0yX8JP/01agXx1uS2qdLAjUFjTqPUT69m
	a0/t+Ts/xdAHJn7Reo8WpFPJmyCKono/OkE2LMy0B3sKjiem8qQOvKN09fHsDF7S
	VJL1H7y6KRMLouCdzpqdJF/lT/PbeACEpdMLd6ZZaOE+VlRR5BP61Ng4OyOzcGax
	KFL6oOHNMQqGxclX4fll1SltJsdad66RKCB7sGX8cg5LnnYRjlixderP+MATOZcp
	ffk25uryeQmC7EyF6EaLFnz/+Sye/A/1/FtgGJ9WL27UQE2o8+jQ4wzkKQz6hJwW
	SzWf9OTrWPGOwo4Nq7V2EQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1734924859; x=
	1735011259; bh=nEH1URNdxSAGRd2hibJQ2pjsuo0FVSMW41bOnF3aA0o=; b=i
	Un20Q1azacqulAigKtlAMRHmhP3RNM/P/IbYb4WWDxdI5bR4SW2zrVFsCOPzm9bp
	HavvVY44hcdxGrgCCrVU+akzu5LIzZG1U7/sruBNpzwOhdQHBJLQu/VMDu5HH/aH
	mIAZh/mo8agVe4ElfawBJlujE5d1Plc5L19oQbTBIz99AVmoX4wEv9GQNvQPLZZS
	JxlWEuzx/narj7IomziYjKbybGFqFULFy9Eh3CY2DTD4/0/IutsIrHRlHO4DunuY
	fD5abDsoQbfrfaIz8UYBX8bGlP3SPWXJA+SgIHb/agRnY+4z0spWwO3hET54Ne+F
	lbF2Ph8y44cFZrj8Pv1Qw==
X-ME-Sender: <xms:O9poZ9JORrpSX6vxYekHCHq-GjnXsWPXy3djRzoPqginUPHn-G2d9g>
    <xme:O9poZ5JXToipUJl5s-rO8FikpbJ0-bG23GM9Mrl5gu982OgyQLMyp9GdvJh1pt4zF
    kOtFrC47RybGx66w_c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddtledgheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedfofgrrhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnh
    hovhhosehsqhhuvggssgdrtggrqeenucggtffrrghtthgvrhhnpefhgefgudfgfeeufeeu
    uedujeejhefhieeuudffvedtfefhgeekffeihfffgfelgeenucffohhmrghinhepmhhitg
    hrohhsohhfthdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhnsg
    gprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegumhhithhr
    hidrthhorhhokhhhohhvsehgmhgrihhlrdgtohhmpdhrtghpthhtohephhguvghgohgvug
    gvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehpvghtvghrrdhhuhhtthgvrhgvrhes
    rhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghr
    rdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:O9poZ1vNALoR6p1idPmxMQSO-0xjW0qG-V3-HZGSe_wO5rf_Jk6mZw>
    <xmx:O9poZ-adnmkWX35fjSicRnuoXmgnELDGskTR6m907bngtxBZSpJR0g>
    <xmx:O9poZ0ajsbpO5fHOVE72Sc7L443E0paW6T4kqOTBcuMrlASUUSyTBA>
    <xmx:O9poZyAFws_ufnt8gmKCTztu14ZjHsSb4bCOy-vZuBtDJb7fDWE7Sg>
    <xmx:O9poZ7Wt6-xwGrG4hZw070qS9TBSzAk1cVkJxjdYN1Z0YSCFw5JeLOoE>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 037FF3C0066; Sun, 22 Dec 2024 22:34:19 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 22 Dec 2024 22:33:56 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: "Hans de Goede" <hdegoede@redhat.com>,
 "Peter Hutterer" <peter.hutterer@redhat.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <7b7d00d2-ebef-4d0b-840a-44d6ceda8d07@app.fastmail.com>
In-Reply-To: <65fbce93-5f73-4b09-af55-c5d782691773@app.fastmail.com>
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
 <65fbce93-5f73-4b09-af55-c5d782691773@app.fastmail.com>
Subject: Re: [PATCH] Input: atkbd: Fix so copilot key generates F23 keycode
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Dec 22, 2024, at 3:16 PM, Mark Pearson wrote:
> Hi Dmitry,
>
> On Thu, Dec 19, 2024, at 2:17 PM, Dmitry Torokhov wrote:
>> On Thu, Dec 19, 2024 at 01:40:24PM -0500, Mark Pearson wrote:
>>> On Thu, Dec 19, 2024, at 1:31 PM, Dmitry Torokhov wrote:
>>> > On Thu, Dec 19, 2024 at 07:26:19PM +0100, Hans de Goede wrote:
>>> >> Hi,
>>> >> 
>>> >> On 19-Dec-24 7:15 PM, Dmitry Torokhov wrote:
>>> > And mapping to F23 as I said should be done through udev. I doubt they
>>> > will get all OEMs settle on the same scancode.
>>> >
>>> 
>>> I'll see if we can find a way to check on other vendor platforms what scancode is used.
>>> If it is a common scancode, across multiple vendors, would the patch be acceptable?
>>
>> It is currently unmapped by default, so maybe.
>>
>> FWIW:
>>
>> dtor@dtor-ws:~/kernel/work $ grep KEY_6e /lib/udev/hwdb.d/60-keyboard.hwdb
>> KEYBOARD_KEY_6e=wlan
>> KEYBOARD_KEY_6e=left                                   # left on d-pad
>> KEYBOARD_KEY_6e=search
>>
>> That 2nd entry is actually from one of Thinkpad models ;)
>>
> I got confirmation from the keyboard team that 0x6e is the scancode 
> from F23, and is common for all PC vendors for Windows.
>
> They pointed me at this page as confirmation: 
> https://learn.microsoft.com/en-us/windows/win32/inputdev/about-keyboard-input#scan-codes
> (F23 is in the table of scan codes)
>
> Does that make this patch valid again for consideration, in your opinion?
>
Apologies for the multiple emails, but just wanted to add a note that Canonical kindly tested for me on a Dell and HP platform, and confirmed they are using the same scan code (as expected at this point). This change should benefit all vendors.

Thanks
Mark

