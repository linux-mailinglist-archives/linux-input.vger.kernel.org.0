Return-Path: <linux-input+bounces-8671-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7EA9F7E56
	for <lists+linux-input@lfdr.de>; Thu, 19 Dec 2024 16:48:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0400B188CCDC
	for <lists+linux-input@lfdr.de>; Thu, 19 Dec 2024 15:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6273A1547D2;
	Thu, 19 Dec 2024 15:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="XkzVUKW3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="csOJci52"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899593D3B8;
	Thu, 19 Dec 2024 15:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734623325; cv=none; b=OzZVjUaXzB88NDp1pgE1iHcutT24O3Yq1CjtqcnqajHM3pcOqpM5EyKon4vFNSG+yaJEGhwR+8dPU0EYPQXeGJhPes21Hp+958tltCRwMeW6VaruqGUCxnSXUDZz5/hNu8gOB8A6LFKQCsRv5Mlbu4IWbUblbgmHQbJrkDy7OFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734623325; c=relaxed/simple;
	bh=8katZxoik5Hh3kSQh75BtRl4c0so5dDpdS8lsxgM1nQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=SW2Lw4nBFK42flojbY9lFWinwrmlFXfMNuxAalqnGFY0nMSt82JSgfj1hBvFfo3CCtboU2cB3sjqqOmn1KAm8TQxFj8cl5YyWUKNgQAqnRxdPAKfanwWfQ/bJ2vXnIsvGIWGTY4YbVODnbOx5BNnUGcrj28LPSdEQIHTF4/J9Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=XkzVUKW3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=csOJci52; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 913E02540183;
	Thu, 19 Dec 2024 10:48:41 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-02.internal (MEProxy); Thu, 19 Dec 2024 10:48:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1734623321;
	 x=1734709721; bh=sWdRNAw4OB2e4hqfm+2Rb5f/BLxgOhnVOdEaRFulqX0=; b=
	XkzVUKW3iH7jWx+mfWtiCZEnS8ZPvCCsh73CMKd6rMJ720AKkVVxvQ0b1nCoIDrm
	enXNUVTOVX5aO5qjBqpQiGJVMy/n/aOHiw3SD4Fuo6fYat4fb4Piz+dqR/V3fyks
	aSFHopj8gI6+hhHS+A7mZ7wUtLVhOeQr7V1k8TWNSNbd3HN6juZa1uTwqaJqOKJv
	/AzAoh98e0v+Q33NqrZtYd4z4oYIBNwHpBZnZOayTx2urPZmiNxxUFQ3p5CG8Awo
	k+zDkW3ukiODUb+9+BeOKS8dNPzwFfixuvLA56kpaYwxpGdJxwjAZ6ME4gWFS+sN
	e/vTNs74Pr6EEQnwobEu8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734623321; x=
	1734709721; bh=sWdRNAw4OB2e4hqfm+2Rb5f/BLxgOhnVOdEaRFulqX0=; b=c
	sOJci52fbGwXeZoFQ3BhTTTX8Rt9Gf4/T5v5bw/WUhKp/eiPyX+aJII921Qfggpr
	DGAIBMmuon+49vmaMngDiWOft8sY91Busdo0M4/1dpJjXPXsLMp0MG2H9hGG1bra
	7FcI2xctERSecTrstJvuubwqOdY0tuf2OanNr9HEYK/Bf7v9Dq//saVx0LbiieYi
	8pd+BN2OD6NOWCRcyTjHU+xhJwhR0SqFRwCq8ILXN0drpsrczar7IQwIAKRvJO+S
	Ce7kJDEZ0Y4YqdUa95M4Oghg66SYV01SfCNm07UUWD4GoqEmFAJXEh/osvajNXt+
	GIPtQdh9o/FQQBE1/jHZA==
X-ME-Sender: <xms:WUBkZ7ASHjHXeVlGedv7k0pIBnmhPaXD4JXR1wlm-_ZoA7Uf3AsLng>
    <xme:WUBkZxgxzhCs9EHOp8PuAs5L3vax42z_SAD8pv3trfiDAQr5rI0AeULorpn-fi0sr
    k9yS3pnNHxPXfB0tJs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddttddgjeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedfofgrrhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnh
    hovhhosehsqhhuvggssgdrtggrqeenucggtffrrghtthgvrhhnpeefudeitdeuffeiueef
    ueeuieffudfhueffgeefueegieelieffleejueeigeevheenucffohhmrghinhepthhomh
    hshhgrrhgufigrrhgvrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrg
    dpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepughm
    ihhtrhihrdhtohhrohhkhhhovhesghhmrghilhdrtghomhdprhgtphhtthhopehhuggvgh
    hovgguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugidqihhnphhuthes
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlh
    esvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:WUBkZ2nPZnG7A7-rycSf5Xoo44xqUEZkba7w948MfW-Ov9gvt1IOnQ>
    <xmx:WUBkZ9wRzi5rAl07dcrnwpA6bsgD4PT3w72I4mhqLtos1gMD3Z5i0w>
    <xmx:WUBkZwQH3YyVPUefieoPnQJQwXW5-SVZMl8qcGYjDN4osK1soFFj3g>
    <xmx:WUBkZwYxAP8Ha4P8r1YlwxB7i3eVLukR2dlJydziJydOuBhSb2oglw>
    <xmx:WUBkZ2dx_7LWRyGe0de8IQpPsuctVdSxi5ANdRMTa4A4A4SyfzqIBPU9>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 29FB93C0066; Thu, 19 Dec 2024 10:48:41 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 19 Dec 2024 10:48:20 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Hans de Goede" <hdegoede@redhat.com>
Cc: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <223e3b07-365c-436e-9439-25cd3a490e5e@app.fastmail.com>
In-Reply-To: <d2a2abe2-0739-4277-8803-73220be6fc3a@redhat.com>
References: <mpearson-lenovo@squebb.ca>
 <20241219151910.14235-1-mpearson-lenovo@squebb.ca>
 <d2a2abe2-0739-4277-8803-73220be6fc3a@redhat.com>
Subject: Re: [PATCH] Input: atkbd: Fix so copilot key generates F23 keycode
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Hans

On Thu, Dec 19, 2024, at 10:28 AM, Hans de Goede wrote:
> +Cc Peter Hutterer

My bad - I've been discussing this with Peter and should have added him. Thanks for including (sorry Peter!)

>
> Hi Mark,
>
> Thank you for your patch.
>
> On 19-Dec-24 4:18 PM, Mark Pearson wrote:
>> The copilot key on Lenovo laptops doesn't work as scancode 0x6e, which it
>> generates is not mapped.
>> This change lets scancode 0x6e generate keycode 193 (F23 key) which is
>> the expected value for copilot.
>> 
>> Tested on T14s G6 AMD.
>> I've had reports from other users that their ThinkBooks are using the same
>> scancode.
>
> Hmm, I'm not sure mapping this to KEY_F23 is the right thing to do,
> there are 2 issues with this approach:
>
> 1. /usr/share/X11/xkb/symbols/inet currently maps this to
>    XF86TouchpadOff as F20 - F23 where repurposed to
>    TouchPad on/off/toggle / micmute to work around X11
>    not allowing key-codes > 247.
>
>    We are actually working on removing this X11 workaround
>    to make F20-F23 available as normal key-codes again
>    for keyboards which actually have such keys.
>
> 2. There are some keyboards which have an actual F23 key
>    and mapping the co-pilot key to that and then having
>    desktop environments grow default keybindings on top
>    of that will basically mean clobbering the F23 key or
>    at least making it harder to use.
>
> I think was is necessary instead is to add a new
> KEY_COPILOT to include/uapi/linux/input-event-codes.h
> and use that instead.

Sorry, should have been clearer in the commit message.
I'm doing this just on the Microsoft spec. The co-pilot key is left-shift, Windows/Meta key, F23. Weird combo I know....

Somewhere I had a MS page...but this Tom's HW page mentions it:
https://www.tomshardware.com/software/windows/windows-copilot-key-is-secretly-from-the-ibm-era-but-you-can-remap-it-with-the-right-tools

I'll see if I can find something more formal.

>
> Peter, I thought I read somewhere that you were looking
> into mapping the copilot key to a new  KEY_COPILOT evdev
> key for some other keyboards?
>

Wouldn't this require the kernel catching all three key events and doing the interpretation? I have no idea how this would be done or if it makes sense.

> Regards,
>
> Hans
>

Thanks!
Mark

>
>
>> 
>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> ---
>>  drivers/input/keyboard/atkbd.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
>> index 5855d4fc6e6a..f7b08b359c9c 100644
>> --- a/drivers/input/keyboard/atkbd.c
>> +++ b/drivers/input/keyboard/atkbd.c
>> @@ -89,7 +89,7 @@ static const unsigned short atkbd_set2_keycode[ATKBD_KEYMAP_SIZE] = {
>>  	  0, 46, 45, 32, 18,  5,  4, 95,  0, 57, 47, 33, 20, 19,  6,183,
>>  	  0, 49, 48, 35, 34, 21,  7,184,  0,  0, 50, 36, 22,  8,  9,185,
>>  	  0, 51, 37, 23, 24, 11, 10,  0,  0, 52, 53, 38, 39, 25, 12,  0,
>> -	  0, 89, 40,  0, 26, 13,  0,  0, 58, 54, 28, 27,  0, 43,  0, 85,
>> +	  0, 89, 40,  0, 26, 13,  0,193, 58, 54, 28, 27,  0, 43,  0, 85,
>>  	  0, 86, 91, 90, 92,  0, 14, 94,  0, 79,124, 75, 71,121,  0,  0,
>>  	 82, 83, 80, 76, 77, 72,  1, 69, 87, 78, 81, 74, 55, 73, 70, 99,
>>

